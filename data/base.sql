/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.189.253
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : 120.24.189.253:3306
 Source Schema         : base

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 16/06/2022 18:01:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `user_type` int(1) NOT NULL DEFAULT 2 COMMENT '用户类型 （2：普通、1：管理员、0：超级管理员）',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `person_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员id',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上传登录时间',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `user_status` int(1) NOT NULL DEFAULT 0 COMMENT '用户状态（0：正常、1：已注销）',
  `create_time` datetime NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('0b968dab73fb443fa8e65f402a47583d', 2, 'junbuyu', '123456', '8b80f924f19746e6bdfc18964f81e33d', '君不语', '2020-11-28 13:01:29', 1, 0, '2020-11-28 13:01:26', '2020-11-28 13:01:26');
INSERT INTO `account` VALUES ('350db83ed5574164a666d11738ba01dd', 2, 'liudong', '123456', 'efb6f0eb3ba541429d80e83f1cb80e7c', '刘东', '2020-11-24 16:28:37', 8, 0, '2020-10-12 14:31:27', '2020-10-12 14:31:27');
INSERT INTO `account` VALUES ('4df4131efb4949a2a2ac3420b52e87f7', 0, 'SuperAdmin', '123456', '4b6745b0c8684ee2bcbe68628bb84915', '刘东', '2022-05-16 09:51:09', 236, 0, '2020-11-03 17:30:02', '2020-11-03 17:30:02');
INSERT INTO `account` VALUES ('5b70c3a0715c4925a432090c0d635496', 1, 'admin', '123456', '3e0468155a3f4679b060c904d6cc8d42', '刘东', '2021-04-25 15:47:21', 1, 0, '2019-09-22 14:52:02', NULL);
INSERT INTO `account` VALUES ('7501bc2e833b4cacbce1df27ab1de4c2', 2, 'taobao', '123456', '6869a49c3b2a4f8dae0ba848a40a023f', '马云', NULL, 0, 0, '2021-05-26 16:21:56', '2021-08-11 19:57:28');
INSERT INTO `account` VALUES ('7da1ee6de7434ada8614110d14faf7cd', 2, 'DONG', '123456', 'b7baaee0c1e1493d9eec5f833c7bb51a', '刘', NULL, 0, 0, '2020-10-12 15:48:39', '2020-10-12 15:48:39');
INSERT INTO `account` VALUES ('94e6475af3eb419bbf693c3813e92675', 2, 'ld', '123456', '7ba92ef0dab542e6bd1061770e11c4cb', '刘东', NULL, 0, 0, '2020-10-12 15:34:57', '2020-10-12 15:34:57');
INSERT INTO `account` VALUES ('fffc9e2e39ac4a54b32c346aa2ba1271', 2, 'liu-dong', '123456', '600e5cff674e4594819674f624b3cf0c', '刘东', '2020-10-12 16:50:17', 1, 1, '2020-10-12 13:34:15', '2020-10-12 17:04:02');

SET FOREIGN_KEY_CHECKS = 1;
