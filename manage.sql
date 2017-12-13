-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-12-13 07:44:48
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
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `a_games_id` varchar(150) NOT NULL COMMENT '可玩遊戲ID(,分開)',
  `a_all_upid` varchar(255) NOT NULL COMMENT '方便移除 遊戲ID 可以搜尋到相關階層帳號',
  `a_add_adminid` int(11) NOT NULL COMMENT '紀錄被哪支帳號新增',
  `a_first_upid` int(11) NOT NULL COMMENT '第一個總代ID',
  `a_level` int(11) NOT NULL COMMENT '身份[1]公司[2]總代[3]代理人[4]客服',
  `a_service` int(11) NOT NULL COMMENT '代理人ID(客服使用)',
  `a_mid` varchar(100) NOT NULL,
  `a_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_name` varchar(20) NOT NULL,
  `a_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_pic` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `r_id` int(11) NOT NULL,
  `a_forgetcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_forgetcode_time` datetime NOT NULL,
  `a_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_logintime` datetime NOT NULL,
  `a_ispublic` tinyint(4) NOT NULL,
  `a_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_createtime` datetime NOT NULL,
  `a_updatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 資料表的匯出資料 `admin`
--

INSERT INTO `admin` (`a_id`, `a_games_id`, `a_all_upid`, `a_add_adminid`, `a_first_upid`, `a_level`, `a_service`, `a_mid`, `a_username`, `a_password`, `a_name`, `a_email`, `a_pic`, `r_id`, `a_forgetcode`, `a_forgetcode_time`, `a_ip`, `a_logintime`, `a_ispublic`, `a_admin`, `a_createtime`, `a_updatetime`) VALUES
(1, '', '', 1, 0, 1, 0, 'dfbd05bd22bb75ac2c151ca2d1db9b2e1513142834620531go37sen2m4nlk5es39bparhsl', 'admin', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '系統管理員', 'admin@gmail.com', '', 2, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-12-13 13:27:14', 1, 'admin', '2017-10-17 13:43:34', '2017-10-17 13:43:34'),
(2, '2,1', '1', 1, 0, 2, 0, 'ae84098ab9476dcee271290d1f9c6abd1508314287189820q937kqqrbd85vblgb326b39a5', 'test1', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test1-總代', 'test1@gmail.com', '', 3, NULL, '0000-00-00 00:00:00', '::1', '2017-10-18 16:11:27', 1, 'admin', '2017-10-17 14:10:01', '2017-10-18 16:10:55'),
(3, '1', '1,2', 2, 2, 3, 0, '47c2b6232842f47d2418a4e2b6fffe8915083135197481104j4g4q3274gsqmqd0i5t0d9h6', 'test2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test2-代理人', 'test2@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-10-18 15:58:39', 1, 'test2', '2017-10-17 14:10:54', '2017-10-18 16:05:46'),
(4, '1', '1,2,3', 3, 2, 3, 0, '046039e11ec81721fe4c79d99d52905d1508224170565258aau7np371buqmv9gn0kqtkti6', 'test3', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test3-代理人', 'test3@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'test2', '2017-10-17 15:09:30', '2017-10-18 16:06:08'),
(5, '', '1,2', 2, 0, 4, 2, '1f1d58bcdf0bcfc735663321a0036eaa150839967477166ohjputbm1gfgaef06hrh6aobm4', 'stest1', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest1-總代客服', 'stest1@gmail.com', '', 5, NULL, '0000-00-00 00:00:00', '::1', '2017-10-19 15:54:34', 1, 'test1', '2017-10-17 15:11:04', '2017-10-17 15:11:04'),
(6, '', '1,2,3', 3, 0, 4, 3, 'a8da5a97b9dce5bcdd07d00b1e4b1cde1508224382830788aau7np371buqmv9gn0kqtkti6', 'stest2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest2-代理人客服', 'stest2@gmail.com', '', 5, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'test2', '2017-10-17 15:13:02', '2017-10-17 15:13:02'),
(15, '', '1,2', 5, 0, 4, 2, '3fe84efde85e8e5ed5586bab9b89d146150823302031574pequr2gd3e7p0ifklpnh58aui6', 'stest11', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest1客服-建立總代客服', 'stest11@gmail.com', '', 12, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'stest1', '2017-10-17 17:37:00', '2017-10-17 17:39:55'),
(16, '1', '1,2', 5, 2, 3, 0, '7acff93f96b09090a8678d4791bce41915082347596943pequr2gd3e7p0ifklpnh58aui6', 'newtest2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'newtest2-st1總代客服建', 'newtest2@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'stest1', '2017-10-17 18:05:59', '2017-10-17 18:06:32'),
(17, '', '', 1, 0, 1, 0, 'cd9953cfdab3c5cab5249f9722c023b41513146662332011go37sen2m4nlk5es39bparhsl', 'customer', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '客服', 'aaa@vvv.com', '', 5, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-12-13 14:31:02', 1, 'admin', '2017-12-06 16:50:57', '2017-12-08 09:58:18'),
(18, '', '', 1, 0, 1, 0, '088586f80ff14fb2e1024e3ce60a12f91513146871131go37sen2m4nlk5es39bparhsl', 'money', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '財務', 'bbb@ccc.ddd', '', 4, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-12-13 14:34:31', 1, 'admin', '2017-12-08 09:58:44', '2017-12-08 09:58:44');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_log`
--

