/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.1.127:3306
 Source Schema         : meet_warehouse

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/03/2023 23:00:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `product_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编号',
  `product_type` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品类型（0：其他、1：书籍、2：电子、3：服装）',
  `product_description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品说明',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `amount` int(1) NOT NULL DEFAULT 0 COMMENT '商品总数',
  `remaining_quantity` int(1) NOT NULL DEFAULT 0 COMMENT '剩余数量',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价格',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0：否、1：是',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('26f87289-6ce1-41f2-8183-9d30f1f93ce3', '军龙影术战', '00000', 85, 'Ut enim irure proident aute', 'http://dummyimage.com/400x400', 5, 69, 48.00, 1, 'do', '2023-03-04 23:10:38', NULL, '2023-03-04 23:10:38', NULL);
INSERT INTO `inventory` VALUES ('32b9849a55f445f8b16dd9d201c02650', 'MyLogo', 'O-00001', 0, '我的logo', '/images/20210114163046212meet-1.png', 10, 9, 80.00, 0, NULL, '2021-01-14 16:31:27', NULL, '2021-01-15 23:28:11', NULL);
INSERT INTO `inventory` VALUES ('3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 'B-00001', 1, '如何阅读一本书', '/images/如何阅读一本书.jpg', 100, 100, 19.80, 0, '如何阅读一本书', '2020-10-14 15:51:10', NULL, '2021-01-15 23:28:16', NULL);
INSERT INTO `inventory` VALUES ('6b262ab034f34eb7b9b0d65bdc3d41f2', '我在未来等你', 'B-00002', 1, '我在未来等你-刘同', '/images/我在未来等你.jpg', 50, 26, 15.00, 0, '作者刘同', '2020-10-14 15:52:50', NULL, '2021-01-15 23:28:21', NULL);
INSERT INTO `inventory` VALUES ('b4f48856aa884b3ba47578a770de5142', ' 经济学通识', 'B-00003', 1, '经济学通识——薛兆丰', '/images/20210114162822559经济学通识.jpg', 100, 100, 20.00, 0, NULL, '2020-11-28 14:00:55', NULL, '2021-01-15 23:28:27', NULL);
INSERT INTO `inventory` VALUES ('bed35f6a863840998d815b908f4dd1d1', '荣耀V30PRO', 'D-00001', 2, '华为荣耀系列', '/images/荣耀V30Pro.jpg', 1000, 26, 3200.00, 0, NULL, '2020-10-14 15:54:13', NULL, '2021-01-15 23:28:32', NULL);
INSERT INTO `inventory` VALUES ('c72369d8f8a44181b6ea30cdc6ee1fcb', '联想笔记本Y9000', 'D-00002', 2, '联想拯救者系列', '/images/Y9000X.jpg', 99, 0, 6000.00, 0, '拯救者系列、型号Y9000', '2020-10-14 15:57:04', NULL, '2021-01-15 23:28:37', NULL);

SET FOREIGN_KEY_CHECKS = 1;
