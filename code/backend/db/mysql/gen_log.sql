/*
 Navicat Premium Data Transfer

 Source Server         : localhostMysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cnet

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/06/2025 16:27:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_log
-- ----------------------------
DROP TABLE IF EXISTS `gen_log`;
CREATE TABLE `gen_log`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(0) NULL DEFAULT NULL,
  `GenInfo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Status` int(0) NULL DEFAULT NULL,
  `TableName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_log
-- ----------------------------
INSERT INTO `gen_log` VALUES (1, '2025-06-11 10:16:14', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (2, '2025-06-24 15:44:21', '', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (3, '2025-06-24 15:49:23', 'Model、BLL、Controller', 1, 'gen_log');

SET FOREIGN_KEY_CHECKS = 1;
