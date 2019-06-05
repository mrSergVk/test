<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);

class MyTestTask
{
    private $db;
    private $uid;
    private $anonymous = array(
        'signUp',
        'signIn'
    );

    function __construct($token)
    {
        $this->db = mysqli_connect('localhost', 'asdkasd', '1Qwerty');
        mysqli_select_db($this->db, 'asdkasd');

        if (!is_null($token)) {
            $result = $this->db->query('SELECT * FROM `tokens` WHERE `token` = \'' . $this->clearTokenData($token) . '\' LIMIT 1');
            $result = $result->fetch_assoc();
            if ($result !== null) {
                $this->uid = (int)$result['id_user'];
            }
        }
    }

    private function clearTokenData($data)
    {
        return preg_replace('/[^\w]*/', '', $data);
    }

    public function callFunction($fname, $params = array())
    {
        if (!method_exists($this, $fname)) {
            return $this->formResponse(null, 500, 'Method not found');
        }
        if (is_null($this->uid) && !in_array($fname, $this->anonymous)) {
            return $this->formResponse(null, 401, 'Authorize to use this method');
        }

        try {
            $data = $this->$fname($params);
            return $this->formResponse($data);
        } catch (Exception $e) {
            return $this->formResponse(null, $e->getCode(), $e->getMessage());
        }
    }

    private function formResponse($data, $errorCode = 0, $errorMessage = 'Success')
    {
        header('Content-type: application/json');
        http_response_code($errorCode === 0 ? 200 : $errorCode);
        return json_encode(array(
            'error' => $errorCode,
            'message' => $errorMessage,
            'data_list' => !is_null($data) ? array($data['objectName'] => $data['result']) : null
        ));
    }

    private function signUp($param)
    {
        if (!isset($param['email']) || !filter_var($param['email'], FILTER_VALIDATE_EMAIL) || strlen(trim($param['email'])) < 5) {
            throw new Exception('Received wrong email', 400);
        }
        if (!isset($param['password']) || strlen(trim($param['password'])) < 4) {
            throw new Exception('Received wrong password', 400);
        }

        $alreadyUser = $this->db->query('SELECT * FROM `users` WHERE `email` = \'' . $param['email'] . '\' LIMIT 1');
        $alreadyUser = $alreadyUser->fetch_assoc();
        $token = sha1($this->uid . microtime(true));
        if (is_null($alreadyUser)) {
            $this->db->query('INSERT INTO `users` (`email`, `password`) VALUES (\'' . $param['email'] . '\', \'' . password_hash(trim($param['password']), PASSWORD_BCRYPT) . '\')');
            $this->uid = (int)$this->db->insert_id;
        } else {
            throw new Exception('User with this email already exists', 400);
        }

        $this->db->query('INSERT INTO `tokens` (`id_user`, `token`, `date`) VALUES (\'' . $this->uid . '\', \'' . $token . '\', \'' . date('Y-m-d H:i:s') . '\')');

        return array('objectName' => 'token', 'result' => $token);
    }

    private function signIn($param)
    {
        if (!isset($param['email']) || !filter_var($param['email'], FILTER_VALIDATE_EMAIL) || strlen(trim($param['email'])) < 5) {
            throw new Exception('Received wrong email', 400);
        }
        if (!isset($param['password']) || strlen(trim($param['password'])) < 4) {
            throw new Exception('Received wrong password', 400);
        }

        $user = $this->db->query('SELECT * FROM `users` WHERE `email` = \'' . $param['email'] . '\' LIMIT 1');
        $user = $user->fetch_assoc();
        $token = sha1($this->uid . microtime(true));
        if (is_null($user)) {
            throw new Exception('User with this email not found', 400);
        }

        if (!password_verify($param['password'], $user['password'])) {
            throw new Exception('Incorrect password', 400);
        }
        $this->uid = (int)$user['id'];

        $this->db->query('INSERT INTO `tokens` (`id_user`, `token`, `date`) VALUES (\'' . $this->uid . '\', \'' . $token . '\', \'' . date('Y-m-d H:i:s') . '\')');

        return array('objectName' => 'token', 'result' => $token);
    }

