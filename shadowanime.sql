-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 15 Lis 2018, 09:51
-- Wersja serwera: 5.6.37
-- Wersja PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shadowanime`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_favoriteanime`
--

CREATE TABLE IF NOT EXISTS `accounts_favoriteanime` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_favoriteanime`
--

INSERT INTO `accounts_favoriteanime` (`id`, `created`, `last_updated`, `anime_id`, `user_id`) VALUES
(1, '2018-11-15 09:11:34.754052', '2018-11-15 09:11:34.754052', 2, 1),
(2, '2018-11-15 09:11:34.754052', '2018-11-15 09:11:34.754052', 3, 1),
(3, '2018-11-15 09:11:34.754052', '2018-11-15 09:11:34.754052', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_listanime`
--

CREATE TABLE IF NOT EXISTS `accounts_listanime` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_listanime`
--

INSERT INTO `accounts_listanime` (`id`, `type`, `created`, `last_updated`, `anime_id`, `user_id`) VALUES
(1, 'Dropped', '2018-11-14 21:05:23.216724', '2018-11-14 21:05:23.216724', 4, 1),
(2, 'Watching', '2018-11-14 21:05:23.216724', '2018-11-14 21:05:23.216724', 2, 1),
(3, 'Completed', '2018-11-14 21:05:23.222757', '2018-11-14 21:05:23.222757', 3, 1),
(4, 'Planning', '2018-11-14 21:05:23.222757', '2018-11-14 21:05:23.222757', 1, 1),
(5, 'Completed', '2018-11-14 21:13:27.912101', '2018-11-14 21:13:27.912101', 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_profile`
--

CREATE TABLE IF NOT EXISTS `accounts_profile` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `signature` longtext,
  `language` varchar(20) DEFAULT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `slug`, `avatar`, `signature`, `language`, `last_activity`, `role_id`, `user_id`) VALUES
