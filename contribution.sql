-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-12-25 07:39:14
-- 伺服器版本: 10.1.28-MariaDB
-- PHP 版本： 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `manage`
--

-- --------------------------------------------------------

--
-- 資料表結構 `contribution`
--

CREATE TABLE `contribution` (
  `id` int(11) NOT NULL,
  `anchor_id` int(11) NOT NULL COMMENT '主播ID',
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '會員ID',
  `point` int(4) NOT NULL COMMENT '打賞金額',
  `contents` text COLLATE utf8_unicode_ci,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `contribution`
--

INSERT INTO `contribution` (`id`, `anchor_id`, `member_id`, `point`, `contents`, `created_date`) VALUES
(1, 1, 'ad1475', 500, '', '2017-12-25 12:28:02'),
(2, 2, 'a571615', 50, '', '2017-12-25 13:55:19');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `contribution`
--
ALTER TABLE `contribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
