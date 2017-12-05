/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : manage

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 05/12/2017 16:26:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_games_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可玩遊戲ID(,分開)',
  `a_all_upid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方便移除 遊戲ID 可以搜尋到相關階層帳號',
  `a_add_adminid` int(11) NOT NULL COMMENT '紀錄被哪支帳號新增',
  `a_first_upid` int(11) NOT NULL COMMENT '第一個總代ID',
  `a_level` int(11) NOT NULL COMMENT '身份[1]公司[2]總代[3]代理人[4]客服',
  `a_service` int(11) NOT NULL COMMENT '代理人ID(客服使用)',
  `a_mid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_pic` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `r_id` int(11) NOT NULL,
  `a_forgetcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `a_forgetcode_time` datetime(0) NOT NULL,
  `a_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_logintime` datetime(0) NOT NULL,
  `a_ispublic` tinyint(4) NOT NULL,
  `a_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a_createtime` datetime(0) NOT NULL,
  `a_updatetime` datetime(0) NOT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '', '', 1, 0, 1, 0, '8cdbbbbff3b2c11fc19590f78a06b21b1512440416514013b640preell9hdgq4342hmtcbo', 'admin', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '系統管理員', 'admin@gmail.com', '', 2, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-12-05 10:20:16', 1, 'admin', '2017-10-17 13:43:34', '2017-10-17 13:43:34');
