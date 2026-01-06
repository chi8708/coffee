/*
 Navicat Premium Data Transfer

 Source Server         : localhostMysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cnet_el

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/07/2025 17:08:40
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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_log
-- ----------------------------
INSERT INTO `gen_log` VALUES (1, '2025-06-11 10:16:14', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (2, '2025-06-24 15:44:21', '', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (3, '2025-06-24 15:49:23', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (4, '2025-06-24 17:38:14', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (5, '2025-06-24 17:40:42', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (6, '2025-06-24 17:41:33', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (7, '2025-06-24 17:42:06', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (8, '2025-06-24 17:42:37', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (9, '2025-06-25 14:31:06', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (10, '2025-06-30 16:18:32', 'Model、BLL、Controller', 1, 'test_table');
INSERT INTO `gen_log` VALUES (11, '2025-06-30 16:41:05', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (12, '2025-06-30 16:42:34', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (13, '2025-06-30 16:47:56', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (14, '2025-06-30 16:54:26', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (15, '2025-06-30 16:55:39', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (16, '2025-06-30 16:57:47', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (17, '2025-06-30 16:59:39', 'Model、BLL、Controller、Access、Api、Views', -1, 'test_table');
INSERT INTO `gen_log` VALUES (18, '2025-06-30 16:59:39', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (19, '2025-06-30 17:01:15', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (20, '2025-06-30 17:33:04', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (21, '2025-07-01 11:05:42', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (22, '2025-07-01 11:10:26', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (23, '2025-07-01 11:12:31', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (24, '2025-07-01 11:13:04', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (25, '2025-07-01 11:20:00', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (26, '2025-07-01 11:22:16', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (27, '2025-07-01 11:25:05', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (28, '2025-07-01 11:28:08', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (29, '2025-07-01 11:29:12', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (30, '2025-07-01 11:30:02', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (31, '2025-07-01 11:37:05', 'Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (32, '2025-07-01 12:04:17', 'Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (33, '2025-07-01 12:05:54', 'Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (34, '2025-07-01 13:29:27', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (35, '2025-07-01 13:31:15', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (36, '2025-07-01 13:32:09', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (37, '2025-07-01 13:34:05', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (38, '2025-07-01 13:35:28', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (39, '2025-07-01 13:40:47', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (40, '2025-07-01 13:41:57', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (41, '2025-07-01 13:43:12', 'Model、BLL、Controller、Access、Api、Views', -1, 'test_table');
INSERT INTO `gen_log` VALUES (42, '2025-07-01 15:09:25', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (43, '2025-07-01 15:12:02', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (44, '2025-07-01 15:13:07', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (45, '2025-07-01 15:14:15', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (46, '2025-07-01 15:20:04', 'Model、BLL、Controller', 1, 'test_table');
INSERT INTO `gen_log` VALUES (47, '2025-07-01 15:20:09', 'Model、BLL、Controller', 1, 'gen_log');
INSERT INTO `gen_log` VALUES (48, '2025-07-01 15:23:23', 'Model、BLL、Controller', 1, 'test_table');
INSERT INTO `gen_log` VALUES (49, '2025-07-01 15:45:05', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (50, '2025-07-01 15:49:42', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (51, '2025-07-01 16:03:02', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (52, '2025-07-01 16:05:45', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (53, '2025-07-01 16:08:46', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (54, '2025-07-01 16:09:48', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (55, '2025-07-01 16:12:48', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (56, '2025-07-01 16:13:29', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (57, '2025-07-01 16:15:17', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (58, '2025-07-01 16:18:31', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (59, '2025-07-01 16:22:19', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (60, '2025-07-01 16:33:43', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (61, '2025-07-01 16:35:38', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (62, '2025-07-01 16:37:57', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (63, '2025-07-01 16:47:42', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (64, '2025-07-01 16:54:12', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (65, '2025-07-01 16:59:26', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');
INSERT INTO `gen_log` VALUES (66, '2025-07-01 17:05:35', 'Model、BLL、Controller、Access、Api、Views', 1, 'test_table');

-- ----------------------------
-- Table structure for pub_department
-- ----------------------------
DROP TABLE IF EXISTS `pub_department`;
CREATE TABLE `pub_department`  (
  `DeptCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号',
  `DeptName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ParentCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级部门编号',
  `DeptLevel` int(0) NOT NULL COMMENT '部门级别',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `StopFlag` tinyint(0) NULL DEFAULT NULL COMMENT '停用状态 默认0 未停用 1 停用',
  PRIMARY KEY (`DeptCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_department
-- ----------------------------
INSERT INTO `pub_department` VALUES ('D000001', '总部', NULL, '', 0, '-', '2018-05-11 17:35:07', 0);
INSERT INTO `pub_department` VALUES ('D000002', '广州分公司', '1111', 'D000001', 0, '00000002-admin', '2023-07-27 22:33:30', 0);
INSERT INTO `pub_department` VALUES ('D000003', '信息技术部', '22331', 'D000002', 0, '00000002-admin', '2023-07-29 13:40:15', 0);
INSERT INTO `pub_department` VALUES ('D000004', '客服中心', NULL, 'D000002', 0, '00000002-admin', '2023-07-29 13:40:03', 0);
INSERT INTO `pub_department` VALUES ('D000005', '昆明分公司', NULL, 'D000001', 0, '00000002-admin', '2023-07-27 20:04:46', 0);
INSERT INTO `pub_department` VALUES ('D000008', '订单', '搜索ss', 'D000001', 0, '-', '2018-04-19 15:47:07', 1);
INSERT INTO `pub_department` VALUES ('D000009', '搜索', NULL, 'D000001', 0, '-', '2018-04-16 09:48:30', 1);
INSERT INTO `pub_department` VALUES ('D000011', '试试', NULL, 'D000001', 0, '-', '2018-04-16 09:55:51', 1);
INSERT INTO `pub_department` VALUES ('D000012', '订单', NULL, 'D000003', 0, '-', '2018-04-19 13:31:59', 1);
INSERT INTO `pub_department` VALUES ('D000013', '订单', NULL, 'D000001', 0, '-', '2018-04-19 13:34:18', 1);
INSERT INTO `pub_department` VALUES ('D000014', '是是是', NULL, 'D000001', 0, '-', '2018-04-19 13:34:23', 1);
INSERT INTO `pub_department` VALUES ('D000015', 'dd', NULL, 'D000003', 0, '-', '2018-04-19 14:47:38', 1);
INSERT INTO `pub_department` VALUES ('D000016', '1232', '123试试', 'D000003', 0, '-', '2018-04-19 15:23:51', 1);
INSERT INTO `pub_department` VALUES ('D000017', 'ss', 'ff', 'D000001', 0, '-', '2018-04-20 13:15:48', 1);
INSERT INTO `pub_department` VALUES ('D000018', 'sss', 'ddd', 'D000002', 0, '-', '2018-04-20 13:23:07', 1);
INSERT INTO `pub_department` VALUES ('D000019', 'sssfsdf', NULL, 'D000002', 0, '-', '2018-04-20 13:36:29', 1);
INSERT INTO `pub_department` VALUES ('D000020', 'ss', 'dd', '', 0, '-', '2018-04-23 13:17:31', 1);
INSERT INTO `pub_department` VALUES ('D000021', 'ss4', 'dd', 'D000001', 0, '-', '2018-05-12 10:06:21', 1);
INSERT INTO `pub_department` VALUES ('D000022', '试试', NULL, 'D000005', 0, '-', '2018-05-12 09:22:34', 0);
INSERT INTO `pub_department` VALUES ('D000023', 'tt2', '试试', 'D000001', 0, '-', '2018-05-12 09:24:57', 1);
INSERT INTO `pub_department` VALUES ('D000024', '订单', '搜索', 'D000001', 0, '-', '2018-04-27 10:02:32', 1);
INSERT INTO `pub_department` VALUES ('D000025', '是是是', '订单', 'D000001', 0, '-', '2018-04-27 10:02:55', 1);
INSERT INTO `pub_department` VALUES ('D000026', '搜索3', 's', 'D000001', 0, '-', '2018-05-12 09:20:15', 1);
INSERT INTO `pub_department` VALUES ('D000027', 'dd', '1111', 'D000001', 0, '-', '2018-04-27 10:05:02', 1);
INSERT INTO `pub_department` VALUES ('D000028', 'ss', NULL, 'D000001', 0, '-', '2018-04-27 10:07:47', 1);
INSERT INTO `pub_department` VALUES ('D000029', '孙菲菲', NULL, 'D000001', 0, '-', '2018-04-27 10:08:12', 1);
INSERT INTO `pub_department` VALUES ('D000030', 'd1', NULL, 'D000001', 0, '-', '2018-04-27 10:13:25', 1);
INSERT INTO `pub_department` VALUES ('D000031', 'ss', '11', 'D000003', 0, '-', '2018-04-27 10:13:38', 1);
INSERT INTO `pub_department` VALUES ('D000032', '111', NULL, 'D000001', 0, '-', '2018-04-27 10:13:50', 1);
INSERT INTO `pub_department` VALUES ('D000033', 'ss21', 'dd', 'D000023', 0, '00000002-admin', '2022-04-21 15:14:01', 0);
INSERT INTO `pub_department` VALUES ('D000034', 'fff', 'ss', 'D000023', 0, '-', '2018-05-12 09:28:39', 0);
INSERT INTO `pub_department` VALUES ('D000035', 'fsss', 'ddd', 'D000023', 0, '-', '2018-05-11 14:46:05', 1);
INSERT INTO `pub_department` VALUES ('D000036', 'sf', 'ss', 'D000023', 0, '-', '2018-05-11 14:54:34', 1);
INSERT INTO `pub_department` VALUES ('D000037', 'ss3', '1', 'D000003', 0, '00000002-admin', '2025-06-11 17:00:49', 0);
INSERT INTO `pub_department` VALUES ('D000038', 'ss', '111', 'D000003', 0, '-', '2018-05-11 17:16:12', 1);
INSERT INTO `pub_department` VALUES ('D000039', '111', NULL, 'D000003', 0, '-', '2018-05-12 10:16:00', 1);
INSERT INTO `pub_department` VALUES ('D000040', '112', '22', 'D000023', 0, '00000002-admin', '2018-07-02 17:18:34', 1);
INSERT INTO `pub_department` VALUES ('D000041', '11', '22', 'D000026', 0, '00000002-admin', '2018-07-02 17:23:57', 0);
INSERT INTO `pub_department` VALUES ('D000042', '11', '22', 'D000026', 0, '00000002-admin', '2018-08-17 11:08:50', 0);
INSERT INTO `pub_department` VALUES ('D000043', '1122', '22', 'D000026', 0, '00000002-admin', '2018-08-17 11:09:31', 0);
INSERT INTO `pub_department` VALUES ('D000044', '12233', NULL, 'D000026', 0, '00000002-admin', '2018-08-17 11:11:00', 1);
INSERT INTO `pub_department` VALUES ('D000045', '11', '33', 'D000026', 0, '00000002-admin', '2018-08-17 11:12:51', 1);
INSERT INTO `pub_department` VALUES ('D000046', '2', '333', 'D000026', 0, '00000002-admin', '2018-08-17 11:13:42', 1);
INSERT INTO `pub_department` VALUES ('D000047', '112', '222', 'D000003', 0, '00000002-admin', '2019-08-09 14:06:16', 1);
INSERT INTO `pub_department` VALUES ('D000048', '123', '11', 'D000002', 0, '00000002-admin', '2019-08-09 15:19:14', NULL);
INSERT INTO `pub_department` VALUES ('D000049', '123', '11', 'D000002', 0, '00000002-admin', '2019-08-09 15:19:30', NULL);
INSERT INTO `pub_department` VALUES ('D000050', '122', '111', 'D000003', 0, '00000002-admin', '2019-08-09 15:20:18', NULL);
INSERT INTO `pub_department` VALUES ('D000051', '111', NULL, 'D000002', 0, '00000002-admin', '2019-08-09 15:26:12', 1);
INSERT INTO `pub_department` VALUES ('D000052', '121', NULL, 'D000002', 0, '00000002-admin', '2019-08-09 15:37:45', 1);
INSERT INTO `pub_department` VALUES ('D000053', '行政部', NULL, 'D000002', 0, '00000002-admin', '2023-07-29 13:39:47', 0);

-- ----------------------------
-- Table structure for pub_function
-- ----------------------------
DROP TABLE IF EXISTS `pub_function`;
CREATE TABLE `pub_function`  (
  `FunctionCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编号',
  `FunctionEnglish` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FunctionChina` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `FunctionDescrip` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `ParentCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点',
  `MenuFlag` tinyint(0) NOT NULL COMMENT '是否为菜单 1菜单 0权限',
  `StopFlag` tinyint(0) NULL DEFAULT NULL COMMENT '是否停用',
  `URLString` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `lmdt` datetime(0) NULL DEFAULT NULL COMMENT '创建或修改时间',
  `lmid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人 名字加工号 张三(000001)',
  `sortId` int(0) NULL DEFAULT NULL COMMENT '排序字段',
  `pageTarget` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'navTab 嵌套  _blank 新窗口 dialog 弹出窗',
  `MenuIcon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标class',
  `RouterPath` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由路径',
  `IsCache` tinyint(0) NULL DEFAULT NULL COMMENT '是否组件缓存',
  PRIMARY KEY (`FunctionCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_function
-- ----------------------------
INSERT INTO `pub_function` VALUES ('FC001', NULL, '系统管理', NULL, '0', 1, 0, NULL, '2018-04-04 00:00:00', NULL, 1, 'navTab', 'ele-Setting', '/baseSet', 0);
INSERT INTO `pub_function` VALUES ('FC001001', NULL, '用户管理', '12222', 'FC001', 1, 0, '/admin/user/list', '2023-07-30 18:48:44', '00000002-admin', 1, NULL, 'fa fa-user', '/baseSet/user', 1);
INSERT INTO `pub_function` VALUES ('FC001001001', NULL, '查看', NULL, 'FC001001', 0, 0, NULL, '2019-10-10 11:04:31', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001001002', NULL, '添加', NULL, 'FC001001', 0, 0, NULL, '2018-05-14 13:41:28', '-', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001001003', NULL, '编辑', NULL, 'FC001001', 0, 0, NULL, '2018-05-14 13:42:07', '-', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001001004', NULL, '删除', NULL, 'FC001001', 0, 0, NULL, '2018-05-14 13:45:13', '-', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001001005', NULL, '授权', NULL, 'FC001001', 0, 0, NULL, '2018-05-14 13:48:11', '-', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001002', NULL, '角色管理', NULL, 'FC001', 1, 0, 'admin/role/list', '2023-07-30 20:20:48', '00000002-admin', 2, 'navTab', 'iconfont icon-role', '/baseSet/role', 0);
INSERT INTO `pub_function` VALUES ('FC001002001', NULL, '查看', NULL, 'FC001002', 0, 0, NULL, '2018-05-15 13:09:51', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001002002', NULL, '添加', NULL, 'FC001002', 0, 0, NULL, '2018-05-15 13:10:29', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001002003', NULL, '编辑', NULL, 'FC001002', 0, 0, NULL, '2018-05-15 13:11:29', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001002004', NULL, '删除', NULL, 'FC001002', 0, 0, NULL, '2018-05-15 13:12:04', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001002005', NULL, '授权', NULL, 'FC001002', 0, 0, NULL, '2019-10-08 09:44:06', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001003', NULL, '权限管理', NULL, 'FC001', 1, 0, 'admin/permission/list', '2018-05-15 13:18:40', '00000002-admin', 3, NULL, 'iconfont icon-function', '/baseSet/function', 0);
INSERT INTO `pub_function` VALUES ('FC001003001', NULL, '查看', NULL, 'FC001003', 0, 0, NULL, '2018-05-15 13:20:01', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001003002', NULL, '添加', NULL, 'FC001003', 0, 0, NULL, '2018-05-15 13:20:21', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001003003', NULL, '编辑', NULL, 'FC001003', 0, 0, NULL, '2018-05-15 13:20:39', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001003004', NULL, '删除', NULL, 'FC001003', 0, 0, NULL, '2018-05-15 13:21:03', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001004', NULL, '组织架构', NULL, 'FC001', 1, 0, 'admin/dept/list', '2018-05-15 13:22:19', '00000002-admin', 4, NULL, 'iconfont icon-org', '/baseSet/dept', 0);
INSERT INTO `pub_function` VALUES ('FC001004001', NULL, '查看', NULL, 'FC001004', 0, 0, '', '2025-06-11 17:08:03', '00000002-admin', 99, NULL, NULL, '', 0);
INSERT INTO `pub_function` VALUES ('FC001004002', NULL, '添加', NULL, 'FC001004', 0, 0, NULL, '2018-05-15 13:23:00', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001004003', NULL, '编辑', NULL, 'FC001004', 0, 0, NULL, '2018-05-15 13:23:17', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001004004', NULL, '删除', NULL, 'FC001004', 0, 0, NULL, '2018-05-15 13:23:37', '00000002-admin', 99, NULL, NULL, NULL, 0);
INSERT INTO `pub_function` VALUES ('FC001005', 'EchartTest', 'Echart', NULL, 'FC001', 1, 0, 'view/EchartTest/index1.vue', '2021-12-14 13:36:35', '00000002-admin', 9999, NULL, NULL, 'EchartTest', 0);
INSERT INTO `pub_function` VALUES ('FC002', 'BUSINESSINFO', '业务信息', NULL, '0', 1, 0, 'Main', '2018-04-04 11:36:55', NULL, 2, 'navTab', NULL, '/Business', 0);
INSERT INTO `pub_function` VALUES ('FC002001', 'test_table', 'test_table', NULL, 'FC002', 1, 0, 'admin/test_table/list', '2025-06-30 17:32:57', '000000-系统自动', 99, NULL, 'ios - people', '/Business/test_table', 0);
INSERT INTO `pub_function` VALUES ('FC002001001', 'test_table_List', '查询', NULL, 'FC002001', 0, 0, NULL, '2025-06-30 17:32:57', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002001002', 'test_table_Add', '新增', NULL, 'FC002001', 0, 0, NULL, '2025-06-30 17:32:57', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002001003', 'test_table_Edit', '编辑', NULL, 'FC002001', 0, 0, NULL, '2025-06-30 17:32:57', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002001004', 'test_table_Remove', '删除', NULL, 'FC002001', 0, 0, NULL, '2025-06-30 17:32:57', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002002', 'gen_log', 'gen_log', NULL, 'FC002', 1, 0, 'admin/gen_log/list', '2025-07-01 15:20:04', '000000-系统自动', 99, NULL, 'ios - people', '/Business/gen_log', 0);
INSERT INTO `pub_function` VALUES ('FC002002001', 'gen_log_list', '查询', NULL, 'FC002002', 0, 0, NULL, '2025-07-01 15:20:04', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002002002', 'gen_log_add', '新增', NULL, 'FC002002', 0, 0, NULL, '2025-07-01 15:20:04', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002002003', 'gen_log_edit', '编辑', NULL, 'FC002002', 0, 0, NULL, '2025-07-01 15:20:04', '000000-系统自动', 99, NULL, NULL, NULL, NULL);
INSERT INTO `pub_function` VALUES ('FC002002004', 'gen_log_remove', '删除', NULL, 'FC002002', 0, 0, NULL, '2025-07-01 15:20:04', '000000-系统自动', 99, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pub_role
-- ----------------------------
DROP TABLE IF EXISTS `pub_role`;
CREATE TABLE `pub_role`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `RoleCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `StopFlag` tinyint(0) NOT NULL COMMENT '停用状态 默认0  未停用 1 停用',
  `Crid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Crdt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_role
-- ----------------------------
INSERT INTO `pub_role` VALUES (1, 'RC000001', '超级管理员', '123', 0, '00000001', '2018-04-04 00:00:00', '00000002-admin', '2023-08-02 22:08:12');
INSERT INTO `pub_role` VALUES (2, 'RC000002', '普通管理员', '2221', 0, NULL, NULL, '00000002-admin', '2022-04-12 13:17:26');
INSERT INTO `pub_role` VALUES (3, 'RC000003', '客服经理', '11112212', 0, NULL, NULL, '00000002-admin', '2025-06-10 17:29:49');
INSERT INTO `pub_role` VALUES (4, '000004', '销售经理', '12345', 1, '-', '2018-05-10 17:27:25', '-', '2018-05-10 17:27:25');
INSERT INTO `pub_role` VALUES (5, '000005', '客服专员', NULL, 1, '-', '2018-05-11 09:45:59', '-', '2018-05-11 09:45:59');
INSERT INTO `pub_role` VALUES (7, 'RC000007', 'tt', 'ss', 1, '-', '2018-05-11 16:27:18', '-', '2018-05-11 16:27:18');
INSERT INTO `pub_role` VALUES (8, 'RC000008', 'tt', '111', 1, '-', '2018-05-14 10:50:43', '-', '2018-05-14 10:50:43');
INSERT INTO `pub_role` VALUES (9, 'RC000009', '角色2', '2222', 1, NULL, NULL, '00000002-admin', '2019-08-14 10:10:54');
INSERT INTO `pub_role` VALUES (10, 'RC000010', '客户专员', NULL, 0, NULL, NULL, '00000002-admin', '2019-08-14 14:49:06');
INSERT INTO `pub_role` VALUES (11, 'RC000011', 'test222', '1232323', 1, NULL, NULL, '00000002-admin', '2023-07-31 21:18:26');
INSERT INTO `pub_role` VALUES (12, 'RC000012', 'test2', 'tetwt', 0, NULL, NULL, '00000002-admin', '2025-06-11 16:59:38');

-- ----------------------------
-- Table structure for pub_rolefunction
-- ----------------------------
DROP TABLE IF EXISTS `pub_rolefunction`;
CREATE TABLE `pub_rolefunction`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `RoleCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `FunctionCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编号',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `StopFlag` tinyint(0) NULL DEFAULT NULL COMMENT '停用状态 默认0 未停用 1 停用',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_rolefunction
-- ----------------------------
INSERT INTO `pub_rolefunction` VALUES (1, '111', 'dddd', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (25, 'RC000001', 'FC001001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (26, 'RC000001', 'FC001001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (27, 'RC000001', 'FC001001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (28, 'RC000001', 'FC001001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (29, 'RC000001', 'FC001001005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (30, 'RC000001', 'FC001002001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (31, 'RC000001', 'FC001002002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (32, 'RC000001', 'FC001002003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (33, 'RC000001', 'FC001002004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (34, 'RC000001', 'FC001002005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (35, 'RC000001', 'FC001003001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (36, 'RC000001', 'FC001003002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (37, 'RC000001', 'FC001003003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (38, 'RC000001', 'FC001003004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (39, 'RC000001', 'FC001004001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (40, 'RC000001', 'FC001004002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (41, 'RC000001', 'FC001004003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (42, 'RC000001', 'FC001004004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (43, 'RC000001', 'FC001005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (44, 'RC000001', 'FC002001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (45, 'RC000001', 'FC002001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (46, 'RC000001', 'FC002001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (47, 'RC000001', 'FC002001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (389, 'RC000006', 'FC001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (390, 'RC000006', 'FC001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (391, 'RC000006', 'FC001001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (562, 'RC000006', 'FC001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (563, 'RC000006', 'FC001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (564, 'RC000006', 'FC001001005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (565, 'RC000006', 'FC001001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (566, 'RC000006', 'FC001001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (567, 'RC000006', 'FC001001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (568, 'RC000006', 'FC001001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (569, 'RC000006', 'FC001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (570, 'RC000006', 'FC001002001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (571, 'RC000006', 'FC001002002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (572, 'RC000006', 'FC001002003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (573, 'RC000006', 'FC001002004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (574, 'RC000006', 'FC001002005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (575, 'RC000006', 'FC001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (576, 'RC000006', 'FC001003001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (577, 'RC000006', 'FC001003002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (578, 'RC000006', 'FC001003003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (579, 'RC000006', 'FC001003004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (580, 'RC000006', 'FC001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (581, 'RC000006', 'FC001004001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (582, 'RC000006', 'FC001004002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (583, 'RC000006', 'FC001004003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (584, 'RC000006', 'FC001004004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (585, 'RC000006', 'FC002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (586, 'RC000006', '0004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (873, 'RC000002', 'FC001001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (874, 'RC000002', 'FC001001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (875, 'RC000002', 'FC001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (876, 'RC000002', 'FC001002001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (877, 'RC000002', 'FC001002002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (878, 'RC000002', 'FC001002003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (879, 'RC000002', 'FC001002004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (880, 'RC000002', 'FC001002005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (881, 'RC000002', 'FC001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (882, 'RC000002', 'FC001003001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (883, 'RC000002', 'FC001003002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (884, 'RC000002', 'FC001003003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (885, 'RC000002', 'FC001003004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (886, 'RC000002', 'FC001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (887, 'RC000002', 'FC001004001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (888, 'RC000002', 'FC001004002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (889, 'RC000002', 'FC001004003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (890, 'RC000002', 'FC001004004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (978, 'RC000010', 'FC001001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (979, 'RC000010', 'FC001001005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (980, 'RC000010', 'FC001004001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (989, 'RC000003', 'FC001001001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (990, 'RC000003', 'FC001001002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (991, 'RC000003', 'FC001001003', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (992, 'RC000003', 'FC001001004', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (993, 'RC000003', 'FC001001005', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (994, 'RC000003', 'FC001002001', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (995, 'RC000003', 'FC001002002', NULL, NULL, NULL);
INSERT INTO `pub_rolefunction` VALUES (996, 'RC000003', 'FC001002005', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pub_user
-- ----------------------------
DROP TABLE IF EXISTS `pub_user`;
CREATE TABLE `pub_user`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `UserCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户名',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称/用户名',
  `RealName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `UserPwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `Sex` bit(1) NOT NULL COMMENT '性别',
  `IdentityNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `Birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `DeptCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `ManagerFlag` tinyint(1) NOT NULL COMMENT '是否是管理员 默认不是 0  是1',
  `Tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `QQ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `StopFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '停用状态 默认0 未停用 1停用',
  `Crid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Crdt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `LoginDate` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `ProvinceCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份编号',
  `CityCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市编号',
  `RegionCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编号',
  `UserAddress` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地址',
  `Wxcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `HeadUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `UserStatus` smallint(0) NULL DEFAULT NULL COMMENT '1启用 -1禁用',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_user
-- ----------------------------
INSERT INTO `pub_user` VALUES (1, '00000001', 'chi', '迟', '123123', b'0', NULL, NULL, 'D000001', 0, '15288133116', NULL, NULL, NULL, b'0', NULL, NULL, '00000002-admin', '2023-07-29 21:19:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (2, '00000002', 'admin', 'admin', '123456', b'0', NULL, NULL, 'D000002', 0, '15288133116', NULL, NULL, '                        \n                    ', b'0', NULL, NULL, '00000002-admin', '2020-08-04 09:45:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (19, '00000003', 'hhh', 'chi', '123456', b'1', NULL, NULL, 'D000001', 0, '15211111111', NULL, NULL, NULL, b'0', '00000002-admin', '2018-08-17 10:18:58', '00000002-admin', '2023-07-22 20:53:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (20, '00000004', 'cts', '迟1', '12345678', b'1', NULL, NULL, 'D000003', 0, '12345678901', NULL, NULL, '123456', b'0', '00000002-admin', '2019-08-01 17:29:09', '00000002-admin', '2019-10-10 14:17:38', NULL, NULL, NULL, NULL, '123', NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (21, '00000005', 'cts2', '111', '1234567890', b'1', NULL, NULL, 'D000037', 0, '15288133113', NULL, NULL, '2222', b'0', '00000002-admin', '2019-08-01 17:33:36', '00000002-admin', '2023-07-28 20:45:13', NULL, NULL, NULL, NULL, '111', NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (22, '00000006', 'jack', 'chi', '111111', b'1', NULL, NULL, 'D000003', 0, '15288133116', NULL, NULL, NULL, b'0', '00000002-admin', '2019-08-02 08:56:02', '00000002-admin', '2023-07-22 22:05:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (23, '00000007', '123', NULL, '11111111', b'1', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, b'0', '00000002-admin', '2019-08-02 16:52:01', '00000002-admin', '2019-08-02 16:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (24, '00000008', '123', NULL, '11111111', b'1', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, b'0', '00000002-admin', '2019-08-02 16:52:20', '00000002-admin', '2019-08-02 16:52:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (25, '00000009', 'chi2', '111', '111111', b'1', NULL, NULL, 'D000003', 0, '15288133116', NULL, NULL, NULL, b'0', '00000001-chi', '2019-10-12 14:08:31', '00000002-admin', '2023-07-29 21:19:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pub_user` VALUES (26, '00000010', 'test111', 'chidreal', '111111', b'1', NULL, NULL, 'D000003', 0, '15200000000', NULL, NULL, NULL, b'0', '00000002-admin', '2025-06-11 16:56:00', '00000002-admin', '2025-06-11 16:56:11', NULL, NULL, NULL, NULL, 'chidreal', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pub_userfunction
-- ----------------------------
DROP TABLE IF EXISTS `pub_userfunction`;
CREATE TABLE `pub_userfunction`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `UserCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `FunctionCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编号',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `StopFlag` tinyint(0) NULL DEFAULT NULL COMMENT '停用状态 默认0 未停用 1 停用',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_userfunction
-- ----------------------------
INSERT INTO `pub_userfunction` VALUES (11, '00000003', 'FC001', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (12, '00000003', 'FC001002', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (17, '00000005', '', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (137, '00000002', 'FC001004001', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (138, '00000002', 'FC001004002', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (139, '00000002', 'FC001004003', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (140, '00000002', 'FC001004004', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (141, '00000002', 'FC001005', NULL, NULL, NULL);
INSERT INTO `pub_userfunction` VALUES (142, '00000010', 'FC001001001', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pub_userrole
-- ----------------------------
DROP TABLE IF EXISTS `pub_userrole`;
CREATE TABLE `pub_userrole`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `UserCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `RoleCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `Lmid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `Lmdt` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `StopFlag` tinyint(0) NULL DEFAULT NULL COMMENT '停用状态 默认0 未停用 1 停用',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_userrole
-- ----------------------------
INSERT INTO `pub_userrole` VALUES (40, '00000002', 'RC000001', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (42, '00000004', 'RC000003', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (50, '00000003', 'RC000001', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (51, '00000003', 'RC000002', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (53, '00000006', 'RC000002', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (54, '00000006', 'RC000001', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (56, '00000005', 'RC000002', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (58, '00000001', 'RC000002', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (59, '00000009', 'RC000001', NULL, NULL, NULL);
INSERT INTO `pub_userrole` VALUES (60, '00000010', 'RC000002', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `Brithday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `StopFlag` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO `test_table` VALUES (1, '12234', '2025-07-03 00:00:00', b'0');
INSERT INTO `test_table` VALUES (2, 'hahah', '2025-07-09 00:00:00', b'1');

-- ----------------------------
-- View structure for v_pubdept_parent
-- ----------------------------
DROP VIEW IF EXISTS `v_pubdept_parent`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pubdept_parent` AS select `pub_department`.`DeptCode` AS `DeptCode`,`pub_department`.`DeptName` AS `DeptName`,`pub_department`.`Remark` AS `Remark`,`pub_department`.`ParentCode` AS `ParentCode`,`pub_department`.`DeptLevel` AS `DeptLevel`,`pub_department`.`Lmid` AS `Lmid`,`pub_department`.`Lmdt` AS `Lmdt`,`pub_department`.`StopFlag` AS `StopFlag`,`pub_department_1`.`DeptName` AS `ParentName` from (`pub_department` join `pub_department` `pub_department_1` on((`pub_department`.`ParentCode` = `pub_department_1`.`DeptCode`)));

-- ----------------------------
-- View structure for v_pubfunction_parent
-- ----------------------------
DROP VIEW IF EXISTS `v_pubfunction_parent`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pubfunction_parent` AS select `pub_function`.`FunctionCode` AS `FunctionCode`,`pub_function`.`FunctionEnglish` AS `FunctionEnglish`,`pub_function`.`FunctionChina` AS `FunctionChina`,`pub_function`.`FunctionDescrip` AS `FunctionDescrip`,`pub_function`.`ParentCode` AS `ParentCode`,`pub_function`.`MenuFlag` AS `MenuFlag`,`pub_function`.`StopFlag` AS `StopFlag`,`pub_function`.`URLString` AS `URLString`,`pub_function`.`editdate` AS `editdate`,`pub_function`.`editor` AS `editor`,`pub_function`.`sortidx` AS `sortidx`,`pub_function`.`target` AS `target`,`pub_function`.`MenuIcon` AS `MenuIcon`,`pub_function_1`.`FunctionChina` AS `parentName`,`pub_function`.`RouterPath` AS `RouterPath`,`pub_function`.`IsCache` AS `IsCache` from (`pub_function` left join `pub_function` `pub_function_1` on((`pub_function`.`ParentCode` = `pub_function_1`.`FunctionCode`)));

-- ----------------------------
-- View structure for v_pubuser_dept
-- ----------------------------
DROP VIEW IF EXISTS `v_pubuser_dept`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pubuser_dept` AS select `pub_user`.`Id` AS `Id`,`pub_user`.`UserCode` AS `UserCode`,`pub_user`.`UserName` AS `UserName`,`pub_user`.`RealName` AS `RealName`,`pub_user`.`UserPwd` AS `UserPwd`,`pub_user`.`Sex` AS `Sex`,`pub_user`.`IdentityNo` AS `IdentityNo`,`pub_user`.`Birthday` AS `Birthday`,`pub_user`.`DeptCode` AS `DeptCode`,`pub_user`.`ManagerFlag` AS `ManagerFlag`,`pub_user`.`Tel` AS `Tel`,`pub_user`.`EMail` AS `EMail`,`pub_user`.`QQ` AS `QQ`,`pub_user`.`Remark` AS `Remark`,`pub_user`.`StopFlag` AS `StopFlag`,`pub_user`.`Crid` AS `Crid`,`pub_user`.`Crdt` AS `Crdt`,`pub_user`.`Lmid` AS `Lmid`,`pub_user`.`Lmdt` AS `Lmdt`,`pub_user`.`LoginDate` AS `LoginDate`,`pub_user`.`ProvinceCode` AS `ProvinceCode`,`pub_user`.`CityCode` AS `CityCode`,`pub_user`.`RegionCode` AS `RegionCode`,`pub_user`.`UserAddress` AS `UserAddress`,`pub_user`.`Wxcode` AS `Wxcode`,`pub_user`.`HeadUrl` AS `HeadUrl`,`pub_department`.`DeptName` AS `DeptName` from (`pub_user` left join `pub_department` on((`pub_department`.`DeptCode` = `pub_user`.`DeptCode`)));

-- ----------------------------
-- Procedure structure for pr_pager
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_pager`;
delimiter ;;
CREATE PROCEDURE `pr_pager`(in     p_table_name        varchar(1024),        /*表名*/

