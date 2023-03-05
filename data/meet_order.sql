/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.154.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.154.127:3306
 Source Schema         : meet_order

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/03/2023 23:00:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_form
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_type` smallint(1) NOT NULL DEFAULT 1 COMMENT '订单类型（1、出货单、2、退货单）',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `order_status` smallint(1) NOT NULL DEFAULT 1 COMMENT '订单状态（1：待接单、2：待发货、3：待收货、4：待签收、5已签收）',
  `receiver_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '收货人id',
  `receiver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '收货人名称',
  `receive_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '收货地址',
  `shipper_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货人id',
  `shipper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货人名称',
  `ship_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货地址',
  `order_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES ('01099b741f7446309ed67cdc08f18475', '出-2021010011', 1, '2021-01-15 15:01:48', 1, NULL, '刘东', '黄埔区', NULL, '李东', '天河区', 1510.00, NULL, '2021-01-15 15:01:48', NULL, '2021-01-15 23:57:04', NULL, NULL);
INSERT INTO `order_form` VALUES ('3fcb5adb77474b2b912a99967e64bd21', '出-2021010010', 1, '2021-01-15 14:42:28', 1, NULL, '刘东', '番禺区', NULL, '刘东', '天河区', 112.00, NULL, '2021-01-15 14:42:28', NULL, '2021-01-15 23:56:58', NULL, NULL);
INSERT INTO `order_form` VALUES ('4a79a985b7844cbdb7d8b020061b0365', '出-2021010009', 1, '2021-01-14 23:39:34', 1, NULL, '刘东', '广州市天河区', NULL, '刘东', '广州市番禺区', 120.00, '测试', '2021-01-14 23:39:34', NULL, '2021-01-15 23:56:53', NULL, NULL);
INSERT INTO `order_form` VALUES ('71d03f1fd0ec498cbd68876edc139446', '出-2021010008', 1, '2020-10-24 22:47:35', 1, 'efb6f0eb3ba541429d80e83f1cb80e7c', '刘东', '广东省广州市番禺区大石街道礼村小学', NULL, NULL, NULL, 100.00, NULL, '2020-10-24 22:47:35', NULL, '2021-01-15 23:56:49', NULL, NULL);
INSERT INTO `order_form` VALUES ('76222109f09444939ffc44412138f778', '出-2021010007', 1, '2021-01-15 00:14:17', 1, NULL, '张嘉欣', '广州市番禺区', NULL, '刘东', ' 广州市天河区', 150.00, NULL, '2021-01-15 00:14:17', NULL, '2021-01-15 23:56:35', NULL, NULL);
INSERT INTO `order_form` VALUES ('791ffb28a3f74886b9530be4be85f98e', '出-2021010006', 1, '2020-10-26 10:48:56', 1, 'b7baaee0c1e1493d9eec5f833c7bb51a', '刘', NULL, NULL, NULL, NULL, 100.00, NULL, '2020-10-26 10:48:56', NULL, '2021-01-15 23:56:28', NULL, NULL);
INSERT INTO `order_form` VALUES ('7a2dedcce2bd4328b3428a96c51cdaa8', '出-2021010005', 1, '2020-10-15 23:08:05', 1, NULL, NULL, '广州市天河区', NULL, NULL, '广州市番禺区', 100.00, NULL, '2020-10-15 23:08:05', NULL, '2021-01-15 23:56:21', NULL, NULL);
INSERT INTO `order_form` VALUES ('924acde9c38046bca58cac646cda989f', '出-2021010004', 1, '2021-01-14 23:38:19', 1, NULL, '刘东', '广州市天河区', NULL, '刘东', '广州市番禺区', 121.00, '测试', '2021-01-14 23:38:19', NULL, '2021-01-15 23:56:16', NULL, NULL);
INSERT INTO `order_form` VALUES ('a07b9ef129e04235b5de2327412deb6f', '出-2021010003', 1, '2021-01-15 22:28:01', 1, NULL, '张', '6号', NULL, '刘', '2号', 45.00, NULL, '2021-01-15 22:28:01', NULL, '2021-01-15 23:56:06', NULL, NULL);
INSERT INTO `order_form` VALUES ('cb485bdf203d48d99c605a45da1db836', '出-2021010002', 1, '2020-10-24 22:44:22', 1, 'efb6f0eb3ba541429d80e83f1cb80e7c', '刘东', '广东省广州市番禺区大石街道', NULL, NULL, NULL, 100.00, NULL, '2020-10-24 22:44:22', NULL, '2021-01-15 23:56:00', NULL, NULL);
INSERT INTO `order_form` VALUES ('d343889e69d5487199ab6bbab44fdb93', '退-2021010001', 2, '2021-01-15 23:58:28', 1, NULL, '刘东', '天河区', NULL, '张嘉欣', '番禺区', 100.00, NULL, '2021-01-15 23:58:28', NULL, '2021-01-15 23:58:28', NULL, NULL);
INSERT INTO `order_form` VALUES ('e44413c41ed444038d2ff117b13c29bc', '出-2021010001', 1, '2020-10-24 22:38:14', 1, 'efb6f0eb3ba541429d80e83f1cb80e7c', '刘东', '广东省广州市番禺区', NULL, NULL, NULL, 100.00, NULL, '2020-10-24 22:38:14', NULL, '2021-01-15 23:53:41', NULL, NULL);

