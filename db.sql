-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 05 2019 г., 13:27
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tt`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `due_date` date DEFAULT NULL,
  `priority` enum('low','normal','high') NOT NULL DEFAULT 'normal',
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `id_user`, `title`, `due_date`, `priority`, `is_done`, `is_deleted`) VALUES
(1, 3, '8da26e7966d129f2f29e47a410933b677ca75b0d', '2019-06-08', 'low', 0, 0),
(2, 3, '44b9aba26760740602b829fa51a80ed93a1de517', '2019-06-05', 'normal', 0, 0),
(3, 3, '41cb173a03694ec956fdfab7415d5e8b7b423305', '2019-06-11', 'low', 0, 0),
(4, 3, 'd58a0e6385347d949a45c3aad8ffb19396be827f', '2019-06-05', 'high', 0, 0),
(5, 3, '218d910f3b28a1517e73d0aef55a29d2f3926ba4', '2019-06-06', 'low', 0, 0),
(6, 3, '7fb127d039ff0027cda104fe2d43ea6d15a29be6', '2019-06-10', 'low', 0, 0),
(7, 3, '7d3bf61c19ae3c0a69d74de0be3fad638ef9f92d', '2019-06-11', 'normal', 0, 0),
(8, 3, '1f30b7f2af18dd3fb7c6012eda95e30b20b9c8bf', '2019-06-15', 'low', 0, 0),
(9, 3, 'd40faaabbf23df5f01bd9859bdea9e21592b1f09', '2019-06-21', 'low', 0, 0),
(10, 3, '271f8edf5ce58996031b5141ef818b3e41a854b2', '2019-06-23', 'low', 0, 0),
(11, 3, 'd1fda5a2d6d2e27a8e15530ab0a8a51fd4979a08', '2019-06-29', 'normal', 0, 0),
(12, 3, 'ce45fd7c653e6fa827de83582bc0f16c99b24aef', '2019-07-01', 'normal', 0, 0),
(13, 3, '9fe629132b62b4e94b570473d57267181b20523f', '2019-07-11', 'normal', 0, 0),
(14, 3, 'ccd34b7927913b579b044b8eea1c45b9fe224318', '2019-07-17', 'normal', 0, 0),
(15, 3, '45ee4cc6df0714f9e9c2df8c9fa4a14d679c2626', '2019-07-27', 'normal', 0, 0),
(16, 3, 'c5e36d585126d18838a2c9818f2f4602372d8547', '2019-07-28', 'high', 0, 0),
(17, 3, '5794482e5b7bd6ca904a01981db5fdb119a55250', '2019-08-06', 'high', 0, 0),
(18, 3, '06abcff421b379ce282d4e945b2cb42707df9511', '2019-08-15', 'high', 0, 0),
(19, 3, '34b4f80ac9a5e65b6cf366b7406e53ce3ddb2e55', '2019-08-20', 'normal', 0, 0),
(20, 3, 'bc9e73a92d3bb442df594a7280e8252f9167a90a', '2019-08-27', 'normal', 0, 0),
(21, 3, '478701521730a68effe2bda22ab8e2a99ab344cd', '2019-08-28', 'normal', 0, 0),
(22, 3, '3e14a0614272adb8d385e9827e444919e8578232', '2019-09-07', 'low', 0, 0),
(23, 3, 'a0aa1ed69b4aa22fb6f45643f7ea828c4c4d46ec', '2019-09-16', 'low', 0, 0),
(24, 3, '57f0eb1893d7a9cc28332cacbade59e786511e13', '2019-09-19', 'low', 0, 0),
(25, 3, 'a01b6d17c10518395bdcfbde8451a141280479ba', '2019-09-26', 'high', 0, 0),
(26, 3, 'dddcd3717a677bde68712c488d3f8829f68fc60a', '2019-10-02', 'low', 0, 0),
(27, 3, '13e1d9148889106c8d489bfe7a2b5522f1cdcf07', '2019-10-09', 'high', 0, 0),
(28, 3, '073092b8ecb39068c8f10278f71e7d7859de5722', '2019-10-13', 'low', 0, 0),
(29, 3, 'e4ebf3faa0bbf2224ab816636eb0c267e552f4fc', '2019-10-22', 'low', 0, 0),
(30, 3, '1c8b5db7bb0e5ffaeb82eb2ebab6e9507c555bb6', '2019-10-30', 'low', 0, 0),
(31, 3, '0bb8f848e8556734b894788a9b5ab1c016b109a6', '2019-10-31', 'low', 0, 0),
(32, 3, '559184b76f585354b7851620ac19cf8ddc1315d3', '2019-11-01', 'high', 0, 0),
(33, 3, '87be14d973eb0b5c0e3d01788a133b86809012d7', '2019-11-03', 'high', 0, 0),
(34, 3, 'ba0aaa74594f7936aac7ec58ce68aec5c3552b31', '2019-11-06', 'normal', 0, 0),
(35, 3, '6a2c3fd813bb054fd9b4beb80f056fa4c37fe8b1', '2019-11-10', 'high', 0, 0),
(36, 3, '944b4bd4e328b6ba2c11f21cda9caca26ef0cf2a', '2019-11-15', 'low', 0, 0),
(37, 3, 'b0364b929e2335b4df4e2ff07eaa6adcf8c3477b', '2019-11-25', 'high', 0, 0),
(38, 3, 'f145518b6eeb8cc662da0f564743cfa6a281818e', '2019-11-28', 'high', 0, 0),
(39, 3, '5c46764b30d2591e4c4726a9073c2aa8061ae421', '2019-12-04', 'high', 0, 0),
(40, 3, 'c4503ca16e11efe21bbf3790f0579e01fa1f019e', '2019-12-08', 'normal', 0, 0),
(41, 3, '237e2a0d48479cc754da0a9ec61940055eedd920', '2019-12-12', 'high', 0, 0),
(42, 3, 'f226882f5388aeb8b4f3e2b7716a72d193deb159', '2019-12-16', 'normal', 0, 0),
(43, 3, '3087ef2c8aa812ad8699555b6fd6c29bad8957d7', '2019-12-22', 'low', 0, 0),
(44, 3, '163d638c0bc1933eb9bcb836d675831e0516f338', '2019-12-26', 'high', 0, 0),
(45, 3, '099fbd403bc92e7c55a691a22c96d04fddf6c8e2', '2020-01-03', 'low', 0, 0),
(46, 3, '840638bfd7ed2492f1e5004ff06a2b36ecf034a9', '2020-01-06', 'normal', 0, 0),
(47, 3, '16090eae012066d3aa00ad3f0ef5b2a4a03a3e90', '2020-01-15', 'low', 0, 0),
(48, 3, 'ebf6e5e1dd661f6b3bf54d4da5cce4b971382b75', '2020-01-22', 'low', 0, 0),
(49, 3, '948803d37cfb56856595171c654d3c60d0d1fb9f', '2020-02-01', 'normal', 0, 0),
(50, 3, '4f55fcfa31ec8e173bf06f41ca541ddf9fa5d0e3', '2020-02-03', 'low', 0, 0),
(51, 3, '8cd7d5bfc0bc7855c152581249c26621be27dc2a', '2020-02-06', 'high', 0, 0),
(52, 3, '071bdddf99c30c38c279b616f0d428325d72cc0e', '2020-02-10', 'high', 0, 0),
(53, 3, 'd27e6ec19c6178bfef9fa223c88fd23b863794b7', '2020-02-13', 'high', 0, 0),
(54, 3, '94397d20f64ebbe20178bcfeb7979de04bebde47', '2020-02-16', 'low', 0, 0),
(55, 3, '6f1bce25c2ee1d926ec2e85dc1b8fb18a3a3361b', '2020-02-20', 'high', 0, 0),
(56, 3, '0df7c9ea70fb1eb8ddca06e7a05053d79e882565', '2020-02-27', 'normal', 0, 0),
(57, 3, '6a41f85eed6744dc8f66b9e5cc3b24a383170850', '2020-03-03', 'high', 0, 0),
(58, 3, '2a48650007445f91201926e12a440a227aa34e2e', '2020-03-13', 'normal', 0, 0),
(59, 3, 'b6315105ac556723af4745b696d3f2b5da455054', '2020-03-16', 'normal', 0, 0),
(60, 3, 'd75af724e631046897a0161706cafcf890d55c88', '2020-03-18', 'high', 0, 0),
(61, 3, 'a694c947ba996bcc22ca5674ae313e51c8655d5b', '2020-03-26', 'low', 0, 0),
(62, 3, '3d43dcc1c32a7efc20b09c79612f831c13e1a4fe', '2020-04-02', 'low', 0, 0),
(63, 3, '4be2705b52f35ecd56e082e09ea2d03d9a884373', '2020-04-10', 'high', 0, 0),
(64, 3, '78d13f81b2fe9849456f88c91e611f60a0111c2d', '2020-04-12', 'low', 0, 0),
(65, 3, 'c3c4fbcc09fb362504c959b24b027789c2af9e36', '2020-04-21', 'normal', 0, 0),
(66, 3, 'c9f56f392510cc96a94584b080f31d65d0ebab06', '2020-04-26', 'low', 0, 0),
(67, 3, 'e0a4dc9feb9daa3b2f4ba37a00fc1bd8d04330aa', '2020-05-02', 'low', 0, 0),
(68, 3, '6bb2d6712a54093fbc79d7a893e6c70ae5c69f11', '2020-05-09', 'low', 0, 0),
(69, 3, 'fdb3a932b485a60f821c9b1165aa46139b0a84cf', '2020-05-17', 'low', 0, 0),
(70, 3, '0bce976407340d79d759d4adbe868440a057ef9e', '2020-05-23', 'low', 0, 0),
(71, 3, '7ff45afbaa8faa88f5c05707daf0b93a7bc39e4b', '2020-05-26', 'normal', 0, 0),
(72, 3, '790f7f2aacfc502e4e1d6266bacd0ac6b7bba278', '2020-06-01', 'normal', 0, 0),
(73, 3, 'f4e0eb4f91329a8163050b527313844ada622848', '2020-06-05', 'normal', 0, 0),
(74, 3, '98eeba39328a5ee6b719bbf8b639920ba7be2106', '2020-06-13', 'low', 0, 0),
(75, 3, 'af5b85c919a7eee0d2d7fa0303d8ce3dc1ec1f23', '2020-06-17', 'high', 0, 0),
(76, 3, 'a2ebce78602dbf7381660640d976b41451e298d8', '2020-06-19', 'high', 0, 0),
(77, 3, 'd464fda14bbfde9d02fb6fc27b87106733aaabda', '2020-06-27', 'high', 0, 0),
(78, 3, '7f1de686e8e9567c6a825b9776a2619f4b7af74b', '2020-07-02', 'high', 0, 0),
(79, 3, '2513ce08e720a04ce1a8e3fef3f2e54535d4164e', '2020-07-03', 'normal', 0, 0),
(80, 3, 'fed8eb659e1a5173c2a48f94dd3900e82f0f2574', '2020-07-06', 'high', 0, 0),
(81, 3, '6e74442de36fa35548aacb330414f3c586b84d54', '2020-07-10', 'low', 0, 0),
(82, 3, 'b93c74ad1e875d9b6953db941031002cda5581d9', '2020-07-19', 'high', 0, 0),
(83, 3, '060a708f84c921616d9c0ce9bf9e5c644e1b15e5', '2020-07-29', 'high', 0, 0),
(84, 3, '8c28a0e1c4849c8d56a686b8512ce04a9ab7a401', '2020-08-01', 'high', 0, 0),
(85, 3, '56717d8e2c63f6dcb017295ee1d0dafb351ccef3', '2020-08-03', 'normal', 0, 0),
(86, 3, 'b23ac76a14cf706759750b5886226f40ce230644', '2020-08-10', 'low', 0, 0),
(87, 3, '91df7c823619aa7b7e4779b8939ee589a9513986', '2020-08-14', 'normal', 0, 0),
(88, 3, 'f1c2aeb900fe95ff29a39b126ab205bdc3abd241', '2020-08-20', 'normal', 0, 0),
(89, 3, '959b6a51a73166781380381cf7a37287a586f3dd', '2020-08-26', 'normal', 0, 0),
(90, 3, '22d71bf57ebf3ce194aa0b2c3afd77174efba7c3', '2020-09-01', 'high', 0, 0),
(91, 3, 'ff81756dd4f9e3270035f5cb9c08508385f8433c', '2020-09-10', 'normal', 0, 0),
(92, 3, '4e0a12229d26dec7b723f9270b655dcd080b330f', '2020-09-15', 'normal', 0, 0),
(93, 3, '86a9471f3618d8b54b6de7702383848174370b34', '2020-09-19', 'normal', 0, 0),
(94, 3, '7291a84d4edd06c1d31fa16e805e352d30c96d7c', '2020-09-22', 'high', 0, 0),
(95, 3, 'a3d308d59c41e14dbef32185c3d9207ed09d6c35', '2020-09-24', 'low', 0, 0),
(96, 3, 'd2143b04fad0e74e36ecb1f756dcc09414ed1e27', '2020-10-01', 'high', 0, 0),
(97, 3, 'ccc1bd65afaf25eb0168fe726a4d2f03be692e2a', '2020-10-04', 'high', 0, 0),
(98, 3, '6a9f86111d898972f042678cd6e013455eb82b31', '2020-10-13', 'normal', 0, 0),
(99, 3, 'd96797f7dcbe0fea1ff65bc2ad6009ec1edc4d22', '2020-10-19', 'low', 0, 0),
(100, 3, 'd91e510d2c6259fbfa85e60cf8e40e08ffb23241', '2020-10-21', 'low', 0, 0),
(101, 3, 'a839212a6cad530cef5ffe43e473858b76d003f2', '2020-10-25', 'normal', 0, 0),
(102, 3, '1f6702c90998c1ff1c3be88eda21f1d832d6af1c', '2020-10-30', 'normal', 0, 0),
(103, 3, '957c014931dfe1a3d6618a044cbaf9459b2fa39e', '2020-11-08', 'normal', 0, 0),
(104, 3, 'd58a0e6385347d949a45c3aad8ffb19396be827f', '2019-06-05', 'low', 0, 0),
(105, 3, '1efc0ce80aa8015404b23c60929f81c0158a2398', '2019-06-08', 'low', 0, 0),
(106, 3, 'a47ea5e46c4e689795fa806e6833b8e0699c13e1', '2019-06-13', 'low', 0, 0),
(107, 3, 'df547c4d250532fefe610127a90f6aa6402bd411', '2019-06-20', 'high', 0, 0),
(108, 3, '00e0a24b74aa83c61713392485d300466eae154b', '2019-06-22', 'high', 0, 0),
(109, 3, '99296c2dfcbb931764175a2c32b4f039feed1bd1', '2019-07-02', 'normal', 0, 0),
(110, 3, '1a4fd4decbd1378d3fe6107b532d2e440c60963f', '2019-07-09', 'high', 0, 0),
(111, 3, 'f8ef798cd07dad12b78e00ba79e1e215cd8f9449', '2019-07-10', 'normal', 0, 0),
(112, 3, 'bd6268a666203dbd54f349e52518285942109824', '2019-07-12', 'high', 0, 0),
(113, 3, '572d192096325a7838b5f2d644a778898b7cd772', '2019-07-14', 'normal', 0, 0),
(114, 3, '1f9385d2c82e458648f6ac53933600932ff0d221', '2019-07-23', 'high', 0, 0),
(115, 3, '2c863fd7cd80148536ba21d620dbcadde5016b0a', '2019-07-28', 'low', 0, 0),
(116, 3, '9a3bf5a8ce2db30ca823fb9a0c88c8bd64ca7e33', '2019-08-06', 'high', 0, 0),
(117, 3, '58d724cec82a6098a55a7bfbf9b2ded29f7c1eaa', '2019-08-09', 'low', 0, 0),
(118, 3, '43b1c89e1c1435aa1e13f69163beecea3f705016', '2019-08-19', 'high', 0, 0),
(119, 3, '59f76bc4d7f1d0cc111641b82539b2ac8092866e', '2019-08-21', 'high', 0, 0),
(120, 3, '3e517ee2fa2947d28ac39de9249c5a6a94132349', '2019-08-23', 'high', 0, 0),
(121, 3, 'fc24c6133c5b86b4ece601ea109ab27a3494b492', '2019-08-31', 'high', 0, 0),
(122, 3, 'dc7849882c84ba3455502ca38efa2acf3fe0a0d5', '2019-09-10', 'low', 0, 0),
(123, 3, '7b95a9b5c742ce17fb026efe782c6315bceff7af', '2019-09-12', 'low', 0, 0),
(124, 3, '5b675cef163faac4e08c0f534d9d77495f8e2a2a', '2019-09-16', 'normal', 0, 0),
(125, 3, '269a147765f294e239623e8a2460960f2cf1000e', '2019-09-18', 'low', 0, 0),
(126, 3, 'bc0cf3f1c51a2c202ee3abd27215ccddfb5c0208', '2019-09-27', 'normal', 0, 0),
(127, 3, '58a190d6e61c265416f6f72fdecc58eb07b8ee01', '2019-09-29', 'normal', 0, 0),
(128, 3, '6e52e76aac6ec56acf537a8b9b24f09c87867512', '2019-10-07', 'low', 0, 0),
(129, 3, '2ba748ac209ea481f8ef363ab89b7b1ae92a423f', '2019-10-13', 'low', 0, 0),
(130, 3, '893edde88885281d212be9b9bea0ec484401e005', '2019-10-21', 'low', 0, 0),
(131, 3, 'ef0cd593177b2d017a3252cd71d541838d5261ca', '2019-10-26', 'high', 0, 0),
(132, 3, '4cef854da6923cf9b676ff360c3f52c366922439', '2019-11-01', 'high', 0, 0),
(133, 3, '328ef41c89acdffebf4365b2ee0cca7d551c6bbe', '2019-11-09', 'normal', 0, 0),
(134, 3, '0d5993b9757c3e05406dc227d7a030e54c9c49f7', '2019-11-15', 'normal', 0, 0),
(135, 3, '302168b6b657dcbe6631a8ebd76f7b1e1310c17f', '2019-11-22', 'low', 0, 0),
(136, 3, '77911ad06a42c9e156f5bf5307f4b79d2ae5df4c', '2019-11-25', 'high', 0, 0),
(137, 3, '046d8d171022295de534b91e4536cef72922908a', '2019-12-02', 'low', 0, 0),
(138, 3, 'b5a8a647c15d8a7b9f5ddee4efa19bdfa947e611', '2019-12-11', 'low', 0, 0),
(139, 3, 'cacb02e1787b5e94738722efec34c0b12255951b', '2019-12-15', 'high', 0, 0),
(140, 3, '6851e66a04708ca9b5b9adb99a88b180c4c3d2fd', '2019-12-20', 'low', 0, 0),
(141, 3, '17c9af24aeed77a7714cf815858b950bc6e7afa8', '2019-12-27', 'normal', 0, 0),
(142, 3, 'a1d372a56940a81ecdcaae112ee12a53ea7784b7', '2020-01-04', 'high', 0, 0),
(143, 3, '8212544785f8029e91fb286e3248c1fccd0cd8bb', '2020-01-08', 'high', 0, 0),
(144, 3, '44f8cfb2f953d71f1536f46a612d99c71b7217b3', '2020-01-09', 'high', 0, 0),
(145, 3, '1a3390b4235e38d4ec71df1634f879319e73eadf', '2020-01-15', 'high', 0, 0),
(146, 3, 'bf6cff4c26b950f3be89d2c17d910a1f4428a27c', '2020-01-16', 'normal', 0, 0),
(147, 3, '6829edb99110069b744b753ae11224f9280de6c6', '2020-01-24', 'normal', 0, 0),
(148, 3, '72f7ba75b25f7f2ea46a711c002f8dd0e3175ab7', '2020-01-29', 'normal', 0, 0),
(149, 3, '20aec83eaacaa6032e10b3907adf9f104564dee6', '2020-02-06', 'high', 0, 0),
(150, 3, 'ff7f95c4365eea48f6ccb9b681a9a380b99a911b', '2020-02-12', 'normal', 0, 0),
(151, 3, 'a37b066819cf080b033bc44f658266c54b2c830b', '2020-02-16', 'high', 0, 0),
(152, 3, 'bb1e7bca6d8bfc4fec5177a301f1bfcfb5489e4f', '2020-02-19', 'normal', 0, 0),
(153, 3, '37fa8597d54f68203ebbcc020b19c58f1f6a6f87', '2020-02-24', 'normal', 0, 0),
(154, 3, '14918e89b9d0532507934998708c70c15a6c0790', '2020-02-26', 'high', 0, 0),
(155, 3, 'a2833bc7c619015fab5f36c184e7cac2c66d975f', '2020-03-03', 'low', 0, 0),
(156, 3, '1307dcd70d8308e07609da87137f845cddc6f946', '2020-03-08', 'high', 0, 0),
(157, 3, '5c895587f967d881db23b3cfa29edca75c7f0772', '2020-03-09', 'high', 0, 0),
(158, 3, 'b6e90b8dd1c08c70a04d2859d0bfec44790d42a8', '2020-03-11', 'high', 0, 0),
(159, 3, '2739e0c63ed09d2ce7b71d2566aa48f7137a1a66', '2020-03-20', 'normal', 0, 0),
(160, 3, '5861784b49e71d3af8ab8620b0537368e1c3adee', '2020-03-30', 'high', 0, 0),
(161, 3, 'a8ea0a9415ba177a7df7e38001118d86ccf47646', '2020-04-08', 'low', 0, 0),
(162, 3, '5f20521c1a51dd259674c0358b499a7a9b9cb9c3', '2020-04-14', 'normal', 0, 0),
(163, 3, 'cc983ab1eb6a44f121894489fd4715c40b2c6819', '2020-04-19', 'low', 0, 0),
(164, 3, '30662dfe4e64d4469692cfcd76f63c3195bf50e6', '2020-04-25', 'normal', 0, 0),
(165, 3, 'ccb7ee3ee82aa995bc4f0d8b3005a3cdf4854157', '2020-04-28', 'normal', 0, 0),
(166, 3, '80ecda00c131f92d0d6125acd6d9822c7ce223bc', '2020-05-04', 'high', 0, 0),
(167, 3, '389cd3f014599d67a6d8014b8cbe6043f826671a', '2020-05-13', 'high', 0, 0),
(168, 3, '858b8ba2e293e3c89f3b68863eb13564f46f3971', '2020-05-20', 'normal', 0, 0),
(169, 3, 'afcd91dbd772de2b384af1b85f5d3f7c1eee394d', '2020-05-25', 'low', 0, 0),
(170, 3, 'b83afb4ec2f044bf19c0165c3ca9c25902d3e3ae', '2020-05-30', 'normal', 0, 0),
(171, 3, '10f010482f42ca3eb3ff556ffab4f88e229da393', '2020-06-04', 'normal', 0, 0),
(172, 3, 'b5beede2bc213e326a7d1d4ab386f7e0c5dd61ef', '2020-06-08', 'normal', 0, 0),
(173, 3, '2a473d73aae58ef576d6cce770f6c03c3151d6b2', '2020-06-15', 'normal', 0, 0),
(174, 3, '61a87ae501ab880527217b3beb9b7ad74a57fd9b', '2020-06-18', 'low', 0, 0),
(175, 3, '58e9a4d8e25cf7ca7dfc84ce5758f33b7daeee87', '2020-06-25', 'low', 0, 0),
(176, 3, 'f4a35c7cc1d388bdd645fbeb567a72a6e2397914', '2020-06-29', 'low', 0, 0),
(177, 3, 'e8b01a49bab0f17941ad792981c0f36a91d80f30', '2020-07-01', 'low', 0, 0),
(178, 3, 'ba0a4c698df087fe802fddeaa843ba757e2ea60e', '2020-07-09', 'normal', 0, 0),
(179, 3, '3dd51daf7dec88b6c1a9b3cce29439ce039e8839', '2020-07-15', 'normal', 0, 0),
(180, 3, 'ea2b17009138785cfc83394ba1b635c42889159b', '2020-07-22', 'high', 0, 0),
(181, 3, '0a86cc414e0bb7ae8f94b2aabe8739f3fbe3d937', '2020-07-28', 'high', 0, 0),
(182, 3, '0ceb201cc726a32e92b73e1cce965ce53090052e', '2020-08-02', 'normal', 0, 0),
(183, 3, '4ad1b62cd045c3ce9ef59237b67795d8f624c8f2', '2020-08-07', 'normal', 0, 0),
(184, 3, '6ee12c9457f832dbbb26ad6873f52624e5e202ed', '2020-08-09', 'low', 0, 0),
(185, 3, '950bd1cca6dbf068083f73db882a0bcf89a98461', '2020-08-11', 'high', 0, 0),
(186, 3, '1b19f816fade1d83a972cd901b552927db2bb050', '2020-08-21', 'high', 0, 0),
(187, 3, '4e231581d42316dda71adf51daaa928d7739d0a7', '2020-08-27', 'low', 0, 0),
(188, 3, 'e110f43b05bf6c046b175080dd82a6fe7838fa7f', '2020-09-02', 'normal', 0, 0),
(189, 3, '846a8a09f1f2739ec8ee14329931bbfe0b92e79f', '2020-09-09', 'low', 0, 0),
(190, 3, '9ec5d6228a3bca72d8ece91cdf7c3117d2e02723', '2020-09-13', 'high', 0, 0),
(191, 3, 'bc62fae7af451dd0bfe3e820c9058add966a0f24', '2020-09-22', 'low', 0, 0),
(192, 3, '2095aaff35a41c7be60e1db1e89a11a885d3f12c', '2020-09-26', 'normal', 0, 0),
(193, 3, 'd16dd401581c0c19a70f20720d73f4c2c742d474', '2020-10-02', 'low', 0, 0),
(194, 3, '9b82e09ed905c855b9689834e11ddbcdce568064', '2020-10-06', 'normal', 0, 0),
(195, 3, '6f4eb6e87f1aecff9d74e7c9973bbf239c90935a', '2020-10-08', 'high', 0, 0),
(196, 3, 'f4011a5b11dae81a355b2d7a15c281fcdfcc0f51', '2020-10-12', 'normal', 0, 0),
(197, 3, 'da7ee1f8707b1a0f63a0e01013ff2aba5bfcaa8c', '2020-10-14', 'normal', 0, 0),
(198, 3, '6755e3ea4d97037da239b743134b028465d515c5', '2020-10-23', 'low', 0, 0),
(199, 3, 'f19f9fce60724ef1535bc99cdec74db5033a81e5', '2020-11-01', 'normal', 0, 0),
(200, 3, '10ab4616a43968c4cb661445cd7ab61cf74f0d57', '2020-11-04', 'low', 0, 0),
(201, 3, 'be2f6b4061655802baac63b049cbf3e2501cd085', '2020-11-10', 'normal', 0, 0),
(202, 3, '74d242b2795f5f04992019b85edbcd68a1595c42', '2020-11-14', 'normal', 0, 0),
(203, 3, '01eb4ffd6c7249819dc78bf0c421bb4b68d300ef', '2020-11-22', 'normal', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tokens`
--

INSERT INTO `tokens` (`id`, `id_user`, `token`, `date`) VALUES
(3, 3, 'e699fadc45db4493e066a5cc5144352c82abbb1c', '2019-06-05 12:29:07');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `is_deleted`) VALUES
(3, 'test@test.test', '$2y$10$oYcQzz9C2/FiusS7qBGsNe67H9yNlKEEecy5I95WI1FYP8M/sE64e', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT для таблицы `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
