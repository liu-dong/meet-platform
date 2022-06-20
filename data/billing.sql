/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.189.253
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : 120.24.189.253:3306
 Source Schema         : billing

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 16/06/2022 18:01:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for billing_details
-- ----------------------------
DROP TABLE IF EXISTS `billing_details`;
CREATE TABLE `billing_details`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `record_time` datetime NOT NULL COMMENT '记录时间',
  `spending_type` smallint(1) NOT NULL COMMENT '支出类型 0：其他、1：餐饮、2：交通、3：房租、4：娱乐、5：通讯、6：学习、7：购物',
  `amount_paid` decimal(10, 2) NOT NULL COMMENT '支出金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of billing_details
-- ----------------------------
INSERT INTO `billing_details` VALUES ('04d4c2a1-1fcc-4770-a927-3a3caa892c48', '2022-06-02 00:00:00', 1, 2.00, '备注', '2022-06-09 10:56:50', NULL, '2022-06-09 10:56:50', NULL);
INSERT INTO `billing_details` VALUES ('1108e6bd-5344-49ff-93fb-981175d6fcb3', '2022-06-05 00:00:00', 1, 12.09, '备注', '2022-06-09 23:07:32', NULL, '2022-06-10 10:59:25', NULL);
INSERT INTO `billing_details` VALUES ('1e57eb5e-3126-493d-b43e-58b65fdef73c', '2022-06-01 10:40:24', 1, 12.00, '备注', '2022-06-09 10:40:42', NULL, '2022-06-09 10:40:42', NULL);
INSERT INTO `billing_details` VALUES ('2544fb06-9141-4423-8c08-1055f7dedfc4', '2022-06-09 09:39:29', 1, 21.00, '午餐', '2022-06-09 09:39:29', NULL, '2022-06-09 09:39:29', NULL);
INSERT INTO `billing_details` VALUES ('34b766f9-272f-407b-98e1-5290ce6f7fff', '2022-05-30 15:28:11', 1, 15.22, '11', '2022-05-30 15:28:11', NULL, '2022-05-30 15:28:11', NULL);
INSERT INTO `billing_details` VALUES ('39fb7cdf-afc8-4c76-882b-f32fe886c02c', '2022-06-09 09:50:48', 1, 16.00, '晚餐', '2022-06-09 09:50:48', NULL, '2022-06-09 09:50:48', NULL);
INSERT INTO `billing_details` VALUES ('3fd74cd0-8145-4454-870d-8fae5da6964c', '2022-06-09 09:42:45', 1, 21.00, '备注', '2022-06-09 09:42:45', NULL, '2022-06-09 09:42:45', NULL);
INSERT INTO `billing_details` VALUES ('4bb631f1-0092-4dd9-b098-2c3829934bda', '2022-05-31 00:00:00', 1, 1.00, '备注', '2022-06-09 11:06:29', NULL, '2022-06-09 11:06:29', NULL);
INSERT INTO `billing_details` VALUES ('51b8ad30-e4b3-48a5-95f5-853d3c5c7b3e', '2022-06-09 10:02:41', 1, 12.80, '备注', '2022-06-09 10:02:41', NULL, '2022-06-09 10:02:41', NULL);
INSERT INTO `billing_details` VALUES ('56600a0c-243f-4d7a-8805-63cf7c4cef14', '2022-05-30 15:29:43', 1, 123.00, '11', '2022-05-30 15:29:43', NULL, '2022-05-30 15:29:43', NULL);
INSERT INTO `billing_details` VALUES ('72c0acbd-0aac-4bb3-8b85-f75955e9c8de', '2022-05-30 15:29:52', 3, 990.00, '22', '2022-05-30 15:29:52', NULL, '2022-05-30 15:29:52', NULL);
INSERT INTO `billing_details` VALUES ('763e5290-ede0-4005-8b94-14d2ef5612a5', '2022-06-09 10:02:13', 1, 12.90, '备注', '2022-06-09 10:02:13', NULL, '2022-06-09 10:02:13', NULL);
INSERT INTO `billing_details` VALUES ('7b337f44-a44d-4f29-a8b8-458c18ff77fa', '2022-06-09 10:06:41', 1, 12.00, '备注', '2022-06-09 10:06:41', NULL, '2022-06-09 10:06:41', NULL);
INSERT INTO `billing_details` VALUES ('80588ee6-a074-422b-b719-3a40af4dec4b', '2022-06-01 10:41:28', 1, 143.00, '备注', '2022-06-09 10:41:41', NULL, '2022-06-09 10:41:41', NULL);
INSERT INTO `billing_details` VALUES ('8f02b869-0df8-4468-b1a8-3629dc6166f5', '2022-06-09 09:40:40', 2, 2133.00, '备注', '2022-06-09 09:40:40', NULL, '2022-06-09 09:40:40', NULL);
INSERT INTO `billing_details` VALUES ('a3dc1d0d-aed7-412e-9ab3-08ac7d71d0a6', '2022-06-09 10:03:06', 1, 11.00, '备注', '2022-06-09 10:03:06', NULL, '2022-06-09 10:03:06', NULL);
INSERT INTO `billing_details` VALUES ('b45ade9c-b229-4f22-82e3-dd9b050f9ebb', '2022-05-30 15:29:08', 2, 50.00, '11', '2022-05-30 15:29:08', NULL, '2022-05-30 15:29:08', NULL);
INSERT INTO `billing_details` VALUES ('b9f88caf-93d4-40ba-b4de-613739228f2b', '2022-06-03 11:34:32', 1, 1.00, '1', '2022-06-10 11:34:36', NULL, '2022-06-10 11:34:36', NULL);
INSERT INTO `billing_details` VALUES ('bed1280f-eb50-4d84-9e9c-a6eaf7326c4a', '2022-05-30 15:30:11', 5, 100.00, '22', '2022-05-30 15:30:11', NULL, '2022-05-30 15:30:11', NULL);
INSERT INTO `billing_details` VALUES ('c83ce5e5-ebab-4218-9b64-33d4b7500742', '2022-06-02 00:00:00', 1, 3.00, '备注', '2022-06-09 10:58:08', NULL, '2022-06-09 10:58:08', NULL);
INSERT INTO `billing_details` VALUES ('cb2a97eb-6cea-4080-99df-db2da368fd48', '2022-06-02 00:00:00', 1, 4.00, '1', '2022-06-09 10:59:16', NULL, '2022-06-09 10:59:16', NULL);
INSERT INTO `billing_details` VALUES ('e4f4bc5f-cc9c-42b2-bed9-cd27ada7cef5', '2022-06-13 10:33:18', 1, 111.00, '1', '2022-06-13 10:33:22', NULL, '2022-06-13 10:33:22', NULL);
INSERT INTO `billing_details` VALUES ('ef08218b-4570-40ea-8cc9-78b6159b31af', '2022-06-02 00:00:00', 1, 1.00, '备注', '2022-06-09 10:55:48', NULL, '2022-06-09 10:55:48', NULL);
INSERT INTO `billing_details` VALUES ('f67f9b15-8a36-4bec-a6d1-2705c62868e8', '2022-05-30 15:29:28', 1, 34.00, '11', '2022-05-30 15:29:28', NULL, '2022-05-30 15:29:28', NULL);
INSERT INTO `billing_details` VALUES ('fa9c746a-d985-44d8-ae95-02f56ea87145', '2022-06-03 11:34:37', 2, 2.00, '2', '2022-06-10 11:34:45', NULL, '2022-06-10 11:34:51', NULL);
INSERT INTO `billing_details` VALUES ('fbd08227-8354-4bec-97d2-a81d851de77b', '2022-06-09 09:53:57', 3, 312.00, '备注', '2022-06-09 09:53:57', NULL, '2022-06-09 09:53:57', NULL);