(1, '-2', 'img/user/user.png', NULL, 'pl', '2018-11-15 09:43:36.742767', NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_roleuser`
--

CREATE TABLE IF NOT EXISTS `accounts_roleuser` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `role_power_number` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_userfavoriteanime`
--

CREATE TABLE IF NOT EXISTS `accounts_userfavoriteanime` (
  `id` int(11) NOT NULL,
  `created_list` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_userfavoriteanime`
--

INSERT INTO `accounts_userfavoriteanime` (`id`, `created_list`, `last_updated`, `user_id`) VALUES
(1, '2018-11-15 09:11:10.564609', '2018-11-15 09:11:34.754052', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_userlistanime`
--

CREATE TABLE IF NOT EXISTS `accounts_userlistanime` (
  `id` int(11) NOT NULL,
  `created_list` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_userlistanime`
--

INSERT INTO `accounts_userlistanime` (`id`, `created_list`, `last_updated`, `user_id`) VALUES
(1, '2018-11-14 20:51:21.149875', '2018-11-15 08:54:20.339410', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_userwatchedanime`
--

CREATE TABLE IF NOT EXISTS `accounts_userwatchedanime` (
  `id` int(11) NOT NULL,
  `created_list` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_userwatchedanime`
--

INSERT INTO `accounts_userwatchedanime` (`id`, `created_list`, `last_updated`, `user_id`) VALUES
(1, '2018-11-14 20:51:21.200009', '2018-11-15 08:54:20.409716', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_watchedanime`
--

CREATE TABLE IF NOT EXISTS `accounts_watchedanime` (
  `id` int(11) NOT NULL,
  `watch` smallint(6) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `episode_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accounts_watchedanime`
--

INSERT INTO `accounts_watchedanime` (`id`, `watch`, `created`, `last_updated`, `episode_id`, `user_id`) VALUES
(7, 2, '2018-11-14 21:06:48.804337', '2018-11-14 21:12:22.523587', 1, 1),
(8, 2, '2018-11-14 21:06:48.804337', '2018-11-14 21:12:22.523587', 2, 1),
(9, 2, '2018-11-14 21:06:48.804337', '2018-11-14 21:12:22.523587', 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_anime`
--

CREATE TABLE IF NOT EXISTS `anime_anime` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_roman` varchar(191) DEFAULT NULL,
  `title_kanji` varchar(191) DEFAULT NULL,
  `description` longtext NOT NULL,
  `picture` varchar(100) NOT NULL,
  `type_series` varchar(5) NOT NULL,
  `pub_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_anime` varchar(20) NOT NULL,
  `mpaa` varchar(5) NOT NULL,
  `number_episode` varchar(20) DEFAULT NULL,
  `episode_time` varchar(20) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `anime_anime`
--

INSERT INTO `anime_anime` (`id`, `title`, `slug`, `title_en`, `title_roman`, `title_kanji`, `description`, `picture`, `type_series`, `pub_date`, `end_date`, `status_anime`, `mpaa`, `number_episode`, `episode_time`, `created_user_id`) VALUES
(1, 'One Piece', 'one-piece', NULL, NULL, NULL, 'One Piece opowiada nam historię młodego, nieznanego światu pirata o jakże złowieszczym i mrożącym krew w żyłach imieniu Luffy, który za cel życia obrał sobie całkiem drobne marzenie - zostanie królem piratów! W świecie One Piece znajduje się 5 oceanów, cztery z nich to odpowiednio South/North/East/West Blue, piątym zaś, największym, najniebezpieczniejszym i usianym wysepkami jest Grand Line. To właśnie gdzieś na tym piątym oceanie znajduje się tytułowy One Piece - skarb pozostawiony przez poprzedniego króla piratów Gol D. Rogera, którego to skarbu wіaściciel staje się władcą Grand Line. Oczywistym jest, że Luffy, choć piekielnie silny, samotnie nigdy nie da rady zrealizować swojego marzenia - nie sposób wszak samemu sterować statkiem... I to nie byle łajbą ale prawdziwą piracką galerą, toteż priorytetem naszego rubasznego bohatera staje się zebranie załogi! Kto będzie tę załogę stanowił? Czy okażą się kompanami godnymi zaufania czy też pazernymi hedonistami? Na czym polega nieludzka siła Luffyego? Odpowiedzi na te wszystkie i wiele więcej pytań czekają na was.', 'img/anime/None-One Piece/235189.jpg', 'TV', '1999-10-20', NULL, 'Emitowane', 'PG-13', NULL, '24', NULL),
(2, 'Black Clover', 'black-clover', NULL, NULL, NULL, 'Seria przedstawia losy piętnastoletniego chłopca o imieniu Asta, który dąży do zostania Cesarzem magii, czyli bycia najsilniejszym magiem w królestwie. To nie będzie proste z wielu powodów. Jednym z nich jest to że jego uzdolniony magicznie brat Yuno dąży do tego samego celu. Na dodatek podstawowym problem jest to, że Asta nie ma w swoim ciele żadnej wykrywalnej ani znanej magii! Okazuje się jednak, że ma więcej szczęścia niż rozumu - otrzymuje niesamowicie rzadki Grymuar pięciolistnej koniczyny, który udostępnia mu moc antymagiczną! Czy ktoś, kto nie potrafi używać mocy magicznej może zostać Cesarzem Magii?\r\nJedno jest pewne - nasz bohater nigdy się nie podda!', 'img/anime/None-Black Clover/222849_vlBo6sw.jpg', 'TV', '2017-10-03', NULL, 'Emitowane', 'PG-13', NULL, '24', NULL),
(3, 'Fairy Tail', 'fairy-tail', NULL, NULL, NULL, 'Akcja Fairy Tail rozgrywa się na ziemiach królestwa Fiore, gdzie magia jest czymś normalnym - ludzie nią handlują i dzięki niej się utrzymują. Na całym kontynencie utworzone są gildie skupiające magów, aby ci wykonywali zadania niewykonalne bądź za trudne dla przeciętnego człowieka. Anime opowiada o przygodach gildii nazwanej Fairy Tail. Wraz z rozwojem fabuły poznajemy historie bohaterów i legendarnych stworzeń m.in. smoków.\r\nHistoria zaczyna się od dołączenia do gildii Lucy Heartfilii. Poznaje ona pozostałych członków, między innymi Natsu, jego najlepszego przyjaciela (latającego i mówiącego kota) Happy, ciągle rozbierającego się Graya oraz wszechmocną Erzę Scarlet. Wraz z nimi przeżywa wiele przygód i razem stawiają czoła wszelakim przeciwnościom.\r\nDlaczego zabójca smoków był wychowany przez smoka? Kim tak naprawdę jest Happy? Odpowiedzi na te i wiele innych pytań znajdziecie w tej serii wraz z odpowiednią dawką akcji i humoru, typową dla shounena.', 'img/anime/None-Fairy Tail/193232_dieDMNV.jpg', 'TV', '2009-10-12', '2013-03-30', 'Zakończone', 'PG-13', '175', '24', NULL),
(4, '.hack//G.U. Trilogy: Parody Mode', 'hackgu-trilogy-parody-mode', NULL, NULL, NULL, '', 'img/anime/default/brak_obrazka.jpg', 'TV', NULL, NULL, 'Emitowane', 'PG-13', NULL, '24', NULL),
(5, 'Test test', 'test-test', NULL, NULL, NULL, '', 'img/anime/default/brak_obrazka.jpg', 'FILM', NULL, NULL, 'Zakończone', 'PG-13', NULL, '25', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_episodsanime`
--

CREATE TABLE IF NOT EXISTS `anime_episodsanime` (
  `id` int(11) NOT NULL,
  `name_pl` varchar(191) NOT NULL,
  `name_eng` varchar(191) NOT NULL,
  `name_rom` varchar(191) NOT NULL,
  `name_kan` varchar(191) NOT NULL,
  `filler` tinyint(1) NOT NULL,
  `Published` tinyint(1) NOT NULL,
  `special` tinyint(1) NOT NULL,
  `typ` varchar(30) NOT NULL,
  `dlugosc` int(10) unsigned NOT NULL,
  `numer` int(10) unsigned NOT NULL,
  `channel` varchar(191) NOT NULL,
  `premiera` date DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `message` longtext,
  `anime_title_id` int(11) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `anime_episodsanime`
--

INSERT INTO `anime_episodsanime` (`id`, `name_pl`, `name_eng`, `name_rom`, `name_kan`, `filler`, `Published`, `special`, `typ`, `dlugosc`, `numer`, `channel`, `premiera`, `created`, `last_updated`, `message`, `anime_title_id`, `created_user_id`) VALUES
(1, 'Fairy Tail', '', '', '', 0, 0, 0, 'standardowy', 25, 1, '', NULL, '2018-11-14 21:02:33.397440', '2018-11-14 21:02:33.397440', '', 3, NULL),
(2, 'Nazywam się Luffy! Zamierzam zostać królem piratów', '', '', '', 0, 0, 0, 'standardowy', 25, 1, '', NULL, '2018-11-14 21:03:03.985600', '2018-11-14 21:03:03.985600', '', 1, NULL),
(3, 'Asta i Yuno', '', '', '', 0, 0, 0, 'standardowy', 25, 1, '', NULL, '2018-11-14 21:03:17.266332', '2018-11-14 21:03:30.796112', '', 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_playerepisode`
--

CREATE TABLE IF NOT EXISTS `anime_playerepisode` (
  `id` int(11) NOT NULL,
  `player_1` varchar(200) DEFAULT NULL,
  `player_2` varchar(200) DEFAULT NULL,
  `player_3` varchar(200) DEFAULT NULL,
  `player_4` varchar(200) DEFAULT NULL,
  `player_5` varchar(200) DEFAULT NULL,
  `player_6` varchar(200) DEFAULT NULL,
  `voice_lang` varchar(20) NOT NULL,
  `subs_lang` varchar(20) NOT NULL,
  `resolution` varchar(8) NOT NULL,
  `author_sub` varchar(191) NOT NULL,
  `source_video` varchar(200) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `message` longtext,
  `Published` tinyint(1) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `episode_anime_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_scoreanime`
--

CREATE TABLE IF NOT EXISTS `anime_scoreanime` (
  `id` int(11) NOT NULL,
  `general` int(11) NOT NULL,
  `story` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `graphics` int(11) NOT NULL,
  `music` int(11) NOT NULL,
  `anime_title_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `anime_scoreanime`
--

INSERT INTO `anime_scoreanime` (`id`, `general`, `story`, `character`, `graphics`, `music`, `anime_title_id`, `user_id`) VALUES
(1, 9, 9, 9, 9, 9, 2, 1),
(2, 9, 8, 9, 7, 8, 3, 1),
(3, 10, 9, 9, 8, 9, 1, 1),
(4, 5, 2, 4, 3, 6, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_taganime`
--

CREATE TABLE IF NOT EXISTS `anime_taganime` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `message` longtext,
  `Published` tinyint(1) NOT NULL,
  `anime_title_id` int(11) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add kv store', 7, 'add_kvstore'),
(26, 'Can change kv store', 7, 'change_kvstore'),
(27, 'Can delete kv store', 7, 'delete_kvstore'),
(28, 'Can view kv store', 7, 'view_kvstore'),
(29, 'Can add list anime', 8, 'add_listanime'),
(30, 'Can change list anime', 8, 'change_listanime'),
(31, 'Can delete list anime', 8, 'delete_listanime'),
(32, 'Can view list anime', 8, 'view_listanime'),
(33, 'Can add profile', 9, 'add_profile'),
(34, 'Can change profile', 9, 'change_profile'),
(35, 'Can delete profile', 9, 'delete_profile'),
(36, 'Can view profile', 9, 'view_profile'),
(37, 'Can add role user', 10, 'add_roleuser'),
(38, 'Can change role user', 10, 'change_roleuser'),
(39, 'Can delete role user', 10, 'delete_roleuser'),
(40, 'Can view role user', 10, 'view_roleuser'),
(41, 'Can add user list anime', 11, 'add_userlistanime'),
(42, 'Can change user list anime', 11, 'change_userlistanime'),
(43, 'Can delete user list anime', 11, 'delete_userlistanime'),
(44, 'Can view user list anime', 11, 'view_userlistanime'),
(45, 'Can add user watched anime', 12, 'add_userwatchedanime'),
(46, 'Can change user watched anime', 12, 'change_userwatchedanime'),
(47, 'Can delete user watched anime', 12, 'delete_userwatchedanime'),
(48, 'Can view user watched anime', 12, 'view_userwatchedanime'),
(49, 'Can add watched anime', 13, 'add_watchedanime'),
(50, 'Can change watched anime', 13, 'change_watchedanime'),
(51, 'Can delete watched anime', 13, 'delete_watchedanime'),
(52, 'Can view watched anime', 13, 'view_watchedanime'),
(53, 'Can add last update', 14, 'add_lastupdate'),
(54, 'Can change last update', 14, 'change_lastupdate'),
(55, 'Can delete last update', 14, 'delete_lastupdate'),
(56, 'Can view last update', 14, 'view_lastupdate'),
(57, 'Can add news', 15, 'add_news'),
(58, 'Can change news', 15, 'change_news'),
(59, 'Can delete news', 15, 'delete_news'),
(60, 'Can view news', 15, 'view_news'),
(61, 'Can add anime', 16, 'add_anime'),
(62, 'Can change anime', 16, 'change_anime'),
(63, 'Can delete anime', 16, 'delete_anime'),
(64, 'Can view anime', 16, 'view_anime'),
(65, 'Can add episods anime', 17, 'add_episodsanime'),
(66, 'Can change episods anime', 17, 'change_episodsanime'),
(67, 'Can delete episods anime', 17, 'delete_episodsanime'),
(68, 'Can view episods anime', 17, 'view_episodsanime'),
(69, 'Can add player episode', 18, 'add_playerepisode'),
(70, 'Can change player episode', 18, 'change_playerepisode'),
(71, 'Can delete player episode', 18, 'delete_playerepisode'),
(72, 'Can view player episode', 18, 'view_playerepisode'),
(73, 'Can add score anime', 19, 'add_scoreanime'),
(74, 'Can change score anime', 19, 'change_scoreanime'),
(75, 'Can delete score anime', 19, 'delete_scoreanime'),
(76, 'Can view score anime', 19, 'view_scoreanime'),
(77, 'Can add tag anime', 20, 'add_taganime'),
(78, 'Can change tag anime', 20, 'change_taganime'),
(79, 'Can delete tag anime', 20, 'delete_taganime'),
(80, 'Can view tag anime', 20, 'view_taganime'),
(81, 'Can add tag', 21, 'add_tag'),
(82, 'Can change tag', 21, 'change_tag'),
(83, 'Can delete tag', 21, 'delete_tag'),
(84, 'Can view tag', 21, 'view_tag'),
(85, 'Can add favorite anime', 22, 'add_favoriteanime'),
(86, 'Can change favorite anime', 22, 'change_favoriteanime'),
(87, 'Can delete favorite anime', 22, 'delete_favoriteanime'),
(88, 'Can view favorite anime', 22, 'view_favoriteanime'),
(89, 'Can add user favorite anime', 23, 'add_userfavoriteanime'),
(90, 'Can change user favorite anime', 23, 'change_userfavoriteanime'),
(91, 'Can delete user favorite anime', 23, 'delete_userfavoriteanime'),
(92, 'Can view user favorite anime', 23, 'view_userfavoriteanime');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$Orc2k0zzWnwz$wf/se5LtYD3g6j6bihpe1559LrNyfIoM9IIXbL9FgTA=', '2018-11-15 08:54:20.179722', 1, 'tshibe', '', '', '', 1, 1, '2018-11-14 20:51:20.883937');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-11-14 20:59:21.764411', '1', 'One Piece', 1, '[{"added": {}}]', 16, 1),
(2, '2018-11-14 21:00:07.620096', '2', 'Black Clover', 1, '[{"added": {}}]', 16, 1),
(3, '2018-11-14 21:01:48.158414', '3', 'Fairy Tail', 1, '[{"added": {}}]', 16, 1),
(4, '2018-11-14 21:02:03.478088', '4', '.hack//G.U. Trilogy: Parody Mode', 1, '[{"added": {}}]', 16, 1),
(5, '2018-11-14 21:02:33.397440', '1', '1, Fairy Tail - Fairy Tail', 1, '[{"added": {}}]', 17, 1),
(6, '2018-11-14 21:03:03.985600', '2', '1, One Piece - Nazywam się Luffy! Zamierzam zostać królem piratów', 1, '[{"added": {}}]', 17, 1),
(7, '2018-11-14 21:03:17.266332', '3', '0, Black Clover - Asta i Yuno', 1, '[{"added": {}}]', 17, 1),
(8, '2018-11-14 21:03:30.796112', '3', '1, Black Clover - Asta i Yuno', 2, '[{"changed": {"fields": ["numer"]}}]', 17, 1),
(9, '2018-11-14 21:03:51.966086', '1', '9', 1, '[{"added": {}}]', 19, 1),
(10, '2018-11-14 21:04:07.455082', '2', '9', 1, '[{"added": {}}]', 19, 1),
(11, '2018-11-14 21:04:34.474973', '3', '10', 1, '[{"added": {}}]', 19, 1),
(12, '2018-11-14 21:04:52.103521', '4', '5', 1, '[{"added": {}}]', 19, 1),
(13, '2018-11-14 21:05:23.222757', '1', 'tshibe', 2, '[{"added": {"name": "list anime", "object": "tshibe, Dropped - .hack//G.U. Trilogy: Parody Mode"}}, {"added": {"name": "list anime", "object": "tshibe, Watching - Black Clover"}}, {"added": {"name": "list anime", "object": "tshibe, Completed - Fairy Tail"}}, {"added": {"name": "list anime", "object": "tshibe, Planning - One Piece"}}]', 11, 1),
(14, '2018-11-14 21:06:48.804337', '1', 'tshibe', 2, '[{"added": {"name": "watched anime", "object": "1, tshibe, Fairy Tail"}}, {"added": {"name": "watched anime", "object": "1, tshibe, Nazywam si\\u0119 Luffy! Zamierzam zosta\\u0107 kr\\u00f3lem pirat\\u00f3w"}}, {"added": {"name": "watched anime", "object": "1, tshibe, Asta i Yuno"}}]', 12, 1),
(15, '2018-11-14 21:07:00.170910', '1', 'tshibe', 2, '[]', 12, 1),
(16, '2018-11-14 21:12:22.523587', '1', 'tshibe', 2, '[{"changed": {"name": "watched anime", "object": "2, tshibe, Fairy Tail", "fields": ["watch"]}}, {"changed": {"name": "watched anime", "object": "2, tshibe, Nazywam si\\u0119 Luffy! Zamierzam zosta\\u0107 kr\\u00f3lem pirat\\u00f3w", "fields": ["watch"]}}, {"changed": {"name": "watched anime", "object": "2, tshibe, Asta i Yuno", "fields": ["watch"]}}]', 12, 1),
(17, '2018-11-14 21:13:13.522537', '5', 'Test test', 1, '[{"added": {}}]', 16, 1),
(18, '2018-11-14 21:13:27.912101', '1', 'tshibe', 2, '[{"added": {"name": "list anime", "object": "tshibe, Completed - Test test"}}]', 11, 1),
(19, '2018-11-15 09:11:10.564609', '1', 'tshibe', 1, '[{"added": {}}]', 23, 1),
(20, '2018-11-15 09:11:34.764290', '1', 'tshibe', 2, '[{"added": {"name": "favorite anime", "object": "tshibe, Black Clover"}}, {"added": {"name": "favorite anime", "object": "tshibe, Fairy Tail"}}, {"added": {"name": "favorite anime", "object": "tshibe, One Piece"}}]', 23, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(22, 'accounts', 'favoriteanime'),
(8, 'accounts', 'listanime'),
(9, 'accounts', 'profile'),
(10, 'accounts', 'roleuser'),
(23, 'accounts', 'userfavoriteanime'),
(11, 'accounts', 'userlistanime'),
(12, 'accounts', 'userwatchedanime'),
(13, 'accounts', 'watchedanime'),
(1, 'admin', 'logentry'),
(16, 'anime', 'anime'),
(17, 'anime', 'episodsanime'),
(18, 'anime', 'playerepisode'),
(19, 'anime', 'scoreanime'),
(20, 'anime', 'taganime'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(14, 'shadow', 'lastupdate'),
(15, 'shadow', 'news'),
(21, 'tags', 'tag'),
(7, 'thumbnail', 'kvstore');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-11-14 20:49:16.291467'),
(2, 'auth', '0001_initial', '2018-11-14 20:49:20.349046'),
(3, 'tags', '0001_initial', '2018-11-14 20:49:21.119845'),
(4, 'anime', '0001_initial', '2018-11-14 20:49:25.984232'),
(5, 'accounts', '0001_initial', '2018-11-14 20:49:27.184833'),
(6, 'accounts', '0002_auto_20181114_2148', '2018-11-14 20:49:31.972627'),
(7, 'admin', '0001_initial', '2018-11-14 20:49:32.733211'),
(8, 'admin', '0002_logentry_remove_auto_add', '2018-11-14 20:49:32.789092'),
(9, 'admin', '0003_logentry_add_action_flag_choices', '2018-11-14 20:49:32.853038'),
(10, 'contenttypes', '0002_remove_content_type_name', '2018-11-14 20:49:33.448840'),
(11, 'auth', '0002_alter_permission_name_max_length', '2018-11-14 20:49:33.776313'),
(12, 'auth', '0003_alter_user_email_max_length', '2018-11-14 20:49:34.110361'),
(13, 'auth', '0004_alter_user_username_opts', '2018-11-14 20:49:34.170262'),
(14, 'auth', '0005_alter_user_last_login_null', '2018-11-14 20:49:34.558623'),
(15, 'auth', '0006_require_contenttypes_0002', '2018-11-14 20:49:34.697527'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2018-11-14 20:49:34.776559'),
(17, 'auth', '0008_alter_user_username_max_length', '2018-11-14 20:49:35.115824'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2018-11-14 20:49:35.477283'),
(19, 'sessions', '0001_initial', '2018-11-14 20:49:35.759079'),
(20, 'shadow', '0001_initial', '2018-11-14 20:49:36.604790'),
(21, 'shadow', '0002_auto_20181107_2241', '2018-11-14 20:49:36.922287'),
(22, 'shadow', '0003_auto_20181108_1604', '2018-11-14 20:49:36.980516'),
(23, 'thumbnail', '0001_initial', '2018-11-14 20:49:37.206738'),
(24, 'accounts', '0003_auto_20181115_1007', '2018-11-15 09:09:16.291979');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nqdwurkqke5reeivvhvqi15kbv5oz1is', 'ZDYwNjhkNjVmZjFmYzg2M2Q0ZTNkODllMTcxNjYxNWIwNzQzYTcyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTFjOWU5NGFhOWE5YTg1Njg4ZTAxODU4YzNmOGViOTYzMDA5YmM3In0=', '2018-11-15 10:43:36.762474'),
('vyd01hq8bwq0pmk5o7lzmj14z988yfj9', 'ZDYwNjhkNjVmZjFmYzg2M2Q0ZTNkODllMTcxNjYxNWIwNzQzYTcyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTFjOWU5NGFhOWE5YTg1Njg4ZTAxODU4YzNmOGViOTYzMDA5YmM3In0=', '2018-11-14 22:38:59.961983'),
('x6in8w8ldao7weidtnt8pqlmtrl8hlfd', 'ZDYwNjhkNjVmZjFmYzg2M2Q0ZTNkODllMTcxNjYxNWIwNzQzYTcyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTFjOWU5NGFhOWE5YTg1Njg4ZTAxODU4YzNmOGViOTYzMDA5YmM3In0=', '2018-11-14 22:41:09.541895');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shadow_lastupdate`
--

CREATE TABLE IF NOT EXISTS `shadow_lastupdate` (
  `id` int(11) NOT NULL,
  `updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shadow_news`
--

CREATE TABLE IF NOT EXISTS `shadow_news` (
  `id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tags_tag`
--

CREATE TABLE IF NOT EXISTS `tags_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL,
  `language` varchar(6) NOT NULL,
  `parent` varchar(191) DEFAULT NULL,
  `description` longtext,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `message` longtext,
  `Published` tinyint(1) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `thumbnail_kvstore`
--

CREATE TABLE IF NOT EXISTS `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `thumbnail_kvstore`
--

INSERT INTO `thumbnail_kvstore` (`key`, `value`) VALUES
('sorl-thumbnail||image||0c8d7b2d93fed257cb99857b72b34c57', '{"name": "cache/b7/94/b794853e03e42ba23afc8a1373442f21.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 300]}'),
('sorl-thumbnail||image||2dbf3f72cd8b79b912a9dbb003a444cf', '{"name": "cache/f9/58/f9580fed790da6eb37a9761ffd2cdc83.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 260]}'),
('sorl-thumbnail||image||34bc3f5c7e1c876ecd73be7adde000b6', '{"name": "cache/1d/16/1d1693cdfcb25349dbf0295d24e3b2ff.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 260]}'),
('sorl-thumbnail||image||4ae376ae4fbb88f3cf1172f03433670c', '{"name": "cache/47/42/47428301a8c81bac8f012ef4e812c86e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 300]}'),
('sorl-thumbnail||image||4da8457044d1e52833e1abf7ab0c6afc', '{"name": "img/anime/None-Black Clover/222849_vlBo6sw.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 318]}'),
('sorl-thumbnail||image||54b9f603ae39c924e544fcc461fd6e17', '{"name": "cache/ad/b4/adb4b192c2d5400aa07ea6cbe55121dc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 300]}'),
('sorl-thumbnail||image||57b81f4905b26a744a6e89fb888bd110', '{"name": "cache/24/8a/248a5338a8dd654e8ad04406ba8ca200.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 260]}'),
('sorl-thumbnail||image||5f22451d67b2a408ed1e6b4c000402c6', '{"name": "cache/13/57/13579dcd7729a6a146b7a93bc201f014.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 225]}'),
('sorl-thumbnail||image||68a3317f221335fdbbe0c55fa3d62be1', '{"name": "cache/a5/36/a536783cf989a8ebcfa29c2a3ffc10d8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 260]}'),
('sorl-thumbnail||image||83fa1a807ab80ef071bd1ce410a2244e', '{"name": "cache/e0/2f/e02f5bb2757454ed1dc39ca311ad25f8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [47, 73]}'),
('sorl-thumbnail||image||8b9da7e357665da11ce77e89e50d3b13', '{"name": "img/anime/None-One Piece/235189.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 324]}'),
('sorl-thumbnail||image||965207a617d5934c03598b6cd4674ef0', '{"name": "img/anime/None-Fairy Tail/193232_dieDMNV.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 315]}'),
('sorl-thumbnail||image||a1765df3dbc6a5e783c1015dc6b46b06', '{"name": "img/anime/default/brak_obrazka.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 350]}'),
('sorl-thumbnail||image||cd5ec878ac8ae0cbd4ea5b64b0f5e59c', '{"name": "img/user/user.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [530, 530]}'),
('sorl-thumbnail||image||d339db1253129ba438a2fe9df4396b06', '{"name": "cache/f5/6b/f56b3cf17131adc2a081e1b97a05b064.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [47, 73]}'),
('sorl-thumbnail||image||d4dc64903c42f2891beca19f7bb14df1', '{"name": "cache/99/ac/99ac5db07e190c61c1e8d8b2e0e5efbc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [225, 300]}'),
('sorl-thumbnail||image||e529f91b1908883e5ec233d185942d84', '{"name": "cache/c5/2a/c52accb27b1fd172665816b6bfe77e8e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [47, 73]}'),
('sorl-thumbnail||image||e739d0debb6cffa0d4a10381495c9d1e', '{"name": "cache/20/8a/208a5363ce553588a5a9bf12f48a9459.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [47, 73]}'),
('sorl-thumbnail||image||ef526ae6edbbd3993768da7bab6ab2fa', '{"name": "cache/99/5c/995ce9b8fae291e50cc568d0badf74bd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [30, 30]}'),
('sorl-thumbnail||thumbnails||4da8457044d1e52833e1abf7ab0c6afc', '["83fa1a807ab80ef071bd1ce410a2244e", "4ae376ae4fbb88f3cf1172f03433670c", "2dbf3f72cd8b79b912a9dbb003a444cf"]'),
('sorl-thumbnail||thumbnails||8b9da7e357665da11ce77e89e50d3b13', '["68a3317f221335fdbbe0c55fa3d62be1", "d339db1253129ba438a2fe9df4396b06", "d4dc64903c42f2891beca19f7bb14df1"]'),
('sorl-thumbnail||thumbnails||965207a617d5934c03598b6cd4674ef0', '["e529f91b1908883e5ec233d185942d84", "34bc3f5c7e1c876ecd73be7adde000b6", "54b9f603ae39c924e544fcc461fd6e17"]'),
('sorl-thumbnail||thumbnails||a1765df3dbc6a5e783c1015dc6b46b06', '["57b81f4905b26a744a6e89fb888bd110", "e739d0debb6cffa0d4a10381495c9d1e", "0c8d7b2d93fed257cb99857b72b34c57"]'),
('sorl-thumbnail||thumbnails||cd5ec878ac8ae0cbd4ea5b64b0f5e59c', '["ef526ae6edbbd3993768da7bab6ab2fa", "5f22451d67b2a408ed1e6b4c000402c6"]');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `accounts_favoriteanime`
--
ALTER TABLE `accounts_favoriteanime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_favoriteanime_anime_id_cb3d56ec_fk_anime_anime_id` (`anime_id`),
  ADD KEY `accounts_favoriteani_user_id_881d858c_fk_accounts_` (`user_id`);

--
-- Indexes for table `accounts_listanime`
--
ALTER TABLE `accounts_listanime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_listanime_anime_id_5aeddc1d_fk_anime_anime_id` (`anime_id`),
  ADD KEY `accounts_listanime_user_id_5a6f7da1_fk_accounts_userlistanime_id` (`user_id`);

--
-- Indexes for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_profile_slug_8a7a322e` (`slug`),
  ADD KEY `accounts_profile_role_id_22d0fb13_fk_accounts_roleuser_id` (`role_id`);

--
-- Indexes for table `accounts_roleuser`
--
ALTER TABLE `accounts_roleuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_userfavoriteanime`
--
ALTER TABLE `accounts_userfavoriteanime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_userlistanime`
--
ALTER TABLE `accounts_userlistanime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_userwatchedanime`
--
ALTER TABLE `accounts_userwatchedanime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_watchedanime`
--
ALTER TABLE `accounts_watchedanime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_watchedanim_episode_id_9d6eda74_fk_anime_epi` (`episode_id`),
  ADD KEY `accounts_watchedanim_user_id_508b8058_fk_accounts_` (`user_id`);

--
-- Indexes for table `anime_anime`
--
ALTER TABLE `anime_anime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_anime_created_user_id_bf85af4f_fk_auth_user_id` (`created_user_id`),
  ADD KEY `anime_anime_slug_3ec903e0` (`slug`);

--
-- Indexes for table `anime_episodsanime`
--
ALTER TABLE `anime_episodsanime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_episodsanime_name_pl_name_eng_name_ro_827b97f4_uniq` (`name_pl`,`name_eng`,`name_rom`,`name_kan`,`anime_title_id`),
  ADD KEY `anime_episodsanime_anime_title_id_27710438_fk_anime_anime_id` (`anime_title_id`),
  ADD KEY `anime_episodsanime_created_user_id_70a58870_fk_auth_user_id` (`created_user_id`);

--
-- Indexes for table `anime_playerepisode`
--
ALTER TABLE `anime_playerepisode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_playerepisode_created_user_id_b49acb1a_fk_auth_user_id` (`created_user_id`),
  ADD KEY `anime_playerepisode_episode_anime_id_b983704a_fk_anime_epi` (`episode_anime_id`);

--
-- Indexes for table `anime_scoreanime`
--
ALTER TABLE `anime_scoreanime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_scoreanime_user_id_anime_title_id_3a8dd6c2_uniq` (`user_id`,`anime_title_id`),
  ADD KEY `anime_scoreanime_anime_title_id_38901579_fk_anime_anime_id` (`anime_title_id`);

--
-- Indexes for table `anime_taganime`
--
ALTER TABLE `anime_taganime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_taganime_anime_title_id_tag_id_8a816372_uniq` (`anime_title_id`,`tag_id`),
  ADD KEY `anime_taganime_created_user_id_34ec6201_fk_auth_user_id` (`created_user_id`),
  ADD KEY `anime_taganime_tag_id_81039019_fk_tags_tag_id` (`tag_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `shadow_lastupdate`
--
ALTER TABLE `shadow_lastupdate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shadow_news`
--
ALTER TABLE `shadow_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shadow_news_user_id_d396ef5c_fk_auth_user_id` (`user_id`),
  ADD KEY `shadow_news_slug_8ba96024` (`slug`);

--
-- Indexes for table `tags_tag`
--
ALTER TABLE `tags_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_tag_name_type_60c4357e_uniq` (`name`,`type`),
  ADD KEY `tags_tag_created_user_id_32dcef4f_fk_auth_user_id` (`created_user_id`);

--
-- Indexes for table `thumbnail_kvstore`
--
ALTER TABLE `thumbnail_kvstore`
  ADD PRIMARY KEY (`key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `accounts_favoriteanime`
--
ALTER TABLE `accounts_favoriteanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `accounts_listanime`
--
ALTER TABLE `accounts_listanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `accounts_roleuser`
--
ALTER TABLE `accounts_roleuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `accounts_userfavoriteanime`
--
ALTER TABLE `accounts_userfavoriteanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `accounts_userlistanime`
--
ALTER TABLE `accounts_userlistanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `accounts_userwatchedanime`
--
ALTER TABLE `accounts_userwatchedanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `accounts_watchedanime`
--
ALTER TABLE `accounts_watchedanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT dla tabeli `anime_anime`
--
ALTER TABLE `anime_anime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `anime_episodsanime`
--
ALTER TABLE `anime_episodsanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `anime_playerepisode`
--
ALTER TABLE `anime_playerepisode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `anime_scoreanime`
--
ALTER TABLE `anime_scoreanime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `anime_taganime`
--
ALTER TABLE `anime_taganime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT dla tabeli `shadow_lastupdate`
--
ALTER TABLE `shadow_lastupdate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `shadow_news`
--
ALTER TABLE `shadow_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `tags_tag`
--
ALTER TABLE `tags_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `accounts_favoriteanime`
--
ALTER TABLE `accounts_favoriteanime`
  ADD CONSTRAINT `accounts_favoriteani_user_id_881d858c_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_userfavoriteanime` (`id`),
  ADD CONSTRAINT `accounts_favoriteanime_anime_id_cb3d56ec_fk_anime_anime_id` FOREIGN KEY (`anime_id`) REFERENCES `anime_anime` (`id`);

--
-- Ograniczenia dla tabeli `accounts_listanime`
--
ALTER TABLE `accounts_listanime`
  ADD CONSTRAINT `accounts_listanime_anime_id_5aeddc1d_fk_anime_anime_id` FOREIGN KEY (`anime_id`) REFERENCES `anime_anime` (`id`),
  ADD CONSTRAINT `accounts_listanime_user_id_5a6f7da1_fk_accounts_userlistanime_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userlistanime` (`id`);

--
-- Ograniczenia dla tabeli `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_role_id_22d0fb13_fk_accounts_roleuser_id` FOREIGN KEY (`role_id`) REFERENCES `accounts_roleuser` (`id`),
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `accounts_userfavoriteanime`
--
ALTER TABLE `accounts_userfavoriteanime`
  ADD CONSTRAINT `accounts_userfavoriteanime_user_id_69b0b7fd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `accounts_userlistanime`
--
ALTER TABLE `accounts_userlistanime`
  ADD CONSTRAINT `accounts_userlistanime_user_id_b05b54f9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `accounts_userwatchedanime`
--
ALTER TABLE `accounts_userwatchedanime`
  ADD CONSTRAINT `accounts_userwatchedanime_user_id_91e6081a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `accounts_watchedanime`
--
ALTER TABLE `accounts_watchedanime`
  ADD CONSTRAINT `accounts_watchedanim_episode_id_9d6eda74_fk_anime_epi` FOREIGN KEY (`episode_id`) REFERENCES `anime_episodsanime` (`id`),
  ADD CONSTRAINT `accounts_watchedanim_user_id_508b8058_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_userwatchedanime` (`id`);

--
-- Ograniczenia dla tabeli `anime_anime`
--
ALTER TABLE `anime_anime`
  ADD CONSTRAINT `anime_anime_created_user_id_bf85af4f_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `anime_episodsanime`
--
ALTER TABLE `anime_episodsanime`
  ADD CONSTRAINT `anime_episodsanime_anime_title_id_27710438_fk_anime_anime_id` FOREIGN KEY (`anime_title_id`) REFERENCES `anime_anime` (`id`),
  ADD CONSTRAINT `anime_episodsanime_created_user_id_70a58870_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `anime_playerepisode`
--
ALTER TABLE `anime_playerepisode`
  ADD CONSTRAINT `anime_playerepisode_created_user_id_b49acb1a_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `anime_playerepisode_episode_anime_id_b983704a_fk_anime_epi` FOREIGN KEY (`episode_anime_id`) REFERENCES `anime_episodsanime` (`id`);

--
-- Ograniczenia dla tabeli `anime_scoreanime`
--
ALTER TABLE `anime_scoreanime`
  ADD CONSTRAINT `anime_scoreanime_anime_title_id_38901579_fk_anime_anime_id` FOREIGN KEY (`anime_title_id`) REFERENCES `anime_anime` (`id`),
  ADD CONSTRAINT `anime_scoreanime_user_id_d37c8b98_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `anime_taganime`
--
ALTER TABLE `anime_taganime`
  ADD CONSTRAINT `anime_taganime_anime_title_id_b2336ac5_fk_anime_anime_id` FOREIGN KEY (`anime_title_id`) REFERENCES `anime_anime` (`id`),
  ADD CONSTRAINT `anime_taganime_created_user_id_34ec6201_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `anime_taganime_tag_id_81039019_fk_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tag` (`id`);

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `shadow_news`
--
ALTER TABLE `shadow_news`
  ADD CONSTRAINT `shadow_news_user_id_d396ef5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `tags_tag`
--
ALTER TABLE `tags_tag`
  ADD CONSTRAINT `tags_tag_created_user_id_32dcef4f_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
