/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.1.127:3306
 Source Schema         : meet_event

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 10/03/2023 18:22:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `event_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件编码',
  `event_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件名称',
  `operater_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人id',
  `event_description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件描述',
  `happen_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事发地址',
  `happen_division_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事发区划名称',
  `happen_division_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事发区划编码',
  `happen_date` datetime NULL DEFAULT NULL COMMENT '事发时间',
  `map_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'GCJ02' COMMENT '坐标系：WGS84、GCJ02',
  `map_x` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '坐标x(纬度)',
  `map_y` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '坐标y(经度)',
  `event_category_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件分类编码',
  `data_sources` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源',
  `event_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件状态 register：登记、claim：响应、deal：处理、end：办结',
  `expect_complete_date` datetime NOT NULL COMMENT '预计完成时间',
  `expect_warn_date` datetime NOT NULL COMMENT '预计预警时间',
  `urgency_degree` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急程度 普通：normal、紧急：urgency',
  `efficiency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件时效标签  正常：normal、预警：warn、超时：overdue',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_happen_division_code`(`happen_division_code`) USING BTREE,
  INDEX `index_creation_time`(`create_time`) USING BTREE,
  INDEX `index_event_code`(`event_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('8ccd56791326454eaad3078eec27e130', '366379', '测试事件名称', '4df4131efb4949a2a2ac3420b52e87f7', '测试事件名称', '广州市', '越秀区', '440104', '2023-02-22 11:26:02', NULL, NULL, NULL, 'CG_LL', 'yxxf', 'register', '2023-03-15 17:55:47', '2023-03-12 17:55:47', 'normal', 'normal', 0, '2023-03-10 17:55:47', '4df4131efb4949a2a2ac3420b52e87f7', '2023-03-10 17:55:47', '4df4131efb4949a2a2ac3420b52e87f7');

-- ----------------------------
-- Table structure for event_flow
-- ----------------------------
DROP TABLE IF EXISTS `event_flow`;
CREATE TABLE `event_flow`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `event_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件编码',
  `operater_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人id',
  `operate_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `flow_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程内容',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事件流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event_flow
-- ----------------------------

-- ----------------------------
-- Table structure for event_group
-- ----------------------------
DROP TABLE IF EXISTS `event_group`;
CREATE TABLE `event_group`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `event_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件编码',
  `group_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群聊id',
  `current_status` int(1) NULL DEFAULT 1 COMMENT '是否是事件当前所在群聊 0：不是、1：是',
  `relation_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'register' COMMENT '事件群聊关系  登记：register、转办：turn、分享：share',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_event_code`(`event_code`) USING BTREE,
  INDEX `index_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事件群聊关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event_group
-- ----------------------------

-- ----------------------------
-- Table structure for workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `workflow_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作流名称',
  `workflow_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作流编码',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务类型',
  `deploy_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用地市',
  `run_status` int(1) NULL DEFAULT 1 COMMENT '运行状态 1、未上线，2、上线中，3、已停用，4、已删除',
  `run_version` int(1) NULL DEFAULT 1 COMMENT '运行版本',
  `version_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本说明',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务工单——工作流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow
-- ----------------------------
INSERT INTO `workflow` VALUES ('0b2af4221f5649ed9b19e8616e4e0215', '工作流', '807901', 'meet', '广州市', 2, 1, '第一个版本', 0, '2023-03-10 16:52:59', NULL, '2023-03-10 16:52:59', NULL);
INSERT INTO `workflow` VALUES ('9c99b82d8d33423a8d8d451fa8b5c887', '效直形', '381282', 'proident', '鸡西市', 9, 69, 'proident', 1, '2023-03-10 14:34:57', '6', '2023-03-10 15:02:59', '40');
INSERT INTO `workflow` VALUES ('a77f6f21738949f9b927727c16a5b59e', '工作流1', '595786', 'meet', '广州市', 2, 1, '第一个版本', 0, '2023-03-10 17:07:37', '4df4131efb4949a2a2ac3420b52e87f7', '2023-03-10 17:07:37', '4df4131efb4949a2a2ac3420b52e87f7');
INSERT INTO `workflow` VALUES ('be7ce2a794b54feebab0164803d21299', '事件处置工作流', '207671', 'yxxf', '广州市', 2, 1, '第一个版本', NULL, '2023-03-10 15:02:12', NULL, '2023-03-10 15:12:58', NULL);

-- ----------------------------
-- Table structure for workflow_flow_detail
-- ----------------------------
DROP TABLE IF EXISTS `workflow_flow_detail`;
CREATE TABLE `workflow_flow_detail`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `workflow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作流id',
  `flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '环节名称',
  `flow_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '环节编码',
  `flow_permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环节权限代码值',
  `mapping_table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库表映射',
  `form_layout_id` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单布局id',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务工单——工作流环节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_flow_detail
-- ----------------------------
INSERT INTO `workflow_flow_detail` VALUES ('0785e34f8b544844be48e9a873c652c5', 'be7ce2a794b54feebab0164803d21299', '办结', 'end', NULL, NULL, NULL, 0, '2023-03-10 15:18:03', NULL, '2023-03-10 15:18:03', NULL);
INSERT INTO `workflow_flow_detail` VALUES ('1e89a8a9d59c4b38b8603f61b6700871', 'be7ce2a794b54feebab0164803d21299', '响应', 'claim', NULL, NULL, NULL, 0, '2023-03-10 15:17:29', NULL, '2023-03-10 15:17:29', NULL);
INSERT INTO `workflow_flow_detail` VALUES ('c5ccfdf53a914ff788f5509b2f207f27', 'be7ce2a794b54feebab0164803d21299', '处理', 'deal', NULL, NULL, NULL, 0, '2023-03-10 15:17:55', NULL, '2023-03-10 15:17:55', NULL);
INSERT INTO `workflow_flow_detail` VALUES ('f2d740570be74da7a5ae3e2ef9229e69', 'be7ce2a794b54feebab0164803d21299', '登记', 'register', NULL, NULL, NULL, 0, '2023-03-10 15:16:36', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for workflow_main_flow
-- ----------------------------
DROP TABLE IF EXISTS `workflow_main_flow`;
CREATE TABLE `workflow_main_flow`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `workflow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务工单id',
  `flow_detail_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程环节id',
  `flow_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环节编码',
  `flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环节名称',
  `operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作顺序 并行：parallel，串联：serial',
  `auto_complete_flow` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自动完成环节',
  `auto_complete_flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自动完成环节名称',
  `flow_sort` int(1) NULL DEFAULT 0 COMMENT '环节顺序',
  `status_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态名称',
  `is_start` int(1) NOT NULL DEFAULT 0 COMMENT '是否开始环节 0:否，1:是',
  `is_end` int(1) NOT NULL DEFAULT 0 COMMENT '是否结束环节 0:否，1:是',
  `is_repeat` int(1) NOT NULL DEFAULT 0 COMMENT '流程是否可重复 0:否，1:是',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_workflow_id`(`workflow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务工单——工作流主干流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_main_flow
-- ----------------------------
INSERT INTO `workflow_main_flow` VALUES ('191fa9db3a704e71bfbc0880fb31a228', 'be7ce2a794b54feebab0164803d21299', '1e89a8a9d59c4b38b8603f61b6700871', 'claim', '响应', 'serial', 'register', '登记', 2, '待处理', 0, 0, 0, NULL, '2023-03-10 15:32:29', NULL, '2023-03-10 15:51:09', NULL);
INSERT INTO `workflow_main_flow` VALUES ('a6cb76fc02d940d595e1d26dac901982', 'be7ce2a794b54feebab0164803d21299', '0785e34f8b544844be48e9a873c652c5', 'end', '办结', 'serial', 'register,claim,deal', '登记,响应,处理', 4, '已办结', 0, 1, 0, NULL, '2023-03-10 15:32:29', NULL, '2023-03-10 15:51:09', NULL);
INSERT INTO `workflow_main_flow` VALUES ('a9a3bdf798c3455ca6620a21bab1d6f9', 'be7ce2a794b54feebab0164803d21299', '1e89a8a9d59c4b38b8603f61b6700871', 'register', '登记', 'serial', NULL, NULL, 1, '待响应', 1, 0, 0, NULL, '2023-03-10 15:32:29', NULL, '2023-03-10 15:51:09', NULL);
INSERT INTO `workflow_main_flow` VALUES ('bb551eb504f34b30a8d1a494a09cc0ad', 'be7ce2a794b54feebab0164803d21299', 'c5ccfdf53a914ff788f5509b2f207f27', 'deal', '处理', 'serial', 'register,claim', '登记,响应', 3, '已处理', 0, 0, 0, NULL, '2023-03-10 15:32:29', NULL, '2023-03-10 15:51:09', NULL);

SET FOREIGN_KEY_CHECKS = 1;
