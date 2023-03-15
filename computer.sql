/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : computer

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/03/2023 20:38:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_room
-- ----------------------------
DROP TABLE IF EXISTS `class_room`;
CREATE TABLE `class_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_room
-- ----------------------------
INSERT INTO `class_room` VALUES (3, '初一', 1);
INSERT INTO `class_room` VALUES (4, '三班', 1);

-- ----------------------------
-- Table structure for coment
-- ----------------------------
DROP TABLE IF EXISTS `coment`;
CREATE TABLE `coment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `get_id` int(11) NULL DEFAULT NULL,
  `send_id` int(11) NULL DEFAULT NULL,
  `coment_relation_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coment
-- ----------------------------
INSERT INTO `coment` VALUES (5, '11', 2, 4, 6);
INSERT INTO `coment` VALUES (6, '1', 4, 2, 6);
INSERT INTO `coment` VALUES (7, '2', 2, 4, 6);

-- ----------------------------
-- Table structure for coment_relation
-- ----------------------------
DROP TABLE IF EXISTS `coment_relation`;
CREATE TABLE `coment_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NULL DEFAULT NULL,
  `user_two` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coment_relation
-- ----------------------------
INSERT INTO `coment_relation` VALUES (6, 4, 2);

-- ----------------------------
-- Table structure for home_work_detail
-- ----------------------------
DROP TABLE IF EXISTS `home_work_detail`;
CREATE TABLE `home_work_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_work_id` int(11) NULL DEFAULT NULL,
  `p1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_work_detail
-- ----------------------------
INSERT INTO `home_work_detail` VALUES (1, '12', 1, '10', '9', '8', '12', 10, '10+2', 1);
INSERT INTO `home_work_detail` VALUES (7, '2', 7, '1', '2', '3', '4', 2, '1+1', 1);
INSERT INTO `home_work_detail` VALUES (8, '1', 7, NULL, NULL, NULL, NULL, 2, '1', 2);
INSERT INTO `home_work_detail` VALUES (9, '2', 7, '1', '2', '3', '4', 2, '1+1', 1);

-- ----------------------------
-- Table structure for home_work_result
-- ----------------------------
DROP TABLE IF EXISTS `home_work_result`;
CREATE TABLE `home_work_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `homework_detail_id` int(11) NULL DEFAULT NULL,
  `homework_id` int(11) NULL DEFAULT NULL,
  `is_true` bit(1) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_work_result
-- ----------------------------
INSERT INTO `home_work_result` VALUES (1, '1', '12', 1, 1, b'0', 2, 4);
INSERT INTO `home_work_result` VALUES (5, '2', NULL, 7, 7, b'1', 2, 4);
INSERT INTO `home_work_result` VALUES (7, '1', NULL, 8, 7, b'1', 2, 4);
INSERT INTO `home_work_result` VALUES (8, '2', NULL, 7, 7, b'1', 2, 4);
INSERT INTO `home_work_result` VALUES (10, '1', NULL, 8, 7, b'1', 2, 4);

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_room_id` int(11) NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `homework_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES (1, 4, '2023-03-04', 'java开发', 5, 2);
INSERT INTO `homework` VALUES (7, 4, NULL, '1+1', 2, 2);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NULL DEFAULT NULL,
  `remote_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (3, NULL, 'http://localhost:8002/static/6407012eb16577dcfe792513.jpg', '1', 1);
INSERT INTO `resource` VALUES (4, NULL, 'http://localhost:8002/static/6407042fb16577b0bcca168e.mp4', 'java', 2);

-- ----------------------------
-- Table structure for resource_type
-- ----------------------------
DROP TABLE IF EXISTS `resource_type`;
CREATE TABLE `resource_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_type
-- ----------------------------
INSERT INTO `resource_type` VALUES (1, '书籍');
INSERT INTO `resource_type` VALUES (2, '视频');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '计算机');
INSERT INTO `subject` VALUES (2, '网络层');
INSERT INTO `subject` VALUES (5, '物理层');
INSERT INTO `subject` VALUES (6, '通信层');

-- ----------------------------
-- Table structure for teacher_look_work
-- ----------------------------
DROP TABLE IF EXISTS `teacher_look_work`;
CREATE TABLE `teacher_look_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_room_id` int(11) NULL DEFAULT NULL,
  `homework_detail_id` int(11) NULL DEFAULT NULL,
  `homework_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` date NULL DEFAULT NULL,
  `class_room` int(11) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_type` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, NULL, NULL, 'zz', '111', 2, 'zz', '11');
INSERT INTO `user` VALUES (3, NULL, NULL, 'admin', '123123123', 3, 'admin', NULL);
INSERT INTO `user` VALUES (4, NULL, 4, '333', '123456', 1, 'zzy', '湖南长沙');
INSERT INTO `user` VALUES (5, NULL, 4, '11', '123', 1, '11', '123');
INSERT INTO `user` VALUES (6, NULL, 3, 'zz', '1', 1, 'zz1', '32');
INSERT INTO `user` VALUES (8, NULL, NULL, '2', '2', 2, '2', '2');

SET FOREIGN_KEY_CHECKS = 1;