CREATE TABLE `admin_log` (
  `al_id` int(11) NOT NULL,
  `a_username` varchar(20) NOT NULL,
  `al_main_key` int(11) NOT NULL,
  `al_fun_key` int(11) NOT NULL,
  `al_descript` varchar(100) NOT NULL,
  `al_createtime` datetime NOT NULL,
  `al_ip` char(15) NOT NULL,
  `al_action` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_log`
--

INSERT INTO `admin_log` (`al_id`, `a_username`, `al_main_key`, `al_fun_key`, `al_descript`, `al_createtime`, `al_ip`, `al_action`) VALUES
(2341, 'money', 3, 4, '列表', '2017-12-13 14:44:05', '127.0.0.1', 2),
(2340, 'money', 3, 3, '列表', '2017-12-13 14:43:56', '127.0.0.1', 2),
(2339, 'money', 4, 4, '列表', '2017-12-13 14:42:38', '127.0.0.1', 2),
(2338, 'money', 4, 2, '列表', '2017-12-13 14:42:37', '127.0.0.1', 2),
(2337, 'money', 4, 3, '列表', '2017-12-13 14:42:36', '127.0.0.1', 2),
(2336, 'money', 4, 4, '列表', '2017-12-13 14:42:35', '127.0.0.1', 2),
(2335, 'money', 4, 6, '列表', '2017-12-13 14:42:34', '127.0.0.1', 2),
(2334, 'money', 4, 5, '列表', '2017-12-13 14:42:33', '127.0.0.1', 2),
(2333, 'money', 4, 4, '列表', '2017-12-13 14:42:32', '127.0.0.1', 2),
(2332, 'money', 3, 5, '列表', '2017-12-13 14:42:30', '127.0.0.1', 2),
(2331, 'money', 3, 4, '列表', '2017-12-13 14:42:29', '127.0.0.1', 2),
(2330, 'money', 3, 3, '列表', '2017-12-13 14:42:28', '127.0.0.1', 2),
(2329, 'money', 3, 2, '列表', '2017-12-13 14:38:52', '127.0.0.1', 2),
(2328, 'money', 3, 1, '列表', '2017-12-13 14:38:51', '127.0.0.1', 2),
(2327, 'money', 3, 5, '列表', '2017-12-13 14:38:47', '127.0.0.1', 2),
(2326, 'money', 3, 3, '列表', '2017-12-13 14:38:44', '127.0.0.1', 2),
(2325, 'money', 4, 4, '列表', '2017-12-13 14:38:41', '127.0.0.1', 2),
(2324, 'money', 4, 5, '列表', '2017-12-13 14:38:40', '127.0.0.1', 2),
(2323, 'money', 4, 6, '列表', '2017-12-13 14:38:37', '127.0.0.1', 2),
(2322, 'money', 4, 5, 'id:71', '2017-12-13 14:38:35', '127.0.0.1', 8),
(2321, 'money', 4, 5, '列表', '2017-12-13 14:38:22', '127.0.0.1', 2),
(2320, 'money', 4, 4, '列表', '2017-12-13 14:38:21', '127.0.0.1', 2),
(2319, 'money', 4, 3, '列表', '2017-12-13 14:38:19', '127.0.0.1', 2),
(2318, 'money', 3, 4, '列表', '2017-12-13 14:38:17', '127.0.0.1', 2),
(2317, 'money', 3, 5, '列表', '2017-12-13 14:38:16', '127.0.0.1', 2),
(2316, 'money', 3, 4, '列表', '2017-12-13 14:37:35', '127.0.0.1', 2),
(2315, 'money', 3, 5, '列表', '2017-12-13 14:37:33', '127.0.0.1', 2),
(2314, 'money', 3, 4, '列表', '2017-12-13 14:37:31', '127.0.0.1', 2),
(2313, 'money', 3, 5, '列表', '2017-12-13 14:37:26', '127.0.0.1', 2),
(2312, 'money', 3, 4, 'id:24', '2017-12-13 14:37:23', '127.0.0.1', 8),
(2311, 'money', 3, 4, '列表', '2017-12-13 14:34:36', '127.0.0.1', 2),
(2310, 'money', 3, 3, '列表', '2017-12-13 14:34:35', '127.0.0.1', 2),
(2309, 'money', 0, 0, 'money登入成功', '2017-12-13 14:34:31', '127.0.0.1', 1),
(2308, 'customer', 4, 6, '列表', '2017-12-13 14:34:22', '127.0.0.1', 2),
(2307, 'customer', 3, 5, '列表', '2017-12-13 14:34:18', '127.0.0.1', 2),
(2306, 'customer', 3, 3, 'id:25', '2017-12-13 14:34:15', '127.0.0.1', 8),
(2305, 'customer', 3, 3, 'id:25', '2017-12-13 14:34:09', '127.0.0.1', 4),
(2304, 'customer', 3, 3, '列表', '2017-12-13 14:33:40', '127.0.0.1', 2),
(2303, 'customer', 3, 5, '列表', '2017-12-13 14:33:37', '127.0.0.1', 2),
(2302, 'customer', 3, 2, '國泰 id:2', '2017-12-13 14:33:33', '127.0.0.1', 8),
(2301, 'customer', 3, 2, '列表', '2017-12-13 14:33:18', '127.0.0.1', 2),
(2300, 'customer', 3, 1, '列表', '2017-12-13 14:33:17', '127.0.0.1', 2),
(2299, 'customer', 3, 5, '列表', '2017-12-13 14:33:14', '127.0.0.1', 2),
(2298, 'customer', 3, 2, '1筆資料(\'3\')', '2017-12-13 14:33:13', '127.0.0.1', 16),
(2297, 'customer', 3, 2, '列表', '2017-12-13 14:33:07', '127.0.0.1', 2),
(2296, 'customer', 4, 4, 'id:71', '2017-12-13 14:33:01', '127.0.0.1', 4),
(2295, 'customer', 4, 4, '列表', '2017-12-13 14:32:48', '127.0.0.1', 2),
(2294, 'customer', 4, 3, '列表', '2017-12-13 14:32:44', '127.0.0.1', 2),
(2293, 'customer', 3, 3, '列表', '2017-12-13 14:32:42', '127.0.0.1', 2),
(2291, 'customer', 3, 3, 'id:24', '2017-12-13 14:32:36', '127.0.0.1', 4),
(2292, 'customer', 3, 5, '列表', '2017-12-13 14:32:39', '127.0.0.1', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '銀行名稱',
  `bank_no` char(3) CHARACTER SET latin1 NOT NULL COMMENT '銀行代碼',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `bank`
--

INSERT INTO `bank` (`id`, `name`, `bank_no`, `last_manager`, `created_time`) VALUES
(16, '中國信託', '008', 'admin', '2017-12-06 09:49:20'),
(17, '國泰世華', '012', 'admin', '2017-12-06 09:49:33'),
(18, '台新銀行', '087', 'admin', '2017-12-06 09:49:48');

-- --------------------------------------------------------

--
-- 資料表結構 `bank_card`
--

CREATE TABLE `bank_card` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `bank_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '銀行',
  `bank_card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '卡號',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='銀行帳戶';

--
-- 資料表的匯出資料 `bank_card`
--

INSERT INTO `bank_card` (`id`, `bank_name`, `bank_id`, `bank_card_no`, `last_manager`, `created_time`, `updated_time`) VALUES
(1, '工商01', '18', '6548513', 'admin', '2017-12-06 10:08:25', '2017-12-06 10:08:25'),
(2, '國泰', '17', '789456123', 'customer', '2017-12-06 10:08:44', '2017-12-13 14:33:33');

-- --------------------------------------------------------

--
-- 資料表結構 `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '交易編號',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '玩家ID',
  `game_id` int(11) NOT NULL COMMENT '遊戲ID',
  `money` int(20) UNSIGNED NOT NULL COMMENT '金額',
  `deposit_pay_id` int(11) NOT NULL COMMENT '第三方支付ID',
  `pay_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方序號',
  `pay_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '儲值ID(外部提供)',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '狀態  [0: 未審核] [1:完成] [2:拒絕][3:捨棄]',
  `contents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `last_manager` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_time` datetime NOT NULL COMMENT '審核時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `deposit`
--

INSERT INTO `deposit` (`id`, `user_id`, `game_id`, `money`, `deposit_pay_id`, `pay_code`, `pay_id`, `status`, `contents`, `created_time`, `updated_time`, `last_manager`, `check_time`) VALUES
(71, 2, 5, 745, 1, '74125896', NULL, 2, '金額輸入錯誤', '2017-12-13 14:33:01', '2017-12-13 14:38:35', 'money', '2017-12-13 14:38:35');

--
-- 觸發器 `deposit`
--
DELIMITER $$
CREATE TRIGGER `deposit_insert_trigger` AFTER INSERT ON `deposit` FOR EACH ROW insert into deposit_log(deposit_id, user_id,game_id,contents, last_manager) values (NEW.id, NEW.user_id, NEW.game_id, "新增", NEW.last_manager)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deposit_update_trigger` AFTER UPDATE ON `deposit` FOR EACH ROW IF (NEW.contents != OLD.contents AND NEW.status != OLD.status) 
    THEN
    	INSERT INTO deposit_log(deposit_id, user_id,game_id,status,contents, last_manager) values (OLD.id, OLD.user_id, OLD.game_id, NEW.status, NEW.contents, new.last_manager); 
 ELSEIF (NEW.contents != OLD.contents) 
    THEN
    	INSERT INTO deposit_log(deposit_id, user_id,game_id,contents, last_manager) values (OLD.id, OLD.user_id, OLD.game_id ,NEW.contents, new.last_manager);
    ELSEIF (NEW.status != OLD.status) 
    THEN
    	INSERT INTO deposit_log(deposit_id, user_id,game_id,status, last_manager) values (OLD.id, OLD.user_id, OLD.game_id ,NEW.status, new.last_manager);
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `deposit_log`
--

CREATE TABLE `deposit_log` (
  `id` int(11) NOT NULL,
  `deposit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '狀態  [0: 未審核] [1:完成] [2:拒絕][3:捨棄]',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `deposit_log`
--

INSERT INTO `deposit_log` (`id`, `deposit_id`, `user_id`, `game_id`, `status`, `contents`, `last_manager`, `updated_time`) VALUES
(75, 71, 2, 5, NULL, '新增', 'customer', '2017-12-13 14:33:01'),
(76, 71, 2, 5, 2, '金額輸入錯誤', 'money', '2017-12-13 14:38:35');

-- --------------------------------------------------------

--
-- 資料表結構 `deposit_pay`
--

CREATE TABLE `deposit_pay` (
  `id` int(11) NOT NULL,
  `pay_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '第三方支付名稱',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='第三方支付列表';

--
-- 資料表的匯出資料 `deposit_pay`
--

INSERT INTO `deposit_pay` (`id`, `pay_name`, `last_manager`, `created_time`) VALUES
(1, 'MyCard', 'admin', '2017-12-06 10:13:52');

-- --------------------------------------------------------

--
-- 資料表結構 `dispensing`
--

CREATE TABLE `dispensing` (
  `id` int(11) NOT NULL,
  `user_id` tinyint(10) DEFAULT NULL COMMENT '玩家id',
  `game_id` tinyint(10) DEFAULT NULL COMMENT '遊戲id',
  `bank_card_id` int(11) NOT NULL COMMENT '我方銀行卡號',
  `bank_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '玩家銀行',
  `num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '對方卡號',
  `money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '金額',
  `contents` longtext COLLATE utf8_unicode_ci COMMENT '意見',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL COMMENT '申請時間',
  `updated_time` datetime NOT NULL COMMENT '審核時間',
  `is_pay` tinyint(4) NOT NULL COMMENT '交易狀態',
  `check_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='出款';

--
-- 資料表的匯出資料 `dispensing`
--

INSERT INTO `dispensing` (`id`, `user_id`, `game_id`, `bank_card_id`, `bank_id`, `num`, `money`, `contents`, `last_manager`, `created_time`, `updated_time`, `is_pay`, `check_time`) VALUES
(24, 1, 5, 2, '18', '789456123', '500', '', 'money', '2017-12-13 14:32:36', '2017-12-13 14:37:23', 1, '2017-12-13 14:37:23'),
(25, 2, 5, 2, '16', '4561287', '850', '', 'customer', '2017-12-13 14:34:09', '2017-12-13 14:34:15', 3, '2017-12-13 14:34:15');

--
-- 觸發器 `dispensing`
--
DELIMITER $$
CREATE TRIGGER `dispensing_check_updated_trigger` AFTER UPDATE ON `dispensing` FOR EACH ROW IF (NEW.contents != OLD.contents AND NEW.is_pay != OLD.is_pay) 
    THEN
    	INSERT INTO dispensing_log(dispensing_id, user_id,game_id,is_pay,contents, last_manager) values (OLD.id, OLD.user_id, OLD.game_id, NEW.is_pay, NEW.contents, new.last_manager); 
 ELSEIF (NEW.contents != OLD.contents) 
    THEN
    	INSERT INTO dispensing_log(dispensing_id, user_id,game_id,contents, last_manager) values (OLD.id, OLD.user_id, OLD.game_id ,NEW.contents, new.last_manager);
    ELSEIF (NEW.is_pay != OLD.is_pay) 
    THEN
    	INSERT INTO dispensing_log(dispensing_id, user_id,game_id,is_pay, last_manager) values (OLD.id, OLD.user_id, OLD.game_id ,NEW.is_pay, new.last_manager);
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dispensing_insert_trigger` AFTER INSERT ON `dispensing` FOR EACH ROW insert into dispensing_log(dispensing_id, user_id,game_id,contents, last_manager) values (NEW.id, NEW.user_id, NEW.game_id, "新增", NEW.last_manager)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `dispensing_log`
--

CREATE TABLE `dispensing_log` (
  `id` int(11) NOT NULL,
  `dispensing_id` int(11) NOT NULL COMMENT '出款項目的ID',
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `is_pay` tinyint(4) DEFAULT NULL COMMENT '狀態  [0: 未審核] [1:完成] [2:拒絕][3:捨棄]',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `dispensing_log`
--

INSERT INTO `dispensing_log` (`id`, `dispensing_id`, `user_id`, `game_id`, `is_pay`, `contents`, `last_manager`, `updated_time`) VALUES
(35, 24, 1, 5, NULL, '新增', 'customer', '2017-12-13 14:32:36'),
(36, 25, 2, 5, NULL, '新增', 'customer', '2017-12-13 14:34:09'),
(37, 25, 2, 5, 3, '', 'customer', '2017-12-13 14:34:15'),
(38, 24, 1, 5, 1, '', 'money', '2017-12-13 14:37:23');

-- --------------------------------------------------------

--
-- 資料表結構 `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `game_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `last_manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='玩家群組';

--
-- 資料表的匯出資料 `game`
--

INSERT INTO `game` (`id`, `game_name`, `contents`, `last_manager`, `created_time`, `updated_time`) VALUES
(4, 'pk7', '', 'admin', '2017-12-06 10:27:48', '2017-12-06 10:28:13'),
(5, 'pk10', 'pk10', 'admin', '2017-12-06 10:31:41', '2017-12-06 10:31:41');

-- --------------------------------------------------------

--
-- 資料表結構 `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL COMMENT '使用者編號',
  `game_id` int(11) NOT NULL COMMENT '遊戲ID',
  `player_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT NULL,
  `last_manager` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `player`
--

INSERT INTO `player` (`id`, `game_id`, `player_name`, `created_time`, `updated_time`, `last_manager`) VALUES
(1, 5, '王曉明', '2017-12-06 02:49:11', '2017-12-06 02:49:11', 'admin'),
(2, 5, '李小小', '2017-12-06 02:50:56', '2017-12-06 02:50:56', 'admin'),
(3, 4, '李小小', '2017-12-06 03:26:56', '2017-12-06 03:26:56', 'admin'),
(4, 5, 'TEST', '2017-12-11 06:04:37', '2017-12-11 06:04:37', 'admin');

-- --------------------------------------------------------

--
-- 資料表結構 `rules`
--

CREATE TABLE `rules` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(80) NOT NULL,
  `r_depiction` text NOT NULL,
  `r_agents` int(11) NOT NULL COMMENT '[0]公司[1]改代理人',
  `r_service` int(11) NOT NULL,
  `r_superadmin` tinyint(4) NOT NULL DEFAULT '0',
  `r_system` varchar(255) NOT NULL,
  `r_admin` varchar(20) NOT NULL,
  `r_updatetime` datetime NOT NULL,
  `r_createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 資料表的匯出資料 `rules`
--

INSERT INTO `rules` (`r_id`, `r_name`, `r_depiction`, `r_agents`, `r_service`, `r_superadmin`, `r_system`, `r_admin`, `r_updatetime`, `r_createtime`) VALUES
(2, '系統管理員', '最高權限管理組', 0, 0, 0, '', 'admin', '2017-12-08 10:00:31', '2016-02-02 18:36:21'),
(3, '總代理人', '這個是總代理人帳號權限\r\n不可改', 0, 0, 0, '', 'admin', '2017-12-08 10:00:07', '2017-07-15 12:21:16'),
(4, '財務', '調閱玩家資料與上下分操作', 1, 0, 0, '', 'admin', '2017-12-11 14:19:30', '2017-07-16 10:43:18'),
(5, '行銷客服', '觀看基本資訊與出入款申請', 0, 1, 0, '', 'admin', '2017-12-08 09:57:31', '2017-07-20 13:03:09');

-- --------------------------------------------------------

--
-- 資料表結構 `rules_auth`
--

CREATE TABLE `rules_auth` (
  `ra_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `ra_main_key` int(11) NOT NULL,
  `ra_fun_key` int(11) NOT NULL,
  `ra_auth` int(11) NOT NULL,
  `ra_admin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ra_updatetime` datetime NOT NULL,
  `ra_createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `rules_auth`
--

INSERT INTO `rules_auth` (`ra_id`, `r_id`, `ra_main_key`, `ra_fun_key`, `ra_auth`, `ra_admin`, `ra_updatetime`, `ra_createtime`) VALUES
(1, 14, 10, 3, 10, 'admin', '2017-07-26 09:03:42', '2017-07-26 09:03:42'),
(2, 15, 10, 2, 14, 'admin', '2017-07-26 09:03:59', '2017-07-26 09:03:59'),
(3, 16, 10, 3, 10, 'admin', '2017-07-26 09:04:16', '2017-07-26 09:04:16'),
(4, 16, 10, 4, 10, 'admin', '2017-07-26 09:04:16', '2017-07-26 09:04:16'),
(5, 17, 7, 1, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34'),
(6, 17, 7, 2, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34'),
(7, 17, 7, 3, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34'),
(8, 17, 7, 4, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34'),
(9, 6, 10, 1, 14, 'admin', '2017-10-16 11:20:04', '2017-10-16 11:20:04'),
(10, 7, 10, 2, 14, 'admin', '2017-10-16 11:21:16', '2017-10-16 11:21:16'),
(11, 8, 10, 1, 14, 'admin', '2017-10-16 11:21:58', '2017-10-16 11:21:58'),
(12, 8, 10, 2, 14, 'admin', '2017-10-16 11:21:58', '2017-10-16 11:21:58'),
(13, 9, 10, 3, 10, 'admin', '2017-10-16 11:23:22', '2017-10-16 11:23:22'),
(14, 13, 10, 1, 14, 'admin', '2017-10-16 11:24:36', '2017-10-16 11:24:36'),
(15, 13, 10, 2, 14, 'admin', '2017-10-16 11:24:36', '2017-10-16 11:24:36'),
(16, 10, 10, 4, 10, 'admin', '2017-10-16 11:25:24', '2017-10-16 11:25:24'),
(17, 11, 10, 3, 10, 'admin', '2017-10-16 11:25:56', '2017-10-16 11:25:56'),
(18, 11, 10, 4, 10, 'admin', '2017-10-16 11:25:56', '2017-10-16 11:25:56'),
(120, 5, 3, 1, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(121, 5, 3, 2, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(122, 5, 3, 3, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(123, 5, 3, 5, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(124, 5, 4, 1, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(125, 5, 4, 2, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(126, 5, 4, 3, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(127, 5, 4, 4, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(128, 5, 4, 6, 30, 'admin', '2017-12-08 09:57:31', '2017-12-08 09:57:31'),
(140, 3, 1, 1, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(141, 3, 1, 2, 2, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(142, 3, 2, 1, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(143, 3, 3, 1, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(144, 3, 3, 2, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(145, 3, 3, 3, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(146, 3, 3, 4, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(147, 3, 3, 5, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(148, 3, 4, 1, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(149, 3, 4, 2, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(150, 3, 4, 3, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(151, 3, 4, 4, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(152, 3, 4, 5, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(153, 3, 4, 6, 30, 'admin', '2017-12-08 10:00:07', '2017-12-08 10:00:07'),
(154, 2, 1, 1, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(155, 2, 1, 2, 2, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(156, 2, 2, 1, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(157, 2, 3, 1, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(158, 2, 3, 2, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(159, 2, 3, 3, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(160, 2, 3, 4, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(161, 2, 3, 5, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(162, 2, 4, 1, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(163, 2, 4, 2, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(164, 2, 4, 3, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(165, 2, 4, 4, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(166, 2, 4, 5, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(167, 2, 4, 6, 30, 'admin', '2017-12-08 10:00:31', '2017-12-08 10:00:31'),
(168, 4, 1, 1, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(169, 4, 1, 2, 2, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(170, 4, 2, 1, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(171, 4, 3, 1, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(172, 4, 3, 2, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(173, 4, 3, 3, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(174, 4, 3, 4, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(175, 4, 3, 5, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(176, 4, 4, 1, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(177, 4, 4, 2, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(178, 4, 4, 3, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(179, 4, 4, 4, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(180, 4, 4, 5, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30'),
(181, 4, 4, 6, 30, 'admin', '2017-12-11 14:19:30', '2017-12-11 14:19:30');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- 資料表索引 `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`al_id`);

--
-- 資料表索引 `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `bank_card`
--
ALTER TABLE `bank_card`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `deposit_log`
--
ALTER TABLE `deposit_log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `deposit_pay`
--
ALTER TABLE `deposit_pay`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `dispensing`
--
ALTER TABLE `dispensing`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `dispensing_log`
--
ALTER TABLE `dispensing_log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`r_id`);

--
-- 資料表索引 `rules_auth`
--
ALTER TABLE `rules_auth`
  ADD PRIMARY KEY (`ra_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表 AUTO_INCREMENT `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `al_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2342;

--
-- 使用資料表 AUTO_INCREMENT `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表 AUTO_INCREMENT `bank_card`
--
ALTER TABLE `bank_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '交易編號', AUTO_INCREMENT=72;

--
-- 使用資料表 AUTO_INCREMENT `deposit_log`
--
ALTER TABLE `deposit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用資料表 AUTO_INCREMENT `deposit_pay`
--
ALTER TABLE `deposit_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `dispensing`
--
ALTER TABLE `dispensing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表 AUTO_INCREMENT `dispensing_log`
--
ALTER TABLE `dispensing_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用資料表 AUTO_INCREMENT `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=6;

--
-- 使用資料表 AUTO_INCREMENT `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=5;

--
-- 使用資料表 AUTO_INCREMENT `rules_auth`
--
ALTER TABLE `rules_auth`
  MODIFY `ra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