-- ----------------------------
-- Table structure for static_spec
-- ----------------------------
DROP TABLE IF EXISTS `static_spec`;
CREATE TABLE `static_spec`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `spec_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `spec_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `spec_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `default_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典规格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of static_spec
-- ----------------------------
INSERT INTO `static_spec` VALUES ('11', 'spendingType', '支出类型', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for static_value
-- ----------------------------
DROP TABLE IF EXISTS `static_value`;
CREATE TABLE `static_value`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `spec_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格ID',
  `value_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `value_value` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `testid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of static_value
-- ----------------------------
INSERT INTO `static_value` VALUES ('111', '11', '其他', '0', NULL, NULL, NULL, NULL, NULL, 602124069819342);
INSERT INTO `static_value` VALUES ('112', '11', '餐饮', '1', NULL, NULL, NULL, NULL, NULL, 596015151027604);
INSERT INTO `static_value` VALUES ('113', '11', '交通', '2', NULL, NULL, NULL, NULL, NULL, 173703573340274);
INSERT INTO `static_value` VALUES ('114', '11', '房租', '3', NULL, NULL, NULL, NULL, NULL, 780472441278838);
INSERT INTO `static_value` VALUES ('115', '11', '娱乐', '4', NULL, NULL, NULL, NULL, NULL, 581251514033648);
INSERT INTO `static_value` VALUES ('116', '11', '通讯', '5', NULL, NULL, NULL, NULL, NULL, 464840273992009);
INSERT INTO `static_value` VALUES ('117', '11', '学习', '6', NULL, NULL, NULL, NULL, NULL, 480446855519383);
INSERT INTO `static_value` VALUES ('118', '11', '购物', '7', NULL, NULL, NULL, NULL, NULL, 907713483281166);

SET FOREIGN_KEY_CHECKS = 1;