INSERT INTO `admin` VALUES (2, '2,1', '1', 1, 0, 2, 0, 'ae84098ab9476dcee271290d1f9c6abd1508314287189820q937kqqrbd85vblgb326b39a5', 'test1', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test1-總代', 'test1@gmail.com', '', 3, NULL, '0000-00-00 00:00:00', '::1', '2017-10-18 16:11:27', 1, 'admin', '2017-10-17 14:10:01', '2017-10-18 16:10:55');
INSERT INTO `admin` VALUES (3, '1', '1,2', 2, 2, 3, 0, '47c2b6232842f47d2418a4e2b6fffe8915083135197481104j4g4q3274gsqmqd0i5t0d9h6', 'test2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test2-代理人', 'test2@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '127.0.0.1', '2017-10-18 15:58:39', 1, 'test2', '2017-10-17 14:10:54', '2017-10-18 16:05:46');
INSERT INTO `admin` VALUES (4, '1', '1,2,3', 3, 2, 3, 0, '046039e11ec81721fe4c79d99d52905d1508224170565258aau7np371buqmv9gn0kqtkti6', 'test3', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'test3-代理人', 'test3@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'test2', '2017-10-17 15:09:30', '2017-10-18 16:06:08');
INSERT INTO `admin` VALUES (5, '', '1,2', 2, 0, 4, 2, '1f1d58bcdf0bcfc735663321a0036eaa150839967477166ohjputbm1gfgaef06hrh6aobm4', 'stest1', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest1-總代客服', 'stest1@gmail.com', '', 5, NULL, '0000-00-00 00:00:00', '::1', '2017-10-19 15:54:34', 1, 'test1', '2017-10-17 15:11:04', '2017-10-17 15:11:04');
INSERT INTO `admin` VALUES (6, '', '1,2,3', 3, 0, 4, 3, 'a8da5a97b9dce5bcdd07d00b1e4b1cde1508224382830788aau7np371buqmv9gn0kqtkti6', 'stest2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest2-代理人客服', 'stest2@gmail.com', '', 5, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'test2', '2017-10-17 15:13:02', '2017-10-17 15:13:02');
INSERT INTO `admin` VALUES (15, '', '1,2', 5, 0, 4, 2, '3fe84efde85e8e5ed5586bab9b89d146150823302031574pequr2gd3e7p0ifklpnh58aui6', 'stest11', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'stest1客服-建立總代客服', 'stest11@gmail.com', '', 12, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'stest1', '2017-10-17 17:37:00', '2017-10-17 17:39:55');
INSERT INTO `admin` VALUES (16, '1', '1,2', 5, 2, 3, 0, '7acff93f96b09090a8678d4791bce41915082347596943pequr2gd3e7p0ifklpnh58aui6', 'newtest2', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'newtest2-st1總代客服建', 'newtest2@gmail.com', '', 4, NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1, 'stest1', '2017-10-17 18:05:59', '2017-10-17 18:06:32');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `al_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `al_main_key` int(11) NOT NULL,
  `al_fun_key` int(11) NOT NULL,
  `al_descript` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `al_createtime` datetime(0) NOT NULL,
  `al_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `al_action` int(11) NOT NULL,
  PRIMARY KEY (`al_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES (1, 'admin', 6, 3, '列表', '2017-10-17 11:23:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (2, 'admin', 6, 3, 'test1', '2017-10-17 11:24:05', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (3, 'admin', 6, 3, '列表', '2017-10-17 11:24:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (4, 'admin', 0, 0, 'admin登入成功', '2017-10-17 11:29:12', '::1', 1);
INSERT INTO `admin_log` VALUES (5, 'admin', 6, 3, '列表', '2017-10-17 11:34:07', '::1', 2);
INSERT INTO `admin_log` VALUES (6, 'test1', 0, 0, 'test1登入成功', '2017-10-17 11:37:12', '::1', 1);
INSERT INTO `admin_log` VALUES (7, 'test1', 6, 1, '列表', '2017-10-17 11:37:18', '::1', 2);
INSERT INTO `admin_log` VALUES (8, 'test1', 6, 1, 'test2', '2017-10-17 11:54:07', '::1', 4);
INSERT INTO `admin_log` VALUES (9, 'test1', 6, 1, 'test2', '2017-10-17 11:54:17', '::1', 8);
INSERT INTO `admin_log` VALUES (10, 'test2', 0, 0, 'test2登入成功', '2017-10-17 11:58:29', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (11, 'test2', 6, 1, '列表', '2017-10-17 11:58:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (12, 'test2', 6, 1, 'test3', '2017-10-17 12:02:32', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (13, 'test1', 6, 1, '列表', '2017-10-17 12:06:43', '::1', 2);
INSERT INTO `admin_log` VALUES (14, 'admin', 6, 3, 'test1', '2017-10-17 12:08:46', '::1', 8);
INSERT INTO `admin_log` VALUES (15, 'test1', 6, 1, 'test2', '2017-10-17 12:08:53', '::1', 8);
INSERT INTO `admin_log` VALUES (16, 'admin', 6, 3, '列表', '2017-10-17 12:09:27', '::1', 2);
INSERT INTO `admin_log` VALUES (17, 'admin', 6, 3, 'test1', '2017-10-17 12:09:30', '::1', 8);
INSERT INTO `admin_log` VALUES (18, 'admin', 2, 1, '列表', '2017-10-17 12:10:24', '::1', 2);
INSERT INTO `admin_log` VALUES (19, 'admin', 2, 1, 'boss@degather.com', '2017-10-17 12:10:56', '::1', 4);
INSERT INTO `admin_log` VALUES (20, 'admin', 2, 1, 'jean@degather.com', '2017-10-17 12:11:28', '::1', 4);
INSERT INTO `admin_log` VALUES (21, 'admin', 2, 1, 'maggie@degather.com', '2017-10-17 12:12:22', '::1', 4);
INSERT INTO `admin_log` VALUES (22, 'admin', 1, 1, '列表', '2017-10-17 12:15:03', '::1', 2);
INSERT INTO `admin_log` VALUES (23, 'admin', 2, 1, '列表', '2017-10-17 12:15:37', '::1', 2);
INSERT INTO `admin_log` VALUES (24, 'admin', 2, 1, 'shawna@degather.com', '2017-10-17 12:17:57', '::1', 4);
INSERT INTO `admin_log` VALUES (25, 'admin', 2, 1, 'pllai@degather.com', '2017-10-17 12:19:05', '::1', 4);
INSERT INTO `admin_log` VALUES (26, 'admin', 2, 1, 'kuansu@degather.com', '2017-10-17 12:19:25', '::1', 4);
INSERT INTO `admin_log` VALUES (27, 'admin', 2, 1, 'evahu@degather.com', '2017-10-17 12:19:48', '::1', 4);
INSERT INTO `admin_log` VALUES (28, 'admin', 2, 1, 'mhchen@degather.com', '2017-10-17 12:20:18', '::1', 4);
INSERT INTO `admin_log` VALUES (29, 'admin', 6, 3, '列表', '2017-10-17 12:20:45', '::1', 2);
INSERT INTO `admin_log` VALUES (30, 'test1', 6, 2, '列表', '2017-10-17 12:27:54', '::1', 2);
INSERT INTO `admin_log` VALUES (31, 'test1', 6, 2, 'stest1', '2017-10-17 12:28:52', '::1', 4);
INSERT INTO `admin_log` VALUES (32, 'test1', 11, 1, '列表', '2017-10-17 12:35:44', '::1', 2);
INSERT INTO `admin_log` VALUES (33, 'stest1', 0, 0, 'stest1登入成功', '2017-10-17 12:35:59', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (34, 'stest1', 10, 5, '列表', '2017-10-17 12:36:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (35, 'stest1', 10, 1, '列表', '2017-10-17 12:36:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (36, 'stest1', 10, 5, '列表', '2017-10-17 12:36:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (37, 'test2', 3, 1, '列表', '2017-10-17 12:38:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (38, 'test1', 3, 1, '列表', '2017-10-17 12:38:12', '::1', 2);
INSERT INTO `admin_log` VALUES (39, 'stest1', 3, 1, '列表', '2017-10-17 12:38:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (40, 'stest1', 3, 2, '列表', '2017-10-17 12:38:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (41, 'stest1', 3, 1, '列表', '2017-10-17 12:38:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (42, 'test1', 3, 2, '列表', '2017-10-17 12:38:19', '::1', 2);
INSERT INTO `admin_log` VALUES (43, 'stest1', 3, 2, '列表', '2017-10-17 12:38:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (44, 'test2', 3, 2, '列表', '2017-10-17 12:38:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (45, 'test1', 3, 1, '列表', '2017-10-17 12:43:24', '::1', 2);
INSERT INTO `admin_log` VALUES (46, 'admin', 3, 1, '列表', '2017-10-17 12:43:33', '::1', 2);
INSERT INTO `admin_log` VALUES (47, 'test1', 6, 1, '列表', '2017-10-17 12:56:54', '::1', 2);
INSERT INTO `admin_log` VALUES (48, 'admin', 2, 1, '列表', '2017-10-17 13:42:21', '::1', 2);
INSERT INTO `admin_log` VALUES (49, 'admin', 2, 1, 'admin', '2017-10-17 13:43:34', '::1', 4);
INSERT INTO `admin_log` VALUES (50, 'admin', 2, 1, '列表', '2017-10-17 13:44:36', '::1', 2);
INSERT INTO `admin_log` VALUES (51, 'admin', 6, 3, '列表', '2017-10-17 13:44:43', '::1', 2);
INSERT INTO `admin_log` VALUES (52, 'admin', 6, 3, 'test1', '2017-10-17 14:10:02', '::1', 4);
INSERT INTO `admin_log` VALUES (53, 'test1', 0, 0, 'test1登入成功', '2017-10-17 14:10:18', '::1', 1);
INSERT INTO `admin_log` VALUES (54, 'test1', 6, 1, '列表', '2017-10-17 14:10:21', '::1', 2);
INSERT INTO `admin_log` VALUES (55, 'test1', 6, 1, 'test2', '2017-10-17 14:10:54', '::1', 4);
INSERT INTO `admin_log` VALUES (56, 'admin', 6, 3, '列表', '2017-10-17 14:11:35', '::1', 2);
INSERT INTO `admin_log` VALUES (57, 'test1', 6, 1, '列表', '2017-10-17 15:07:33', '::1', 2);
INSERT INTO `admin_log` VALUES (58, 'test1', 6, 2, '列表', '2017-10-17 15:08:13', '::1', 2);
INSERT INTO `admin_log` VALUES (59, 'test2', 0, 0, 'test2登入成功', '2017-10-17 15:08:31', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (60, 'test2', 6, 1, '列表', '2017-10-17 15:08:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (61, 'test2', 6, 1, 'test3', '2017-10-17 15:09:30', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (62, 'test1', 6, 2, 'stest1', '2017-10-17 15:11:04', '::1', 4);
INSERT INTO `admin_log` VALUES (63, 'stest1', 0, 0, 'stest1登入成功', '2017-10-17 15:11:19', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (64, 'admin', 2, 1, '列表', '2017-10-17 15:11:28', '::1', 2);
INSERT INTO `admin_log` VALUES (65, 'test2', 6, 2, '列表', '2017-10-17 15:12:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (66, 'test2', 6, 2, 'stest2', '2017-10-17 15:13:02', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (67, 'admin', 2, 1, 'boss@degather.com', '2017-10-17 15:13:40', '::1', 4);
INSERT INTO `admin_log` VALUES (68, 'admin', 2, 1, 'jean@degather.com', '2017-10-17 15:14:14', '::1', 4);
INSERT INTO `admin_log` VALUES (69, 'admin', 2, 1, 'maggie@degather.com', '2017-10-17 15:14:38', '::1', 4);
INSERT INTO `admin_log` VALUES (70, 'admin', 2, 1, 'shawna@degather.com', '2017-10-17 15:15:16', '::1', 4);
INSERT INTO `admin_log` VALUES (71, 'admin', 2, 1, 'pllai@degather.com', '2017-10-17 15:15:47', '::1', 4);
INSERT INTO `admin_log` VALUES (72, 'admin', 2, 1, 'kuansu@degather.com', '2017-10-17 15:16:10', '::1', 4);
INSERT INTO `admin_log` VALUES (73, 'admin', 2, 1, 'evahu@degather.com', '2017-10-17 15:16:32', '::1', 4);
INSERT INTO `admin_log` VALUES (74, 'admin', 2, 1, 'mhchen@degather.com', '2017-10-17 15:16:56', '::1', 4);
INSERT INTO `admin_log` VALUES (75, 'test1', 6, 2, '列表', '2017-10-17 15:26:03', '::1', 2);
INSERT INTO `admin_log` VALUES (76, 'admin', 6, 3, '列表', '2017-10-17 15:26:19', '::1', 2);
INSERT INTO `admin_log` VALUES (77, 'admin', 9, 1, '列表', '2017-10-17 15:26:24', '::1', 2);
INSERT INTO `admin_log` VALUES (78, 'admin', 9, 2, '列表', '2017-10-17 15:26:30', '::1', 2);
INSERT INTO `admin_log` VALUES (79, 'admin', 9, 2, ' id:11', '2017-10-17 15:34:25', '::1', 8);
INSERT INTO `admin_log` VALUES (80, 'admin', 3, 1, '列表', '2017-10-17 15:34:41', '::1', 2);
INSERT INTO `admin_log` VALUES (81, 'stest1', 3, 1, '列表', '2017-10-17 15:34:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (82, 'test1', 3, 1, '列表', '2017-10-17 15:34:53', '::1', 2);
INSERT INTO `admin_log` VALUES (83, 'admin', 6, 3, '列表', '2017-10-17 15:38:57', '::1', 2);
INSERT INTO `admin_log` VALUES (84, 'admin', 3, 1, '列表', '2017-10-17 15:40:07', '::1', 2);
INSERT INTO `admin_log` VALUES (85, 'admin', 3, 1, 'test id:4', '2017-10-17 16:06:08', '::1', 8);
INSERT INTO `admin_log` VALUES (86, 'admin', 3, 1, '列表', '2017-10-17 16:06:28', '::1', 2);
INSERT INTO `admin_log` VALUES (87, 'test1', 3, 2, '列表', '2017-10-17 16:15:13', '::1', 2);
INSERT INTO `admin_log` VALUES (88, 'test1', 3, 1, '列表', '2017-10-17 16:15:17', '::1', 2);
INSERT INTO `admin_log` VALUES (89, 'test1', 3, 2, '列表', '2017-10-17 16:15:19', '::1', 2);
INSERT INTO `admin_log` VALUES (90, 'test1', 11, 1, '列表', '2017-10-17 16:15:22', '::1', 2);
INSERT INTO `admin_log` VALUES (91, 'test1', 11, 2, '列表', '2017-10-17 16:15:23', '::1', 2);
INSERT INTO `admin_log` VALUES (92, 'test1', 3, 1, '列表', '2017-10-17 16:15:26', '::1', 2);
INSERT INTO `admin_log` VALUES (93, 'admin', 3, 2, '列表', '2017-10-17 16:37:14', '::1', 2);
INSERT INTO `admin_log` VALUES (94, 'admin', 3, 1, '列表', '2017-10-17 16:37:16', '::1', 2);
INSERT INTO `admin_log` VALUES (95, 'admin', 3, 1, '排序', '2017-10-17 17:06:53', '::1', 8);
INSERT INTO `admin_log` VALUES (96, 'admin', 3, 1, '列表', '2017-10-17 17:06:54', '::1', 2);
INSERT INTO `admin_log` VALUES (97, 'admin', 3, 1, '排序', '2017-10-17 17:06:55', '::1', 8);
INSERT INTO `admin_log` VALUES (98, 'admin', 3, 1, '列表', '2017-10-17 17:06:56', '::1', 2);
INSERT INTO `admin_log` VALUES (99, 'admin', 3, 2, '列表', '2017-10-17 17:10:49', '::1', 2);
INSERT INTO `admin_log` VALUES (100, 'test1', 3, 2, '列表', '2017-10-17 17:10:57', '::1', 2);
INSERT INTO `admin_log` VALUES (101, 'admin', 6, 3, '列表', '2017-10-17 17:14:39', '::1', 2);
INSERT INTO `admin_log` VALUES (102, 'stest1', 3, 2, '列表', '2017-10-17 17:14:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (103, 'stest1', 3, 1, '列表', '2017-10-17 17:14:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (104, 'stest1', 3, 2, '列表', '2017-10-17 17:14:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (105, 'stest1', 3, 2, 'HIHI777 id:5', '2017-10-17 17:16:49', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (106, 'stest1', 6, 1, '列表', '2017-10-17 17:18:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (107, 'test1', 6, 1, '列表', '2017-10-17 17:18:22', '::1', 2);
INSERT INTO `admin_log` VALUES (108, 'stest1', 0, 0, 'stest1登入成功', '2017-10-17 17:20:02', '::1', 1);
INSERT INTO `admin_log` VALUES (109, 'test1', 0, 0, 'test1登入成功', '2017-10-17 17:20:11', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (110, 'stest1', 6, 1, '列表', '2017-10-17 17:20:12', '::1', 2);
INSERT INTO `admin_log` VALUES (111, 'test1', 6, 1, '列表', '2017-10-17 17:20:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (112, 'test2', 6, 2, '列表', '2017-10-17 17:28:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (113, 'test2', 6, 1, '列表', '2017-10-17 17:28:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (114, 'stest1', 6, 2, '列表', '2017-10-17 17:29:13', '::1', 2);
INSERT INTO `admin_log` VALUES (115, 'admin', 6, 7, '列表', '2017-10-17 17:29:27', '::1', 2);
INSERT INTO `admin_log` VALUES (116, 'admin', 6, 3, '列表', '2017-10-17 17:29:28', '::1', 2);
INSERT INTO `admin_log` VALUES (117, 'test1', 6, 2, '列表', '2017-10-17 17:32:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (118, 'test1', 6, 1, '列表', '2017-10-17 17:33:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (119, 'test1', 6, 2, '列表', '2017-10-17 17:33:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (120, 'test1', 6, 1, '列表', '2017-10-17 17:33:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (121, 'test1', 6, 2, '列表', '2017-10-17 17:33:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (122, 'stest1', 6, 2, 'stest111', '2017-10-17 17:34:29', '::1', 4);
INSERT INTO `admin_log` VALUES (123, 'stest1', 6, 2, '列表', '2017-10-17 17:36:08', '::1', 2);
INSERT INTO `admin_log` VALUES (124, 'stest1', 6, 2, 'stest11', '2017-10-17 17:37:00', '::1', 4);
INSERT INTO `admin_log` VALUES (125, 'stest1', 6, 2, 'stest11', '2017-10-17 17:37:08', '::1', 8);
INSERT INTO `admin_log` VALUES (126, 'stest1', 6, 2, '列表', '2017-10-17 17:37:09', '::1', 2);
INSERT INTO `admin_log` VALUES (127, 'stest1', 6, 2, 'stest11', '2017-10-17 17:39:55', '::1', 8);
INSERT INTO `admin_log` VALUES (128, 'stest1', 6, 2, '列表', '2017-10-17 17:40:00', '::1', 2);
INSERT INTO `admin_log` VALUES (129, 'stest1', 6, 4, '列表', '2017-10-17 17:43:15', '::1', 2);
INSERT INTO `admin_log` VALUES (130, 'test1', 6, 4, '列表', '2017-10-17 17:43:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (131, 'stest1', 6, 4, 'id:1', '2017-10-17 17:45:27', '::1', 8);
INSERT INTO `admin_log` VALUES (132, 'stest1', 6, 1, '列表', '2017-10-17 17:45:41', '::1', 2);
INSERT INTO `admin_log` VALUES (133, 'test1', 6, 1, '列表', '2017-10-17 17:45:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (134, 'stest1', 6, 2, '列表', '2017-10-17 17:46:12', '::1', 2);
INSERT INTO `admin_log` VALUES (135, 'stest1', 6, 1, '列表', '2017-10-17 17:46:13', '::1', 2);
INSERT INTO `admin_log` VALUES (136, 'admin', 6, 7, '列表', '2017-10-17 18:01:21', '::1', 2);
INSERT INTO `admin_log` VALUES (137, 'stest1', 6, 1, 'newtest2', '2017-10-17 18:02:16', '::1', 4);
INSERT INTO `admin_log` VALUES (138, 'stest1', 6, 1, 'newtest2', '2017-10-17 18:02:42', '::1', 8);
INSERT INTO `admin_log` VALUES (139, 'stest1', 6, 1, '1筆資料(\'16\')', '2017-10-17 18:04:06', '::1', 16);
INSERT INTO `admin_log` VALUES (140, 'stest1', 6, 1, 'newtest2', '2017-10-17 18:05:59', '::1', 4);
INSERT INTO `admin_log` VALUES (141, 'stest1', 6, 1, 'newtest2', '2017-10-17 18:06:32', '::1', 8);
INSERT INTO `admin_log` VALUES (142, 'stest1', 6, 1, '列表', '2017-10-17 18:06:39', '::1', 2);
INSERT INTO `admin_log` VALUES (143, 'stest1', 6, 2, '列表', '2017-10-17 18:20:22', '::1', 2);
INSERT INTO `admin_log` VALUES (144, 'stest1', 6, 1, '列表', '2017-10-17 18:20:24', '::1', 2);
INSERT INTO `admin_log` VALUES (145, 'admin', 6, 3, '列表', '2017-10-17 18:20:29', '::1', 2);
INSERT INTO `admin_log` VALUES (146, 'admin', 6, 3, 'test1', '2017-10-17 18:21:00', '::1', 8);
INSERT INTO `admin_log` VALUES (147, 'admin', 11, 1, '列表', '2017-10-17 18:22:06', '::1', 2);
INSERT INTO `admin_log` VALUES (148, 'admin', 6, 7, '列表', '2017-10-17 18:22:09', '::1', 2);
INSERT INTO `admin_log` VALUES (149, 'admin', 6, 3, '列表', '2017-10-17 18:22:10', '::1', 2);
INSERT INTO `admin_log` VALUES (150, 'admin', 6, 7, '列表', '2017-10-17 18:22:12', '::1', 2);
INSERT INTO `admin_log` VALUES (151, 'stest1', 6, 4, '列表', '2017-10-17 18:22:20', '::1', 2);
INSERT INTO `admin_log` VALUES (152, 'stest1', 11, 1, '列表', '2017-10-17 18:22:22', '::1', 2);
INSERT INTO `admin_log` VALUES (153, 'test1', 11, 1, '列表', '2017-10-17 18:22:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (154, 'admin', 6, 3, '列表', '2017-10-17 18:28:48', '::1', 2);
INSERT INTO `admin_log` VALUES (155, 'admin', 6, 7, '列表', '2017-10-17 18:28:50', '::1', 2);
INSERT INTO `admin_log` VALUES (156, 'admin', 6, 5, '列表', '2017-10-17 18:28:52', '::1', 2);
INSERT INTO `admin_log` VALUES (157, 'admin', 6, 3, '列表', '2017-10-17 18:28:53', '::1', 2);
INSERT INTO `admin_log` VALUES (158, 'admin', 6, 3, 'test1', '2017-10-17 18:29:06', '::1', 8);
INSERT INTO `admin_log` VALUES (159, 'stest1', 11, 1, 'id:7', '2017-10-17 18:31:28', '::1', 4);
INSERT INTO `admin_log` VALUES (160, 'stest1', 11, 1, '列表', '2017-10-17 18:31:54', '::1', 2);
INSERT INTO `admin_log` VALUES (161, 'stest1', 11, 1, 'id:7', '2017-10-17 18:33:35', '::1', 8);
INSERT INTO `admin_log` VALUES (162, 'stest1', 11, 1, '列表', '2017-10-17 18:33:45', '::1', 2);
INSERT INTO `admin_log` VALUES (163, 'stest1', 11, 2, '列表', '2017-10-17 18:33:53', '::1', 2);
INSERT INTO `admin_log` VALUES (164, 'test1', 11, 2, '列表', '2017-10-17 18:33:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (165, 'stest1', 11, 3, '列表', '2017-10-17 18:33:57', '::1', 2);
INSERT INTO `admin_log` VALUES (166, 'stest1', 6, 1, '列表', '2017-10-17 18:37:40', '::1', 2);
INSERT INTO `admin_log` VALUES (167, 'stest1', 6, 2, '列表', '2017-10-17 18:39:56', '::1', 2);
INSERT INTO `admin_log` VALUES (168, 'stest1', 6, 4, '列表', '2017-10-17 18:39:57', '::1', 2);
INSERT INTO `admin_log` VALUES (169, 'stest1', 6, 1, '列表', '2017-10-17 18:39:58', '::1', 2);
INSERT INTO `admin_log` VALUES (170, 'admin', 6, 7, '列表', '2017-10-17 18:40:09', '::1', 2);
INSERT INTO `admin_log` VALUES (171, 'stest1', 6, 2, '列表', '2017-10-17 18:41:14', '::1', 2);
INSERT INTO `admin_log` VALUES (172, 'stest1', 11, 1, '列表', '2017-10-17 18:41:17', '::1', 2);
INSERT INTO `admin_log` VALUES (173, 'stest1', 11, 2, '列表', '2017-10-17 18:41:18', '::1', 2);
INSERT INTO `admin_log` VALUES (174, 'stest1', 11, 3, '列表', '2017-10-17 18:41:20', '::1', 2);
INSERT INTO `admin_log` VALUES (175, 'stest1', 8, 1, '列表', '2017-10-17 18:46:23', '::1', 2);
INSERT INTO `admin_log` VALUES (176, 'stest1', 10, 5, '列表', '2017-10-17 18:46:24', '::1', 2);
INSERT INTO `admin_log` VALUES (177, 'stest1', 10, 1, '列表', '2017-10-17 18:46:26', '::1', 2);
INSERT INTO `admin_log` VALUES (178, 'stest1', 10, 2, '列表', '2017-10-17 18:46:27', '::1', 2);
INSERT INTO `admin_log` VALUES (179, 'stest1', 10, 3, '列表', '2017-10-17 18:46:29', '::1', 2);
INSERT INTO `admin_log` VALUES (180, 'stest1', 10, 4, '列表', '2017-10-17 18:46:30', '::1', 2);
INSERT INTO `admin_log` VALUES (181, 'stest1', 10, 5, '列表', '2017-10-17 18:46:31', '::1', 2);
INSERT INTO `admin_log` VALUES (182, 'stest1', 11, 1, '列表', '2017-10-17 18:49:27', '::1', 2);
INSERT INTO `admin_log` VALUES (183, 'stest1', 6, 1, '列表', '2017-10-17 18:49:35', '::1', 2);
INSERT INTO `admin_log` VALUES (184, 'stest1', 0, 0, '代理人列表 id:70', '2017-10-17 18:49:50', '::1', 1);
INSERT INTO `admin_log` VALUES (185, 'admin', 12, 1, '列表', '2017-10-17 18:58:19', '::1', 2);
INSERT INTO `admin_log` VALUES (186, 'stest1', 8, 1, '列表', '2017-10-17 19:00:32', '::1', 2);
INSERT INTO `admin_log` VALUES (187, 'test1', 10, 5, '列表', '2017-10-17 19:02:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (188, 'stest1', 10, 5, '列表', '2017-10-17 19:02:18', '::1', 2);
INSERT INTO `admin_log` VALUES (189, 'test1', 10, 1, '列表', '2017-10-17 19:02:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (190, 'stest1', 10, 1, '列表', '2017-10-17 19:02:22', '::1', 2);
INSERT INTO `admin_log` VALUES (191, 'stest1', 10, 2, '列表', '2017-10-17 19:07:16', '::1', 2);
INSERT INTO `admin_log` VALUES (192, 'stest1', 10, 3, '列表', '2017-10-17 19:07:17', '::1', 2);
INSERT INTO `admin_log` VALUES (193, 'stest1', 10, 4, '列表', '2017-10-17 19:07:18', '::1', 2);
INSERT INTO `admin_log` VALUES (194, 'stest1', 6, 1, '列表', '2017-10-17 19:07:58', '::1', 2);
INSERT INTO `admin_log` VALUES (195, 'stest1', 6, 2, '列表', '2017-10-17 19:07:59', '::1', 2);
INSERT INTO `admin_log` VALUES (196, 'test1', 0, 0, 'test1登入成功', '2017-10-18 12:45:22', '::1', 1);
INSERT INTO `admin_log` VALUES (197, 'test1', 10, 5, '列表', '2017-10-18 12:45:25', '::1', 2);
INSERT INTO `admin_log` VALUES (198, 'test1', 8, 1, '列表', '2017-10-18 12:45:27', '::1', 2);
INSERT INTO `admin_log` VALUES (199, 'stest1', 0, 0, 'stest1登入成功', '2017-10-18 12:45:38', '::1', 1);
INSERT INTO `admin_log` VALUES (200, 'admin', 0, 0, 'admin登入成功', '2017-10-18 15:11:38', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (201, 'admin', 6, 3, '列表', '2017-10-18 15:13:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (202, 'admin', 11, 1, '列表', '2017-10-18 15:14:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (203, 'admin', 11, 4, '列表', '2017-10-18 15:14:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (204, 'admin', 11, 2, '列表', '2017-10-18 15:14:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (205, 'admin', 11, 1, '列表', '2017-10-18 15:14:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (206, 'admin', 6, 3, '列表', '2017-10-18 15:14:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (207, 'stest1', 6, 1, '列表', '2017-10-18 15:35:08', '::1', 2);
INSERT INTO `admin_log` VALUES (208, 'stest1', 6, 2, '列表', '2017-10-18 15:35:32', '::1', 2);
INSERT INTO `admin_log` VALUES (209, 'stest1', 6, 4, '列表', '2017-10-18 15:37:04', '::1', 2);
INSERT INTO `admin_log` VALUES (210, 'test1', 11, 1, '列表', '2017-10-18 15:37:08', '::1', 2);
INSERT INTO `admin_log` VALUES (211, 'stest1', 8, 1, '列表', '2017-10-18 15:40:53', '::1', 2);
INSERT INTO `admin_log` VALUES (212, 'stest1', 10, 5, '列表', '2017-10-18 15:40:55', '::1', 2);
INSERT INTO `admin_log` VALUES (213, 'stest1', 10, 2, '列表', '2017-10-18 15:40:56', '::1', 2);
INSERT INTO `admin_log` VALUES (214, 'stest1', 10, 1, '列表', '2017-10-18 15:40:57', '::1', 2);
INSERT INTO `admin_log` VALUES (215, 'stest1', 10, 2, '列表', '2017-10-18 15:40:58', '::1', 2);
INSERT INTO `admin_log` VALUES (216, 'stest1', 10, 3, '列表', '2017-10-18 15:40:58', '::1', 2);
INSERT INTO `admin_log` VALUES (217, 'stest1', 10, 4, '列表', '2017-10-18 15:40:59', '::1', 2);
INSERT INTO `admin_log` VALUES (218, 'stest1', 8, 1, '列表', '2017-10-18 15:54:08', '::1', 2);
INSERT INTO `admin_log` VALUES (219, 'admin', 0, 0, 'admin登入成功', '2017-10-18 15:55:52', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (220, 'admin', 10, 5, '列表', '2017-10-18 15:55:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (221, 'admin', 10, 1, '列表', '2017-10-18 15:55:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (222, 'admin', 9, 1, '列表', '2017-10-18 15:56:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (223, 'admin', 9, 2, '列表', '2017-10-18 15:56:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (224, 'admin', 9, 2, ' id:19', '2017-10-18 15:57:28', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (225, 'test2', 0, 0, 'test2登入成功', '2017-10-18 15:58:39', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (226, 'test2', 11, 1, '列表', '2017-10-18 15:58:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (227, 'test2', 6, 1, '列表', '2017-10-18 15:58:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (228, 'test2', 6, 2, '列表', '2017-10-18 16:04:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (229, 'test2', 6, 1, '列表', '2017-10-18 16:04:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (230, 'test2', 6, 1, 'test2', '2017-10-18 16:05:46', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (231, 'test2', 6, 1, 'test3', '2017-10-18 16:06:08', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (232, 'test2', 0, 0, '代理人列表 id:50', '2017-10-18 16:06:21', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (233, 'admin', 1, 1, '列表', '2017-10-18 16:07:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (234, 'admin', 9, 2, '列表', '2017-10-18 16:08:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (235, 'test2', 6, 1, '列表', '2017-10-18 16:10:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (236, 'admin', 1, 1, '列表', '2017-10-18 16:10:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (237, 'stest1', 6, 2, '列表', '2017-10-18 16:10:31', '::1', 2);
INSERT INTO `admin_log` VALUES (238, 'stest1', 6, 4, '列表', '2017-10-18 16:10:32', '::1', 2);
INSERT INTO `admin_log` VALUES (239, 'test1', 6, 4, '列表', '2017-10-18 16:10:35', '::1', 2);
INSERT INTO `admin_log` VALUES (240, 'admin', 6, 3, '列表', '2017-10-18 16:10:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (241, 'admin', 6, 3, 'test1', '2017-10-18 16:10:55', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (242, 'admin', 6, 3, '列表', '2017-10-18 16:11:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (243, 'stest1', 0, 0, 'stest1登入成功', '2017-10-18 16:11:18', '::1', 1);
INSERT INTO `admin_log` VALUES (244, 'test1', 0, 0, 'test1登入成功', '2017-10-18 16:11:27', '::1', 1);
INSERT INTO `admin_log` VALUES (245, 'test1', 6, 1, '列表', '2017-10-18 16:11:38', '::1', 2);
INSERT INTO `admin_log` VALUES (246, 'test1', 6, 4, '列表', '2017-10-18 16:11:42', '::1', 2);
INSERT INTO `admin_log` VALUES (247, 'stest1', 6, 4, '列表', '2017-10-18 16:11:44', '::1', 2);
INSERT INTO `admin_log` VALUES (248, 'stest1', 6, 4, 'id:1', '2017-10-18 16:14:19', '::1', 8);
INSERT INTO `admin_log` VALUES (249, 'stest1', 11, 1, '列表', '2017-10-18 16:14:26', '::1', 2);
INSERT INTO `admin_log` VALUES (250, 'test1', 11, 1, '列表', '2017-10-18 16:14:32', '::1', 2);
INSERT INTO `admin_log` VALUES (251, 'test1', 11, 2, '列表', '2017-10-18 16:14:36', '::1', 2);
INSERT INTO `admin_log` VALUES (252, 'test1', 11, 1, '列表', '2017-10-18 16:14:39', '::1', 2);
INSERT INTO `admin_log` VALUES (253, 'stest1', 0, 0, 'stest1登入成功', '2017-10-18 16:36:55', '::1', 1);
INSERT INTO `admin_log` VALUES (254, 'stest1', 8, 1, '列表', '2017-10-18 16:37:00', '::1', 2);
INSERT INTO `admin_log` VALUES (255, 'stest1', 6, 1, '列表', '2017-10-18 16:37:04', '::1', 2);
INSERT INTO `admin_log` VALUES (256, 'stest1', 3, 1, '列表', '2017-10-18 16:37:07', '::1', 2);
INSERT INTO `admin_log` VALUES (257, 'stest1', 3, 2, '列表', '2017-10-18 16:37:11', '::1', 2);
INSERT INTO `admin_log` VALUES (258, 'stest1', 6, 2, '列表', '2017-10-18 16:41:32', '::1', 2);
INSERT INTO `admin_log` VALUES (259, 'stest1', 6, 4, '列表', '2017-10-18 16:41:34', '::1', 2);
INSERT INTO `admin_log` VALUES (260, 'stest1', 8, 1, '列表', '2017-10-18 16:43:40', '::1', 2);
INSERT INTO `admin_log` VALUES (261, 'stest1', 10, 5, '列表', '2017-10-18 16:43:43', '::1', 2);
INSERT INTO `admin_log` VALUES (262, 'stest1', 10, 2, '列表', '2017-10-18 16:43:44', '::1', 2);
INSERT INTO `admin_log` VALUES (263, 'stest1', 10, 1, '列表', '2017-10-18 16:43:45', '::1', 2);
INSERT INTO `admin_log` VALUES (264, 'stest1', 10, 3, '列表', '2017-10-18 16:43:46', '::1', 2);
INSERT INTO `admin_log` VALUES (265, 'stest1', 10, 4, '列表', '2017-10-18 16:43:46', '::1', 2);
INSERT INTO `admin_log` VALUES (266, 'stest1', 10, 1, '列表', '2017-10-18 16:43:47', '::1', 2);
INSERT INTO `admin_log` VALUES (267, 'stest1', 8, 1, '列表', '2017-10-18 16:43:48', '::1', 2);
INSERT INTO `admin_log` VALUES (268, 'stest1', 11, 1, '列表', '2017-10-18 17:35:12', '::1', 2);
INSERT INTO `admin_log` VALUES (269, 'stest1', 6, 1, '列表', '2017-10-18 17:42:35', '::1', 2);
INSERT INTO `admin_log` VALUES (270, 'stest1', 6, 2, '列表', '2017-10-18 17:42:36', '::1', 2);
INSERT INTO `admin_log` VALUES (271, 'test1', 11, 2, '列表', '2017-10-18 17:42:45', '::1', 2);
INSERT INTO `admin_log` VALUES (272, 'test1', 6, 1, '列表', '2017-10-18 17:42:47', '::1', 2);
INSERT INTO `admin_log` VALUES (273, 'stest1', 6, 1, '列表', '2017-10-18 17:42:51', '::1', 2);
INSERT INTO `admin_log` VALUES (274, 'stest1', 6, 2, '列表', '2017-10-18 17:42:53', '::1', 2);
INSERT INTO `admin_log` VALUES (275, 'stest1', 6, 1, '列表', '2017-10-18 17:44:06', '::1', 2);
INSERT INTO `admin_log` VALUES (276, 'admin', 6, 7, '列表', '2017-10-18 17:46:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (277, 'admin', 12, 1, '列表', '2017-10-18 18:01:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (278, 'admin', 11, 3, '列表', '2017-10-18 18:14:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (279, 'stest1', 10, 5, '列表', '2017-10-18 18:33:29', '::1', 2);
INSERT INTO `admin_log` VALUES (280, 'stest1', 10, 3, '列表', '2017-10-18 18:33:30', '::1', 2);
INSERT INTO `admin_log` VALUES (281, 'stest1', 10, 2, '列表', '2017-10-18 18:33:31', '::1', 2);
INSERT INTO `admin_log` VALUES (282, 'stest1', 10, 1, '列表', '2017-10-18 18:33:34', '::1', 2);
INSERT INTO `admin_log` VALUES (283, 'stest1', 10, 2, '列表', '2017-10-18 18:33:36', '::1', 2);
INSERT INTO `admin_log` VALUES (284, 'stest1', 0, 0, 'stest1登入成功', '2017-10-19 15:54:35', '::1', 1);
INSERT INTO `admin_log` VALUES (285, 'stest1', 6, 1, '列表', '2017-10-19 15:54:41', '::1', 2);
INSERT INTO `admin_log` VALUES (286, 'admin', 0, 0, 'admin登入成功', '2017-10-23 12:22:23', '::1', 1);
INSERT INTO `admin_log` VALUES (287, 'admin', 1, 1, '列表', '2017-10-23 12:22:28', '::1', 2);
INSERT INTO `admin_log` VALUES (288, 'admin', 0, 0, 'admin登入成功', '2017-10-23 16:08:07', '::1', 1);
INSERT INTO `admin_log` VALUES (289, 'admin', 6, 5, '列表', '2017-10-23 16:08:14', '::1', 2);
INSERT INTO `admin_log` VALUES (290, 'admin', 6, 7, '列表', '2017-10-23 17:34:07', '::1', 2);
INSERT INTO `admin_log` VALUES (291, 'admin', 3, 1, '列表', '2017-10-23 17:34:10', '::1', 2);
INSERT INTO `admin_log` VALUES (292, 'admin', 0, 0, 'admin登入成功', '2017-10-27 11:34:28', '::1', 1);
INSERT INTO `admin_log` VALUES (293, 'admin', 0, 0, 'admin登入成功', '2017-10-30 16:26:12', '::1', 1);
INSERT INTO `admin_log` VALUES (294, 'admin', 6, 3, '列表', '2017-10-30 16:26:16', '::1', 2);
INSERT INTO `admin_log` VALUES (295, 'admin', 6, 7, '列表', '2017-10-30 16:26:17', '::1', 2);
INSERT INTO `admin_log` VALUES (296, 'admin', 10, 1, '列表', '2017-10-30 16:26:19', '::1', 2);
INSERT INTO `admin_log` VALUES (297, 'admin', 0, 0, 'admin登入失敗-帳密不正確', '2017-10-30 16:41:26', '::1', 1);
INSERT INTO `admin_log` VALUES (298, 'admin', 0, 0, 'admin登入成功', '2017-10-30 16:41:31', '::1', 1);
INSERT INTO `admin_log` VALUES (299, 'admin', 10, 1, '列表', '2017-10-30 16:41:35', '::1', 2);
INSERT INTO `admin_log` VALUES (300, 'admin', 10, 1, '列表', '2017-10-30 18:18:41', '::1', 2);
INSERT INTO `admin_log` VALUES (301, 'admin', 0, 0, 'admin????', '2017-11-16 15:14:01', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (302, 'admin', 2, 1, '??', '2017-11-16 15:14:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (303, 'admin', 0, 0, 'admin????', '2017-11-16 15:15:30', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (304, 'admin', 0, 0, 'admin????', '2017-11-16 15:18:18', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (305, 'admin', 0, 0, 'admin????', '2017-11-16 15:18:55', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (306, 'admin', 2, 1, '??', '2017-11-16 15:29:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (307, 'admin', 1, 1, '??', '2017-11-16 15:32:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (308, 'admin', 1, 1, '??', '2017-11-16 15:54:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (309, 'admin', 2, 1, '??', '2017-11-16 15:54:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (310, 'admin', 2, 1, '??', '2017-11-16 16:22:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (311, 'admin', 3, 2, '??', '2017-11-16 16:23:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (312, 'admin', 1, 1, '??', '2017-11-16 16:38:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (313, 'admin', 3, 2, '??', '2017-11-16 16:39:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (314, 'admin', 3, 2, 'test id:6', '2017-11-16 16:48:36', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (315, 'admin', 3, 2, '??', '2017-11-16 16:54:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (316, 'admin', 3, 2, 'test id:7', '2017-11-16 17:10:08', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (317, 'admin', 3, 2, '??', '2017-11-16 17:12:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (318, 'admin', 3, 2, 'test111111 id:7', '2017-11-16 17:12:55', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (319, 'admin', 3, 2, '1???(\'7\')', '2017-11-16 17:13:03', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (320, 'admin', 3, 2, 'test id:6', '2017-11-16 17:19:49', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (321, 'admin', 3, 2, '??', '2017-11-16 17:19:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (322, 'admin', 2, 1, '??', '2017-11-16 17:19:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (323, 'admin', 3, 2, '??', '2017-11-16 17:20:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (324, 'admin', 2, 1, '??', '2017-11-16 17:20:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (325, 'admin', 2, 1, '??', '2017-11-16 17:35:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (326, 'admin', 3, 2, '??', '2017-11-16 17:36:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (327, 'admin', 0, 0, 'admin????', '2017-11-16 17:37:08', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (328, 'admin', 3, 2, '??', '2017-11-16 17:37:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (329, 'admin', 2, 1, '??', '2017-11-16 17:45:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (330, 'admin', 0, 0, 'admin????', '2017-11-17 09:19:17', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (331, 'admin', 3, 2, '??', '2017-11-17 09:20:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (332, 'admin', 3, 2, '??', '2017-11-17 09:20:40', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (333, 'admin', 3, 2, '??', '2017-11-17 09:39:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (334, 'admin', 0, 0, 'admin????', '2017-11-17 09:40:12', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (335, 'admin', 3, 2, '??', '2017-11-17 09:41:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (336, 'admin', 1, 1, '??', '2017-11-17 09:53:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (337, 'admin', 0, 0, 'admin????', '2017-11-17 10:05:57', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (338, 'admin', 3, 2, '??', '2017-11-17 10:14:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (339, 'admin', 2, 1, '??', '2017-11-17 10:15:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (340, 'admin', 0, 0, 'admin????', '2017-11-17 10:17:40', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (341, 'admin', 3, 2, '??', '2017-11-17 10:23:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (342, 'admin', 2, 1, '??', '2017-11-17 10:23:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (343, 'admin', 2, 3, '??', '2017-11-17 10:23:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (344, 'admin', 1, 1, '??', '2017-11-17 10:23:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (345, 'admin', 3, 2, '??', '2017-11-17 10:37:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (346, 'admin', 2, 1, '??', '2017-11-17 10:47:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (347, 'admin', 2, 3, '??', '2017-11-17 10:47:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (348, 'admin', 1, 1, '??', '2017-11-17 10:47:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (349, 'admin', 2, 1, '??', '2017-11-17 10:47:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (350, 'admin', 3, 2, '??', '2017-11-17 11:05:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (351, 'admin', 2, 1, '??', '2017-11-17 11:05:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (352, 'admin', 2, 3, '??', '2017-11-17 11:05:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (353, 'admin', 1, 1, '??', '2017-11-17 11:05:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (354, 'admin', 3, 2, '??', '2017-11-17 11:06:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (355, 'admin', 2, 1, '??', '2017-11-17 11:49:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (356, 'admin', 0, 0, 'admin????', '2017-11-17 11:49:38', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (357, 'admin', 3, 2, '??', '2017-11-17 12:22:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (358, 'admin', 2, 1, '??', '2017-11-17 12:22:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (359, 'admin', 2, 1, '??', '2017-11-17 16:29:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (360, 'admin', 2, 3, '??', '2017-11-17 16:29:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (361, 'admin', 1, 1, '??', '2017-11-17 16:29:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (362, 'admin', 3, 2, '??', '2017-11-17 16:46:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (363, 'admin', 2, 1, '??', '2017-11-17 16:49:40', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (364, 'admin', 2, 3, '??', '2017-11-17 16:49:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (365, 'admin', 3, 2, '??', '2017-11-17 16:49:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (366, 'admin', 1, 1, '??', '2017-11-17 16:50:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (367, 'admin', 3, 2, '??', '2017-11-17 16:50:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (368, 'admin', 3, 2, '??', '2017-11-17 16:50:24', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (369, 'admin', 2, 1, '??', '2017-11-17 16:50:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (370, 'admin', 2, 3, '??', '2017-11-17 16:50:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (371, 'admin', 3, 2, '??', '2017-11-17 16:50:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (372, 'admin', 2, 1, '??', '2017-11-17 16:54:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (373, 'admin', 3, 2, '??', '2017-11-17 16:54:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (374, 'admin', 2, 1, '??', '2017-11-17 16:59:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (375, 'admin', 1, 1, '??', '2017-11-17 16:59:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (376, 'admin', 3, 2, '??', '2017-11-17 16:59:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (377, 'admin', 3, 2, '??', '2017-11-17 17:14:00', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (378, 'admin', 2, 1, '??', '2017-11-17 17:14:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (379, 'admin', 2, 3, '??', '2017-11-17 17:14:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (380, 'admin', 2, 1, '??', '2017-11-17 17:14:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (381, 'admin', 1, 1, '??', '2017-11-17 17:23:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (382, 'admin', 3, 2, '??', '2017-11-17 17:23:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (383, 'admin', 0, 0, 'admin????', '2017-11-17 17:23:57', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (384, 'admin', 3, 2, '??', '2017-11-17 17:24:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (385, 'admin', 3, 2, '??', '2017-11-17 17:26:51', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (386, 'admin', 2, 1, '??', '2017-11-17 17:28:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (387, 'admin', 3, 2, '??', '2017-11-17 17:30:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (388, 'admin', 2, 1, '??', '2017-11-17 17:30:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (389, 'admin', 1, 1, '??', '2017-11-20 09:16:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (390, 'admin', 2, 1, '??', '2017-11-20 09:27:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (391, 'admin', 2, 3, '??', '2017-11-20 09:36:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (392, 'admin', 3, 2, '??', '2017-11-20 09:37:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (393, 'admin', 3, 2, '??', '2017-11-20 09:39:10', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (394, 'admin', 2, 1, '??', '2017-11-20 09:39:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (395, 'admin', 3, 2, '??', '2017-11-20 09:39:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (396, 'admin', 2, 1, '??', '2017-11-20 10:08:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (397, 'admin', 0, 0, 'admin????', '2017-11-20 10:20:01', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (398, 'admin', 2, 1, '??', '2017-11-20 10:22:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (399, 'admin', 1, 1, '??', '2017-11-20 10:23:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (400, 'admin', 2, 1, '??', '2017-11-20 10:24:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (401, 'admin', 2, 3, '??', '2017-11-20 10:25:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (402, 'admin', 1, 1, '??', '2017-11-20 10:25:40', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (403, 'admin', 2, 1, '??', '2017-11-20 10:25:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (404, 'admin', 2, 3, '??', '2017-11-20 10:48:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (405, 'admin', 1, 1, '??', '2017-11-20 10:48:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (406, 'admin', 2, 1, '??', '2017-11-20 10:48:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (407, 'admin', 2, 1, 'pllai@degather.com', '2017-11-20 10:48:50', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (408, 'admin', 1, 1, '??', '2017-11-20 10:48:54', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (409, 'admin', 2, 1, '??', '2017-11-20 10:49:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (410, 'admin', 2, 3, '??', '2017-11-20 10:49:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (411, 'admin', 2, 1, '??', '2017-11-20 10:49:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (412, 'admin', 3, 2, '??', '2017-11-20 10:49:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (413, 'admin', 2, 1, '??', '2017-11-20 10:49:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (414, 'admin', 3, 2, '??', '2017-11-22 16:08:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (415, 'admin', 1, 1, '??', '2017-11-22 16:10:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (416, 'admin', 2, 1, '??', '2017-11-22 16:10:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (417, 'admin', 1, 1, '??', '2017-11-22 16:11:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (418, 'admin', 1, 1, '1???(\'11\')', '2017-11-22 16:12:10', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (419, 'admin', 1, 1, '5???(\'10\',\'9\',\'8\',\'7\',\'6\')', '2017-11-22 16:12:21', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (420, 'admin', 1, 1, '??', '2017-11-22 16:12:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (421, 'admin', 3, 2, '??', '2017-11-22 16:19:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (422, 'admin', 3, 2, '1???(\'4\')', '2017-11-22 16:25:47', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (423, 'admin', 3, 2, '5???(\'6\',\'5\',\'3\',\'2\',\'1\')', '2017-11-22 16:25:51', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (424, 'admin', 3, 2, 'test id:8', '2017-11-22 16:26:08', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (425, 'admin', 3, 2, '??', '2017-11-22 16:27:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (426, 'admin', 1, 1, '??', '2017-11-22 16:45:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (427, 'admin', 3, 2, '??', '2017-11-22 16:45:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (428, 'admin', 1, 1, '??', '2017-11-22 16:56:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (429, 'admin', 3, 2, '??', '2017-11-22 16:56:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (430, 'admin', 1, 1, '??', '2017-11-22 17:10:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (431, 'admin', 3, 2, '??', '2017-11-22 17:11:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (432, 'admin', 3, 2, 'test id:12', '2017-11-22 17:26:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (433, 'admin', 3, 2, 'test id:13', '2017-11-22 17:26:56', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (434, 'admin', 3, 2, '??', '2017-11-22 17:27:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (435, 'admin', 2, 1, '??', '2017-11-22 17:31:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (436, 'admin', 1, 1, '??', '2017-11-22 17:31:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (437, 'admin', 3, 2, '??', '2017-11-22 17:31:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (438, 'admin', 3, 2, 'test id:14', '2017-11-22 17:50:44', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (439, 'admin', 3, 2, '??', '2017-11-22 17:50:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (440, 'admin', 0, 0, 'admin????', '2017-11-23 09:32:28', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (441, 'admin', 3, 2, '??', '2017-11-23 09:32:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (442, 'admin', 2, 1, '??', '2017-11-23 09:41:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (443, 'admin', 2, 1, '??', '2017-11-23 09:44:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (444, 'admin', 9, 1, '??', '2017-11-23 09:48:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (445, 'admin', 2, 1, '??', '2017-11-23 09:54:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (446, 'admin', 12, 1, '??', '2017-11-23 09:54:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (447, 'admin', 2, 1, '??', '2017-11-23 09:58:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (448, 'admin', 12, 1, '??', '2017-11-23 10:01:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (449, 'admin', 12, 1, 'test id:3', '2017-11-23 10:25:27', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (450, 'admin', 12, 1, '1???(\'3\')', '2017-11-23 10:25:46', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (451, 'admin', 12, 1, '1???(\'2\')', '2017-11-23 10:25:54', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (452, 'admin', 12, 1, '1???(\'1\')', '2017-11-23 10:25:58', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (453, 'admin', 12, 1, 'test id:4', '2017-11-23 10:26:23', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (454, 'admin', 12, 1, '??', '2017-11-23 10:48:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (455, 'admin', 12, 1, 'test id:5', '2017-11-23 11:06:39', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (456, 'admin', 12, 1, '??', '2017-11-23 11:07:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (457, 'admin', 12, 1, '1???(\'5\')', '2017-11-23 11:09:59', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (458, 'admin', 12, 1, '??', '2017-11-23 11:11:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (459, 'admin', 12, 1, '??', '2017-11-23 11:21:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (460, 'admin', 12, 1, '??', '2017-11-23 11:27:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (461, 'admin', 12, 1, '??', '2017-11-23 11:30:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (462, 'admin', 12, 1, 'test id:4', '2017-11-23 11:45:30', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (463, 'admin', 12, 1, '??', '2017-11-23 11:46:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (464, 'admin', 12, 1, 'test id:4', '2017-11-23 11:49:47', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (465, 'admin', 12, 1, '??', '2017-11-23 11:49:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (466, 'admin', 12, 1, '??? id:6', '2017-11-23 11:50:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (467, 'admin', 12, 1, '??', '2017-11-23 11:52:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (468, 'admin', 12, 1, '陳小名 id:7', '2017-11-23 11:54:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (469, 'admin', 12, 1, '1筆資料(\'6\')', '2017-11-23 11:55:10', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (470, 'admin', 12, 1, '列表', '2017-11-23 11:56:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (471, 'admin', 3, 1, '列表', '2017-11-23 12:19:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (472, 'admin', 3, 2, '列表', '2017-11-23 12:20:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (473, 'admin', 3, 2, '1筆資料(\'7\')', '2017-11-23 12:20:31', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (474, 'admin', 3, 2, '列表', '2017-11-23 12:27:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (475, 'admin', 1, 1, '列表', '2017-11-23 13:47:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (476, 'admin', 3, 2, '列表', '2017-11-23 13:47:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (477, 'admin', 3, 2, '列表', '2017-11-23 13:57:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (478, 'admin', 3, 2, 'test id:4', '2017-11-23 14:02:29', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (479, 'admin', 3, 2, '列表', '2017-11-23 14:03:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (480, 'admin', 3, 2, '列表', '2017-11-23 14:09:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (481, 'admin', 3, 2, '工商01 id:8', '2017-11-23 14:23:22', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (482, 'admin', 3, 2, '列表', '2017-11-23 14:24:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (483, 'admin', 3, 2, '工商01 id:8', '2017-11-23 14:24:21', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (484, 'admin', 3, 2, '列表', '2017-11-23 14:25:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (485, 'admin', 3, 2, '1筆資料(\'4\')', '2017-11-23 14:29:27', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (486, 'admin', 3, 2, '列表', '2017-11-23 14:31:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (487, 'admin', 3, 2, '工商01 id:8', '2017-11-23 14:37:33', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (488, 'admin', 3, 2, '列表', '2017-11-23 14:38:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (489, 'admin', 3, 2, '工商02 id:9', '2017-11-23 14:41:00', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (490, 'admin', 1, 1, '列表', '2017-11-23 14:41:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (491, 'admin', 3, 2, '列表', '2017-11-23 14:41:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (492, 'admin', 3, 1, '列表', '2017-11-23 14:50:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (493, 'admin', 3, 1, '陳小名 id:7', '2017-11-23 14:57:39', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (494, 'admin', 3, 1, '列表', '2017-11-23 14:57:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (495, 'admin', 3, 2, '列表', '2017-11-23 14:58:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (496, 'admin', 3, 1, '列表', '2017-11-23 14:58:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (497, 'admin', 3, 2, '列表', '2017-11-23 15:12:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (498, 'admin', 3, 1, '列表', '2017-11-23 15:12:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (499, 'admin', 3, 2, '列表', '2017-11-23 15:29:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (500, 'admin', 3, 1, '列表', '2017-11-23 15:29:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (501, 'admin', 3, 1, '陳小名 id:7', '2017-11-23 15:42:17', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (502, 'admin', 3, 1, 'test id:4', '2017-11-23 15:42:30', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (503, 'admin', 3, 1, '1筆資料(\'4\')', '2017-11-23 15:42:34', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (504, 'admin', 3, 1, 'test id:8', '2017-11-23 15:42:49', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (505, 'admin', 3, 1, '1筆資料(\'8\')', '2017-11-23 15:42:59', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (506, 'admin', 3, 1, '樂付001 id:9', '2017-11-23 15:43:47', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (507, 'admin', 3, 1, '列表', '2017-11-23 15:44:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (508, 'admin', 3, 2, '列表', '2017-11-23 15:44:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (509, 'admin', 3, 1, '列表', '2017-11-23 15:44:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (510, 'admin', 3, 2, '列表', '2017-11-23 15:45:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (511, 'admin', 3, 1, '列表', '2017-11-23 15:48:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (512, 'admin', 3, 2, '列表', '2017-11-23 15:48:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (513, 'admin', 3, 1, '列表', '2017-11-23 15:48:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (514, 'admin', 3, 2, '列表', '2017-11-23 15:48:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (515, 'admin', 3, 1, '列表', '2017-11-23 15:51:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (516, 'admin', 3, 2, '列表', '2017-11-23 15:53:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (517, 'admin', 3, 1, '列表', '2017-11-23 15:53:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (518, 'admin', 3, 2, '列表', '2017-11-23 15:55:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (519, 'admin', 3, 1, '列表', '2017-11-23 15:55:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (520, 'admin', 3, 2, '列表', '2017-11-23 15:57:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (521, 'admin', 2, 3, '列表', '2017-11-23 15:57:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (522, 'admin', 3, 2, '列表', '2017-11-23 15:58:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (523, 'admin', 2, 3, '列表', '2017-11-23 15:58:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (524, 'admin', 1, 1, '列表', '2017-11-23 15:58:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (525, 'admin', 1, 1, '管理 id:2', '2017-11-23 15:58:37', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (526, 'admin', 1, 1, '列表', '2017-11-23 15:58:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (527, 'admin', 3, 2, '列表', '2017-11-23 16:08:40', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (528, 'admin', 3, 1, '列表', '2017-11-23 16:08:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (529, 'admin', 3, 2, '列表', '2017-11-23 16:08:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (530, 'admin', 1, 1, '列表', '2017-11-23 16:08:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (531, 'admin', 1, 1, '1筆資料(\'11\')', '2017-11-23 16:09:05', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (532, 'admin', 1, 1, '5筆資料(\'10\',\'9\',\'8\',\'7\',\'6\')', '2017-11-23 16:09:14', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (533, 'admin', 3, 2, '列表', '2017-11-23 16:09:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (534, 'admin', 3, 1, '列表', '2017-11-23 16:09:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (535, 'admin', 1, 1, '列表', '2017-11-23 16:09:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (536, 'admin', 1, 1, '管理 id:2', '2017-11-23 16:09:44', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (537, 'admin', 3, 2, '列表', '2017-11-23 16:09:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (538, 'admin', 1, 1, '列表', '2017-11-23 16:09:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (539, 'admin', 3, 2, '列表', '2017-11-23 16:10:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (540, 'admin', 3, 1, '列表', '2017-11-23 16:10:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (541, 'admin', 3, 2, '列表', '2017-11-23 16:10:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (542, 'admin', 3, 1, '列表', '2017-11-23 16:11:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (543, 'admin', 3, 2, '列表', '2017-11-23 16:11:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (544, 'admin', 3, 2, '陳小名 id:7', '2017-11-23 16:25:36', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (545, 'admin', 3, 2, '列表', '2017-11-23 16:26:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (546, 'admin', 3, 1, '列表', '2017-11-23 16:31:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (547, 'admin', 3, 2, '列表', '2017-11-23 16:31:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (548, 'admin', 3, 1, '列表', '2017-11-23 16:36:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (549, 'admin', 3, 2, '列表', '2017-11-23 16:36:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (550, 'admin', 3, 2, '列表', '2017-11-23 16:39:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (551, 'admin', 3, 1, '列表', '2017-11-23 16:45:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (552, 'admin', 3, 2, '列表', '2017-11-23 16:45:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (553, 'admin', 3, 1, '列表', '2017-11-23 16:45:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (554, 'admin', 3, 2, '列表', '2017-11-23 16:45:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (555, 'admin', 3, 1, '列表', '2017-11-23 16:46:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (556, 'admin', 3, 2, '列表', '2017-11-23 16:46:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (557, 'admin', 3, 1, '列表', '2017-11-23 16:46:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (558, 'admin', 3, 2, '列表', '2017-11-23 16:46:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (559, 'admin', 3, 1, '列表', '2017-11-23 16:47:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (560, 'admin', 3, 2, '列表', '2017-11-23 16:47:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (561, 'admin', 3, 1, '列表', '2017-11-23 16:47:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (562, 'admin', 3, 2, '列表', '2017-11-23 16:48:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (563, 'admin', 3, 1, '列表', '2017-11-23 16:48:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (564, 'admin', 3, 2, '列表', '2017-11-23 16:48:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (565, 'admin', 3, 1, '列表', '2017-11-23 16:48:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (566, 'admin', 3, 2, '列表', '2017-11-23 16:49:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (567, 'admin', 3, 2, '陳小名 id:7', '2017-11-23 17:10:31', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (568, 'admin', 3, 2, '列表', '2017-11-23 17:11:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (569, 'admin', 3, 2, 'teat id:8', '2017-11-23 17:11:34', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (570, 'admin', 3, 2, '1筆資料(\'4\')', '2017-11-23 17:12:43', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (571, 'admin', 3, 2, '列表', '2017-11-23 17:13:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (572, 'admin', 3, 1, '列表', '2017-11-23 17:27:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (573, 'admin', 3, 2, '列表', '2017-11-23 17:28:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (574, 'admin', 3, 1, '列表', '2017-11-23 17:28:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (575, 'admin', 3, 2, '列表', '2017-11-23 17:28:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (576, 'admin', 3, 1, '列表', '2017-11-23 17:28:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (577, 'admin', 3, 2, '列表', '2017-11-23 17:28:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (578, 'admin', 3, 1, '列表', '2017-11-23 17:28:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (579, 'admin', 1, 1, '列表', '2017-11-23 17:28:54', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (580, 'admin', 2, 1, '列表', '2017-11-23 17:28:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (581, 'admin', 2, 3, '列表', '2017-11-23 17:29:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (582, 'admin', 1, 1, '列表', '2017-11-23 17:29:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (583, 'admin', 3, 1, '列表', '2017-11-23 17:29:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (584, 'admin', 3, 2, '列表', '2017-11-23 17:29:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (585, 'admin', 3, 1, '列表', '2017-11-23 17:29:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (586, 'admin', 3, 2, '列表', '2017-11-23 17:29:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (587, 'admin', 3, 1, '列表', '2017-11-23 17:29:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (588, 'admin', 3, 2, '列表', '2017-11-23 17:29:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (589, 'admin', 3, 1, '列表', '2017-11-23 17:29:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (590, 'admin', 3, 2, '列表', '2017-11-23 17:30:04', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (591, 'admin', 3, 1, '列表', '2017-11-23 17:45:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (592, 'admin', 0, 0, 'admin登入成功', '2017-11-24 09:50:21', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (593, 'admin', 1, 1, '列表', '2017-11-24 09:50:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (594, 'admin', 1, 1, 'aaa id:5', '2017-11-24 09:52:46', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (595, 'admin', 1, 1, '行銷客服 id:5', '2017-11-24 09:53:15', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (596, 'admin', 3, 1, '列表', '2017-11-24 09:53:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (597, 'admin', 3, 2, '列表', '2017-11-24 09:53:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (598, 'admin', 3, 1, '列表', '2017-11-24 09:54:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (599, 'admin', 3, 2, '列表', '2017-11-24 09:54:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (600, 'admin', 3, 1, '列表', '2017-11-24 09:55:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (601, 'admin', 3, 2, '列表', '2017-11-24 09:55:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (602, 'admin', 3, 1, '列表', '2017-11-24 10:02:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (603, 'admin', 3, 2, '列表', '2017-11-24 10:02:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (604, 'admin', 3, 1, '列表', '2017-11-24 10:02:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (605, 'admin', 1, 1, '列表', '2017-11-24 10:02:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (606, 'admin', 2, 1, '列表', '2017-11-24 10:02:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (607, 'admin', 2, 3, '列表', '2017-11-24 10:02:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (608, 'admin', 3, 1, '列表', '2017-11-24 10:05:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (609, 'admin', 3, 2, '列表', '2017-11-24 10:05:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (610, 'admin', 3, 1, '列表', '2017-11-24 10:05:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (611, 'admin', 3, 2, '列表', '2017-11-24 10:05:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (612, 'admin', 3, 1, '列表', '2017-11-24 10:05:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (613, 'admin', 3, 2, '列表', '2017-11-24 10:05:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (614, 'admin', 3, 1, '列表', '2017-11-24 10:14:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (615, 'admin', 3, 2, '列表', '2017-11-24 10:14:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (616, 'admin', 3, 2, '列表', '2017-11-24 10:21:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (617, 'admin', 3, 1, '列表', '2017-11-24 10:21:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (618, 'admin', 3, 2, '列表', '2017-11-24 10:21:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (619, 'admin', 3, 1, '列表', '2017-11-24 10:21:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (620, 'admin', 3, 2, '列表', '2017-11-24 10:21:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (621, 'admin', 3, 2, '列表', '2017-11-24 10:25:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (622, 'admin', 3, 1, '列表', '2017-11-24 10:26:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (623, 'admin', 3, 2, '列表', '2017-11-24 10:26:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (624, 'admin', 3, 1, '列表', '2017-11-24 10:26:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (625, 'admin', 3, 2, '列表', '2017-11-24 10:26:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (626, 'admin', 3, 1, '列表', '2017-11-24 10:28:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (627, 'admin', 3, 2, '列表', '2017-11-24 10:28:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (628, 'admin', 3, 1, '列表', '2017-11-24 11:01:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (629, 'admin', 3, 2, '列表', '2017-11-24 11:01:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (630, 'admin', 3, 2, '2筆資料(\'2\',\'1\')', '2017-11-24 11:09:46', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (631, 'admin', 3, 1, '列表', '2017-11-24 11:14:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (632, 'admin', 3, 2, '列表', '2017-11-24 11:15:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (633, 'admin', 3, 2, '列表', '2017-11-24 11:20:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (634, 'admin', 3, 2, '列表', '2017-11-24 11:21:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (635, 'admin', 3, 2, '列表', '2017-11-24 11:28:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (636, 'admin', 3, 1, '列表', '2017-11-24 11:34:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (637, 'admin', 3, 2, '列表', '2017-11-24 11:34:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (638, 'admin', 3, 2, '1筆資料(\'3\')', '2017-11-24 13:48:02', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (639, 'admin', 3, 2, '1筆資料(\'4\')', '2017-11-24 13:48:05', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (640, 'admin', 3, 2, '列表', '2017-11-24 13:48:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (641, 'admin', 3, 2, 'test id:5', '2017-11-24 13:51:04', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (642, 'admin', 3, 2, '列表', '2017-11-24 13:51:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (643, 'admin', 3, 2, 'test123 id:6', '2017-11-24 13:52:09', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (644, 'admin', 3, 2, '列表', '2017-11-24 13:54:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (645, 'admin', 3, 2, '123 id:7', '2017-11-24 13:54:17', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (646, 'admin', 3, 2, '列表', '2017-11-24 13:54:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (647, 'admin', 3, 2, '1234 id:5', '2017-11-24 13:54:37', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (648, 'admin', 3, 2, '1筆資料(\'5\')', '2017-11-24 13:54:42', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (649, 'admin', 3, 2, '1234 id:8', '2017-11-24 13:54:49', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (650, 'admin', 3, 2, '列表', '2017-11-24 13:56:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (651, 'admin', 3, 2, '5869 id:9', '2017-11-24 13:56:59', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (652, 'admin', 3, 2, '列表', '2017-11-24 13:57:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (653, 'admin', 3, 2, '123456789 id:10', '2017-11-24 13:57:58', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (654, 'admin', 3, 2, '列表', '2017-11-24 14:01:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (655, 'admin', 3, 2, '589 id:11', '2017-11-24 14:01:45', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (656, 'admin', 3, 2, '列表', '2017-11-24 14:01:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (657, 'admin', 3, 2, '789 id:6', '2017-11-24 14:02:18', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (658, 'admin', 3, 2, '1筆資料(\'6\')', '2017-11-24 14:05:58', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (659, 'admin', 3, 2, '列表', '2017-11-24 14:06:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (660, 'admin', 3, 1, '列表', '2017-11-24 14:25:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (661, 'admin', 3, 2, '列表', '2017-11-24 14:25:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (662, 'admin', 3, 1, '列表', '2017-11-24 14:26:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (663, 'admin', 3, 2, '列表', '2017-11-24 14:26:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (664, 'admin', 3, 1, '列表', '2017-11-24 14:26:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (665, 'admin', 3, 2, '列表', '2017-11-24 14:26:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (666, 'admin', 3, 2, 'test id:7', '2017-11-24 15:04:00', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (667, 'admin', 3, 2, '黑名單玩家 id:3', '2017-11-24 15:04:10', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (668, 'admin', 3, 2, '列表', '2017-11-24 15:11:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (669, 'admin', 3, 1, '列表', '2017-11-24 15:11:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (670, 'admin', 3, 2, '列表', '2017-11-24 15:11:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (671, 'admin', 3, 1, '列表', '2017-11-24 15:11:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (672, 'admin', 3, 2, '列表', '2017-11-24 15:11:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (673, 'admin', 3, 1, '列表', '2017-11-24 15:11:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (674, 'admin', 1, 1, '列表', '2017-11-24 15:18:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (675, 'admin', 3, 1, '列表', '2017-11-24 15:18:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (676, 'admin', 3, 2, '列表', '2017-11-24 15:18:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (677, 'admin', 3, 2, '排序', '2017-11-24 15:18:47', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (678, 'admin', 3, 2, '列表', '2017-11-24 15:22:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (679, 'admin', 3, 2, '856 id:7', '2017-11-24 15:31:13', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (680, 'admin', 3, 2, '列表', '2017-11-24 15:31:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (681, 'admin', 3, 2, '8565 id:12', '2017-11-24 15:31:40', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (682, 'admin', 3, 2, '列表', '2017-11-24 15:33:49', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (683, 'admin', 3, 2, 'test id:13', '2017-11-24 15:36:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (684, 'admin', 3, 2, '列表', '2017-11-24 15:39:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (685, 'admin', 3, 2, '測試 id:14', '2017-11-24 15:39:23', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (686, 'admin', 3, 2, '測試3 id:15', '2017-11-24 15:39:44', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (687, 'admin', 3, 2, '列表', '2017-11-24 15:40:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (688, 'admin', 3, 2, '1筆資料(\'7\')', '2017-11-24 15:40:19', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (689, 'admin', 3, 2, '列表', '2017-11-24 15:40:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (690, 'admin', 3, 1, '列表', '2017-11-24 15:59:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (691, 'admin', 3, 2, '列表', '2017-11-24 15:59:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (692, 'admin', 3, 1, '列表', '2017-11-24 16:10:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (693, 'admin', 3, 2, '列表', '2017-11-24 16:10:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (694, 'admin', 3, 1, '列表', '2017-11-24 16:53:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (695, 'admin', 3, 2, '列表', '2017-11-24 16:59:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (696, 'admin', 3, 1, '列表', '2017-11-24 16:59:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (697, 'admin', 3, 2, '列表', '2017-11-24 17:03:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (698, 'admin', 3, 1, '列表', '2017-11-24 17:03:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (699, 'admin', 3, 2, '列表', '2017-11-24 17:04:04', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (700, 'admin', 3, 1, '列表', '2017-11-24 17:06:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (701, 'admin', 3, 2, '列表', '2017-11-24 17:06:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (702, 'admin', 3, 1, '列表', '2017-11-24 17:06:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (703, 'admin', 3, 2, '列表', '2017-11-24 17:06:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (704, 'admin', 3, 1, '列表', '2017-11-24 17:07:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (705, 'admin', 3, 2, '列表', '2017-11-24 17:08:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (706, 'admin', 3, 1, '列表', '2017-11-24 17:08:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (707, 'admin', 3, 2, '列表', '2017-11-24 17:08:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (708, 'admin', 3, 1, '列表', '2017-11-24 17:08:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (709, 'admin', 3, 2, '列表', '2017-11-24 17:08:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (710, 'admin', 3, 1, '列表', '2017-11-24 17:08:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (711, 'admin', 3, 2, '列表', '2017-11-24 17:09:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (712, 'admin', 3, 1, '列表', '2017-11-24 17:10:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (713, 'admin', 3, 2, '列表', '2017-11-24 17:10:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (714, 'admin', 3, 1, '列表', '2017-11-24 17:10:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (715, 'admin', 3, 2, '列表', '2017-11-24 17:11:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (716, 'admin', 3, 1, '列表', '2017-11-24 17:11:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (717, 'admin', 3, 2, '列表', '2017-11-24 17:15:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (718, 'admin', 3, 1, '列表', '2017-11-24 17:15:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (719, 'admin', 3, 2, '列表', '2017-11-24 17:16:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (720, 'admin', 3, 1, '列表', '2017-11-24 17:16:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (721, 'admin', 3, 2, '列表', '2017-11-24 17:17:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (722, 'admin', 3, 1, '列表', '2017-11-24 17:17:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (723, 'admin', 3, 2, '列表', '2017-11-24 17:17:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (724, 'admin', 3, 1, '列表', '2017-11-24 17:26:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (725, 'admin', 3, 2, '列表', '2017-11-24 17:38:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (726, 'admin', 3, 1, '列表', '2017-11-24 17:38:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (727, 'admin', 0, 0, 'admin登入成功', '2017-11-27 09:26:11', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (728, 'admin', 3, 2, '列表', '2017-11-27 09:26:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (729, 'admin', 3, 1, '列表', '2017-11-27 09:26:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (730, 'admin', 3, 2, '列表', '2017-11-27 09:26:54', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (731, 'admin', 3, 1, '列表', '2017-11-27 09:26:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (732, 'admin', 3, 2, '列表', '2017-11-27 09:26:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (733, 'admin', 3, 2, '排序', '2017-11-27 10:03:58', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (734, 'admin', 3, 2, '列表', '2017-11-27 10:04:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (735, 'admin', 3, 1, '列表', '2017-11-27 10:05:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (736, 'admin', 3, 2, '列表', '2017-11-27 10:05:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (737, 'admin', 3, 1, '列表', '2017-11-27 10:05:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (738, 'admin', 3, 2, '列表', '2017-11-27 10:05:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (739, 'admin', 3, 1, '列表', '2017-11-27 10:39:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (740, 'admin', 3, 2, '列表', '2017-11-27 10:39:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (741, 'admin', 3, 1, '列表', '2017-11-27 10:39:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (742, 'admin', 3, 2, '列表', '2017-11-27 10:39:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (743, 'admin', 3, 2, '1筆資料(\'3\')', '2017-11-27 10:41:17', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (744, 'admin', 3, 2, '1筆資料(\'4\')', '2017-11-27 10:42:00', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (745, 'admin', 3, 2, '群組1 id:5', '2017-11-27 10:42:30', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (746, 'admin', 3, 2, '王曉明 id:16', '2017-11-27 10:42:46', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (747, 'admin', 3, 2, '1筆資料(\'5\')', '2017-11-27 10:42:58', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (748, 'admin', 3, 2, '列表', '2017-11-27 10:43:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (749, 'admin', 3, 2, '群組1 id:6', '2017-11-27 10:44:00', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (750, 'admin', 3, 2, '王曉明 id:17', '2017-11-27 10:44:10', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (751, 'admin', 3, 2, '陳安安 id:18', '2017-11-27 10:44:19', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (752, 'admin', 3, 2, '列表', '2017-11-27 10:44:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (753, 'admin', 3, 2, '群組1 id:7', '2017-11-27 10:45:03', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (754, 'admin', 3, 2, '陳安安 id:19', '2017-11-27 10:45:13', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (755, 'admin', 3, 2, '王曉明 id:20', '2017-11-27 10:45:23', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (756, 'admin', 3, 2, '2筆資料(\'7\')', '2017-11-27 10:45:28', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (757, 'admin', 3, 2, '群組1 id:8', '2017-11-27 10:45:43', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (758, 'admin', 3, 2, '陳安安 id:21', '2017-11-27 10:45:53', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (759, 'admin', 3, 2, '王曉明 id:22', '2017-11-27 10:46:00', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (760, 'admin', 3, 2, '2筆資料(\'8\')', '2017-11-27 10:46:07', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (761, 'admin', 3, 2, '群組1 id:9', '2017-11-27 10:46:24', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (762, 'admin', 3, 2, '群組2 id:10', '2017-11-27 10:46:34', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (763, 'admin', 3, 2, '陳安安 id:23', '2017-11-27 10:46:42', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (764, 'admin', 3, 2, '王曉明 id:24', '2017-11-27 10:46:48', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (765, 'admin', 3, 2, '李小白 id:25', '2017-11-27 10:47:06', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (766, 'admin', 3, 2, '王大明 id:26', '2017-11-27 10:47:13', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (767, 'admin', 3, 2, '2筆資料(\'10\')', '2017-11-27 10:47:25', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (768, 'admin', 3, 2, '列表', '2017-11-27 10:50:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (769, 'admin', 3, 1, '列表', '2017-11-27 10:56:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (770, 'admin', 3, 1, '陳小名 id:7', '2017-11-27 10:57:39', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (771, 'admin', 3, 1, '列表', '2017-11-27 10:58:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (772, 'admin', 3, 2, '列表', '2017-11-27 11:00:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (773, 'admin', 1, 1, '列表', '2017-11-27 11:02:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (774, 'admin', 2, 1, '列表', '2017-11-27 11:02:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (775, 'admin', 3, 2, '列表', '2017-11-27 11:02:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (776, 'admin', 3, 1, '列表', '2017-11-27 11:04:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (777, 'admin', 3, 2, '列表', '2017-11-27 11:11:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (778, 'admin', 3, 1, '列表', '2017-11-27 11:14:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (779, 'admin', 2, 1, '列表', '2017-11-27 11:15:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (780, 'admin', 1, 1, '列表', '2017-11-27 11:15:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (781, 'admin', 3, 1, '列表', '2017-11-27 11:15:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (782, 'admin', 3, 2, '列表', '2017-11-27 11:15:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (783, 'admin', 3, 1, '列表', '2017-11-27 11:15:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (784, 'admin', 3, 2, '列表', '2017-11-27 11:15:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (785, 'admin', 3, 1, '列表', '2017-11-27 11:28:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (786, 'admin', 3, 2, '列表', '2017-11-27 11:28:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (787, 'admin', 3, 1, '列表', '2017-11-27 11:30:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (788, 'admin', 3, 2, '列表', '2017-11-27 11:30:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (789, 'admin', 3, 1, '列表', '2017-11-27 11:30:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (790, 'admin', 3, 2, '列表', '2017-11-27 11:30:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (791, 'admin', 3, 1, '列表', '2017-11-27 11:30:54', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (792, 'admin', 3, 1, '列表', '2017-11-27 11:40:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (793, 'admin', 3, 1, '陳小名 id:7', '2017-11-27 11:40:39', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (794, 'admin', 3, 1, '列表', '2017-11-27 11:40:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (795, 'admin', 3, 2, '列表', '2017-11-27 11:41:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (796, 'admin', 3, 1, '列表', '2017-11-27 11:41:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (797, 'admin', 3, 2, '列表', '2017-11-27 12:04:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (798, 'admin', 0, 0, 'admin登入成功', '2017-11-27 12:27:28', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (799, 'admin', 3, 2, '列表', '2017-11-27 12:28:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (800, 'admin', 3, 2, '列表', '2017-11-27 13:37:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (801, 'admin', 3, 1, '列表', '2017-11-27 13:42:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (802, 'admin', 3, 2, '列表', '2017-11-27 13:42:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (803, 'admin', 0, 0, 'admin登入成功', '2017-11-27 13:47:15', '192.168.1.177', 1);
INSERT INTO `admin_log` VALUES (804, 'admin', 3, 1, '列表', '2017-11-27 13:47:29', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (805, 'admin', 3, 2, '列表', '2017-11-27 13:48:19', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (806, 'admin', 3, 1, '列表', '2017-11-27 13:48:27', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (807, 'admin', 3, 2, '列表', '2017-11-27 13:48:34', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (808, 'admin', 3, 1, '列表', '2017-11-27 13:49:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (809, 'admin', 3, 2, '列表', '2017-11-27 13:49:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (810, 'admin', 3, 1, '列表', '2017-11-27 13:49:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (811, 'admin', 3, 2, '列表', '2017-11-27 13:49:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (812, 'admin', 3, 1, '列表', '2017-11-27 13:49:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (813, 'admin', 3, 1, '列表', '2017-11-27 13:58:00', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (814, 'admin', 3, 2, '列表', '2017-11-27 14:00:43', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (815, 'admin', 3, 1, '列表', '2017-11-27 14:01:37', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (816, 'admin', 3, 2, '列表', '2017-11-27 14:02:30', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (817, 'admin', 3, 1, '列表', '2017-11-27 14:02:49', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (818, 'admin', 3, 2, '列表', '2017-11-27 14:03:05', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (819, 'admin', 1, 1, '列表', '2017-11-27 14:03:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (820, 'admin', 3, 1, '列表', '2017-11-27 14:03:11', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (821, 'admin', 3, 1, '列表', '2017-11-27 14:03:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (822, 'admin', 3, 2, '列表', '2017-11-27 14:03:53', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (823, 'admin', 3, 1, '列表', '2017-11-27 14:04:44', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (824, 'admin', 3, 2, '列表', '2017-11-27 14:04:56', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (825, 'admin', 3, 1, '列表', '2017-11-27 14:05:47', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (826, 'admin', 3, 2, '列表', '2017-11-27 14:06:01', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (827, 'admin', 3, 2, '列表', '2017-11-27 14:10:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (828, 'admin', 3, 1, '列表', '2017-11-27 14:10:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (829, 'admin', 3, 1, '列表', '2017-11-27 14:28:08', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (830, 'admin', 3, 2, '列表', '2017-11-27 14:28:46', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (831, 'admin', 3, 1, '列表', '2017-11-27 14:29:36', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (832, 'admin', 3, 2, '列表', '2017-11-27 14:29:37', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (833, 'admin', 3, 1, '列表', '2017-11-27 14:29:45', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (834, 'admin', 3, 2, '列表', '2017-11-27 14:29:49', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (835, 'admin', 3, 2, '列表', '2017-11-27 14:38:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (836, 'admin', 3, 1, '列表', '2017-11-27 14:38:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (837, 'admin', 3, 2, '列表', '2017-11-27 14:38:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (838, 'admin', 3, 1, '列表', '2017-11-27 14:38:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (839, 'admin', 3, 2, '列表', '2017-11-27 14:38:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (840, 'admin', 3, 1, '列表', '2017-11-27 14:38:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (841, 'admin', 3, 2, '列表', '2017-11-27 14:41:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (842, 'admin', 3, 1, '列表', '2017-11-27 14:41:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (843, 'admin', 3, 2, '列表', '2017-11-27 14:41:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (844, 'admin', 3, 1, '列表', '2017-11-27 14:41:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (845, 'admin', 3, 2, '列表', '2017-11-27 14:47:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (846, 'admin', 3, 1, '列表', '2017-11-27 14:47:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (847, 'admin', 1, 1, '列表', '2017-11-27 14:51:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (848, 'admin', 2, 1, '列表', '2017-11-27 14:51:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (849, 'admin', 2, 3, '列表', '2017-11-27 14:51:43', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (850, 'admin', 1, 1, '列表', '2017-11-27 14:52:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (851, 'admin', 3, 1, '列表', '2017-11-27 14:52:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (852, 'admin', 3, 2, '列表', '2017-11-27 15:00:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (853, 'admin', 3, 1, '列表', '2017-11-27 15:00:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (854, 'admin', 3, 2, '列表', '2017-11-27 15:00:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (855, 'admin', 3, 1, '列表', '2017-11-27 15:00:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (856, 'admin', 3, 2, '列表', '2017-11-27 15:00:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (857, 'admin', 3, 1, '列表', '2017-11-27 15:00:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (858, 'admin', 3, 2, '列表', '2017-11-27 15:00:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (859, 'admin', 1, 1, '列表', '2017-11-27 15:00:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (860, 'admin', 3, 1, '列表', '2017-11-27 15:00:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (861, 'admin', 3, 2, '列表', '2017-11-27 15:10:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (862, 'admin', 3, 1, '列表', '2017-11-27 15:10:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (863, 'admin', 3, 2, '列表', '2017-11-27 15:10:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (864, 'admin', 3, 1, '列表', '2017-11-27 15:22:58', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (865, 'admin', 3, 2, '列表', '2017-11-27 15:24:47', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (866, 'admin', 3, 1, '列表', '2017-11-27 15:30:18', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (867, 'admin', 3, 2, '列表', '2017-11-27 15:30:32', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (868, 'admin', 3, 1, '列表', '2017-11-27 15:54:40', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (869, 'admin', 3, 2, '列表', '2017-11-27 15:54:46', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (870, 'admin', 3, 1, '列表', '2017-11-27 15:54:47', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (871, 'admin', 3, 2, '列表', '2017-11-27 15:55:00', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (872, 'admin', 3, 1, '列表', '2017-11-27 15:55:02', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (873, 'admin', 3, 2, '列表', '2017-11-27 15:58:37', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (874, 'admin', 3, 1, '列表', '2017-11-27 15:59:23', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (875, 'admin', 1, 1, '列表', '2017-11-27 16:02:01', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (876, 'admin', 2, 1, '列表', '2017-11-27 16:02:04', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (877, 'admin', 3, 2, '列表', '2017-11-27 16:03:00', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (878, 'admin', 3, 1, '列表', '2017-11-27 16:05:55', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (879, 'admin', 3, 2, '列表', '2017-11-27 16:06:24', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (880, 'admin', 3, 1, '列表', '2017-11-27 16:08:51', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (881, 'admin', 2, 1, '列表', '2017-11-27 16:14:36', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (882, 'admin', 2, 3, '列表', '2017-11-27 16:14:48', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (883, 'admin', 2, 1, '列表', '2017-11-27 16:14:49', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (884, 'admin', 1, 1, '列表', '2017-11-27 16:14:51', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (885, 'admin', 3, 1, '列表', '2017-11-27 16:15:03', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (886, 'admin', 3, 2, '列表', '2017-11-27 16:15:11', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (887, 'admin', 3, 1, '列表', '2017-11-27 16:15:15', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (888, 'admin', 3, 2, '列表', '2017-11-27 16:16:07', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (889, 'admin', 0, 0, 'admin登入成功', '2017-11-27 16:32:51', '192.168.1.193', 1);
INSERT INTO `admin_log` VALUES (890, 'admin', 3, 1, '列表', '2017-11-27 16:34:50', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (891, 'admin', 3, 2, '列表', '2017-11-27 16:35:08', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (892, 'admin', 0, 0, 'admin登入成功', '2017-11-27 16:36:35', '192.168.1.177', 1);
INSERT INTO `admin_log` VALUES (893, 'admin', 3, 1, '列表', '2017-11-27 16:36:40', '192.168.1.177', 2);
INSERT INTO `admin_log` VALUES (894, 'admin', 3, 2, '列表', '2017-11-27 16:38:15', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (895, 'admin', 3, 2, '群組1 id:9', '2017-11-27 16:50:51', '192.168.1.193', 8);
INSERT INTO `admin_log` VALUES (896, 'admin', 3, 2, '列表', '2017-11-27 16:51:23', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (897, 'admin', 3, 2, '群組1 id:9', '2017-11-27 16:51:32', '192.168.1.193', 8);
INSERT INTO `admin_log` VALUES (898, 'admin', 3, 2, '列表', '2017-11-27 16:52:54', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (899, 'admin', 3, 2, '群組1 id:9', '2017-11-27 16:53:47', '192.168.1.193', 8);
INSERT INTO `admin_log` VALUES (900, 'admin', 3, 2, '列表', '2017-11-27 16:54:12', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (901, 'admin', 1, 1, '列表', '2017-11-27 17:01:06', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (902, 'admin', 2, 1, '列表', '2017-11-27 17:01:13', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (903, 'admin', 3, 2, '列表', '2017-11-27 17:04:50', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (904, 'admin', 2, 1, '列表', '2017-11-27 17:07:08', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (905, 'admin', 3, 2, '列表', '2017-11-27 17:07:31', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (906, 'admin', 3, 2, '1筆資料(\'25\')', '2017-11-27 17:14:23', '192.168.1.193', 16);
INSERT INTO `admin_log` VALUES (907, 'admin', 3, 2, '列表', '2017-11-27 17:14:44', '192.168.1.193', 2);
INSERT INTO `admin_log` VALUES (908, 'admin', 0, 0, 'admin登入成功', '2017-11-27 17:39:14', '192.168.1.174', 1);
INSERT INTO `admin_log` VALUES (909, 'admin', 3, 1, '列表', '2017-11-27 17:42:46', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (910, 'admin', 3, 2, '列表', '2017-11-27 17:42:47', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (911, 'admin', 3, 1, '列表', '2017-11-27 17:42:47', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (912, 'admin', 3, 2, '列表', '2017-11-27 17:42:50', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (913, 'admin', 3, 1, '列表', '2017-11-27 17:43:00', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (914, 'admin', 0, 0, 'admin登入成功', '2017-11-28 09:12:52', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (915, 'admin', 3, 2, '列表', '2017-11-28 09:17:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (916, 'admin', 3, 2, '列表', '2017-11-28 10:06:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (917, 'admin', 0, 0, 'admin登入成功', '2017-11-28 10:08:52', '192.168.1.174', 1);
INSERT INTO `admin_log` VALUES (918, 'admin', 3, 2, '列表', '2017-11-28 10:09:03', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (919, 'admin', 3, 1, '列表', '2017-11-28 10:11:32', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (920, 'admin', 3, 2, '列表', '2017-11-28 10:11:37', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (921, 'admin', 3, 2, '列表', '2017-11-28 10:15:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (922, 'admin', 3, 2, '王大明 id:26', '2017-11-28 10:20:46', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (923, 'admin', 3, 2, '列表', '2017-11-28 10:23:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (924, 'admin', 3, 2, '沉沉 id:27', '2017-11-28 10:23:59', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (925, 'admin', 3, 2, '列表', '2017-11-28 10:24:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (926, 'admin', 3, 2, '群組2 id:10', '2017-11-28 10:24:25', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (927, 'admin', 3, 2, '列表', '2017-11-28 10:24:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (928, 'admin', 3, 2, '陳安安 id:28', '2017-11-28 10:24:37', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (929, 'admin', 3, 2, '列表', '2017-11-28 10:44:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (930, 'admin', 3, 2, '列表', '2017-11-28 10:56:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (931, 'admin', 3, 1, '列表', '2017-11-28 11:11:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (932, 'admin', 3, 2, '列表', '2017-11-28 11:11:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (933, 'admin', 3, 2, '王大明 id:26', '2017-11-28 11:14:50', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (934, 'admin', 3, 2, '列表', '2017-11-28 11:15:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (935, 'admin', 3, 1, '列表', '2017-11-28 11:29:41', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (936, 'admin', 3, 2, '列表', '2017-11-28 11:29:43', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (937, 'admin', 3, 1, '列表', '2017-11-28 11:29:46', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (938, 'admin', 3, 2, '列表', '2017-11-28 11:29:49', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (939, 'admin', 3, 1, '列表', '2017-11-28 11:29:51', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (940, 'admin', 3, 2, '列表', '2017-11-28 11:40:19', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (941, 'admin', 0, 0, 'admin登入成功', '2017-11-28 12:13:47', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (942, 'admin', 3, 2, '列表', '2017-11-28 12:13:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (943, 'admin', 3, 1, '列表', '2017-11-28 12:23:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (944, 'admin', 3, 2, '列表', '2017-11-28 12:26:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (945, 'admin', 3, 1, '列表', '2017-11-28 12:27:54', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (946, 'admin', 3, 2, '列表', '2017-11-28 12:27:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (947, 'admin', 3, 1, '列表', '2017-11-28 12:28:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (948, 'admin', 3, 2, '列表', '2017-11-28 12:28:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (949, 'admin', 3, 1, '列表', '2017-11-28 12:28:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (950, 'admin', 3, 2, '列表', '2017-11-28 12:28:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (951, 'admin', 3, 2, '1筆資料(\'7\')', '2017-11-28 13:52:18', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (952, 'admin', 3, 2, '列表', '2017-11-28 13:52:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (953, 'admin', 3, 2, '列表', '2017-11-28 13:52:44', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (954, 'admin', 3, 2, '列表', '2017-11-28 13:57:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (955, 'admin', 3, 2, '列表', '2017-11-28 14:05:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (956, 'admin', 3, 2, '列表', '2017-11-28 14:14:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (957, 'admin', 3, 2, '列表', '2017-11-28 14:15:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (958, 'admin', 3, 1, '列表', '2017-11-28 14:16:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (959, 'admin', 3, 2, '列表', '2017-11-28 14:17:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (960, 'admin', 3, 1, '列表', '2017-11-28 14:30:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (961, 'admin', 3, 2, '列表', '2017-11-28 14:30:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (962, 'admin', 3, 2, '列表', '2017-11-28 15:06:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (963, 'admin', 0, 0, 'admin登入成功', '2017-11-28 15:10:39', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (964, 'admin', 3, 2, '列表', '2017-11-28 16:39:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (965, 'admin', 0, 0, 'admin登入成功', '2017-11-29 09:22:44', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (966, 'admin', 3, 2, '列表', '2017-11-29 09:24:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (967, 'admin', 3, 2, '列表', '2017-11-29 09:33:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (968, 'admin', 3, 1, '列表', '2017-11-29 09:34:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (969, 'admin', 3, 2, '列表', '2017-11-29 09:34:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (970, 'admin', 3, 1, '列表', '2017-11-29 09:35:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (971, 'admin', 3, 2, '列表', '2017-11-29 09:36:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (972, 'admin', 3, 1, '列表', '2017-11-29 09:36:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (973, 'admin', 3, 2, '列表', '2017-11-29 09:36:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (974, 'admin', 3, 1, '列表', '2017-11-29 09:36:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (975, 'admin', 0, 0, 'admin登入成功', '2017-11-29 09:36:53', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (976, 'admin', 3, 2, '列表', '2017-11-29 09:36:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (977, 'admin', 3, 1, '列表', '2017-11-29 09:37:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (978, 'admin', 3, 2, '列表', '2017-11-29 09:37:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (979, 'admin', 3, 2, '列表', '2017-11-29 09:46:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (980, 'admin', 0, 0, 'admin登入成功', '2017-11-29 10:02:27', '192.168.1.174', 1);
INSERT INTO `admin_log` VALUES (981, 'admin', 3, 1, '列表', '2017-11-29 10:02:32', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (982, 'admin', 3, 2, '列表', '2017-11-29 10:02:33', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (983, 'admin', 3, 1, '列表', '2017-11-29 10:02:38', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (984, 'admin', 3, 2, '列表', '2017-11-29 10:15:41', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (985, 'admin', 3, 1, '列表', '2017-11-29 10:17:41', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (986, 'admin', 3, 2, '列表', '2017-11-29 10:17:42', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (987, 'admin', 3, 1, '列表', '2017-11-29 10:21:28', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (988, 'admin', 3, 2, '列表', '2017-11-29 10:24:19', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (989, 'admin', 3, 1, '列表', '2017-11-29 10:24:20', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (990, 'admin', 3, 2, '列表', '2017-11-29 10:24:21', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (991, 'admin', 3, 1, '列表', '2017-11-29 10:24:21', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (992, 'admin', 3, 2, '列表', '2017-11-29 10:37:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (993, 'admin', 3, 2, '列表', '2017-11-29 10:40:03', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (994, 'admin', 3, 2, '列表', '2017-11-29 10:45:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (995, 'admin', 3, 1, '列表', '2017-11-29 10:46:03', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (996, 'admin', 3, 2, '列表', '2017-11-29 10:58:08', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (997, 'admin', 3, 1, '列表', '2017-11-29 10:58:10', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (998, 'admin', 3, 2, '列表', '2017-11-29 10:58:11', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (999, 'admin', 3, 2, '列表', '2017-11-29 11:02:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1000, 'admin', 2, 1, '列表', '2017-11-29 11:02:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1001, 'admin', 3, 2, '列表', '2017-11-29 11:02:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1002, 'admin', 3, 2, '列表', '2017-11-29 11:09:50', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1003, 'admin', 3, 1, '列表', '2017-11-29 11:12:24', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1004, 'admin', 3, 2, '列表', '2017-11-29 11:12:31', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1005, 'admin', 3, 1, '列表', '2017-11-29 11:12:32', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1006, 'admin', 3, 2, '列表', '2017-11-29 11:12:34', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1007, 'admin', 3, 2, '列表', '2017-11-29 11:25:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1008, 'admin', 3, 1, '列表', '2017-11-29 11:25:45', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1009, 'admin', 3, 2, '列表', '2017-11-29 11:31:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1010, 'admin', 3, 2, '列表', '2017-11-29 11:40:45', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1011, 'admin', 3, 1, '列表', '2017-11-29 11:40:47', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1012, 'admin', 3, 2, '列表', '2017-11-29 11:40:49', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1013, 'admin', 3, 2, 'id:5', '2017-11-29 13:43:43', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1014, 'admin', 3, 2, '列表', '2017-11-29 13:43:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1015, 'admin', 3, 1, '列表', '2017-11-29 13:57:04', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1016, 'admin', 3, 2, '列表', '2017-11-29 13:57:51', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1017, 'admin', 3, 1, '列表', '2017-11-29 13:58:16', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1018, 'admin', 3, 2, '列表', '2017-11-29 13:58:17', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1019, 'admin', 3, 1, '列表', '2017-11-29 13:58:24', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1020, 'admin', 3, 2, '列表', '2017-11-29 13:58:26', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1021, 'admin', 3, 1, '列表', '2017-11-29 13:58:27', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1022, 'admin', 3, 2, '列表', '2017-11-29 13:58:28', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1023, 'admin', 3, 1, '列表', '2017-11-29 13:58:28', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1024, 'admin', 3, 2, '列表', '2017-11-29 13:58:33', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1025, 'admin', 3, 1, '列表', '2017-11-29 13:58:33', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1026, 'admin', 3, 2, 'id:7', '2017-11-29 14:23:18', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1027, 'admin', 3, 2, '列表', '2017-11-29 14:23:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1028, 'admin', 3, 2, 'id:8', '2017-11-29 14:23:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1029, 'admin', 3, 2, '列表', '2017-11-29 14:24:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1030, 'admin', 3, 2, '王曉明 id:29', '2017-11-29 14:28:22', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1031, 'admin', 3, 2, '沉沉 id:30', '2017-11-29 14:28:31', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1032, 'admin', 3, 2, '王小小 id:31', '2017-11-29 14:28:45', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1033, 'admin', 3, 2, '列表', '2017-11-29 14:28:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1034, 'admin', 3, 2, 'id:9', '2017-11-29 14:29:08', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1035, 'admin', 3, 2, 'id:9', '2017-11-29 14:29:34', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1036, 'admin', 3, 2, '列表', '2017-11-29 14:32:04', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1037, 'admin', 3, 2, '列表', '2017-11-29 14:39:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1038, 'admin', 3, 2, '列表', '2017-11-29 14:42:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1039, 'admin', 3, 2, 'id:25', '2017-11-29 15:10:12', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1040, 'admin', 3, 2, '列表', '2017-11-29 15:10:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1041, 'admin', 3, 2, 'id:1', '2017-11-29 15:12:04', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1042, 'admin', 3, 2, '列表', '2017-11-29 15:14:21', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1043, 'admin', 3, 2, 'id:26', '2017-11-29 15:22:41', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1044, 'admin', 3, 2, '列表', '2017-11-29 15:23:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1045, 'admin', 3, 2, 'id:27', '2017-11-29 15:31:52', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1046, 'admin', 3, 2, '列表', '2017-11-29 15:33:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1047, 'admin', 3, 2, 'id:28', '2017-11-29 15:34:22', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1048, 'admin', 3, 2, '列表', '2017-11-29 15:35:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1049, 'admin', 3, 2, 'id:29', '2017-11-29 15:35:17', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1050, 'admin', 3, 2, '列表', '2017-11-29 15:35:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1051, 'admin', 3, 2, 'id:29', '2017-11-29 15:36:02', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1052, 'admin', 3, 2, '列表', '2017-11-29 15:36:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1053, 'admin', 3, 2, '列表', '2017-11-29 15:38:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1054, 'admin', 3, 1, '列表', '2017-11-29 15:44:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1055, 'admin', 3, 1, '列表', '2017-11-29 15:49:47', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1056, 'admin', 3, 1, '列表', '2017-11-29 15:56:57', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1057, 'admin', 3, 2, '列表', '2017-11-29 16:03:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1058, 'admin', 3, 1, '列表', '2017-11-29 16:03:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1059, 'admin', 3, 2, '列表', '2017-11-29 16:03:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1060, 'admin', 3, 1, '列表', '2017-11-29 16:03:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1061, 'admin', 3, 1, 'id:9', '2017-11-29 16:19:23', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1062, 'admin', 3, 1, '列表', '2017-11-29 16:20:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1063, 'admin', 3, 2, '列表', '2017-11-29 16:22:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1064, 'admin', 3, 1, '列表', '2017-11-29 16:22:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1065, 'admin', 3, 1, 'id:9', '2017-11-29 16:22:44', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1066, 'admin', 3, 1, '列表', '2017-11-29 16:22:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1067, 'admin', 3, 2, '列表', '2017-11-29 16:24:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1068, 'admin', 3, 1, '列表', '2017-11-29 16:24:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1069, 'admin', 3, 2, '列表', '2017-11-29 16:24:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1070, 'admin', 3, 1, '列表', '2017-11-29 16:24:40', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1071, 'admin', 3, 1, '列表', '2017-11-29 16:37:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1072, 'admin', 3, 2, '列表', '2017-11-29 16:37:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1073, 'admin', 3, 1, '列表', '2017-11-29 16:38:01', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1074, 'admin', 3, 2, '列表', '2017-11-29 16:43:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1075, 'admin', 3, 1, '列表', '2017-11-29 16:44:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1076, 'admin', 3, 2, '列表', '2017-11-29 16:45:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1077, 'admin', 3, 1, '列表', '2017-11-29 16:48:00', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1078, 'admin', 3, 2, '列表', '2017-11-29 17:02:19', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1079, 'admin', 3, 1, '列表', '2017-11-29 17:02:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1080, 'admin', 3, 2, '列表', '2017-11-29 17:02:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1081, 'admin', 3, 1, '列表', '2017-11-29 17:03:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1082, 'admin', 3, 2, '列表', '2017-11-29 17:03:12', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1083, 'admin', 3, 1, '列表', '2017-11-29 17:03:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1084, 'admin', 3, 2, '列表', '2017-11-29 17:03:33', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1085, 'admin', 3, 1, '列表', '2017-11-29 17:06:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1086, 'admin', 3, 2, '列表', '2017-11-29 17:06:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1087, 'admin', 3, 1, '列表', '2017-11-29 17:06:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1088, 'admin', 3, 2, '列表', '2017-11-29 17:06:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1089, 'admin', 3, 1, '列表', '2017-11-29 17:36:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1090, 'admin', 3, 2, '列表', '2017-11-29 17:36:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1091, 'admin', 3, 1, '列表', '2017-11-29 17:36:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1092, 'admin', 3, 2, '列表', '2017-11-29 17:36:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1093, 'admin', 0, 0, 'admin登入成功', '2017-11-30 09:58:42', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (1094, 'admin', 3, 2, '列表', '2017-11-30 09:58:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1095, 'admin', 3, 1, '列表', '2017-11-30 09:59:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1096, 'admin', 3, 2, '列表', '2017-11-30 09:59:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1097, 'admin', 3, 1, '列表', '2017-11-30 10:00:04', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1098, 'admin', 3, 2, '列表', '2017-11-30 10:00:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1099, 'admin', 3, 1, '列表', '2017-11-30 10:06:32', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1100, 'admin', 3, 2, '列表', '2017-11-30 10:07:07', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1101, 'admin', 3, 1, '列表', '2017-11-30 10:07:15', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1102, 'admin', 3, 2, '列表', '2017-11-30 10:07:16', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1103, 'admin', 3, 1, '列表', '2017-11-30 10:07:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1104, 'admin', 3, 2, '列表', '2017-11-30 10:07:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1105, 'admin', 3, 1, '列表', '2017-11-30 10:08:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1106, 'admin', 3, 2, '列表', '2017-11-30 10:08:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1107, 'admin', 1, 1, '列表', '2017-11-30 10:08:35', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1108, 'admin', 3, 1, '列表', '2017-11-30 10:08:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1109, 'admin', 3, 2, '列表', '2017-11-30 10:08:42', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1110, 'admin', 3, 1, '列表', '2017-11-30 10:08:46', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1111, 'admin', 3, 2, '列表', '2017-11-30 10:08:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1112, 'admin', 1, 1, '列表', '2017-11-30 10:09:17', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1113, 'admin', 2, 1, '列表', '2017-11-30 10:09:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1114, 'admin', 2, 1, '8筆資料(\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\')', '2017-11-30 10:09:38', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (1115, 'admin', 2, 1, '列表', '2017-11-30 10:10:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1116, 'admin', 3, 2, '列表', '2017-11-30 10:10:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1117, 'admin', 3, 2, '列表', '2017-11-30 10:52:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1118, 'admin', 3, 2, 'id:29', '2017-11-30 10:55:08', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1119, 'admin', 3, 2, '列表', '2017-11-30 10:55:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1120, 'admin', 0, 0, 'admin登入成功', '2017-11-30 10:56:07', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (1121, 'admin', 3, 2, '列表', '2017-11-30 10:56:11', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1122, 'admin', 3, 1, '列表', '2017-11-30 10:56:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1123, 'admin', 3, 1, 'id:9', '2017-11-30 10:56:40', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1124, 'admin', 3, 1, 'id:8', '2017-11-30 10:56:48', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1125, 'admin', 3, 1, 'id:7', '2017-11-30 10:57:04', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1126, 'admin', 3, 1, '列表', '2017-11-30 10:58:05', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1127, 'admin', 3, 2, '列表', '2017-11-30 10:58:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1128, 'admin', 3, 1, '列表', '2017-11-30 10:58:28', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1129, 'admin', 3, 1, 'id:10', '2017-11-30 10:58:50', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1130, 'admin', 3, 2, '列表', '2017-11-30 10:58:55', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1131, 'admin', 3, 2, 'id:30', '2017-11-30 10:59:21', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1132, 'admin', 3, 2, '列表', '2017-11-30 10:59:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1133, 'admin', 3, 2, 'id:30', '2017-11-30 10:59:35', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1134, 'admin', 3, 2, '列表', '2017-11-30 10:59:38', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1135, 'admin', 3, 1, '列表', '2017-11-30 11:00:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1136, 'admin', 3, 2, '列表', '2017-11-30 11:00:08', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1137, 'admin', 3, 1, '列表', '2017-11-30 11:00:10', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1138, 'admin', 3, 2, '列表', '2017-11-30 11:00:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1139, 'admin', 3, 1, '列表', '2017-11-30 11:01:14', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1140, 'admin', 3, 1, '1筆資料(\'8\')', '2017-11-30 11:02:14', '127.0.0.1', 16);
INSERT INTO `admin_log` VALUES (1141, 'admin', 3, 1, 'id:11', '2017-11-30 11:02:25', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1142, 'admin', 3, 2, '列表', '2017-11-30 11:02:30', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1143, 'admin', 3, 2, 'id:31', '2017-11-30 11:03:11', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1144, 'admin', 3, 2, '列表', '2017-11-30 11:03:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1145, 'admin', 3, 2, 'id:31', '2017-11-30 11:03:25', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1146, 'admin', 3, 2, '列表', '2017-11-30 11:03:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1147, 'admin', 3, 1, '列表', '2017-11-30 11:03:36', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1148, 'admin', 3, 2, '列表', '2017-11-30 11:03:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1149, 'admin', 3, 2, 'id:32', '2017-11-30 11:05:48', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1150, 'admin', 3, 2, '列表', '2017-11-30 11:05:52', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1151, 'admin', 3, 2, 'id:32', '2017-11-30 11:05:57', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1152, 'admin', 3, 2, '列表', '2017-11-30 11:07:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1153, 'admin', 3, 2, 'id:33', '2017-11-30 11:08:32', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1154, 'admin', 3, 2, '列表', '2017-11-30 11:08:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1155, 'admin', 3, 2, 'id:33', '2017-11-30 11:09:33', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1156, 'admin', 3, 2, '列表', '2017-11-30 11:11:03', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1157, 'admin', 3, 2, 'id:33', '2017-11-30 11:11:15', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1158, 'admin', 3, 2, '列表', '2017-11-30 11:12:06', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1159, 'admin', 3, 2, 'id:33', '2017-11-30 11:12:22', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1160, 'admin', 3, 2, '列表', '2017-11-30 11:12:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1161, 'admin', 3, 2, 'id:33', '2017-11-30 11:12:32', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1162, 'admin', 3, 2, '列表', '2017-11-30 11:12:34', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1163, 'admin', 3, 2, 'id:33', '2017-11-30 11:13:21', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1164, 'admin', 3, 2, '列表', '2017-11-30 11:13:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1165, 'admin', 3, 2, 'id:33', '2017-11-30 11:13:29', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1166, 'admin', 3, 2, '列表', '2017-11-30 11:13:31', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1167, 'admin', 3, 2, 'id:33', '2017-11-30 11:14:28', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1168, 'admin', 3, 2, '列表', '2017-11-30 11:15:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1169, 'admin', 3, 2, 'id:33', '2017-11-30 11:16:04', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1170, 'admin', 3, 2, '列表', '2017-11-30 11:16:20', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1171, 'admin', 3, 2, 'id:33', '2017-11-30 11:16:34', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1172, 'admin', 3, 2, '列表', '2017-11-30 11:16:37', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1173, 'admin', 3, 2, 'id:33', '2017-11-30 11:16:46', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1174, 'admin', 3, 2, '列表', '2017-11-30 11:16:48', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1175, 'admin', 3, 1, '列表', '2017-11-30 11:38:24', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1176, 'admin', 3, 2, '列表', '2017-11-30 11:38:25', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1177, 'admin', 3, 1, '列表', '2017-11-30 11:40:59', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1178, 'admin', 3, 2, '列表', '2017-11-30 11:41:02', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1179, 'admin', 3, 1, '列表', '2017-11-30 11:41:22', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1180, 'admin', 3, 2, '列表', '2017-11-30 11:41:29', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1181, 'admin', 3, 2, '台灣銀行 id:14', '2017-11-30 11:47:13', '127.0.0.1', 8);
INSERT INTO `admin_log` VALUES (1182, 'admin', 3, 2, '列表', '2017-11-30 11:47:18', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1183, 'admin', 2, 1, '列表', '2017-11-30 11:55:26', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1184, 'admin', 3, 2, '列表', '2017-11-30 11:56:27', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1185, 'admin', 2, 1, '列表', '2017-11-30 11:58:13', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1186, 'admin', 3, 2, '列表', '2017-11-30 11:59:09', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1187, 'admin', 3, 2, 'test id:0', '2017-11-30 11:59:23', '127.0.0.1', 4);
INSERT INTO `admin_log` VALUES (1188, 'admin', 3, 2, '列表', '2017-11-30 11:59:41', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1189, 'admin', 2, 1, '列表', '2017-11-30 12:09:53', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1190, 'admin', 0, 0, 'admin登入成功', '2017-11-30 12:09:55', '192.168.1.174', 1);
INSERT INTO `admin_log` VALUES (1191, 'admin', 3, 2, '列表', '2017-11-30 12:10:01', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1192, 'admin', 3, 2, '列表', '2017-11-30 12:11:23', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1193, 'admin', 3, 2, 'cubbish inc id:8', '2017-11-30 12:12:27', '192.168.1.174', 8);
INSERT INTO `admin_log` VALUES (1194, 'admin', 3, 2, '列表', '2017-11-30 12:12:30', '192.168.1.174', 2);
INSERT INTO `admin_log` VALUES (1195, 'admin', 1, 1, '列表', '2017-11-30 13:43:26', '::1', 2);
INSERT INTO `admin_log` VALUES (1196, 'admin', 3, 2, '列表', '2017-11-30 13:43:28', '::1', 2);
INSERT INTO `admin_log` VALUES (1197, 'admin', 3, 2, 'cubbish id:8', '2017-11-30 13:47:01', '::1', 8);
INSERT INTO `admin_log` VALUES (1198, 'admin', 3, 2, '列表', '2017-11-30 13:47:05', '::1', 2);
INSERT INTO `admin_log` VALUES (1199, 'admin', 3, 2, 'cubbish id:8', '2017-11-30 14:32:13', '::1', 8);
INSERT INTO `admin_log` VALUES (1200, 'admin', 0, 0, 'admin登入成功', '2017-11-30 14:45:40', '192.168.1.177', 1);
INSERT INTO `admin_log` VALUES (1201, 'admin', 3, 2, '列表', '2017-11-30 15:58:27', '::1', 2);
INSERT INTO `admin_log` VALUES (1202, 'admin', 0, 0, 'admin登入成功', '2017-12-05 10:09:37', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (1203, 'admin', 3, 2, '列表', '2017-12-05 10:09:45', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1204, 'admin', 3, 1, '列表', '2017-12-05 10:09:56', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1205, 'admin', 3, 2, '列表', '2017-12-05 10:09:58', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1206, 'admin', 0, 0, 'admin登入成功', '2017-12-05 10:20:16', '127.0.0.1', 1);
INSERT INTO `admin_log` VALUES (1207, 'admin', 3, 2, '列表', '2017-12-05 10:20:39', '127.0.0.1', 2);
INSERT INTO `admin_log` VALUES (1208, 'admin', 1, 1, '列表', '2017-12-05 15:40:07', '::1', 2);
INSERT INTO `admin_log` VALUES (1209, 'admin', 2, 1, '列表', '2017-12-05 15:40:12', '::1', 2);
INSERT INTO `admin_log` VALUES (1210, 'admin', 1, 1, '列表', '2017-12-05 15:40:16', '::1', 2);
INSERT INTO `admin_log` VALUES (1211, 'admin', 3, 2, '列表', '2017-12-05 15:44:49', '::1', 2);

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '銀行名稱',
  `bank_no` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '銀行代碼',
  `last_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES (10, '國泰世華商業', '013', '', '0000-00-00');
INSERT INTO `bank` VALUES (12, '中國信託', '822', '', '0000-00-00');
INSERT INTO `bank` VALUES (14, '台灣銀行', '008', '', '0000-00-00');

-- ----------------------------
-- Table structure for bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bank_card`;
CREATE TABLE `bank_card`  (
  `id` int(11) NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `bank_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '銀行',
  `bank_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '卡號',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '餘額',
  `last_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` date NOT NULL,
  `updated_time` date NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '銀行帳戶' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_card
-- ----------------------------
INSERT INTO `bank_card` VALUES (9, '工商02', '', NULL, '500', '', '0000-00-00', '0000-00-00');
INSERT INTO `bank_card` VALUES (10, '工商21', '', NULL, '1000', '', '0000-00-00', '0000-00-00');
INSERT INTO `bank_card` VALUES (11, '工商01', '', NULL, '15000', '', '0000-00-00', '0000-00-00');
INSERT INTO `bank_card` VALUES (12, '工商441', '', NULL, '100', '', '0000-00-00', '0000-00-00');

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '交易編號',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '玩家ID',
  `game_id` int(11) NOT NULL COMMENT '遊戲ID',
  `money` int(20) UNSIGNED NOT NULL COMMENT '金額',
  `deposit_pay_id` int(11) NOT NULL COMMENT '第三方支付ID',
  `pay_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '儲值ID(外部提供)',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '狀態  [0: 未審核] [1:完成] [2:拒絕]',
  `contents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '備註',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `last_manager` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_time` datetime(0) NOT NULL COMMENT '審核時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES (33, 10, 0, 500, 0, NULL, 2, '金額輸入錯誤', NULL, NULL, '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for deposit_log
-- ----------------------------
DROP TABLE IF EXISTS `deposit_log`;
CREATE TABLE `deposit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deposit_log
-- ----------------------------
INSERT INTO `deposit_log` VALUES (9, 0, 0, 0, '測試一下800', '', '2017-11-27 15:40:31');
INSERT INTO `deposit_log` VALUES (10, 0, 0, 0, '修改80，誤打多一個0', 'admin', '2017-11-27 15:45:22');

-- ----------------------------
-- Table structure for deposit_pay
-- ----------------------------
DROP TABLE IF EXISTS `deposit_pay`;
CREATE TABLE `deposit_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '第三方支付名稱',
  `last_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '第三方支付列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deposit_pay
-- ----------------------------
INSERT INTO `deposit_pay` VALUES (7, '陳小名', '', '0000-00-00 00:00:00');
INSERT INTO `deposit_pay` VALUES (9, '樂付001', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for dispensing
-- ----------------------------
DROP TABLE IF EXISTS `dispensing`;
CREATE TABLE `dispensing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '申請人',
  `bank_card_id` int(11) NOT NULL COMMENT '我方銀行卡號',
  `bank` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '玩家銀行',
  `num` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '對方卡號',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '金額',
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '意見',
  `last_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NOT NULL COMMENT '申請時間',
  `updated_time` datetime(0) NOT NULL COMMENT '審核時間',
  `is_pay` tinyint(4) NOT NULL COMMENT '交易狀態',
  `check_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '出款' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dispensing
-- ----------------------------
INSERT INTO `dispensing` VALUES (4, '彼得楊', 0, 'test12', '12', '123456', '48579', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00');
INSERT INTO `dispensing` VALUES (7, '陳小名', 0, '國泰世華', '45', '1200', '123456789', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `dispensing` VALUES (8, 'cubbish', 0, '中華郵政', '57', '1000', '王王王都', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for dispensing_log
-- ----------------------------
DROP TABLE IF EXISTS `dispensing_log`;
CREATE TABLE `dispensing_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispensing_id` int(11) NOT NULL COMMENT '出款項目的ID',
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dispensing_log
-- ----------------------------
INSERT INTO `dispensing_log` VALUES (1, 4, 0, 0, '48579', 'admin', '2017-12-05 16:18:47');
INSERT INTO `dispensing_log` VALUES (2, 8, 0, 0, '王王王', 'admin', '2017-12-05 16:18:47');
INSERT INTO `dispensing_log` VALUES (3, 8, 0, 0, '王王王都', 'admin', '2017-12-05 16:18:47');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `last_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NOT NULL,
  `updated_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '玩家群組' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES (9, '群組1', 'test\r\ntest', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `game` VALUES (10, '群組2', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號',
  `game_id` int(11) NOT NULL COMMENT '遊戲ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_time` timestamp(0) NULL DEFAULT NULL,
  `last_manager` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES (9, 10, '陳小名', '2017-12-05 16:18:51', NULL, '');
INSERT INTO `player` VALUES (10, 9, '謝心怡', '2017-12-05 16:18:51', NULL, '');
INSERT INTO `player` VALUES (11, 9, '王安安', '2017-12-05 16:18:51', NULL, '');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_depiction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_agents` int(11) NOT NULL COMMENT '[0]公司[1]改代理人',
  `r_service` int(11) NOT NULL,
  `r_superadmin` tinyint(4) NOT NULL DEFAULT 0,
  `r_system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_updatetime` datetime(0) NOT NULL,
  `r_createtime` datetime(0) NOT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (2, '管理', '最高權限管理組', 0, 0, 0, '', 'admin', '2017-11-23 16:09:44', '2016-02-02 18:36:21');
INSERT INTO `rules` VALUES (3, '總代理人', '這個是總代理人帳號權限\r\n不可改', 0, 0, 0, '', 'admin', '2017-10-16 17:36:02', '2017-07-15 12:21:16');
INSERT INTO `rules` VALUES (4, '代理人', '調閱玩家資料與上下分操作', 1, 0, 0, '', 'admin', '2017-10-16 18:09:04', '2017-07-16 10:43:18');
INSERT INTO `rules` VALUES (5, '行銷客服', '觀看基本資訊與分析', 0, 1, 0, '', 'admin', '2017-11-24 09:53:15', '2017-07-20 13:03:09');
INSERT INTO `rules` VALUES (12, '即時控盤', '', 0, 0, 0, '', 'admin', '2017-11-24 09:51:47', '2017-07-26 17:02:41');

-- ----------------------------
-- Table structure for rules_auth
-- ----------------------------
DROP TABLE IF EXISTS `rules_auth`;
CREATE TABLE `rules_auth`  (
  `r_id` int(11) NOT NULL,
  `ra_main_key` int(11) NOT NULL,
  `ra_fun_key` int(11) NOT NULL,
  `ra_auth` int(11) NOT NULL,
  `ra_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ra_updatetime` datetime(0) NOT NULL,
  `ra_createtime` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rules_auth
-- ----------------------------
INSERT INTO `rules_auth` VALUES (14, 10, 3, 10, 'admin', '2017-07-26 09:03:42', '2017-07-26 09:03:42');
INSERT INTO `rules_auth` VALUES (15, 10, 2, 14, 'admin', '2017-07-26 09:03:59', '2017-07-26 09:03:59');
INSERT INTO `rules_auth` VALUES (16, 10, 3, 10, 'admin', '2017-07-26 09:04:16', '2017-07-26 09:04:16');
INSERT INTO `rules_auth` VALUES (16, 10, 4, 10, 'admin', '2017-07-26 09:04:16', '2017-07-26 09:04:16');
INSERT INTO `rules_auth` VALUES (17, 7, 1, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34');
INSERT INTO `rules_auth` VALUES (17, 7, 2, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34');
INSERT INTO `rules_auth` VALUES (17, 7, 3, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34');
INSERT INTO `rules_auth` VALUES (17, 7, 4, 10, 'admin', '2017-08-11 18:47:34', '2017-08-11 18:47:34');
INSERT INTO `rules_auth` VALUES (6, 10, 1, 14, 'admin', '2017-10-16 11:20:04', '2017-10-16 11:20:04');
INSERT INTO `rules_auth` VALUES (7, 10, 2, 14, 'admin', '2017-10-16 11:21:16', '2017-10-16 11:21:16');
INSERT INTO `rules_auth` VALUES (8, 10, 1, 14, 'admin', '2017-10-16 11:21:58', '2017-10-16 11:21:58');
INSERT INTO `rules_auth` VALUES (8, 10, 2, 14, 'admin', '2017-10-16 11:21:58', '2017-10-16 11:21:58');
INSERT INTO `rules_auth` VALUES (9, 10, 3, 10, 'admin', '2017-10-16 11:23:22', '2017-10-16 11:23:22');
INSERT INTO `rules_auth` VALUES (13, 10, 1, 14, 'admin', '2017-10-16 11:24:36', '2017-10-16 11:24:36');
INSERT INTO `rules_auth` VALUES (13, 10, 2, 14, 'admin', '2017-10-16 11:24:36', '2017-10-16 11:24:36');
INSERT INTO `rules_auth` VALUES (10, 10, 4, 10, 'admin', '2017-10-16 11:25:24', '2017-10-16 11:25:24');
INSERT INTO `rules_auth` VALUES (11, 10, 3, 10, 'admin', '2017-10-16 11:25:56', '2017-10-16 11:25:56');
INSERT INTO `rules_auth` VALUES (11, 10, 4, 10, 'admin', '2017-10-16 11:25:56', '2017-10-16 11:25:56');
INSERT INTO `rules_auth` VALUES (3, 3, 1, 2, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 3, 2, 30, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 4, 1, 2, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 6, 1, 30, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 6, 2, 30, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 6, 4, 10, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 11, 1, 30, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 11, 2, 2, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 7, 1, 10, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 8, 1, 2, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 10, 5, 2, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 10, 1, 14, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (3, 10, 2, 14, 'admin', '2017-10-16 17:36:02', '2017-10-16 17:36:02');
INSERT INTO `rules_auth` VALUES (4, 3, 1, 2, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 3, 2, 30, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 6, 1, 30, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 6, 2, 30, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 6, 4, 10, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 11, 1, 30, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 11, 2, 2, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 11, 3, 2, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 7, 1, 10, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 8, 1, 2, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 10, 3, 10, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (4, 10, 4, 10, 'admin', '2017-10-16 18:09:05', '2017-10-16 18:09:05');
INSERT INTO `rules_auth` VALUES (2, 3, 1, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 3, 2, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 4, 1, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 6, 3, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 6, 7, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 6, 5, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 11, 1, 26, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 11, 4, 26, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 11, 2, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 11, 3, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 8, 1, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 8, 2, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 9, 1, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 9, 2, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 10, 5, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 10, 1, 14, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 10, 2, 14, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 10, 3, 10, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 10, 4, 10, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 12, 1, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 2, 1, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 2, 3, 2, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (2, 1, 1, 30, 'admin', '2017-10-16 18:29:53', '2017-10-16 18:29:53');
INSERT INTO `rules_auth` VALUES (5, 3, 1, 18, 'admin', '2017-11-24 09:53:15', '2017-11-24 09:53:15');
INSERT INTO `rules_auth` VALUES (5, 3, 2, 78, 'admin', '2017-11-24 09:53:15', '2017-11-24 09:53:15');

-- ----------------------------
-- Triggers structure for table dispensing
-- ----------------------------
DROP TRIGGER IF EXISTS `dispensing_check_updated_trigger`;
delimiter ;;
CREATE TRIGGER `dispensing_check_updated_trigger` AFTER UPDATE ON `dispensing` FOR EACH ROW insert into dispensing_log(dispensing_id, contents, manager) values (OLD.id, NEW.contents, NEW.manager)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
