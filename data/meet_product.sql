/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.154.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.154.127:3306
 Source Schema         : meet_product

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/03/2023 23:00:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `product_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编号',
  `product_type` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品类型（0：其他、1：书籍、2：电子、3：服装）',
  `product_status` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品状态（on_sale：在售，sold_out：下架）',
  `product_description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品说明',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `selling_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '出售价格',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_detele` int(1) NULL DEFAULT NULL COMMENT '是否删除 0：否、1：是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('32b9849a55f445f8b16dd9d201c02650', 'MyLogo', 'O-00001', 0, 0, '我的logo', '/images/20210114163046212meet-1.png', 100.00, NULL, NULL, '2021-01-14 16:31:27', NULL, '2021-01-15 23:28:11', NULL);
INSERT INTO `product` VALUES ('3d9bc0c3765346adbfe5b02a74bad20d', '如何阅读一本书', 'B-00001', 1, 0, '如何阅读一本书', '/images/如何阅读一本书.jpg', 27.80, '如何阅读一本书', NULL, '2020-10-14 15:51:10', NULL, '2021-01-15 23:28:16', NULL);
INSERT INTO `product` VALUES ('6b262ab034f34eb7b9b0d65bdc3d41f2', '我在未来等你', 'B-00002', 1, 0, '我在未来等你-刘同', '/images/我在未来等你.jpg', 19.90, '作者刘同', NULL, '2020-10-14 15:52:50', NULL, '2021-01-15 23:28:21', NULL);
INSERT INTO `product` VALUES ('b4f48856aa884b3ba47578a770de5142', ' 经济学通识', 'B-00003', 1, 0, '经济学通识——薛兆丰', '/images/20210114162822559经济学通识.jpg', 28.00, NULL, NULL, '2020-11-28 14:00:55', NULL, '2021-01-15 23:28:27', NULL);
INSERT INTO `product` VALUES ('bed35f6a863840998d815b908f4dd1d1', '荣耀V30PRO', 'D-00001', 2, 0, '华为荣耀系列', '/images/荣耀V30Pro.jpg', 3800.00, NULL, NULL, '2020-10-14 15:54:13', NULL, '2021-01-15 23:28:32', NULL);
INSERT INTO `product` VALUES ('c72369d8f8a44181b6ea30cdc6ee1fcb', '联想笔记本Y9000', 'D-00002', 2, 1, '联想拯救者系列', '/images/Y9000X.jpg', 7999.00, '拯救者系列、型号Y9000', NULL, '2020-10-14 15:57:04', NULL, '2021-01-15 23:28:37', NULL);

SET FOREIGN_KEY_CHECKS = 1;
