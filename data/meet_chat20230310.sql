/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.1.127:3306
 Source Schema         : meet_chat

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 10/03/2023 18:21:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for group_chat
-- ----------------------------
DROP TABLE IF EXISTS `group_chat`;
CREATE TABLE `group_chat`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `group_chat_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群聊名称',
  `group_chat_type` int(1) NOT NULL DEFAULT 0 COMMENT '群聊类型',
  `group_owner` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群主',
  `group_owner_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群主id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群聊表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_chat
-- ----------------------------
INSERT INTO `group_chat` VALUES ('3b8f13c0154b4d779b6749bec6bb690a', '我的群聊2', 0, '刘东', 'liudong', '普通群聊', 0, '2023-03-07 17:45:55', NULL, '2023-03-07 17:45:55', NULL);
INSERT INTO `group_chat` VALUES ('58886492b9c54abb947d72868e3d9a09', '我的群聊', 0, '刘东', 'liudong', '普通群聊', 0, '2023-03-07 16:50:55', NULL, '2023-03-07 18:12:37', NULL);
INSERT INTO `group_chat` VALUES ('ba3a43621d104dff9de949a1df6cf98e', '我的群聊3', 0, '刘东', 'liudong', '普通群聊', 1, '2023-03-07 17:48:56', NULL, '2023-03-07 17:48:56', NULL);
INSERT INTO `group_chat` VALUES ('e6bec55834814c2ab37130ad2f82d75f', '我的群聊1', 0, '刘东', 'liudong', '普通群聊', 0, '2023-03-07 17:43:41', NULL, '2023-03-07 17:43:42', NULL);

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `group_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群id',
  `member_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员名称',
  `member_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员id',
  `group_position` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '群职位 member：成员、manager：群管理员、owner：群主',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_id`(`group_id`) USING BTREE,
  INDEX `index_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_member
-- ----------------------------
INSERT INTO `group_member` VALUES ('37f37570ee034d9a8c2056cf1d4df9f5', '58886492b9c54abb947d72868e3d9a09', 'LD', 'ld', 'normal', '我的群聊群成员', 0, '2023-03-07 18:12:38', NULL, '2023-03-07 18:12:38', NULL);
INSERT INTO `group_member` VALUES ('587b9cfef27d466eb0a62895ee42b856', 'ba3a43621d104dff9de949a1df6cf98e', 'LD', 'ld', 'normal', '我的群聊群成员', 0, '2023-03-07 17:48:56', NULL, '2023-03-07 17:48:56', NULL);
INSERT INTO `group_member` VALUES ('b02a2b57e3254d428302acfd7e66a029', 'ba3a43621d104dff9de949a1df6cf98e', '刘东', 'liudong', 'owner', '我的群聊,群职位：群主', 0, '2023-03-07 17:48:56', NULL, '2023-03-07 17:48:56', NULL);
INSERT INTO `group_member` VALUES ('cd2b4b49bbab43bbab2fbc9e38bdfbd8', '58886492b9c54abb947d72868e3d9a09', 'LD1', 'ld1', 'normal', '我的群聊群成员', 0, '2023-03-07 18:12:38', NULL, '2023-03-07 18:12:38', NULL);
INSERT INTO `group_member` VALUES ('d59b1900953941aaa68f0d8ed359e5a4', 'ba3a43621d104dff9de949a1df6cf98e', 'LD1', 'ld1', 'normal', '我的群聊群成员', 0, '2023-03-07 17:48:56', NULL, '2023-03-07 17:48:56', NULL);

SET FOREIGN_KEY_CHECKS = 1;