    private function createTask($param)
    {
        if (!isset($param['title']) || strlen(trim($param['title'])) < 3) {
            throw new Exception('Received wrong title', 400);
        }
        if (!isset($param['due_date']) || strtotime($param['due_date']) < 0) {
            throw new Exception('Received wrong due date', 400);
        }
        if (!isset($param['priority']) || !in_array($param['priority'], array('low', 'normal', 'high'))) {
            throw new Exception('Received wrong priority', 400);
        }

        $this->db->query('INSERT INTO `tasks` (`id_user`, `title`, `due_date`, `priority`) VALUES (\'' . $this->uid . '\', \'' . htmlentities($param['title']) . '\', \'' . date('Y-m-d', strtotime($param['due_date'])) . '\', \'' . $param['priority'] . '\')');

        return array('objectName' => 'id', 'result' => (int)$this->db->insert_id);
    }

    private function markTaskDone($param)
    {
        if (!isset($param['id']) || (int)$param['id'] < 1) {
            throw new Exception('Received wrong id', 400);
        }

        $task = $this->db->query('SELECT * FROM `tasks` WHERE `id` = \'' . (int)$param['id'] . '\' AND `id_user` = \'' . $this->uid . '\' AND `is_deleted` = 0 LIMIT 1');
        $task = $task->fetch_assoc();
        if (is_null($task)) {
            throw new Exception('Task with this ID not found', 400);
        }

        if ((bool)$task['is_done']) {
            throw new Exception('Task already marked as done', 400);
        }

        $this->db->query('UPDATE `tasks` SET `is_done` = 1 WHERE `id` = \'' . (int)$param['id'] . '\'');

        return array('objectName' => 'id', 'result' => (int)$param['id']);
    }

    private function deleteTask($param)
    {
        if (!isset($param['id']) || (int)$param['id'] < 1) {
            throw new Exception('Received wrong id', 400);
        }

        $task = $this->db->query('SELECT * FROM `tasks` WHERE `id` = \'' . (int)$param['id'] . '\' AND `id_user` = \'' . $this->uid . '\' AND `is_deleted` = 0 LIMIT 1');
        $task = $task->fetch_assoc();
        if (is_null($task)) {
            throw new Exception('Task with this ID not found', 400);
        }

        $this->db->query('UPDATE `tasks` SET `is_deleted` = 1 WHERE `id` = \'' . (int)$param['id'] . '\'');

        return array('objectName' => 'id', 'result' => (int)$param['id']);
    }

    private function getTasksList($param)
    {
        $page = 1;
        $sortBy = 'title';
        $sortOrder = 'ASC';
        if (isset($param['page']) && (int)$param['page'] > 0) {
            $page = (int)$param['page'];
        }
        if (isset($param['sort_by']) && in_array($param['sort_by'], array('title', 'due_date', 'priority'))) {
            $sortBy = $param['sort_by'];
        }
        if (isset($param['sort_order']) && in_array($param['sort_order'], array('ASC', 'DESC'))) {
            $sortOrder = $param['sort_order'];
        }

        $sql = 'SELECT `id`,`title`,`due_date`,`priority`,`is_done` FROM `tasks` WHERE `id_user` = \'' . $this->uid . '\' AND `is_deleted` = 0 ORDER BY `' . $sortBy . '` ' . $sortOrder . ' LIMIT ' . (($page - 1) * 10) . ', 10';
        $tasks = $this->db->query($sql);
        $tasks = $tasks->fetch_all(MYSQLI_ASSOC);
        foreach ($tasks as &$task) {
            $task['id'] = (int)$task['id'];
            $task['is_done'] = (bool)$task['is_done'];
        }
        unset($task);

        return array('objectName' => 'tasks', 'result' => $tasks);
    }
}

$main = new MyTestTask(isset($_REQUEST['token']) ? $_REQUEST['token'] : null);
$requestUrl = substr($_SERVER['REQUEST_URI'], strpos($_SERVER['REQUEST_URI'], '/') + 1, strpos($_SERVER['REQUEST_URI'], '?') - 1);

if ($requestUrl !== '') {
    $requestData = $_REQUEST;
    if (isset($requestData['token'])) {
        unset($requestData['token']);
    }
    echo $main->callFunction($requestUrl, $requestData);
} else {
    header('Content-type: application/json');
    echo json_encode(array(
        'error' => 0,
        'message' => 'API'
    ));
}