in     p_fields            varchar(1024),        /*查询字段*/

in     p_page_size            int,                /*每页记录数*/

in     p_page_now            int,                /*当前页*/

in     p_order_string        varchar(128),        /*排序条件(包含order关键字,可为空)*/

in     p_where_string        varchar(1024),        /*where条件(包含where关键字,可为空)*/

out    p_out_rows            int)
  COMMENT '分页存储过程'
begin

/*定义变量*/

declare m_begin_row int default 0;

declare m_limit_string char(64);

/*构造语句*/

set m_begin_row = (p_page_now - 1) * p_page_size;

set m_limit_string = concat(' limit ', m_begin_row, ', ', p_page_size);

set @count_string = concat('select count(*) into @rows_total from ', p_table_name, ' where  ', p_where_string);

set @main_string = concat('select ', p_fields, ' from ', p_table_name, ' where ', p_where_string, ' order by ', p_order_string, m_limit_string);

/*预处理*/

prepare count_stmt from @count_string;

execute count_stmt;

deallocate prepare count_stmt;

set p_out_rows = @rows_total;

prepare main_stmt from @main_string;

execute main_stmt;

deallocate prepare main_stmt;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_GetMenu
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_GetMenu`;
delimiter ;;
CREATE PROCEDURE `P_GetMenu`(in userCode VARCHAR(16))
BEGIN
	select DISTINCT * from (

		SELECT pf.* FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND  EXISTS(SELECT prf.Id FROM  Pub_RoleFunction prf WHERE pf.FunctionCode= prf.FunctionCode AND
		 prf.RoleCode IN(SELECT pur.RoleCode FROM Pub_UserRole AS pur WHERE pur.UserCode=userCode ) )
		UNION 
		SELECT pf.* FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND EXISTS(SELECT puf.Id FROM Pub_UserFunction AS puf WHERE pf.FunctionCode=puf.FunctionCode AND puf.UserCode=userCode)
	  ) t where t.MenuFlag=1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_GetUserAccess
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_GetUserAccess`;
delimiter ;;
CREATE PROCEDURE `P_GetUserAccess`(in userCode VARCHAR(16))
BEGIN
	select DISTINCT FunctionCode from (

		SELECT pf.FunctionCode FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND  EXISTS(SELECT prf.Id FROM  Pub_RoleFunction prf WHERE pf.FunctionCode= prf.FunctionCode AND
		 prf.RoleCode IN(SELECT pur.RoleCode FROM Pub_UserRole AS pur WHERE pur.UserCode=userCode ) )
		UNION 
		SELECT pf.FunctionCode FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND EXISTS(SELECT puf.Id FROM Pub_UserFunction AS puf WHERE pf.FunctionCode=puf.FunctionCode AND puf.UserCode=userCode)
	  ) t where t.StopFlag=0;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_GetUserAccessALL
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_GetUserAccessALL`;
delimiter ;;
CREATE PROCEDURE `P_GetUserAccessALL`(in userCode VARCHAR(16))
BEGIN
	select DISTINCT * from (

		SELECT pf.* FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND  EXISTS(SELECT prf.Id FROM  Pub_RoleFunction prf WHERE pf.FunctionCode= prf.FunctionCode AND
		 prf.RoleCode IN(SELECT pur.RoleCode FROM Pub_UserRole AS pur WHERE pur.UserCode=userCode ) )
		UNION 
		SELECT pf.* FROM Pub_Function AS pf
		WHERE pf.StopFlag=0 AND EXISTS(SELECT puf.Id FROM Pub_UserFunction AS puf WHERE pf.FunctionCode=puf.FunctionCode AND puf.UserCode=userCode)
	  ) t where t.StopFlag=0;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_SearchChildDept
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_SearchChildDept`;
delimiter ;;
CREATE PROCEDURE `p_SearchChildDept`(in deptCodeIn VARCHAR(20))
BEGIN
select *,(select DeptName from pub_department where deptCode=a.ParentCode LIMIT 1) as ParentName FROM
(
select * from pub_department where DeptCode = deptCodeIn
UNION
SELECT au.*
FROM (SELECT * FROM pub_department WHERE IFNULL(ParentCode,'')<>'') au,
     (SELECT @pid := deptCodeIn) pd 
WHERE FIND_IN_SET(ParentCode, @pid) > 0 
  AND  (IFNULL(@pid := concat(@pid, ',', DeptCode),'')<>'' )
) a;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_SearchChildFunction
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_SearchChildFunction`;
delimiter ;;
CREATE PROCEDURE `p_SearchChildFunction`(in functionCodeIn VARCHAR(20))
BEGIN
select *,(select FunctionChina from pub_function where FunctionCode=a.ParentCode LIMIT 1) as ParentName FROM
(
select * from pub_function where FunctionCode = functionCodeIn
UNION
SELECT au.*
FROM (SELECT * FROM pub_function WHERE IFNULL(ParentCode,'')<>'') au,
     (SELECT @pid := functionCodeIn) pd 
WHERE FIND_IN_SET(ParentCode, @pid) > 0 
  AND  (IFNULL(@pid := concat(@pid, ',', FunctionCode),'')<>'' )
) a;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
