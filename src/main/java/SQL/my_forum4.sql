/*
 Navicat Premium Data Transfer

 Source Server         : mysql1
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : my_forum

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 07/06/2020 18:33:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `right_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, '1号管理员', 'admin1', 2);
INSERT INTO `t_admin` VALUES (2, '2号管理员', 'admin2', 3);

-- ----------------------------
-- Table structure for t_application
-- ----------------------------
DROP TABLE IF EXISTS `t_application`;
CREATE TABLE `t_application`  (
  `user_id` int(11) NOT NULL,
  `application_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isPass` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_application
-- ----------------------------
INSERT INTO `t_application` VALUES (3, '26', 0);

-- ----------------------------
-- Table structure for t_board
-- ----------------------------
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE `t_board`  (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '论坛版块ID',
  `board_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '论坛版块名',
  `board_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '论坛版块描述',
  `topic_num` int(11) NOT NULL DEFAULT 0 COMMENT '帖子数目',
  PRIMARY KEY (`board_id`) USING BTREE,
  INDEX `AK_Board_NAME`(`board_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_board
-- ----------------------------
INSERT INTO `t_board` VALUES (1, '英雄联盟', '欢迎召唤师们来到英雄联盟社区', 4);
INSERT INTO `t_board` VALUES (2, ' 绝地求生', '《绝地求生》(PUBG) 是由蓝洞开发的一款战术竞技型射击类沙盒游戏', 4);
INSERT INTO `t_board` VALUES (3, '穿越火线', ' 穿越火线》游戏是由韩国Smile Gate开发，由深圳市腾讯计算机系统有限公司代理运营的一款第一人称射击游戏。', 1);
INSERT INTO `t_board` VALUES (4, 'CSGO', '《反恐精英：全球攻势》是一款由VALVE与Hidden Path Entertainment合作开发的第一人称射击游戏', 0);
INSERT INTO `t_board` VALUES (5, 'FIFA', ' FIFA 》是由EA制作发行的足球游戏FIFA系列的续作，将以生动的方式呈现足球赛事的两种面貌：职业赛场和街头足球', 0);

-- ----------------------------
-- Table structure for t_board_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_board_manager`;
CREATE TABLE `t_board_manager`  (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`board_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '论坛管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_board_manager
-- ----------------------------
INSERT INTO `t_board_manager` VALUES (1, 1);
INSERT INTO `t_board_manager` VALUES (2, 1);
INSERT INTO `t_board_manager` VALUES (3, 1);
INSERT INTO `t_board_manager` VALUES (4, 1);
INSERT INTO `t_board_manager` VALUES (5, 1);

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_datetime` datetime(0) NOT NULL,
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES (1, 1, '6', '2020-06-07 18:23:32');

-- ----------------------------
-- Table structure for t_peiwan
-- ----------------------------
DROP TABLE IF EXISTS `t_peiwan`;
CREATE TABLE `t_peiwan`  (
  `peiwan_id` int(11) NOT NULL,
  `peiwan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `peiwan_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `peiwan_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `peiwan_level` int(255) DEFAULT NULL,
  PRIMARY KEY (`peiwan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL DEFAULT 0 COMMENT '论坛ID',
  `topic_id` int(11) NOT NULL DEFAULT 0 COMMENT '话题ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '发表者ID',
  `post_type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '帖子类型 1:主帖子 2:回复帖子',
  `post_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\"\"' COMMENT '帖子标题',
  `post_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `IDX_POST_TOPIC_ID`(`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帖子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES (1, 1, 1, 2, 1, '\"\"', '乐言加油', '2020-06-07 00:00:00');
INSERT INTO `t_post` VALUES (2, 1, 2, 2, 1, '\"\"', '随心情想怎么出就怎么出', '2020-06-07 00:00:00');
INSERT INTO `t_post` VALUES (3, 1, 3, 4, 1, '\"\"', '我我我', '2020-06-07 00:00:00');
INSERT INTO `t_post` VALUES (4, 1, 4, 3, 1, '\"\"', '自己查', '2020-06-07 00:00:00');
INSERT INTO `t_post` VALUES (5, 2, 5, 3, 1, '\"\"', '能怎么看，很强', '2020-06-07 18:18:26');
INSERT INTO `t_post` VALUES (6, 2, 6, 3, 1, '\"\"', '我一般带5个', '2020-06-02 18:20:18');
INSERT INTO `t_post` VALUES (7, 2, 7, 3, 2, '\"\"', '我很强，请求加入', '2020-06-07 18:20:35');
INSERT INTO `t_post` VALUES (8, 2, 8, 4, 1, '\"\"', '不清楚', '2020-06-07 18:22:32');
INSERT INTO `t_post` VALUES (9, 3, 9, 1, 2, '\"\"', '我很久没玩了', '2020-06-07 18:23:04');

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right`  (
  `right_id` int(11) NOT NULL,
  `right_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`right_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_right
-- ----------------------------
INSERT INTO `t_right` VALUES (1, '普通用户');
INSERT INTO `t_right` VALUES (2, '普通管理员');
INSERT INTO `t_right` VALUES (3, '权限管理员');

-- ----------------------------
-- Table structure for t_subboard
-- ----------------------------
DROP TABLE IF EXISTS `t_subboard`;
CREATE TABLE `t_subboard`  (
  `subboard_id` int(255) NOT NULL,
  `board_id` int(11) NOT NULL,
  `subboard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `topic_num` int(255) DEFAULT NULL,
  PRIMARY KEY (`subboard_id`, `board_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subboard
-- ----------------------------
INSERT INTO `t_subboard` VALUES (0, 1, '社区讨论', 1);
INSERT INTO `t_subboard` VALUES (0, 2, '社区讨论', 1);
INSERT INTO `t_subboard` VALUES (0, 3, '社区讨论', 1);
INSERT INTO `t_subboard` VALUES (0, 4, '社区讨论', 0);
INSERT INTO `t_subboard` VALUES (0, 5, '社区讨论', 1);
INSERT INTO `t_subboard` VALUES (1, 1, '攻略分享', 1);
INSERT INTO `t_subboard` VALUES (1, 2, '攻略分享', 1);
INSERT INTO `t_subboard` VALUES (1, 3, '攻略分享', 0);
INSERT INTO `t_subboard` VALUES (1, 4, '攻略分享', 0);
INSERT INTO `t_subboard` VALUES (1, 5, '攻略分享', 0);
INSERT INTO `t_subboard` VALUES (2, 1, '组队交友', 1);
INSERT INTO `t_subboard` VALUES (2, 2, '组队交友', 1);
INSERT INTO `t_subboard` VALUES (2, 3, '组队交友', 0);
INSERT INTO `t_subboard` VALUES (2, 4, '组队交友', 0);
INSERT INTO `t_subboard` VALUES (2, 5, '组队交友', 0);
INSERT INTO `t_subboard` VALUES (3, 1, '比赛资讯', 1);
INSERT INTO `t_subboard` VALUES (3, 2, '比赛资讯', 1);
INSERT INTO `t_subboard` VALUES (3, 3, '比赛资讯', 0);
INSERT INTO `t_subboard` VALUES (3, 4, '比赛资讯', 0);
INSERT INTO `t_subboard` VALUES (3, 5, '比赛资讯', 0);

-- ----------------------------
-- Table structure for t_superadmin
-- ----------------------------
DROP TABLE IF EXISTS `t_superadmin`;
CREATE TABLE `t_superadmin`  (
  `superadmin_id` int(11) NOT NULL,
  `superadmin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `superadmin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `right_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`superadmin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_superadmin
-- ----------------------------
INSERT INTO `t_superadmin` VALUES (1, '1号超级管理员', 'superadmin1', 2);

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic`  (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL COMMENT '所属论坛',
  `topic_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '帖子标题',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '发表用户',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `last_post` datetime(0) NOT NULL DEFAULT '1990-01-01 00:00:00' COMMENT '最后回复时间',
  `topic_views` int(11) NOT NULL DEFAULT 1 COMMENT '浏览数',
  `topic_replies` int(11) NOT NULL DEFAULT 0 COMMENT '回复数',
  `digest` int(11) NOT NULL DEFAULT 0 COMMENT '0:不是精华话题 1:是精华话题',
  `subboard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `IDX_TOPIC_USER_ID`(`user_id`) USING BTREE,
  INDEX `IDX_TOPIC_TITLE`(`topic_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1250 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES (1, 1, 'VG 战队官宣 iG 打野选手 Leyan 转会加盟', 1, '2020-05-24 00:00:00', '2020-05-26 16:32:09', 10, 1, 1, 0);
INSERT INTO `t_topic` VALUES (2, 1, ' 求大神指点符文怎么出', 1, '2020-05-25 18:02:35', '2020-06-03 00:00:00', 10, 0, 1, 1);
INSERT INTO `t_topic` VALUES (3, 1, '求一个好辅助', 1, '2020-05-26 00:00:00', '2020-06-03 00:00:00', 10, 0, 0, 2);
INSERT INTO `t_topic` VALUES (4, 1, '今晚有什么比赛', 1, '2020-05-25 10:16:44', '2020-06-03 10:16:45', 10, 1, 0, 3);
INSERT INTO `t_topic` VALUES (5, 2, ' 怎么看待4AM战队', 2, '2020-05-25 17:40:13', '2020-06-07 00:00:00', 10, 0, 0, 0);
INSERT INTO `t_topic` VALUES (6, 2, '决赛圈一般带几个烟雾弹', 2, '2020-06-01 17:44:45', '2020-06-07 00:00:00', 10, 0, 0, 1);
INSERT INTO `t_topic` VALUES (7, 2, '求双排队友', 2, '2020-06-07 18:09:58', '2020-06-07 00:00:00', 10, 0, 0, 2);
INSERT INTO `t_topic` VALUES (8, 2, '最近有没有比赛', 2, '2020-06-07 18:11:56', '2020-06-07 00:00:00', 10, 0, 0, 3);
INSERT INTO `t_topic` VALUES (9, 3, '这个游戏是不是快凉了', 3, '2020-06-07 18:13:06', '2020-06-07 00:00:00', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:普通用户 2:管理员',
  `locked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:未锁定 1:锁定',
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `last_visit` datetime(0) DEFAULT NULL COMMENT '最后登陆时间',
  `last_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后登陆IP',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `AK_AK_USER_USER_NAME`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', 3, 0, 100, '2020-06-03 10:59:13', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES (2, '郑浩天', '123', 2, 0, 100, '2020-06-07 17:33:27', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES (3, '李彤', '123', 1, 0, 100, '2020-06-07 17:34:02', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES (4, '金辰宇', '123', 1, 0, 100, '2020-06-07 17:34:38', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES (5, '王明瑞', '123', 1, 0, 100, '2020-06-07 17:35:07', ' 0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES (6, '杨阳', '123', 1, 0, 100, '2020-06-07 17:35:32', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_user_detailed
-- ----------------------------
DROP TABLE IF EXISTS `t_user_detailed`;
CREATE TABLE `t_user_detailed`  (
  `user_id` int(11) NOT NULL,
  `image_path` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `e_mail` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_signature` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sign_time` datetime(0) NOT NULL,
  `right_id` int(255) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_detailed
-- ----------------------------
INSERT INTO `t_user_detailed` VALUES (1, '/userPic/285bd9a321044d7d890ca766e67387aa.jpg', 'orochi1972@163.com', '18325213331', '资深lol玩家', '男', '2020-05-25 00:00:00', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003);
INSERT INTO `t_user_detailed` VALUES (2, '/userPic/21251e0c76784753824ec27aae8c8cc6.jpg', 'sc@126.com', '18412389132', '玩绝地求生的漂亮小姐姐', '女', '2020-05-26 00:00:00', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002);
INSERT INTO `t_user_detailed` VALUES (3, '/userPic/23ee44a88e70427dbd00ca046b602106.jpg', 'fgbn@qq.com', '17843800943', '穿越火线资深玩家', '男', '2020-05-26 00:00:00', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001);
INSERT INTO `t_user_detailed` VALUES (4, '/userPic/8c989aae87574a078dbd4800d5ae8cfd.jpg', '423411231@qq.com', '18120712215', '会打游戏的小姐姐', '女', '2020-05-26 00:00:00', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001);
INSERT INTO `t_user_detailed` VALUES (5, '/userPic/4595e85e04b84595b7d4b3a4089d1747.jpg', 'whatis@163.com', '18377648907', '喜欢梅西的帅哥', '男', '2020-06-01 00:00:00', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001);
INSERT INTO `t_user_detailed` VALUES (6, '/userPic/285bd9a321044d7d890ca766e67387aa.jpg', '644230415@qq.com', '15801229663', '资深游戏玩家', '男', '2020-06-07 17:38:18', 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001);

SET FOREIGN_KEY_CHECKS = 1;