-- ----------------------------
-- Table structure for order_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `order_product_relation`;
CREATE TABLE `order_product_relation`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `order_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单id',
  `order_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `product_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `product_count` int(2) NOT NULL DEFAULT 0 COMMENT '商品数量',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_product_relation
-- ----------------------------
INSERT INTO `order_product_relation` VALUES ('075335e15c3e470cb0a65137539eccf2', '76222109f09444939ffc44412138f778', '20210115001417', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 10, NULL, '2021-01-15 23:29:56', '2021-01-15 23:29:56');
INSERT INTO `order_product_relation` VALUES ('256d15ee9f1b4348aa4900b5718a7336', 'e44413c41ed444038d2ff117b13c29bc', '20210114230229', 'c72369d8f8a44181b6ea30cdc6ee1fcb', '联想笔记本Y9000', 7999.00, 3, NULL, '2020-10-24 22:39:22', '2020-10-24 22:39:23');
INSERT INTO `order_product_relation` VALUES ('45b2e40060b04f3c83e544c4dc67f37c', '01099b741f7446309ed67cdc08f18475', '2021010001', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 15, NULL, '2021-01-15 15:01:48', '2021-01-15 15:01:48');
INSERT INTO `order_product_relation` VALUES ('4678f2795e4e4a3bb0c324a69f184231', '7a2dedcce2bd4328b3428a96c51cdaa8', '20210114230227', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 3, NULL, '2020-10-16 23:42:04', '2020-10-16 23:42:18');
INSERT INTO `order_product_relation` VALUES ('52e4cf700a6e405784b661034517cfe9', '924acde9c38046bca58cac646cda989f', '20210114233819', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 7, NULL, '2021-01-15 00:03:45', '2021-01-15 00:03:45');
INSERT INTO `order_product_relation` VALUES ('5996ca99b66b4c74910afa98912702b6', '791ffb28a3f74886b9530be4be85f98e', '20210114230226', '6b262ab034f34eb7b9b0d65bdc3d41f2', '我在未来等你', 19.90, 3, NULL, '2020-10-26 10:49:01', '2020-10-26 10:49:01');
INSERT INTO `order_product_relation` VALUES ('5d7be4087bbc4fa698908e86a7c2c8f1', '71d03f1fd0ec498cbd68876edc139446', '20210114230224', 'c72369d8f8a44181b6ea30cdc6ee1fcb', '联想笔记本Y9000', 7999.00, 3, NULL, '2020-10-24 22:47:41', '2020-10-24 22:47:41');
INSERT INTO `order_product_relation` VALUES ('92b810c335c7477f98af9143131f94d9', 'cb485bdf203d48d99c605a45da1db836', '20210114230228', 'c72369d8f8a44181b6ea30cdc6ee1fcb', '联想笔记本Y9000', 7999.00, 3, NULL, '2020-10-24 22:44:35', '2020-10-24 22:44:35');
INSERT INTO `order_product_relation` VALUES ('9d308c42a99f482b9269eca03b6e45d8', '3fcb5adb77474b2b912a99967e64bd21', '2021010001', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 3, NULL, '2021-01-15 14:42:44', '2021-01-15 14:42:44');
INSERT INTO `order_product_relation` VALUES ('b8cdd3aa2d304737ae16230b046dff4c', '4a79a985b7844cbdb7d8b020061b0365', '20210114233933', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 9, NULL, '2021-01-15 00:01:12', '2021-01-15 00:01:12');
INSERT INTO `order_product_relation` VALUES ('c500327a527d43ae95f06048ed9d5037', 'a07b9ef129e04235b5de2327412deb6f', '出-0003', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 7, NULL, '2021-01-15 22:28:01', '2021-01-15 22:28:01');
INSERT INTO `order_product_relation` VALUES ('cafc1ff7ebe641d393c16a575aeac60c', '4a79a985b7844cbdb7d8b020061b0365', '20210114233933', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 9, NULL, '2021-01-15 15:46:24', '2021-01-15 15:46:24');
INSERT INTO `order_product_relation` VALUES ('fbe14f72762544efa3ff8af49e0462ef', '76222109f09444939ffc44412138f778', '20210115001417', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 10, NULL, '2021-01-15 00:14:17', '2021-01-15 00:14:17');
INSERT INTO `order_product_relation` VALUES ('fdb0e1b77ce346f188c3492e52a4ff3a', '76222109f09444939ffc44412138f778', '20210115001417', '3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 27.80, 10, NULL, '2021-01-15 15:46:13', '2021-01-15 15:46:13');

SET FOREIGN_KEY_CHECKS = 1;
