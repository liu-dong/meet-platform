/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.1.127:3306
 Source Schema         : meet

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 02/02/2023 18:54:28
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account`
(
    `id`              varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `user_type`       int(1) NOT NULL DEFAULT 2 COMMENT '用户类型 （2：普通、1：管理员、0：超级管理员）',
    `username`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin        NOT NULL,
    `password`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `person_id`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员id',
    `real_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `last_login_time` datetime NULL DEFAULT NULL COMMENT '上传登录时间',
    `login_count`     int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
    `user_status`     int(1) NOT NULL DEFAULT 0 COMMENT '用户状态（0：正常、1：已注销）',
    `create_time`     datetime                                                     NOT NULL,
    `update_time`     datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account`
VALUES ('0b968dab73fb443fa8e65f402a47583d', 2, 'junbuyu', '123456', '8b80f924f19746e6bdfc18964f81e33d', '君不语',
        '2020-11-28 13:01:29', 1, 0, '2020-11-28 13:01:26', '2020-11-28 13:01:26');
INSERT INTO `sys_account`
VALUES ('350db83ed5574164a666d11738ba01dd', 2, 'liudong', '123456', 'efb6f0eb3ba541429d80e83f1cb80e7c', '刘东',
        '2020-11-24 16:28:37', 8, 0, '2020-10-12 14:31:27', '2020-10-12 14:31:27');
INSERT INTO `sys_account`
VALUES ('4df4131efb4949a2a2ac3420b52e87f7', 0, 'SuperAdmin', '123456', '1', NULL, '2022-05-16 09:51:09', 236, 0,
        '2020-11-03 17:30:02', '2020-11-03 17:30:02');
INSERT INTO `sys_account`
VALUES ('5b70c3a0715c4925a432090c0d635496', 1, 'admin', '123456', '3e0468155a3f4679b060c904d6cc8d42', '刘东',
        '2021-04-25 15:47:21', 1, 0, '2019-09-22 14:52:02', NULL);
INSERT INTO `sys_account`
VALUES ('7501bc2e833b4cacbce1df27ab1de4c2', 2, 'taobao', '123456', '6869a49c3b2a4f8dae0ba848a40a023f', '马云', NULL, 0,
        0, '2021-05-26 16:21:56', '2021-08-11 19:57:28');
INSERT INTO `sys_account`
VALUES ('7da1ee6de7434ada8614110d14faf7cd', 2, 'DONG', '123456', 'b7baaee0c1e1493d9eec5f833c7bb51a', '刘', NULL, 0, 0,
        '2020-10-12 15:48:39', '2020-10-12 15:48:39');
INSERT INTO `sys_account`
VALUES ('94e6475af3eb419bbf693c3813e92675', 2, 'ld', '123456', '7ba92ef0dab542e6bd1061770e11c4cb', '刘东', NULL, 0, 0,
        '2020-10-12 15:34:57', '2020-10-12 15:34:57');
INSERT INTO `sys_account`
VALUES ('fffc9e2e39ac4a54b32c346aa2ba1271', 2, 'liu-dong', '123456', '600e5cff674e4594819674f624b3cf0c', '刘东',
        '2020-10-12 16:50:17', 1, 1, '2020-10-12 13:34:15', '2020-10-12 17:04:02');

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role`
(
    `id`         varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `account_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `role_id`    varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
INSERT INTO `sys_account_role`
VALUES ('175a1e0-1db7-11eb-9695-000c9d4749c', '94e6475af3eb419bbf693c3813e92675', '32047ea768ff4c72a784e0bc02650eaa');
INSERT INTO `sys_account_role`
VALUES ('477e05cbcc744f07b6872fd6e6748477', '5b70c3a0715c4925a432090c0d635496', '9ab25edf8c624bd391ddeb9275bc97f8');
INSERT INTO `sys_account_role`
VALUES ('5b6d6945b52c42469edbeb77ba3adace', '7501bc2e833b4cacbce1df27ab1de4c2', '604b3be374934dc59ce475236726d9bc');
INSERT INTO `sys_account_role`
VALUES ('6031f6ea5310402486065386f0a9e7e4', '4df4131efb4949a2a2ac3420b52e87f7', '55456caee85c4537b309f3ba72bc1096');
INSERT INTO `sys_account_role`
VALUES ('64ad972c7c584eed95f75cbd6e12c0d4', '0b968dab73fb443fa8e65f402a47583d', '32047ea768ff4c72a784e0bc02650eaa');
INSERT INTO `sys_account_role`
VALUES ('66f767ff010b4622aa3d953830cf43f9', '350db83ed5574164a666d11738ba01dd', '604b3be374934dc59ce475236726d9bc');
INSERT INTO `sys_account_role`
VALUES ('9d7d3713-1db6-11eb-9695-000c9d4749c', 'fffc9e2e39ac4a54b32c346aa2ba1271', '32047ea768ff4c72a784e0bc02650eaa');
INSERT INTO `sys_account_role`
VALUES ('afe1451a7a2c4221ad4fb526a885e62a', '350db83ed5574164a666d11738ba01dd', '32047ea768ff4c72a784e0bc02650eaa');
INSERT INTO `sys_account_role`
VALUES ('b88aec320c604bc2a2313d13fbe15c21', '350db83ed5574164a666d11738ba01dd', '9ab25edf8c624bd391ddeb9275bc97f8');
INSERT INTO `sys_account_role`
VALUES ('ee62f15f10314ac29b25eb4d10d5f304', '7da1ee6de7434ada8614110d14faf7cd', '604b3be374934dc59ce475236726d9bc');
INSERT INTO `sys_account_role`
VALUES ('f20445d331544caeaf081d0bf6e0d5d9', '7da1ee6de7434ada8614110d14faf7cd', '32047ea768ff4c72a784e0bc02650eaa');

-- ----------------------------
-- Table structure for sys_administrative_division
-- ----------------------------
DROP TABLE IF EXISTS `sys_administrative_division`;
CREATE TABLE `sys_administrative_division`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_code`   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父区划代码',
    `division_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划代码',
    `division_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
    `division_type` smallint(1) NULL DEFAULT 0 COMMENT '级别 1：省，2：市，3：区',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `index_division_code`(`division_code`) USING BTREE,
    INDEX           `index_parent_code`(`parent_code`) USING BTREE,
    INDEX           `index_division_type`(`division_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '中国行政区划数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_administrative_division
-- ----------------------------
INSERT INTO `sys_administrative_division`
VALUES (1, '000000', '110000', '北京市', 1);
INSERT INTO `sys_administrative_division`
VALUES (2, '110000', '110100', '市辖区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3, '110100', '110101', '东城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (4, '110100', '110102', '西城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (5, '110100', '110105', '朝阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (6, '110100', '110106', '丰台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (7, '110100', '110107', '石景山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (8, '110100', '110108', '海淀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (9, '110100', '110109', '门头沟区', 3);
INSERT INTO `sys_administrative_division`
VALUES (10, '110100', '110111', '房山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (11, '110100', '110112', '通州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (12, '110100', '110113', '顺义区', 3);
INSERT INTO `sys_administrative_division`
VALUES (13, '110100', '110114', '昌平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (14, '110100', '110115', '大兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (15, '110100', '110116', '怀柔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (16, '110100', '110117', '平谷区', 3);
INSERT INTO `sys_administrative_division`
VALUES (17, '110100', '110118', '密云区', 3);
INSERT INTO `sys_administrative_division`
VALUES (18, '110100', '110119', '延庆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (19, '000000', '120000', '天津市', 1);
INSERT INTO `sys_administrative_division`
VALUES (20, '120000', '120100', '市辖区', 2);
INSERT INTO `sys_administrative_division`
VALUES (21, '120100', '120101', '和平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (22, '120100', '120102', '河东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (23, '120100', '120103', '河西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (24, '120100', '120104', '南开区', 3);
INSERT INTO `sys_administrative_division`
VALUES (25, '120100', '120105', '河北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (26, '120100', '120106', '红桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (27, '120100', '120110', '东丽区', 3);
INSERT INTO `sys_administrative_division`
VALUES (28, '120100', '120111', '西青区', 3);
INSERT INTO `sys_administrative_division`
VALUES (29, '120100', '120112', '津南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (30, '120100', '120113', '北辰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (31, '120100', '120114', '武清区', 3);
INSERT INTO `sys_administrative_division`
VALUES (32, '120100', '120115', '宝坻区', 3);
INSERT INTO `sys_administrative_division`
VALUES (33, '120100', '120116', '滨海新区', 3);
INSERT INTO `sys_administrative_division`
VALUES (34, '120100', '120117', '宁河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (35, '120100', '120118', '静海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (36, '120100', '120119', '蓟州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (37, '000000', '130000', '河北省', 1);
INSERT INTO `sys_administrative_division`
VALUES (38, '130000', '130100', '石家庄市', 2);
INSERT INTO `sys_administrative_division`
VALUES (39, '130100', '130102', '长安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (40, '130100', '130104', '桥西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (41, '130100', '130105', '新华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (42, '130100', '130107', '井陉矿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (43, '130100', '130108', '裕华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (44, '130100', '130109', '藁城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (45, '130100', '130110', '鹿泉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (46, '130100', '130111', '栾城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (47, '130100', '130121', '井陉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (48, '130100', '130123', '正定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (49, '130100', '130125', '行唐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (50, '130100', '130126', '灵寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (51, '130100', '130127', '高邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (52, '130100', '130128', '深泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (53, '130100', '130129', '赞皇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (54, '130100', '130130', '无极县', 3);
INSERT INTO `sys_administrative_division`
VALUES (55, '130100', '130131', '平山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (56, '130100', '130132', '元氏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (57, '130100', '130133', '赵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (58, '130100', '130181', '辛集市', 3);
INSERT INTO `sys_administrative_division`
VALUES (59, '130100', '130183', '晋州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (60, '130100', '130184', '新乐市', 3);
INSERT INTO `sys_administrative_division`
VALUES (61, '130000', '130200', '唐山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (62, '130200', '130202', '路南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (63, '130200', '130203', '路北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (64, '130200', '130204', '古冶区', 3);
INSERT INTO `sys_administrative_division`
VALUES (65, '130200', '130205', '开平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (66, '130200', '130207', '丰南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (67, '130200', '130208', '丰润区', 3);
INSERT INTO `sys_administrative_division`
VALUES (68, '130200', '130209', '曹妃甸区', 3);
INSERT INTO `sys_administrative_division`
VALUES (69, '130200', '130224', '滦南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (70, '130200', '130225', '乐亭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (71, '130200', '130227', '迁西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (72, '130200', '130229', '玉田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (73, '130200', '130281', '遵化市', 3);
INSERT INTO `sys_administrative_division`
VALUES (74, '130200', '130283', '迁安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (75, '130200', '130284', '滦州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (76, '130000', '130300', '秦皇岛市', 2);
INSERT INTO `sys_administrative_division`
VALUES (77, '130300', '130302', '海港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (78, '130300', '130303', '山海关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (79, '130300', '130304', '北戴河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (80, '130300', '130306', '抚宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (81, '130300', '130321', '青龙满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (82, '130300', '130322', '昌黎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (83, '130300', '130324', '卢龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (84, '130000', '130400', '邯郸市', 2);
INSERT INTO `sys_administrative_division`
VALUES (85, '130400', '130402', '邯山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (86, '130400', '130403', '丛台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (87, '130400', '130404', '复兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (88, '130400', '130406', '峰峰矿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (89, '130400', '130407', '肥乡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (90, '130400', '130408', '永年区', 3);
INSERT INTO `sys_administrative_division`
VALUES (91, '130400', '130423', '临漳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (92, '130400', '130424', '成安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (93, '130400', '130425', '大名县', 3);
INSERT INTO `sys_administrative_division`
VALUES (94, '130400', '130426', '涉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (95, '130400', '130427', '磁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (96, '130400', '130430', '邱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (97, '130400', '130431', '鸡泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (98, '130400', '130432', '广平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (99, '130400', '130433', '馆陶县', 3);
INSERT INTO `sys_administrative_division`
VALUES (100, '130400', '130434', '魏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (101, '130400', '130435', '曲周县', 3);
INSERT INTO `sys_administrative_division`
VALUES (102, '130400', '130481', '武安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (103, '130000', '130500', '邢台市', 2);
INSERT INTO `sys_administrative_division`
VALUES (104, '130500', '130502', '襄都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (105, '130500', '130503', '信都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (106, '130500', '130505', '任泽区', 3);
INSERT INTO `sys_administrative_division`
VALUES (107, '130500', '130506', '南和区', 3);
INSERT INTO `sys_administrative_division`
VALUES (108, '130500', '130522', '临城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (109, '130500', '130523', '内丘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (110, '130500', '130524', '柏乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (111, '130500', '130525', '隆尧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (112, '130500', '130528', '宁晋县', 3);
INSERT INTO `sys_administrative_division`
VALUES (113, '130500', '130529', '巨鹿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (114, '130500', '130530', '新河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (115, '130500', '130531', '广宗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (116, '130500', '130532', '平乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (117, '130500', '130533', '威县', 3);
INSERT INTO `sys_administrative_division`
VALUES (118, '130500', '130534', '清河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (119, '130500', '130535', '临西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (120, '130500', '130581', '南宫市', 3);
INSERT INTO `sys_administrative_division`
VALUES (121, '130500', '130582', '沙河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (122, '130000', '130600', '保定市', 2);
INSERT INTO `sys_administrative_division`
VALUES (123, '130600', '130602', '竞秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (124, '130600', '130606', '莲池区', 3);
INSERT INTO `sys_administrative_division`
VALUES (125, '130600', '130607', '满城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (126, '130600', '130608', '清苑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (127, '130600', '130609', '徐水区', 3);
INSERT INTO `sys_administrative_division`
VALUES (128, '130600', '130623', '涞水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (129, '130600', '130624', '阜平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (130, '130600', '130626', '定兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (131, '130600', '130627', '唐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (132, '130600', '130628', '高阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (133, '130600', '130629', '容城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (134, '130600', '130630', '涞源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (135, '130600', '130631', '望都县', 3);
INSERT INTO `sys_administrative_division`
VALUES (136, '130600', '130632', '安新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (137, '130600', '130633', '易县', 3);
INSERT INTO `sys_administrative_division`
VALUES (138, '130600', '130634', '曲阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (139, '130600', '130635', '蠡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (140, '130600', '130636', '顺平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (141, '130600', '130637', '博野县', 3);
INSERT INTO `sys_administrative_division`
VALUES (142, '130600', '130638', '雄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (143, '130600', '130681', '涿州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (144, '130600', '130682', '定州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (145, '130600', '130683', '安国市', 3);
INSERT INTO `sys_administrative_division`
VALUES (146, '130600', '130684', '高碑店市', 3);
INSERT INTO `sys_administrative_division`
VALUES (147, '130000', '130700', '张家口市', 2);
INSERT INTO `sys_administrative_division`
VALUES (148, '130700', '130702', '桥东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (149, '130700', '130703', '桥西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (150, '130700', '130705', '宣化区', 3);
INSERT INTO `sys_administrative_division`
VALUES (151, '130700', '130706', '下花园区', 3);
INSERT INTO `sys_administrative_division`
VALUES (152, '130700', '130708', '万全区', 3);
INSERT INTO `sys_administrative_division`
VALUES (153, '130700', '130709', '崇礼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (154, '130700', '130722', '张北县', 3);
INSERT INTO `sys_administrative_division`
VALUES (155, '130700', '130723', '康保县', 3);
INSERT INTO `sys_administrative_division`
VALUES (156, '130700', '130724', '沽源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (157, '130700', '130725', '尚义县', 3);
INSERT INTO `sys_administrative_division`
VALUES (158, '130700', '130726', '蔚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (159, '130700', '130727', '阳原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (160, '130700', '130728', '怀安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (161, '130700', '130730', '怀来县', 3);
INSERT INTO `sys_administrative_division`
VALUES (162, '130700', '130731', '涿鹿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (163, '130700', '130732', '赤城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (164, '130000', '130800', '承德市', 2);
INSERT INTO `sys_administrative_division`
VALUES (165, '130800', '130802', '双桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (166, '130800', '130803', '双滦区', 3);
INSERT INTO `sys_administrative_division`
VALUES (167, '130800', '130804', '鹰手营子矿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (168, '130800', '130821', '承德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (169, '130800', '130822', '兴隆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (170, '130800', '130824', '滦平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (171, '130800', '130825', '隆化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (172, '130800', '130826', '丰宁满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (173, '130800', '130827', '宽城满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (174, '130800', '130828', '围场满族蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (175, '130800', '130881', '平泉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (176, '130000', '130900', '沧州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (177, '130900', '130902', '新华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (178, '130900', '130903', '运河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (179, '130900', '130921', '沧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (180, '130900', '130922', '青县', 3);
INSERT INTO `sys_administrative_division`
VALUES (181, '130900', '130923', '东光县', 3);
INSERT INTO `sys_administrative_division`
VALUES (182, '130900', '130924', '海兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (183, '130900', '130925', '盐山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (184, '130900', '130926', '肃宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (185, '130900', '130927', '南皮县', 3);
INSERT INTO `sys_administrative_division`
VALUES (186, '130900', '130928', '吴桥县', 3);
INSERT INTO `sys_administrative_division`
VALUES (187, '130900', '130929', '献县', 3);
INSERT INTO `sys_administrative_division`
VALUES (188, '130900', '130930', '孟村回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (189, '130900', '130981', '泊头市', 3);
INSERT INTO `sys_administrative_division`
VALUES (190, '130900', '130982', '任丘市', 3);
INSERT INTO `sys_administrative_division`
VALUES (191, '130900', '130983', '黄骅市', 3);
INSERT INTO `sys_administrative_division`
VALUES (192, '130900', '130984', '河间市', 3);
INSERT INTO `sys_administrative_division`
VALUES (193, '130000', '131000', '廊坊市', 2);
INSERT INTO `sys_administrative_division`
VALUES (194, '131000', '131002', '安次区', 3);
INSERT INTO `sys_administrative_division`
VALUES (195, '131000', '131003', '广阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (196, '131000', '131022', '固安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (197, '131000', '131023', '永清县', 3);
INSERT INTO `sys_administrative_division`
VALUES (198, '131000', '131024', '香河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (199, '131000', '131025', '大城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (200, '131000', '131026', '文安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (201, '131000', '131028', '大厂回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (202, '131000', '131081', '霸州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (203, '131000', '131082', '三河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (204, '130000', '131100', '衡水市', 2);
INSERT INTO `sys_administrative_division`
VALUES (205, '131100', '131102', '桃城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (206, '131100', '131103', '冀州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (207, '131100', '131121', '枣强县', 3);
INSERT INTO `sys_administrative_division`
VALUES (208, '131100', '131122', '武邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (209, '131100', '131123', '武强县', 3);
INSERT INTO `sys_administrative_division`
VALUES (210, '131100', '131124', '饶阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (211, '131100', '131125', '安平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (212, '131100', '131126', '故城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (213, '131100', '131127', '景县', 3);
INSERT INTO `sys_administrative_division`
VALUES (214, '131100', '131128', '阜城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (215, '131100', '131182', '深州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (216, '000000', '140000', '山西省', 1);
INSERT INTO `sys_administrative_division`
VALUES (217, '140000', '140100', '太原市', 2);
INSERT INTO `sys_administrative_division`
VALUES (218, '140100', '140105', '小店区', 3);
INSERT INTO `sys_administrative_division`
VALUES (219, '140100', '140106', '迎泽区', 3);
INSERT INTO `sys_administrative_division`
VALUES (220, '140100', '140107', '杏花岭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (221, '140100', '140108', '尖草坪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (222, '140100', '140109', '万柏林区', 3);
INSERT INTO `sys_administrative_division`
VALUES (223, '140100', '140110', '晋源区', 3);
INSERT INTO `sys_administrative_division`
VALUES (224, '140100', '140121', '清徐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (225, '140100', '140122', '阳曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (226, '140100', '140123', '娄烦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (227, '140100', '140181', '古交市', 3);
INSERT INTO `sys_administrative_division`
VALUES (228, '140000', '140200', '大同市', 2);
INSERT INTO `sys_administrative_division`
VALUES (229, '140200', '140212', '新荣区', 3);
INSERT INTO `sys_administrative_division`
VALUES (230, '140200', '140213', '平城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (231, '140200', '140214', '云冈区', 3);
INSERT INTO `sys_administrative_division`
VALUES (232, '140200', '140215', '云州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (233, '140200', '140221', '阳高县', 3);
INSERT INTO `sys_administrative_division`
VALUES (234, '140200', '140222', '天镇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (235, '140200', '140223', '广灵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (236, '140200', '140224', '灵丘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (237, '140200', '140225', '浑源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (238, '140200', '140226', '左云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (239, '140000', '140300', '阳泉市', 2);
INSERT INTO `sys_administrative_division`
VALUES (240, '140300', '140302', '城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (241, '140300', '140303', '矿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (242, '140300', '140311', '郊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (243, '140300', '140321', '平定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (244, '140300', '140322', '盂县', 3);
INSERT INTO `sys_administrative_division`
VALUES (245, '140000', '140400', '长治市', 2);
INSERT INTO `sys_administrative_division`
VALUES (246, '140400', '140403', '潞州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (247, '140400', '140404', '上党区', 3);
INSERT INTO `sys_administrative_division`
VALUES (248, '140400', '140405', '屯留区', 3);
INSERT INTO `sys_administrative_division`
VALUES (249, '140400', '140406', '潞城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (250, '140400', '140423', '襄垣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (251, '140400', '140425', '平顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (252, '140400', '140426', '黎城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (253, '140400', '140427', '壶关县', 3);
INSERT INTO `sys_administrative_division`
VALUES (254, '140400', '140428', '长子县', 3);
INSERT INTO `sys_administrative_division`
VALUES (255, '140400', '140429', '武乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (256, '140400', '140430', '沁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (257, '140400', '140431', '沁源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (258, '140000', '140500', '晋城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (259, '140500', '140502', '城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (260, '140500', '140521', '沁水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (261, '140500', '140522', '阳城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (262, '140500', '140524', '陵川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (263, '140500', '140525', '泽州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (264, '140500', '140581', '高平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (265, '140000', '140600', '朔州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (266, '140600', '140602', '朔城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (267, '140600', '140603', '平鲁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (268, '140600', '140621', '山阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (269, '140600', '140622', '应县', 3);
INSERT INTO `sys_administrative_division`
VALUES (270, '140600', '140623', '右玉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (271, '140600', '140681', '怀仁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (272, '140000', '140700', '晋中市', 2);
INSERT INTO `sys_administrative_division`
VALUES (273, '140700', '140702', '榆次区', 3);
INSERT INTO `sys_administrative_division`
VALUES (274, '140700', '140703', '太谷区', 3);
INSERT INTO `sys_administrative_division`
VALUES (275, '140700', '140721', '榆社县', 3);
INSERT INTO `sys_administrative_division`
VALUES (276, '140700', '140722', '左权县', 3);
INSERT INTO `sys_administrative_division`
VALUES (277, '140700', '140723', '和顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (278, '140700', '140724', '昔阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (279, '140700', '140725', '寿阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (280, '140700', '140727', '祁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (281, '140700', '140728', '平遥县', 3);
INSERT INTO `sys_administrative_division`
VALUES (282, '140700', '140729', '灵石县', 3);
INSERT INTO `sys_administrative_division`
VALUES (283, '140700', '140781', '介休市', 3);
INSERT INTO `sys_administrative_division`
VALUES (284, '140000', '140800', '运城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (285, '140800', '140802', '盐湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (286, '140800', '140821', '临猗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (287, '140800', '140822', '万荣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (288, '140800', '140823', '闻喜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (289, '140800', '140824', '稷山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (290, '140800', '140825', '新绛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (291, '140800', '140826', '绛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (292, '140800', '140827', '垣曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (293, '140800', '140828', '夏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (294, '140800', '140829', '平陆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (295, '140800', '140830', '芮城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (296, '140800', '140881', '永济市', 3);
INSERT INTO `sys_administrative_division`
VALUES (297, '140800', '140882', '河津市', 3);
INSERT INTO `sys_administrative_division`
VALUES (298, '140000', '140900', '忻州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (299, '140900', '140902', '忻府区', 3);
INSERT INTO `sys_administrative_division`
VALUES (300, '140900', '140921', '定襄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (301, '140900', '140922', '五台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (302, '140900', '140923', '代县', 3);
INSERT INTO `sys_administrative_division`
VALUES (303, '140900', '140924', '繁峙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (304, '140900', '140925', '宁武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (305, '140900', '140926', '静乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (306, '140900', '140927', '神池县', 3);
INSERT INTO `sys_administrative_division`
VALUES (307, '140900', '140928', '五寨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (308, '140900', '140929', '岢岚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (309, '140900', '140930', '河曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (310, '140900', '140931', '保德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (311, '140900', '140932', '偏关县', 3);
INSERT INTO `sys_administrative_division`
VALUES (312, '140900', '140981', '原平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (313, '140000', '141000', '临汾市', 2);
INSERT INTO `sys_administrative_division`
VALUES (314, '141000', '141002', '尧都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (315, '141000', '141021', '曲沃县', 3);
INSERT INTO `sys_administrative_division`
VALUES (316, '141000', '141022', '翼城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (317, '141000', '141023', '襄汾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (318, '141000', '141024', '洪洞县', 3);
INSERT INTO `sys_administrative_division`
VALUES (319, '141000', '141025', '古县', 3);
INSERT INTO `sys_administrative_division`
VALUES (320, '141000', '141026', '安泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (321, '141000', '141027', '浮山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (322, '141000', '141028', '吉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (323, '141000', '141029', '乡宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (324, '141000', '141030', '大宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (325, '141000', '141031', '隰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (326, '141000', '141032', '永和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (327, '141000', '141033', '蒲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (328, '141000', '141034', '汾西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (329, '141000', '141081', '侯马市', 3);
INSERT INTO `sys_administrative_division`
VALUES (330, '141000', '141082', '霍州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (331, '140000', '141100', '吕梁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (332, '141100', '141102', '离石区', 3);
INSERT INTO `sys_administrative_division`
VALUES (333, '141100', '141121', '文水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (334, '141100', '141122', '交城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (335, '141100', '141123', '兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (336, '141100', '141124', '临县', 3);
INSERT INTO `sys_administrative_division`
VALUES (337, '141100', '141125', '柳林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (338, '141100', '141126', '石楼县', 3);
INSERT INTO `sys_administrative_division`
VALUES (339, '141100', '141127', '岚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (340, '141100', '141128', '方山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (341, '141100', '141129', '中阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (342, '141100', '141130', '交口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (343, '141100', '141181', '孝义市', 3);
INSERT INTO `sys_administrative_division`
VALUES (344, '141100', '141182', '汾阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (345, '000000', '150000', '内蒙古自治区', 1);
INSERT INTO `sys_administrative_division`
VALUES (346, '150000', '150100', '呼和浩特市', 2);
INSERT INTO `sys_administrative_division`
VALUES (347, '150100', '150102', '新城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (348, '150100', '150103', '回民区', 3);
INSERT INTO `sys_administrative_division`
VALUES (349, '150100', '150104', '玉泉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (350, '150100', '150105', '赛罕区', 3);
INSERT INTO `sys_administrative_division`
VALUES (351, '150100', '150121', '土默特左旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (352, '150100', '150122', '托克托县', 3);
INSERT INTO `sys_administrative_division`
VALUES (353, '150100', '150123', '和林格尔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (354, '150100', '150124', '清水河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (355, '150100', '150125', '武川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (356, '150000', '150200', '包头市', 2);
INSERT INTO `sys_administrative_division`
VALUES (357, '150200', '150202', '东河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (358, '150200', '150203', '昆都仑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (359, '150200', '150204', '青山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (360, '150200', '150205', '石拐区', 3);
INSERT INTO `sys_administrative_division`
VALUES (361, '150200', '150206', '白云鄂博矿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (362, '150200', '150207', '九原区', 3);
INSERT INTO `sys_administrative_division`
VALUES (363, '150200', '150221', '土默特右旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (364, '150200', '150222', '固阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (365, '150200', '150223', '达尔罕茂明安联合旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (366, '150000', '150300', '乌海市', 2);
INSERT INTO `sys_administrative_division`
VALUES (367, '150300', '150302', '海勃湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (368, '150300', '150303', '海南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (369, '150300', '150304', '乌达区', 3);
INSERT INTO `sys_administrative_division`
VALUES (370, '150000', '150400', '赤峰市', 2);
INSERT INTO `sys_administrative_division`
VALUES (371, '150400', '150402', '红山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (372, '150400', '150403', '元宝山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (373, '150400', '150404', '松山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (374, '150400', '150421', '阿鲁科尔沁旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (375, '150400', '150422', '巴林左旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (376, '150400', '150423', '巴林右旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (377, '150400', '150424', '林西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (378, '150400', '150425', '克什克腾旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (379, '150400', '150426', '翁牛特旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (380, '150400', '150428', '喀喇沁旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (381, '150400', '150429', '宁城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (382, '150400', '150430', '敖汉旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (383, '150000', '150500', '通辽市', 2);
INSERT INTO `sys_administrative_division`
VALUES (384, '150500', '150502', '科尔沁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (385, '150500', '150521', '科尔沁左翼中旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (386, '150500', '150522', '科尔沁左翼后旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (387, '150500', '150523', '开鲁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (388, '150500', '150524', '库伦旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (389, '150500', '150525', '奈曼旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (390, '150500', '150526', '扎鲁特旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (391, '150500', '150581', '霍林郭勒市', 3);
INSERT INTO `sys_administrative_division`
VALUES (392, '150000', '150600', '鄂尔多斯市', 2);
INSERT INTO `sys_administrative_division`
VALUES (393, '150600', '150602', '东胜区', 3);
INSERT INTO `sys_administrative_division`
VALUES (394, '150600', '150603', '康巴什区', 3);
INSERT INTO `sys_administrative_division`
VALUES (395, '150600', '150621', '达拉特旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (396, '150600', '150622', '准格尔旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (397, '150600', '150623', '鄂托克前旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (398, '150600', '150624', '鄂托克旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (399, '150600', '150625', '杭锦旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (400, '150600', '150626', '乌审旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (401, '150600', '150627', '伊金霍洛旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (402, '150000', '150700', '呼伦贝尔市', 2);
INSERT INTO `sys_administrative_division`
VALUES (403, '150700', '150702', '海拉尔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (404, '150700', '150703', '扎赉诺尔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (405, '150700', '150721', '阿荣旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (406, '150700', '150722', '莫力达瓦达斡尔族自治旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (407, '150700', '150723', '鄂伦春自治旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (408, '150700', '150724', '鄂温克族自治旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (409, '150700', '150725', '陈巴尔虎旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (410, '150700', '150726', '新巴尔虎左旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (411, '150700', '150727', '新巴尔虎右旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (412, '150700', '150781', '满洲里市', 3);
INSERT INTO `sys_administrative_division`
VALUES (413, '150700', '150782', '牙克石市', 3);
INSERT INTO `sys_administrative_division`
VALUES (414, '150700', '150783', '扎兰屯市', 3);
INSERT INTO `sys_administrative_division`
VALUES (415, '150700', '150784', '额尔古纳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (416, '150700', '150785', '根河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (417, '150000', '150800', '巴彦淖尔市', 2);
INSERT INTO `sys_administrative_division`
VALUES (418, '150800', '150802', '临河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (419, '150800', '150821', '五原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (420, '150800', '150822', '磴口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (421, '150800', '150823', '乌拉特前旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (422, '150800', '150824', '乌拉特中旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (423, '150800', '150825', '乌拉特后旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (424, '150800', '150826', '杭锦后旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (425, '150000', '150900', '乌兰察布市', 2);
INSERT INTO `sys_administrative_division`
VALUES (426, '150900', '150902', '集宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (427, '150900', '150921', '卓资县', 3);
INSERT INTO `sys_administrative_division`
VALUES (428, '150900', '150922', '化德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (429, '150900', '150923', '商都县', 3);
INSERT INTO `sys_administrative_division`
VALUES (430, '150900', '150924', '兴和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (431, '150900', '150925', '凉城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (432, '150900', '150926', '察哈尔右翼前旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (433, '150900', '150927', '察哈尔右翼中旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (434, '150900', '150928', '察哈尔右翼后旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (435, '150900', '150929', '四子王旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (436, '150900', '150981', '丰镇市', 3);
INSERT INTO `sys_administrative_division`
VALUES (437, '150000', '152200', '兴安盟', 2);
INSERT INTO `sys_administrative_division`
VALUES (438, '152200', '152201', '乌兰浩特市', 3);
INSERT INTO `sys_administrative_division`
VALUES (439, '152200', '152202', '阿尔山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (440, '152200', '152221', '科尔沁右翼前旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (441, '152200', '152222', '科尔沁右翼中旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (442, '152200', '152223', '扎赉特旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (443, '152200', '152224', '突泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (444, '150000', '152500', '锡林郭勒盟', 2);
INSERT INTO `sys_administrative_division`
VALUES (445, '152500', '152501', '二连浩特市', 3);
INSERT INTO `sys_administrative_division`
VALUES (446, '152500', '152502', '锡林浩特市', 3);
INSERT INTO `sys_administrative_division`
VALUES (447, '152500', '152522', '阿巴嘎旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (448, '152500', '152523', '苏尼特左旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (449, '152500', '152524', '苏尼特右旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (450, '152500', '152525', '东乌珠穆沁旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (451, '152500', '152526', '西乌珠穆沁旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (452, '152500', '152527', '太仆寺旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (453, '152500', '152528', '镶黄旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (454, '152500', '152529', '正镶白旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (455, '152500', '152530', '正蓝旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (456, '152500', '152531', '多伦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (457, '150000', '152900', '阿拉善盟', 2);
INSERT INTO `sys_administrative_division`
VALUES (458, '152900', '152921', '阿拉善左旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (459, '152900', '152922', '阿拉善右旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (460, '152900', '152923', '额济纳旗', 3);
INSERT INTO `sys_administrative_division`
VALUES (461, '000000', '210000', '辽宁省', 1);
INSERT INTO `sys_administrative_division`
VALUES (462, '210000', '210100', '沈阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (463, '210100', '210102', '和平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (464, '210100', '210103', '沈河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (465, '210100', '210104', '大东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (466, '210100', '210105', '皇姑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (467, '210100', '210106', '铁西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (468, '210100', '210111', '苏家屯区', 3);
INSERT INTO `sys_administrative_division`
VALUES (469, '210100', '210112', '浑南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (470, '210100', '210113', '沈北新区', 3);
INSERT INTO `sys_administrative_division`
VALUES (471, '210100', '210114', '于洪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (472, '210100', '210115', '辽中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (473, '210100', '210123', '康平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (474, '210100', '210124', '法库县', 3);
INSERT INTO `sys_administrative_division`
VALUES (475, '210100', '210181', '新民市', 3);
INSERT INTO `sys_administrative_division`
VALUES (476, '210000', '210200', '大连市', 2);
INSERT INTO `sys_administrative_division`
VALUES (477, '210200', '210202', '中山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (478, '210200', '210203', '西岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (479, '210200', '210204', '沙河口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (480, '210200', '210211', '甘井子区', 3);
INSERT INTO `sys_administrative_division`
VALUES (481, '210200', '210212', '旅顺口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (482, '210200', '210213', '金州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (483, '210200', '210214', '普兰店区', 3);
INSERT INTO `sys_administrative_division`
VALUES (484, '210200', '210224', '长海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (485, '210200', '210281', '瓦房店市', 3);
INSERT INTO `sys_administrative_division`
VALUES (486, '210200', '210283', '庄河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (487, '210000', '210300', '鞍山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (488, '210300', '210302', '铁东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (489, '210300', '210303', '铁西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (490, '210300', '210304', '立山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (491, '210300', '210311', '千山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (492, '210300', '210321', '台安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (493, '210300', '210323', '岫岩满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (494, '210300', '210381', '海城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (495, '210000', '210400', '抚顺市', 2);
INSERT INTO `sys_administrative_division`
VALUES (496, '210400', '210402', '新抚区', 3);
INSERT INTO `sys_administrative_division`
VALUES (497, '210400', '210403', '东洲区', 3);
INSERT INTO `sys_administrative_division`
VALUES (498, '210400', '210404', '望花区', 3);
INSERT INTO `sys_administrative_division`
VALUES (499, '210400', '210411', '顺城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (500, '210400', '210421', '抚顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (501, '210400', '210422', '新宾满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (502, '210400', '210423', '清原满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (503, '210000', '210500', '本溪市', 2);
INSERT INTO `sys_administrative_division`
VALUES (504, '210500', '210502', '平山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (505, '210500', '210503', '溪湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (506, '210500', '210504', '明山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (507, '210500', '210505', '南芬区', 3);
INSERT INTO `sys_administrative_division`
VALUES (508, '210500', '210521', '本溪满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (509, '210500', '210522', '桓仁满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (510, '210000', '210600', '丹东市', 2);
INSERT INTO `sys_administrative_division`
VALUES (511, '210600', '210602', '元宝区', 3);
INSERT INTO `sys_administrative_division`
VALUES (512, '210600', '210603', '振兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (513, '210600', '210604', '振安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (514, '210600', '210624', '宽甸满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (515, '210600', '210681', '东港市', 3);
INSERT INTO `sys_administrative_division`
VALUES (516, '210600', '210682', '凤城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (517, '210000', '210700', '锦州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (518, '210700', '210702', '古塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (519, '210700', '210703', '凌河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (520, '210700', '210711', '太和区', 3);
INSERT INTO `sys_administrative_division`
VALUES (521, '210700', '210726', '黑山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (522, '210700', '210727', '义县', 3);
INSERT INTO `sys_administrative_division`
VALUES (523, '210700', '210781', '凌海市', 3);
INSERT INTO `sys_administrative_division`
VALUES (524, '210700', '210782', '北镇市', 3);
INSERT INTO `sys_administrative_division`
VALUES (525, '210000', '210800', '营口市', 2);
INSERT INTO `sys_administrative_division`
VALUES (526, '210800', '210802', '站前区', 3);
INSERT INTO `sys_administrative_division`
VALUES (527, '210800', '210803', '西市区', 3);
INSERT INTO `sys_administrative_division`
VALUES (528, '210800', '210804', '鲅鱼圈区', 3);
INSERT INTO `sys_administrative_division`
VALUES (529, '210800', '210811', '老边区', 3);
INSERT INTO `sys_administrative_division`
VALUES (530, '210800', '210881', '盖州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (531, '210800', '210882', '大石桥市', 3);
INSERT INTO `sys_administrative_division`
VALUES (532, '210000', '210900', '阜新市', 2);
INSERT INTO `sys_administrative_division`
VALUES (533, '210900', '210902', '海州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (534, '210900', '210903', '新邱区', 3);
INSERT INTO `sys_administrative_division`
VALUES (535, '210900', '210904', '太平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (536, '210900', '210905', '清河门区', 3);
INSERT INTO `sys_administrative_division`
VALUES (537, '210900', '210911', '细河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (538, '210900', '210921', '阜新蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (539, '210900', '210922', '彰武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (540, '210000', '211000', '辽阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (541, '211000', '211002', '白塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (542, '211000', '211003', '文圣区', 3);
INSERT INTO `sys_administrative_division`
VALUES (543, '211000', '211004', '宏伟区', 3);
INSERT INTO `sys_administrative_division`
VALUES (544, '211000', '211005', '弓长岭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (545, '211000', '211011', '太子河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (546, '211000', '211021', '辽阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (547, '211000', '211081', '灯塔市', 3);
INSERT INTO `sys_administrative_division`
VALUES (548, '210000', '211100', '盘锦市', 2);
INSERT INTO `sys_administrative_division`
VALUES (549, '211100', '211102', '双台子区', 3);
INSERT INTO `sys_administrative_division`
VALUES (550, '211100', '211103', '兴隆台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (551, '211100', '211104', '大洼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (552, '211100', '211122', '盘山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (553, '210000', '211200', '铁岭市', 2);
INSERT INTO `sys_administrative_division`
VALUES (554, '211200', '211202', '银州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (555, '211200', '211204', '清河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (556, '211200', '211221', '铁岭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (557, '211200', '211223', '西丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (558, '211200', '211224', '昌图县', 3);
INSERT INTO `sys_administrative_division`
VALUES (559, '211200', '211281', '调兵山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (560, '211200', '211282', '开原市', 3);
INSERT INTO `sys_administrative_division`
VALUES (561, '210000', '211300', '朝阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (562, '211300', '211302', '双塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (563, '211300', '211303', '龙城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (564, '211300', '211321', '朝阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (565, '211300', '211322', '建平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (566, '211300', '211324', '喀喇沁左翼蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (567, '211300', '211381', '北票市', 3);
INSERT INTO `sys_administrative_division`
VALUES (568, '211300', '211382', '凌源市', 3);
INSERT INTO `sys_administrative_division`
VALUES (569, '210000', '211400', '葫芦岛市', 2);
INSERT INTO `sys_administrative_division`
VALUES (570, '211400', '211402', '连山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (571, '211400', '211403', '龙港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (572, '211400', '211404', '南票区', 3);
INSERT INTO `sys_administrative_division`
VALUES (573, '211400', '211421', '绥中县', 3);
INSERT INTO `sys_administrative_division`
VALUES (574, '211400', '211422', '建昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (575, '211400', '211481', '兴城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (576, '000000', '220000', '吉林省', 1);
INSERT INTO `sys_administrative_division`
VALUES (577, '220000', '220100', '长春市', 2);
INSERT INTO `sys_administrative_division`
VALUES (578, '220100', '220102', '南关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (579, '220100', '220103', '宽城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (580, '220100', '220104', '朝阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (581, '220100', '220105', '二道区', 3);
INSERT INTO `sys_administrative_division`
VALUES (582, '220100', '220106', '绿园区', 3);
INSERT INTO `sys_administrative_division`
VALUES (583, '220100', '220112', '双阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (584, '220100', '220113', '九台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (585, '220100', '220122', '农安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (586, '220100', '220182', '榆树市', 3);
INSERT INTO `sys_administrative_division`
VALUES (587, '220100', '220183', '德惠市', 3);
INSERT INTO `sys_administrative_division`
VALUES (588, '220100', '220184', '公主岭市', 3);
INSERT INTO `sys_administrative_division`
VALUES (589, '220000', '220200', '吉林市', 2);
INSERT INTO `sys_administrative_division`
VALUES (590, '220200', '220202', '昌邑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (591, '220200', '220203', '龙潭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (592, '220200', '220204', '船营区', 3);
INSERT INTO `sys_administrative_division`
VALUES (593, '220200', '220211', '丰满区', 3);
INSERT INTO `sys_administrative_division`
VALUES (594, '220200', '220221', '永吉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (595, '220200', '220281', '蛟河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (596, '220200', '220282', '桦甸市', 3);
INSERT INTO `sys_administrative_division`
VALUES (597, '220200', '220283', '舒兰市', 3);
INSERT INTO `sys_administrative_division`
VALUES (598, '220200', '220284', '磐石市', 3);
INSERT INTO `sys_administrative_division`
VALUES (599, '220000', '220300', '四平市', 2);
INSERT INTO `sys_administrative_division`
VALUES (600, '220300', '220302', '铁西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (601, '220300', '220303', '铁东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (602, '220300', '220322', '梨树县', 3);
INSERT INTO `sys_administrative_division`
VALUES (603, '220300', '220323', '伊通满族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (604, '220300', '220382', '双辽市', 3);
INSERT INTO `sys_administrative_division`
VALUES (605, '220000', '220400', '辽源市', 2);
INSERT INTO `sys_administrative_division`
VALUES (606, '220400', '220402', '龙山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (607, '220400', '220403', '西安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (608, '220400', '220421', '东丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (609, '220400', '220422', '东辽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (610, '220000', '220500', '通化市', 2);
INSERT INTO `sys_administrative_division`
VALUES (611, '220500', '220502', '东昌区', 3);
INSERT INTO `sys_administrative_division`
VALUES (612, '220500', '220503', '二道江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (613, '220500', '220521', '通化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (614, '220500', '220523', '辉南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (615, '220500', '220524', '柳河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (616, '220500', '220581', '梅河口市', 3);
INSERT INTO `sys_administrative_division`
VALUES (617, '220500', '220582', '集安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (618, '220000', '220600', '白山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (619, '220600', '220602', '浑江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (620, '220600', '220605', '江源区', 3);
INSERT INTO `sys_administrative_division`
VALUES (621, '220600', '220621', '抚松县', 3);
INSERT INTO `sys_administrative_division`
VALUES (622, '220600', '220622', '靖宇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (623, '220600', '220623', '长白朝鲜族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (624, '220600', '220681', '临江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (625, '220000', '220700', '松原市', 2);
INSERT INTO `sys_administrative_division`
VALUES (626, '220700', '220702', '宁江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (627, '220700', '220721', '前郭尔罗斯蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (628, '220700', '220722', '长岭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (629, '220700', '220723', '乾安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (630, '220700', '220781', '扶余市', 3);
INSERT INTO `sys_administrative_division`
VALUES (631, '220000', '220800', '白城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (632, '220800', '220802', '洮北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (633, '220800', '220821', '镇赉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (634, '220800', '220822', '通榆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (635, '220800', '220881', '洮南市', 3);
INSERT INTO `sys_administrative_division`
VALUES (636, '220800', '220882', '大安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (637, '220000', '222400', '延边朝鲜族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (638, '222400', '222401', '延吉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (639, '222400', '222402', '图们市', 3);
INSERT INTO `sys_administrative_division`
VALUES (640, '222400', '222403', '敦化市', 3);
INSERT INTO `sys_administrative_division`
VALUES (641, '222400', '222404', '珲春市', 3);
INSERT INTO `sys_administrative_division`
VALUES (642, '222400', '222405', '龙井市', 3);
INSERT INTO `sys_administrative_division`
VALUES (643, '222400', '222406', '和龙市', 3);
INSERT INTO `sys_administrative_division`
VALUES (644, '222400', '222424', '汪清县', 3);
INSERT INTO `sys_administrative_division`
VALUES (645, '222400', '222426', '安图县', 3);
INSERT INTO `sys_administrative_division`
VALUES (646, '000000', '230000', '黑龙江省', 1);
INSERT INTO `sys_administrative_division`
VALUES (647, '230000', '230100', '哈尔滨市', 2);
INSERT INTO `sys_administrative_division`
VALUES (648, '230100', '230102', '道里区', 3);
INSERT INTO `sys_administrative_division`
VALUES (649, '230100', '230103', '南岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (650, '230100', '230104', '道外区', 3);
INSERT INTO `sys_administrative_division`
VALUES (651, '230100', '230108', '平房区', 3);
INSERT INTO `sys_administrative_division`
VALUES (652, '230100', '230109', '松北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (653, '230100', '230110', '香坊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (654, '230100', '230111', '呼兰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (655, '230100', '230112', '阿城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (656, '230100', '230113', '双城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (657, '230100', '230123', '依兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (658, '230100', '230124', '方正县', 3);
INSERT INTO `sys_administrative_division`
VALUES (659, '230100', '230125', '宾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (660, '230100', '230126', '巴彦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (661, '230100', '230127', '木兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (662, '230100', '230128', '通河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (663, '230100', '230129', '延寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (664, '230100', '230183', '尚志市', 3);
INSERT INTO `sys_administrative_division`
VALUES (665, '230100', '230184', '五常市', 3);
INSERT INTO `sys_administrative_division`
VALUES (666, '230000', '230200', '齐齐哈尔市', 2);
INSERT INTO `sys_administrative_division`
VALUES (667, '230200', '230202', '龙沙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (668, '230200', '230203', '建华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (669, '230200', '230204', '铁锋区', 3);
INSERT INTO `sys_administrative_division`
VALUES (670, '230200', '230205', '昂昂溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (671, '230200', '230206', '富拉尔基区', 3);
INSERT INTO `sys_administrative_division`
VALUES (672, '230200', '230207', '碾子山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (673, '230200', '230208', '梅里斯达斡尔族区', 3);
INSERT INTO `sys_administrative_division`
VALUES (674, '230200', '230221', '龙江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (675, '230200', '230223', '依安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (676, '230200', '230224', '泰来县', 3);
INSERT INTO `sys_administrative_division`
VALUES (677, '230200', '230225', '甘南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (678, '230200', '230227', '富裕县', 3);
INSERT INTO `sys_administrative_division`
VALUES (679, '230200', '230229', '克山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (680, '230200', '230230', '克东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (681, '230200', '230231', '拜泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (682, '230200', '230281', '讷河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (683, '230000', '230300', '鸡西市', 2);
INSERT INTO `sys_administrative_division`
VALUES (684, '230300', '230302', '鸡冠区', 3);
INSERT INTO `sys_administrative_division`
VALUES (685, '230300', '230303', '恒山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (686, '230300', '230304', '滴道区', 3);
INSERT INTO `sys_administrative_division`
VALUES (687, '230300', '230305', '梨树区', 3);
INSERT INTO `sys_administrative_division`
VALUES (688, '230300', '230306', '城子河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (689, '230300', '230307', '麻山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (690, '230300', '230321', '鸡东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (691, '230300', '230381', '虎林市', 3);
INSERT INTO `sys_administrative_division`
VALUES (692, '230300', '230382', '密山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (693, '230000', '230400', '鹤岗市', 2);
INSERT INTO `sys_administrative_division`
VALUES (694, '230400', '230402', '向阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (695, '230400', '230403', '工农区', 3);
INSERT INTO `sys_administrative_division`
VALUES (696, '230400', '230404', '南山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (697, '230400', '230405', '兴安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (698, '230400', '230406', '东山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (699, '230400', '230407', '兴山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (700, '230400', '230421', '萝北县', 3);
INSERT INTO `sys_administrative_division`
VALUES (701, '230400', '230422', '绥滨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (702, '230000', '230500', '双鸭山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (703, '230500', '230502', '尖山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (704, '230500', '230503', '岭东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (705, '230500', '230505', '四方台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (706, '230500', '230506', '宝山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (707, '230500', '230521', '集贤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (708, '230500', '230522', '友谊县', 3);
INSERT INTO `sys_administrative_division`
VALUES (709, '230500', '230523', '宝清县', 3);
INSERT INTO `sys_administrative_division`
VALUES (710, '230500', '230524', '饶河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (711, '230000', '230600', '大庆市', 2);
INSERT INTO `sys_administrative_division`
VALUES (712, '230600', '230602', '萨尔图区', 3);
INSERT INTO `sys_administrative_division`
VALUES (713, '230600', '230603', '龙凤区', 3);
INSERT INTO `sys_administrative_division`
VALUES (714, '230600', '230604', '让胡路区', 3);
INSERT INTO `sys_administrative_division`
VALUES (715, '230600', '230605', '红岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (716, '230600', '230606', '大同区', 3);
INSERT INTO `sys_administrative_division`
VALUES (717, '230600', '230621', '肇州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (718, '230600', '230622', '肇源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (719, '230600', '230623', '林甸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (720, '230600', '230624', '杜尔伯特蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (721, '230000', '230700', '伊春市', 2);
INSERT INTO `sys_administrative_division`
VALUES (722, '230700', '230717', '伊美区', 3);
INSERT INTO `sys_administrative_division`
VALUES (723, '230700', '230718', '乌翠区', 3);
INSERT INTO `sys_administrative_division`
VALUES (724, '230700', '230719', '友好区', 3);
INSERT INTO `sys_administrative_division`
VALUES (725, '230700', '230722', '嘉荫县', 3);
INSERT INTO `sys_administrative_division`
VALUES (726, '230700', '230723', '汤旺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (727, '230700', '230724', '丰林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (728, '230700', '230725', '大箐山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (729, '230700', '230726', '南岔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (730, '230700', '230751', '金林区', 3);
INSERT INTO `sys_administrative_division`
VALUES (731, '230700', '230781', '铁力市', 3);
INSERT INTO `sys_administrative_division`
VALUES (732, '230000', '230800', '佳木斯市', 2);
INSERT INTO `sys_administrative_division`
VALUES (733, '230800', '230803', '向阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (734, '230800', '230804', '前进区', 3);
INSERT INTO `sys_administrative_division`
VALUES (735, '230800', '230805', '东风区', 3);
INSERT INTO `sys_administrative_division`
VALUES (736, '230800', '230811', '郊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (737, '230800', '230822', '桦南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (738, '230800', '230826', '桦川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (739, '230800', '230828', '汤原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (740, '230800', '230881', '同江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (741, '230800', '230882', '富锦市', 3);
INSERT INTO `sys_administrative_division`
VALUES (742, '230800', '230883', '抚远市', 3);
INSERT INTO `sys_administrative_division`
VALUES (743, '230000', '230900', '七台河市', 2);
INSERT INTO `sys_administrative_division`
VALUES (744, '230900', '230902', '新兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (745, '230900', '230903', '桃山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (746, '230900', '230904', '茄子河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (747, '230900', '230921', '勃利县', 3);
INSERT INTO `sys_administrative_division`
VALUES (748, '230000', '231000', '牡丹江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (749, '231000', '231002', '东安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (750, '231000', '231003', '阳明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (751, '231000', '231004', '爱民区', 3);
INSERT INTO `sys_administrative_division`
VALUES (752, '231000', '231005', '西安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (753, '231000', '231025', '林口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (754, '231000', '231081', '绥芬河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (755, '231000', '231083', '海林市', 3);
INSERT INTO `sys_administrative_division`
VALUES (756, '231000', '231084', '宁安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (757, '231000', '231085', '穆棱市', 3);
INSERT INTO `sys_administrative_division`
VALUES (758, '231000', '231086', '东宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (759, '230000', '231100', '黑河市', 2);
INSERT INTO `sys_administrative_division`
VALUES (760, '231100', '231102', '爱辉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (761, '231100', '231123', '逊克县', 3);
INSERT INTO `sys_administrative_division`
VALUES (762, '231100', '231124', '孙吴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (763, '231100', '231181', '北安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (764, '231100', '231182', '五大连池市', 3);
INSERT INTO `sys_administrative_division`
VALUES (765, '231100', '231183', '嫩江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (766, '230000', '231200', '绥化市', 2);
INSERT INTO `sys_administrative_division`
VALUES (767, '231200', '231202', '北林区', 3);
INSERT INTO `sys_administrative_division`
VALUES (768, '231200', '231221', '望奎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (769, '231200', '231222', '兰西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (770, '231200', '231223', '青冈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (771, '231200', '231224', '庆安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (772, '231200', '231225', '明水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (773, '231200', '231226', '绥棱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (774, '231200', '231281', '安达市', 3);
INSERT INTO `sys_administrative_division`
VALUES (775, '231200', '231282', '肇东市', 3);
INSERT INTO `sys_administrative_division`
VALUES (776, '231200', '231283', '海伦市', 3);
INSERT INTO `sys_administrative_division`
VALUES (777, '230000', '232700', '大兴安岭地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (778, '232700', '232701', '漠河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (779, '232700', '232721', '呼玛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (780, '232700', '232722', '塔河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (781, '000000', '310000', '上海市', 1);
INSERT INTO `sys_administrative_division`
VALUES (782, '310000', '310100', '市辖区', 2);
INSERT INTO `sys_administrative_division`
VALUES (783, '310100', '310101', '黄浦区', 3);
INSERT INTO `sys_administrative_division`
VALUES (784, '310100', '310104', '徐汇区', 3);
INSERT INTO `sys_administrative_division`
VALUES (785, '310100', '310105', '长宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (786, '310100', '310106', '静安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (787, '310100', '310107', '普陀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (788, '310100', '310109', '虹口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (789, '310100', '310110', '杨浦区', 3);
INSERT INTO `sys_administrative_division`
VALUES (790, '310100', '310112', '闵行区', 3);
INSERT INTO `sys_administrative_division`
VALUES (791, '310100', '310113', '宝山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (792, '310100', '310114', '嘉定区', 3);
INSERT INTO `sys_administrative_division`
VALUES (793, '310100', '310115', '浦东新区', 3);
INSERT INTO `sys_administrative_division`
VALUES (794, '310100', '310116', '金山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (795, '310100', '310117', '松江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (796, '310100', '310118', '青浦区', 3);
INSERT INTO `sys_administrative_division`
VALUES (797, '310100', '310120', '奉贤区', 3);
INSERT INTO `sys_administrative_division`
VALUES (798, '310100', '310151', '崇明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (799, '000000', '320000', '江苏省', 1);
INSERT INTO `sys_administrative_division`
VALUES (800, '320000', '320100', '南京市', 2);
INSERT INTO `sys_administrative_division`
VALUES (801, '320100', '320102', '玄武区', 3);
INSERT INTO `sys_administrative_division`
VALUES (802, '320100', '320104', '秦淮区', 3);
INSERT INTO `sys_administrative_division`
VALUES (803, '320100', '320105', '建邺区', 3);
INSERT INTO `sys_administrative_division`
VALUES (804, '320100', '320106', '鼓楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (805, '320100', '320111', '浦口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (806, '320100', '320113', '栖霞区', 3);
INSERT INTO `sys_administrative_division`
VALUES (807, '320100', '320114', '雨花台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (808, '320100', '320115', '江宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (809, '320100', '320116', '六合区', 3);
INSERT INTO `sys_administrative_division`
VALUES (810, '320100', '320117', '溧水区', 3);
INSERT INTO `sys_administrative_division`
VALUES (811, '320100', '320118', '高淳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (812, '320000', '320200', '无锡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (813, '320200', '320205', '锡山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (814, '320200', '320206', '惠山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (815, '320200', '320211', '滨湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (816, '320200', '320213', '梁溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (817, '320200', '320214', '新吴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (818, '320200', '320281', '江阴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (819, '320200', '320282', '宜兴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (820, '320000', '320300', '徐州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (821, '320300', '320302', '鼓楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (822, '320300', '320303', '云龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (823, '320300', '320305', '贾汪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (824, '320300', '320311', '泉山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (825, '320300', '320312', '铜山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (826, '320300', '320321', '丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (827, '320300', '320322', '沛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (828, '320300', '320324', '睢宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (829, '320300', '320381', '新沂市', 3);
INSERT INTO `sys_administrative_division`
VALUES (830, '320300', '320382', '邳州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (831, '320000', '320400', '常州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (832, '320400', '320402', '天宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (833, '320400', '320404', '钟楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (834, '320400', '320411', '新北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (835, '320400', '320412', '武进区', 3);
INSERT INTO `sys_administrative_division`
VALUES (836, '320400', '320413', '金坛区', 3);
INSERT INTO `sys_administrative_division`
VALUES (837, '320400', '320481', '溧阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (838, '320000', '320500', '苏州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (839, '320500', '320505', '虎丘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (840, '320500', '320506', '吴中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (841, '320500', '320507', '相城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (842, '320500', '320508', '姑苏区', 3);
INSERT INTO `sys_administrative_division`
VALUES (843, '320500', '320509', '吴江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (844, '320500', '320581', '常熟市', 3);
INSERT INTO `sys_administrative_division`
VALUES (845, '320500', '320582', '张家港市', 3);
INSERT INTO `sys_administrative_division`
VALUES (846, '320500', '320583', '昆山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (847, '320500', '320585', '太仓市', 3);
INSERT INTO `sys_administrative_division`
VALUES (848, '320000', '320600', '南通市', 2);
INSERT INTO `sys_administrative_division`
VALUES (849, '320600', '320602', '崇川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (850, '320600', '320611', '港闸区', 3);
INSERT INTO `sys_administrative_division`
VALUES (851, '320600', '320612', '通州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (852, '320600', '320623', '如东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (853, '320600', '320681', '启东市', 3);
INSERT INTO `sys_administrative_division`
VALUES (854, '320600', '320682', '如皋市', 3);
INSERT INTO `sys_administrative_division`
VALUES (855, '320600', '320684', '海门市', 3);
INSERT INTO `sys_administrative_division`
VALUES (856, '320600', '320685', '海安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (857, '320000', '320700', '连云港市', 2);
INSERT INTO `sys_administrative_division`
VALUES (858, '320700', '320703', '连云区', 3);
INSERT INTO `sys_administrative_division`
VALUES (859, '320700', '320706', '海州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (860, '320700', '320707', '赣榆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (861, '320700', '320722', '东海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (862, '320700', '320723', '灌云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (863, '320700', '320724', '灌南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (864, '320000', '320800', '淮安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (865, '320800', '320803', '淮安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (866, '320800', '320804', '淮阴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (867, '320800', '320812', '清江浦区', 3);
INSERT INTO `sys_administrative_division`
VALUES (868, '320800', '320813', '洪泽区', 3);
INSERT INTO `sys_administrative_division`
VALUES (869, '320800', '320826', '涟水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (870, '320800', '320830', '盱眙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (871, '320800', '320831', '金湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (872, '320000', '320900', '盐城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (873, '320900', '320902', '亭湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (874, '320900', '320903', '盐都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (875, '320900', '320904', '大丰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (876, '320900', '320921', '响水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (877, '320900', '320922', '滨海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (878, '320900', '320923', '阜宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (879, '320900', '320924', '射阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (880, '320900', '320925', '建湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (881, '320900', '320981', '东台市', 3);
INSERT INTO `sys_administrative_division`
VALUES (882, '320000', '321000', '扬州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (883, '321000', '321002', '广陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (884, '321000', '321003', '邗江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (885, '321000', '321012', '江都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (886, '321000', '321023', '宝应县', 3);
INSERT INTO `sys_administrative_division`
VALUES (887, '321000', '321081', '仪征市', 3);
INSERT INTO `sys_administrative_division`
VALUES (888, '321000', '321084', '高邮市', 3);
INSERT INTO `sys_administrative_division`
VALUES (889, '320000', '321100', '镇江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (890, '321100', '321102', '京口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (891, '321100', '321111', '润州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (892, '321100', '321112', '丹徒区', 3);
INSERT INTO `sys_administrative_division`
VALUES (893, '321100', '321181', '丹阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (894, '321100', '321182', '扬中市', 3);
INSERT INTO `sys_administrative_division`
VALUES (895, '321100', '321183', '句容市', 3);
INSERT INTO `sys_administrative_division`
VALUES (896, '320000', '321200', '泰州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (897, '321200', '321202', '海陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (898, '321200', '321203', '高港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (899, '321200', '321204', '姜堰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (900, '321200', '321281', '兴化市', 3);
INSERT INTO `sys_administrative_division`
VALUES (901, '321200', '321282', '靖江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (902, '321200', '321283', '泰兴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (903, '320000', '321300', '宿迁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (904, '321300', '321302', '宿城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (905, '321300', '321311', '宿豫区', 3);
INSERT INTO `sys_administrative_division`
VALUES (906, '321300', '321322', '沭阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (907, '321300', '321323', '泗阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (908, '321300', '321324', '泗洪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (909, '000000', '330000', '浙江省', 1);
INSERT INTO `sys_administrative_division`
VALUES (910, '330000', '330100', '杭州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (911, '330100', '330102', '上城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (912, '330100', '330103', '下城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (913, '330100', '330104', '江干区', 3);
INSERT INTO `sys_administrative_division`
VALUES (914, '330100', '330105', '拱墅区', 3);
INSERT INTO `sys_administrative_division`
VALUES (915, '330100', '330106', '西湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (916, '330100', '330108', '滨江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (917, '330100', '330109', '萧山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (918, '330100', '330110', '余杭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (919, '330100', '330111', '富阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (920, '330100', '330112', '临安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (921, '330100', '330122', '桐庐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (922, '330100', '330127', '淳安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (923, '330100', '330182', '建德市', 3);
INSERT INTO `sys_administrative_division`
VALUES (924, '330000', '330200', '宁波市', 2);
INSERT INTO `sys_administrative_division`
VALUES (925, '330200', '330203', '海曙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (926, '330200', '330205', '江北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (927, '330200', '330206', '北仑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (928, '330200', '330211', '镇海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (929, '330200', '330212', '鄞州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (930, '330200', '330213', '奉化区', 3);
INSERT INTO `sys_administrative_division`
VALUES (931, '330200', '330225', '象山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (932, '330200', '330226', '宁海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (933, '330200', '330281', '余姚市', 3);
INSERT INTO `sys_administrative_division`
VALUES (934, '330200', '330282', '慈溪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (935, '330000', '330300', '温州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (936, '330300', '330302', '鹿城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (937, '330300', '330303', '龙湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (938, '330300', '330304', '瓯海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (939, '330300', '330305', '洞头区', 3);
INSERT INTO `sys_administrative_division`
VALUES (940, '330300', '330324', '永嘉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (941, '330300', '330326', '平阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (942, '330300', '330327', '苍南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (943, '330300', '330328', '文成县', 3);
INSERT INTO `sys_administrative_division`
VALUES (944, '330300', '330329', '泰顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (945, '330300', '330381', '瑞安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (946, '330300', '330382', '乐清市', 3);
INSERT INTO `sys_administrative_division`
VALUES (947, '330300', '330383', '龙港市', 3);
INSERT INTO `sys_administrative_division`
VALUES (948, '330000', '330400', '嘉兴市', 2);
INSERT INTO `sys_administrative_division`
VALUES (949, '330400', '330402', '南湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (950, '330400', '330411', '秀洲区', 3);
INSERT INTO `sys_administrative_division`
VALUES (951, '330400', '330421', '嘉善县', 3);
INSERT INTO `sys_administrative_division`
VALUES (952, '330400', '330424', '海盐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (953, '330400', '330481', '海宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (954, '330400', '330482', '平湖市', 3);
INSERT INTO `sys_administrative_division`
VALUES (955, '330400', '330483', '桐乡市', 3);
INSERT INTO `sys_administrative_division`
VALUES (956, '330000', '330500', '湖州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (957, '330500', '330502', '吴兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (958, '330500', '330503', '南浔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (959, '330500', '330521', '德清县', 3);
INSERT INTO `sys_administrative_division`
VALUES (960, '330500', '330522', '长兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (961, '330500', '330523', '安吉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (962, '330000', '330600', '绍兴市', 2);
INSERT INTO `sys_administrative_division`
VALUES (963, '330600', '330602', '越城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (964, '330600', '330603', '柯桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (965, '330600', '330604', '上虞区', 3);
INSERT INTO `sys_administrative_division`
VALUES (966, '330600', '330624', '新昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (967, '330600', '330681', '诸暨市', 3);
INSERT INTO `sys_administrative_division`
VALUES (968, '330600', '330683', '嵊州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (969, '330000', '330700', '金华市', 2);
INSERT INTO `sys_administrative_division`
VALUES (970, '330700', '330702', '婺城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (971, '330700', '330703', '金东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (972, '330700', '330723', '武义县', 3);
INSERT INTO `sys_administrative_division`
VALUES (973, '330700', '330726', '浦江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (974, '330700', '330727', '磐安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (975, '330700', '330781', '兰溪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (976, '330700', '330782', '义乌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (977, '330700', '330783', '东阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (978, '330700', '330784', '永康市', 3);
INSERT INTO `sys_administrative_division`
VALUES (979, '330000', '330800', '衢州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (980, '330800', '330802', '柯城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (981, '330800', '330803', '衢江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (982, '330800', '330822', '常山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (983, '330800', '330824', '开化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (984, '330800', '330825', '龙游县', 3);
INSERT INTO `sys_administrative_division`
VALUES (985, '330800', '330881', '江山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (986, '330000', '330900', '舟山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (987, '330900', '330902', '定海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (988, '330900', '330903', '普陀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (989, '330900', '330921', '岱山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (990, '330900', '330922', '嵊泗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (991, '330000', '331000', '台州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (992, '331000', '331002', '椒江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (993, '331000', '331003', '黄岩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (994, '331000', '331004', '路桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (995, '331000', '331022', '三门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (996, '331000', '331023', '天台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (997, '331000', '331024', '仙居县', 3);
INSERT INTO `sys_administrative_division`
VALUES (998, '331000', '331081', '温岭市', 3);
INSERT INTO `sys_administrative_division`
VALUES (999, '331000', '331082', '临海市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1000, '331000', '331083', '玉环市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1001, '330000', '331100', '丽水市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1002, '331100', '331102', '莲都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1003, '331100', '331121', '青田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1004, '331100', '331122', '缙云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1005, '331100', '331123', '遂昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1006, '331100', '331124', '松阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1007, '331100', '331125', '云和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1008, '331100', '331126', '庆元县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1009, '331100', '331127', '景宁畲族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1010, '331100', '331181', '龙泉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1011, '000000', '340000', '安徽省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1012, '340000', '340100', '合肥市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1013, '340100', '340102', '瑶海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1014, '340100', '340103', '庐阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1015, '340100', '340104', '蜀山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1016, '340100', '340111', '包河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1017, '340100', '340121', '长丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1018, '340100', '340122', '肥东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1019, '340100', '340123', '肥西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1020, '340100', '340124', '庐江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1021, '340100', '340181', '巢湖市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1022, '340000', '340200', '芜湖市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1023, '340200', '340202', '镜湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1024, '340200', '340207', '鸠江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1025, '340200', '340209', '弋江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1026, '340200', '340210', '湾沚区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1027, '340200', '340211', '繁昌区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1028, '340200', '340223', '南陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1029, '340200', '340281', '无为市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1030, '340000', '340300', '蚌埠市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1031, '340300', '340302', '龙子湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1032, '340300', '340303', '蚌山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1033, '340300', '340304', '禹会区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1034, '340300', '340311', '淮上区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1035, '340300', '340321', '怀远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1036, '340300', '340322', '五河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1037, '340300', '340323', '固镇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1038, '340000', '340400', '淮南市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1039, '340400', '340402', '大通区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1040, '340400', '340403', '田家庵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1041, '340400', '340404', '谢家集区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1042, '340400', '340405', '八公山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1043, '340400', '340406', '潘集区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1044, '340400', '340421', '凤台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1045, '340400', '340422', '寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1046, '340000', '340500', '马鞍山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1047, '340500', '340503', '花山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1048, '340500', '340504', '雨山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1049, '340500', '340506', '博望区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1050, '340500', '340521', '当涂县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1051, '340500', '340522', '含山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1052, '340500', '340523', '和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1053, '340000', '340600', '淮北市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1054, '340600', '340602', '杜集区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1055, '340600', '340603', '相山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1056, '340600', '340604', '烈山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1057, '340600', '340621', '濉溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1058, '340000', '340700', '铜陵市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1059, '340700', '340705', '铜官区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1060, '340700', '340706', '义安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1061, '340700', '340711', '郊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1062, '340700', '340722', '枞阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1063, '340000', '340800', '安庆市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1064, '340800', '340802', '迎江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1065, '340800', '340803', '大观区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1066, '340800', '340811', '宜秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1067, '340800', '340822', '怀宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1068, '340800', '340825', '太湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1069, '340800', '340826', '宿松县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1070, '340800', '340827', '望江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1071, '340800', '340828', '岳西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1072, '340800', '340881', '桐城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1073, '340800', '340882', '潜山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1074, '340000', '341000', '黄山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1075, '341000', '341002', '屯溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1076, '341000', '341003', '黄山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1077, '341000', '341004', '徽州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1078, '341000', '341021', '歙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1079, '341000', '341022', '休宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1080, '341000', '341023', '黟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1081, '341000', '341024', '祁门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1082, '340000', '341100', '滁州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1083, '341100', '341102', '琅琊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1084, '341100', '341103', '南谯区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1085, '341100', '341122', '来安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1086, '341100', '341124', '全椒县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1087, '341100', '341125', '定远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1088, '341100', '341126', '凤阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1089, '341100', '341181', '天长市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1090, '341100', '341182', '明光市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1091, '340000', '341200', '阜阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1092, '341200', '341202', '颍州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1093, '341200', '341203', '颍东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1094, '341200', '341204', '颍泉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1095, '341200', '341221', '临泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1096, '341200', '341222', '太和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1097, '341200', '341225', '阜南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1098, '341200', '341226', '颍上县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1099, '341200', '341282', '界首市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1100, '340000', '341300', '宿州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1101, '341300', '341302', '埇桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1102, '341300', '341321', '砀山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1103, '341300', '341322', '萧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1104, '341300', '341323', '灵璧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1105, '341300', '341324', '泗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1106, '340000', '341500', '六安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1107, '341500', '341502', '金安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1108, '341500', '341503', '裕安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1109, '341500', '341504', '叶集区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1110, '341500', '341522', '霍邱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1111, '341500', '341523', '舒城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1112, '341500', '341524', '金寨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1113, '341500', '341525', '霍山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1114, '340000', '341600', '亳州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1115, '341600', '341602', '谯城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1116, '341600', '341621', '涡阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1117, '341600', '341622', '蒙城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1118, '341600', '341623', '利辛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1119, '340000', '341700', '池州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1120, '341700', '341702', '贵池区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1121, '341700', '341721', '东至县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1122, '341700', '341722', '石台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1123, '341700', '341723', '青阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1124, '340000', '341800', '宣城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1125, '341800', '341802', '宣州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1126, '341800', '341821', '郎溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1127, '341800', '341823', '泾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1128, '341800', '341824', '绩溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1129, '341800', '341825', '旌德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1130, '341800', '341881', '宁国市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1131, '341800', '341882', '广德市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1132, '000000', '350000', '福建省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1133, '350000', '350100', '福州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1134, '350100', '350102', '鼓楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1135, '350100', '350103', '台江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1136, '350100', '350104', '仓山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1137, '350100', '350105', '马尾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1138, '350100', '350111', '晋安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1139, '350100', '350112', '长乐区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1140, '350100', '350121', '闽侯县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1141, '350100', '350122', '连江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1142, '350100', '350123', '罗源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1143, '350100', '350124', '闽清县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1144, '350100', '350125', '永泰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1145, '350100', '350128', '平潭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1146, '350100', '350181', '福清市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1147, '350000', '350200', '厦门市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1148, '350200', '350203', '思明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1149, '350200', '350205', '海沧区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1150, '350200', '350206', '湖里区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1151, '350200', '350211', '集美区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1152, '350200', '350212', '同安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1153, '350200', '350213', '翔安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1154, '350000', '350300', '莆田市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1155, '350300', '350302', '城厢区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1156, '350300', '350303', '涵江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1157, '350300', '350304', '荔城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1158, '350300', '350305', '秀屿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1159, '350300', '350322', '仙游县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1160, '350000', '350400', '三明市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1161, '350400', '350402', '梅列区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1162, '350400', '350403', '三元区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1163, '350400', '350421', '明溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1164, '350400', '350423', '清流县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1165, '350400', '350424', '宁化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1166, '350400', '350425', '大田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1167, '350400', '350426', '尤溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1168, '350400', '350427', '沙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1169, '350400', '350428', '将乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1170, '350400', '350429', '泰宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1171, '350400', '350430', '建宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1172, '350400', '350481', '永安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1173, '350000', '350500', '泉州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1174, '350500', '350502', '鲤城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1175, '350500', '350503', '丰泽区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1176, '350500', '350504', '洛江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1177, '350500', '350505', '泉港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1178, '350500', '350521', '惠安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1179, '350500', '350524', '安溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1180, '350500', '350525', '永春县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1181, '350500', '350526', '德化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1182, '350500', '350527', '金门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1183, '350500', '350581', '石狮市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1184, '350500', '350582', '晋江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1185, '350500', '350583', '南安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1186, '350000', '350600', '漳州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1187, '350600', '350602', '芗城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1188, '350600', '350603', '龙文区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1189, '350600', '350622', '云霄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1190, '350600', '350623', '漳浦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1191, '350600', '350624', '诏安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1192, '350600', '350625', '长泰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1193, '350600', '350626', '东山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1194, '350600', '350627', '南靖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1195, '350600', '350628', '平和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1196, '350600', '350629', '华安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1197, '350600', '350681', '龙海市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1198, '350000', '350700', '南平市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1199, '350700', '350702', '延平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1200, '350700', '350703', '建阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1201, '350700', '350721', '顺昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1202, '350700', '350722', '浦城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1203, '350700', '350723', '光泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1204, '350700', '350724', '松溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1205, '350700', '350725', '政和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1206, '350700', '350781', '邵武市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1207, '350700', '350782', '武夷山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1208, '350700', '350783', '建瓯市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1209, '350000', '350800', '龙岩市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1210, '350800', '350802', '新罗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1211, '350800', '350803', '永定区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1212, '350800', '350821', '长汀县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1213, '350800', '350823', '上杭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1214, '350800', '350824', '武平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1215, '350800', '350825', '连城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1216, '350800', '350881', '漳平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1217, '350000', '350900', '宁德市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1218, '350900', '350902', '蕉城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1219, '350900', '350921', '霞浦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1220, '350900', '350922', '古田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1221, '350900', '350923', '屏南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1222, '350900', '350924', '寿宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1223, '350900', '350925', '周宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1224, '350900', '350926', '柘荣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1225, '350900', '350981', '福安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1226, '350900', '350982', '福鼎市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1227, '000000', '360000', '江西省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1228, '360000', '360100', '南昌市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1229, '360100', '360102', '东湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1230, '360100', '360103', '西湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1231, '360100', '360104', '青云谱区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1232, '360100', '360111', '青山湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1233, '360100', '360112', '新建区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1234, '360100', '360113', '红谷滩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1235, '360100', '360121', '南昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1236, '360100', '360123', '安义县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1237, '360100', '360124', '进贤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1238, '360000', '360200', '景德镇市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1239, '360200', '360202', '昌江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1240, '360200', '360203', '珠山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1241, '360200', '360222', '浮梁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1242, '360200', '360281', '乐平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1243, '360000', '360300', '萍乡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1244, '360300', '360302', '安源区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1245, '360300', '360313', '湘东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1246, '360300', '360321', '莲花县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1247, '360300', '360322', '上栗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1248, '360300', '360323', '芦溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1249, '360000', '360400', '九江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1250, '360400', '360402', '濂溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1251, '360400', '360403', '浔阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1252, '360400', '360404', '柴桑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1253, '360400', '360423', '武宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1254, '360400', '360424', '修水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1255, '360400', '360425', '永修县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1256, '360400', '360426', '德安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1257, '360400', '360428', '都昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1258, '360400', '360429', '湖口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1259, '360400', '360430', '彭泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1260, '360400', '360481', '瑞昌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1261, '360400', '360482', '共青城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1262, '360400', '360483', '庐山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1263, '360000', '360500', '新余市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1264, '360500', '360502', '渝水区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1265, '360500', '360521', '分宜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1266, '360000', '360600', '鹰潭市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1267, '360600', '360602', '月湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1268, '360600', '360603', '余江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1269, '360600', '360681', '贵溪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1270, '360000', '360700', '赣州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1271, '360700', '360702', '章贡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1272, '360700', '360703', '南康区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1273, '360700', '360704', '赣县区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1274, '360700', '360722', '信丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1275, '360700', '360723', '大余县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1276, '360700', '360724', '上犹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1277, '360700', '360725', '崇义县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1278, '360700', '360726', '安远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1279, '360700', '360728', '定南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1280, '360700', '360729', '全南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1281, '360700', '360730', '宁都县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1282, '360700', '360731', '于都县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1283, '360700', '360732', '兴国县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1284, '360700', '360733', '会昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1285, '360700', '360734', '寻乌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1286, '360700', '360735', '石城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1287, '360700', '360781', '瑞金市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1288, '360700', '360783', '龙南市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1289, '360000', '360800', '吉安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1290, '360800', '360802', '吉州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1291, '360800', '360803', '青原区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1292, '360800', '360821', '吉安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1293, '360800', '360822', '吉水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1294, '360800', '360823', '峡江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1295, '360800', '360824', '新干县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1296, '360800', '360825', '永丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1297, '360800', '360826', '泰和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1298, '360800', '360827', '遂川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1299, '360800', '360828', '万安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1300, '360800', '360829', '安福县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1301, '360800', '360830', '永新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1302, '360800', '360881', '井冈山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1303, '360000', '360900', '宜春市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1304, '360900', '360902', '袁州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1305, '360900', '360921', '奉新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1306, '360900', '360922', '万载县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1307, '360900', '360923', '上高县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1308, '360900', '360924', '宜丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1309, '360900', '360925', '靖安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1310, '360900', '360926', '铜鼓县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1311, '360900', '360981', '丰城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1312, '360900', '360982', '樟树市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1313, '360900', '360983', '高安市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1314, '360000', '361000', '抚州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1315, '361000', '361002', '临川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1316, '361000', '361003', '东乡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1317, '361000', '361021', '南城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1318, '361000', '361022', '黎川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1319, '361000', '361023', '南丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1320, '361000', '361024', '崇仁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1321, '361000', '361025', '乐安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1322, '361000', '361026', '宜黄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1323, '361000', '361027', '金溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1324, '361000', '361028', '资溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1325, '361000', '361030', '广昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1326, '360000', '361100', '上饶市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1327, '361100', '361102', '信州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1328, '361100', '361103', '广丰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1329, '361100', '361104', '广信区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1330, '361100', '361123', '玉山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1331, '361100', '361124', '铅山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1332, '361100', '361125', '横峰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1333, '361100', '361126', '弋阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1334, '361100', '361127', '余干县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1335, '361100', '361128', '鄱阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1336, '361100', '361129', '万年县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1337, '361100', '361130', '婺源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1338, '361100', '361181', '德兴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1339, '000000', '370000', '山东省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1340, '370000', '370100', '济南市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1341, '370100', '370102', '历下区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1342, '370100', '370103', '市中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1343, '370100', '370104', '槐荫区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1344, '370100', '370105', '天桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1345, '370100', '370112', '历城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1346, '370100', '370113', '长清区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1347, '370100', '370114', '章丘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1348, '370100', '370115', '济阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1349, '370100', '370116', '莱芜区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1350, '370100', '370117', '钢城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1351, '370100', '370124', '平阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1352, '370100', '370126', '商河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1353, '370000', '370200', '青岛市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1354, '370200', '370202', '市南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1355, '370200', '370203', '市北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1356, '370200', '370211', '黄岛区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1357, '370200', '370212', '崂山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1358, '370200', '370213', '李沧区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1359, '370200', '370214', '城阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1360, '370200', '370215', '即墨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1361, '370200', '370281', '胶州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1362, '370200', '370283', '平度市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1363, '370200', '370285', '莱西市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1364, '370000', '370300', '淄博市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1365, '370300', '370302', '淄川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1366, '370300', '370303', '张店区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1367, '370300', '370304', '博山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1368, '370300', '370305', '临淄区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1369, '370300', '370306', '周村区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1370, '370300', '370321', '桓台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1371, '370300', '370322', '高青县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1372, '370300', '370323', '沂源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1373, '370000', '370400', '枣庄市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1374, '370400', '370402', '市中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1375, '370400', '370403', '薛城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1376, '370400', '370404', '峄城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1377, '370400', '370405', '台儿庄区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1378, '370400', '370406', '山亭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1379, '370400', '370481', '滕州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1380, '370000', '370500', '东营市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1381, '370500', '370502', '东营区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1382, '370500', '370503', '河口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1383, '370500', '370505', '垦利区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1384, '370500', '370522', '利津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1385, '370500', '370523', '广饶县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1386, '370000', '370600', '烟台市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1387, '370600', '370602', '芝罘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1388, '370600', '370611', '福山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1389, '370600', '370612', '牟平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1390, '370600', '370613', '莱山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1391, '370600', '370614', '蓬莱区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1392, '370600', '370681', '龙口市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1393, '370600', '370682', '莱阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1394, '370600', '370683', '莱州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1395, '370600', '370685', '招远市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1396, '370600', '370686', '栖霞市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1397, '370600', '370687', '海阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1398, '370000', '370700', '潍坊市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1399, '370700', '370702', '潍城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1400, '370700', '370703', '寒亭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1401, '370700', '370704', '坊子区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1402, '370700', '370705', '奎文区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1403, '370700', '370724', '临朐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1404, '370700', '370725', '昌乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1405, '370700', '370781', '青州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1406, '370700', '370782', '诸城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1407, '370700', '370783', '寿光市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1408, '370700', '370784', '安丘市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1409, '370700', '370785', '高密市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1410, '370700', '370786', '昌邑市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1411, '370000', '370800', '济宁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1412, '370800', '370811', '任城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1413, '370800', '370812', '兖州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1414, '370800', '370826', '微山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1415, '370800', '370827', '鱼台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1416, '370800', '370828', '金乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1417, '370800', '370829', '嘉祥县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1418, '370800', '370830', '汶上县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1419, '370800', '370831', '泗水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1420, '370800', '370832', '梁山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1421, '370800', '370881', '曲阜市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1422, '370800', '370883', '邹城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1423, '370000', '370900', '泰安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1424, '370900', '370902', '泰山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1425, '370900', '370911', '岱岳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1426, '370900', '370921', '宁阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1427, '370900', '370923', '东平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1428, '370900', '370982', '新泰市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1429, '370900', '370983', '肥城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1430, '370000', '371000', '威海市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1431, '371000', '371002', '环翠区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1432, '371000', '371003', '文登区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1433, '371000', '371082', '荣成市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1434, '371000', '371083', '乳山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1435, '370000', '371100', '日照市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1436, '371100', '371102', '东港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1437, '371100', '371103', '岚山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1438, '371100', '371121', '五莲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1439, '371100', '371122', '莒县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1440, '370000', '371300', '临沂市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1441, '371300', '371302', '兰山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1442, '371300', '371311', '罗庄区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1443, '371300', '371312', '河东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1444, '371300', '371321', '沂南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1445, '371300', '371322', '郯城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1446, '371300', '371323', '沂水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1447, '371300', '371324', '兰陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1448, '371300', '371325', '费县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1449, '371300', '371326', '平邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1450, '371300', '371327', '莒南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1451, '371300', '371328', '蒙阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1452, '371300', '371329', '临沭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1453, '370000', '371400', '德州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1454, '371400', '371402', '德城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1455, '371400', '371403', '陵城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1456, '371400', '371422', '宁津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1457, '371400', '371423', '庆云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1458, '371400', '371424', '临邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1459, '371400', '371425', '齐河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1460, '371400', '371426', '平原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1461, '371400', '371427', '夏津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1462, '371400', '371428', '武城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1463, '371400', '371481', '乐陵市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1464, '371400', '371482', '禹城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1465, '370000', '371500', '聊城市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1466, '371500', '371502', '东昌府区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1467, '371500', '371503', '茌平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1468, '371500', '371521', '阳谷县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1469, '371500', '371522', '莘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1470, '371500', '371524', '东阿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1471, '371500', '371525', '冠县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1472, '371500', '371526', '高唐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1473, '371500', '371581', '临清市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1474, '370000', '371600', '滨州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1475, '371600', '371602', '滨城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1476, '371600', '371603', '沾化区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1477, '371600', '371621', '惠民县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1478, '371600', '371622', '阳信县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1479, '371600', '371623', '无棣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1480, '371600', '371625', '博兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1481, '371600', '371681', '邹平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1482, '370000', '371700', '菏泽市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1483, '371700', '371702', '牡丹区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1484, '371700', '371703', '定陶区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1485, '371700', '371721', '曹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1486, '371700', '371722', '单县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1487, '371700', '371723', '成武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1488, '371700', '371724', '巨野县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1489, '371700', '371725', '郓城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1490, '371700', '371726', '鄄城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1491, '371700', '371728', '东明县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1492, '000000', '410000', '河南省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1493, '410000', '410100', '郑州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1494, '410100', '410102', '中原区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1495, '410100', '410103', '二七区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1496, '410100', '410104', '管城回族区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1497, '410100', '410105', '金水区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1498, '410100', '410106', '上街区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1499, '410100', '410108', '惠济区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1500, '410100', '410122', '中牟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1501, '410100', '410181', '巩义市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1502, '410100', '410182', '荥阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1503, '410100', '410183', '新密市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1504, '410100', '410184', '新郑市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1505, '410100', '410185', '登封市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1506, '410000', '410200', '开封市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1507, '410200', '410202', '龙亭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1508, '410200', '410203', '顺河回族区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1509, '410200', '410204', '鼓楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1510, '410200', '410205', '禹王台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1511, '410200', '410212', '祥符区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1512, '410200', '410221', '杞县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1513, '410200', '410222', '通许县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1514, '410200', '410223', '尉氏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1515, '410200', '410225', '兰考县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1516, '410000', '410300', '洛阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1517, '410300', '410302', '老城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1518, '410300', '410303', '西工区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1519, '410300', '410304', '瀍河回族区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1520, '410300', '410305', '涧西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1521, '410300', '410306', '吉利区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1522, '410300', '410311', '洛龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1523, '410300', '410322', '孟津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1524, '410300', '410323', '新安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1525, '410300', '410324', '栾川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1526, '410300', '410325', '嵩县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1527, '410300', '410326', '汝阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1528, '410300', '410327', '宜阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1529, '410300', '410328', '洛宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1530, '410300', '410329', '伊川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1531, '410300', '410381', '偃师市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1532, '410000', '410400', '平顶山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1533, '410400', '410402', '新华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1534, '410400', '410403', '卫东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1535, '410400', '410404', '石龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1536, '410400', '410411', '湛河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1537, '410400', '410421', '宝丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1538, '410400', '410422', '叶县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1539, '410400', '410423', '鲁山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1540, '410400', '410425', '郏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1541, '410400', '410481', '舞钢市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1542, '410400', '410482', '汝州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1543, '410000', '410500', '安阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1544, '410500', '410502', '文峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1545, '410500', '410503', '北关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1546, '410500', '410505', '殷都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1547, '410500', '410506', '龙安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1548, '410500', '410522', '安阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1549, '410500', '410523', '汤阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1550, '410500', '410526', '滑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1551, '410500', '410527', '内黄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1552, '410500', '410581', '林州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1553, '410000', '410600', '鹤壁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1554, '410600', '410602', '鹤山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1555, '410600', '410603', '山城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1556, '410600', '410611', '淇滨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1557, '410600', '410621', '浚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1558, '410600', '410622', '淇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1559, '410000', '410700', '新乡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1560, '410700', '410702', '红旗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1561, '410700', '410703', '卫滨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1562, '410700', '410704', '凤泉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1563, '410700', '410711', '牧野区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1564, '410700', '410721', '新乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1565, '410700', '410724', '获嘉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1566, '410700', '410725', '原阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1567, '410700', '410726', '延津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1568, '410700', '410727', '封丘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1569, '410700', '410781', '卫辉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1570, '410700', '410782', '辉县市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1571, '410700', '410783', '长垣市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1572, '410000', '410800', '焦作市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1573, '410800', '410802', '解放区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1574, '410800', '410803', '中站区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1575, '410800', '410804', '马村区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1576, '410800', '410811', '山阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1577, '410800', '410821', '修武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1578, '410800', '410822', '博爱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1579, '410800', '410823', '武陟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1580, '410800', '410825', '温县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1581, '410800', '410882', '沁阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1582, '410800', '410883', '孟州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1583, '410000', '410900', '濮阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1584, '410900', '410902', '华龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1585, '410900', '410922', '清丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1586, '410900', '410923', '南乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1587, '410900', '410926', '范县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1588, '410900', '410927', '台前县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1589, '410900', '410928', '濮阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1590, '410000', '411000', '许昌市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1591, '411000', '411002', '魏都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1592, '411000', '411003', '建安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1593, '411000', '411024', '鄢陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1594, '411000', '411025', '襄城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1595, '411000', '411081', '禹州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1596, '411000', '411082', '长葛市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1597, '410000', '411100', '漯河市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1598, '411100', '411102', '源汇区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1599, '411100', '411103', '郾城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1600, '411100', '411104', '召陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1601, '411100', '411121', '舞阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1602, '411100', '411122', '临颍县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1603, '410000', '411200', '三门峡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1604, '411200', '411202', '湖滨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1605, '411200', '411203', '陕州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1606, '411200', '411221', '渑池县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1607, '411200', '411224', '卢氏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1608, '411200', '411281', '义马市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1609, '411200', '411282', '灵宝市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1610, '410000', '411300', '南阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1611, '411300', '411302', '宛城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1612, '411300', '411303', '卧龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1613, '411300', '411321', '南召县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1614, '411300', '411322', '方城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1615, '411300', '411323', '西峡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1616, '411300', '411324', '镇平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1617, '411300', '411325', '内乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1618, '411300', '411326', '淅川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1619, '411300', '411327', '社旗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1620, '411300', '411328', '唐河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1621, '411300', '411329', '新野县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1622, '411300', '411330', '桐柏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1623, '411300', '411381', '邓州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1624, '410000', '411400', '商丘市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1625, '411400', '411402', '梁园区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1626, '411400', '411403', '睢阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1627, '411400', '411421', '民权县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1628, '411400', '411422', '睢县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1629, '411400', '411423', '宁陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1630, '411400', '411424', '柘城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1631, '411400', '411425', '虞城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1632, '411400', '411426', '夏邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1633, '411400', '411481', '永城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1634, '410000', '411500', '信阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1635, '411500', '411502', '浉河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1636, '411500', '411503', '平桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1637, '411500', '411521', '罗山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1638, '411500', '411522', '光山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1639, '411500', '411523', '新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1640, '411500', '411524', '商城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1641, '411500', '411525', '固始县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1642, '411500', '411526', '潢川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1643, '411500', '411527', '淮滨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1644, '411500', '411528', '息县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1645, '410000', '411600', '周口市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1646, '411600', '411602', '川汇区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1647, '411600', '411603', '淮阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1648, '411600', '411621', '扶沟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1649, '411600', '411622', '西华县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1650, '411600', '411623', '商水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1651, '411600', '411624', '沈丘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1652, '411600', '411625', '郸城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1653, '411600', '411627', '太康县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1654, '411600', '411628', '鹿邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1655, '411600', '411681', '项城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1656, '410000', '411700', '驻马店市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1657, '411700', '411702', '驿城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1658, '411700', '411721', '西平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1659, '411700', '411722', '上蔡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1660, '411700', '411723', '平舆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1661, '411700', '411724', '正阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1662, '411700', '411725', '确山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1663, '411700', '411726', '泌阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1664, '411700', '411727', '汝南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1665, '411700', '411728', '遂平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1666, '411700', '411729', '新蔡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1667, '419000', '419001', '济源市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1668, '000000', '420000', '湖北省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1669, '420000', '420100', '武汉市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1670, '420100', '420102', '江岸区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1671, '420100', '420103', '江汉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1672, '420100', '420104', '硚口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1673, '420100', '420105', '汉阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1674, '420100', '420106', '武昌区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1675, '420100', '420107', '青山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1676, '420100', '420111', '洪山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1677, '420100', '420112', '东西湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1678, '420100', '420113', '汉南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1679, '420100', '420114', '蔡甸区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1680, '420100', '420115', '江夏区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1681, '420100', '420116', '黄陂区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1682, '420100', '420117', '新洲区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1683, '420000', '420200', '黄石市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1684, '420200', '420202', '黄石港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1685, '420200', '420203', '西塞山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1686, '420200', '420204', '下陆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1687, '420200', '420205', '铁山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1688, '420200', '420222', '阳新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1689, '420200', '420281', '大冶市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1690, '420000', '420300', '十堰市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1691, '420300', '420302', '茅箭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1692, '420300', '420303', '张湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1693, '420300', '420304', '郧阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1694, '420300', '420322', '郧西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1695, '420300', '420323', '竹山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1696, '420300', '420324', '竹溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1697, '420300', '420325', '房县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1698, '420300', '420381', '丹江口市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1699, '420000', '420500', '宜昌市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1700, '420500', '420502', '西陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1701, '420500', '420503', '伍家岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1702, '420500', '420504', '点军区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1703, '420500', '420505', '猇亭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1704, '420500', '420506', '夷陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1705, '420500', '420525', '远安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1706, '420500', '420526', '兴山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1707, '420500', '420527', '秭归县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1708, '420500', '420528', '长阳土家族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1709, '420500', '420529', '五峰土家族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1710, '420500', '420581', '宜都市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1711, '420500', '420582', '当阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1712, '420500', '420583', '枝江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1713, '420000', '420600', '襄阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1714, '420600', '420602', '襄城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1715, '420600', '420606', '樊城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1716, '420600', '420607', '襄州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1717, '420600', '420624', '南漳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1718, '420600', '420625', '谷城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1719, '420600', '420626', '保康县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1720, '420600', '420682', '老河口市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1721, '420600', '420683', '枣阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1722, '420600', '420684', '宜城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1723, '420000', '420700', '鄂州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1724, '420700', '420702', '梁子湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1725, '420700', '420703', '华容区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1726, '420700', '420704', '鄂城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1727, '420000', '420800', '荆门市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1728, '420800', '420802', '东宝区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1729, '420800', '420804', '掇刀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1730, '420800', '420822', '沙洋县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1731, '420800', '420881', '钟祥市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1732, '420800', '420882', '京山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1733, '420000', '420900', '孝感市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1734, '420900', '420902', '孝南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1735, '420900', '420921', '孝昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1736, '420900', '420922', '大悟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1737, '420900', '420923', '云梦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1738, '420900', '420981', '应城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1739, '420900', '420982', '安陆市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1740, '420900', '420984', '汉川市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1741, '420000', '421000', '荆州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1742, '421000', '421002', '沙市区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1743, '421000', '421003', '荆州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1744, '421000', '421022', '公安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1745, '421000', '421023', '监利县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1746, '421000', '421024', '江陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1747, '421000', '421081', '石首市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1748, '421000', '421083', '洪湖市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1749, '421000', '421087', '松滋市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1750, '420000', '421100', '黄冈市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1751, '421100', '421102', '黄州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1752, '421100', '421121', '团风县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1753, '421100', '421122', '红安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1754, '421100', '421123', '罗田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1755, '421100', '421124', '英山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1756, '421100', '421125', '浠水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1757, '421100', '421126', '蕲春县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1758, '421100', '421127', '黄梅县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1759, '421100', '421181', '麻城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1760, '421100', '421182', '武穴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1761, '420000', '421200', '咸宁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1762, '421200', '421202', '咸安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1763, '421200', '421221', '嘉鱼县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1764, '421200', '421222', '通城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1765, '421200', '421223', '崇阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1766, '421200', '421224', '通山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1767, '421200', '421281', '赤壁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1768, '420000', '421300', '随州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1769, '421300', '421303', '曾都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1770, '421300', '421321', '随县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1771, '421300', '421381', '广水市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1772, '420000', '422800', '恩施土家族苗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (1773, '422800', '422801', '恩施市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1774, '422800', '422802', '利川市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1775, '422800', '422822', '建始县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1776, '422800', '422823', '巴东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1777, '422800', '422825', '宣恩县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1778, '422800', '422826', '咸丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1779, '422800', '422827', '来凤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1780, '422800', '422828', '鹤峰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1781, '429000', '429004', '仙桃市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1782, '429000', '429005', '潜江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1783, '429000', '429006', '天门市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1784, '429000', '429021', '神农架林区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1785, '000000', '430000', '湖南省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1786, '430000', '430100', '长沙市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1787, '430100', '430102', '芙蓉区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1788, '430100', '430103', '天心区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1789, '430100', '430104', '岳麓区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1790, '430100', '430105', '开福区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1791, '430100', '430111', '雨花区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1792, '430100', '430112', '望城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1793, '430100', '430121', '长沙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1794, '430100', '430181', '浏阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1795, '430100', '430182', '宁乡市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1796, '430000', '430200', '株洲市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1797, '430200', '430202', '荷塘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1798, '430200', '430203', '芦淞区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1799, '430200', '430204', '石峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1800, '430200', '430211', '天元区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1801, '430200', '430212', '渌口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1802, '430200', '430223', '攸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1803, '430200', '430224', '茶陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1804, '430200', '430225', '炎陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1805, '430200', '430281', '醴陵市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1806, '430000', '430300', '湘潭市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1807, '430300', '430302', '雨湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1808, '430300', '430304', '岳塘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1809, '430300', '430321', '湘潭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1810, '430300', '430381', '湘乡市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1811, '430300', '430382', '韶山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1812, '430000', '430400', '衡阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1813, '430400', '430405', '珠晖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1814, '430400', '430406', '雁峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1815, '430400', '430407', '石鼓区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1816, '430400', '430408', '蒸湘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1817, '430400', '430412', '南岳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1818, '430400', '430421', '衡阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1819, '430400', '430422', '衡南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1820, '430400', '430423', '衡山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1821, '430400', '430424', '衡东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1822, '430400', '430426', '祁东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1823, '430400', '430481', '耒阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1824, '430400', '430482', '常宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1825, '430000', '430500', '邵阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1826, '430500', '430502', '双清区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1827, '430500', '430503', '大祥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1828, '430500', '430511', '北塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1829, '430500', '430522', '新邵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1830, '430500', '430523', '邵阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1831, '430500', '430524', '隆回县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1832, '430500', '430525', '洞口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1833, '430500', '430527', '绥宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1834, '430500', '430528', '新宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1835, '430500', '430529', '城步苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1836, '430500', '430581', '武冈市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1837, '430500', '430582', '邵东市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1838, '430000', '430600', '岳阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1839, '430600', '430602', '岳阳楼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1840, '430600', '430603', '云溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1841, '430600', '430611', '君山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1842, '430600', '430621', '岳阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1843, '430600', '430623', '华容县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1844, '430600', '430624', '湘阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1845, '430600', '430626', '平江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1846, '430600', '430681', '汨罗市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1847, '430600', '430682', '临湘市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1848, '430000', '430700', '常德市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1849, '430700', '430702', '武陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1850, '430700', '430703', '鼎城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1851, '430700', '430721', '安乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1852, '430700', '430722', '汉寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1853, '430700', '430723', '澧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1854, '430700', '430724', '临澧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1855, '430700', '430725', '桃源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1856, '430700', '430726', '石门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1857, '430700', '430781', '津市市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1858, '430000', '430800', '张家界市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1859, '430800', '430802', '永定区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1860, '430800', '430811', '武陵源区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1861, '430800', '430821', '慈利县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1862, '430800', '430822', '桑植县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1863, '430000', '430900', '益阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1864, '430900', '430902', '资阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1865, '430900', '430903', '赫山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1866, '430900', '430921', '南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1867, '430900', '430922', '桃江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1868, '430900', '430923', '安化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1869, '430900', '430981', '沅江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1870, '430000', '431000', '郴州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1871, '431000', '431002', '北湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1872, '431000', '431003', '苏仙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1873, '431000', '431021', '桂阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1874, '431000', '431022', '宜章县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1875, '431000', '431023', '永兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1876, '431000', '431024', '嘉禾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1877, '431000', '431025', '临武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1878, '431000', '431026', '汝城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1879, '431000', '431027', '桂东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1880, '431000', '431028', '安仁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1881, '431000', '431081', '资兴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1882, '430000', '431100', '永州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1883, '431100', '431102', '零陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1884, '431100', '431103', '冷水滩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1885, '431100', '431121', '祁阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1886, '431100', '431122', '东安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1887, '431100', '431123', '双牌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1888, '431100', '431124', '道县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1889, '431100', '431125', '江永县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1890, '431100', '431126', '宁远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1891, '431100', '431127', '蓝山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1892, '431100', '431128', '新田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1893, '431100', '431129', '江华瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1894, '430000', '431200', '怀化市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1895, '431200', '431202', '鹤城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1896, '431200', '431221', '中方县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1897, '431200', '431222', '沅陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1898, '431200', '431223', '辰溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1899, '431200', '431224', '溆浦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1900, '431200', '431225', '会同县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1901, '431200', '431226', '麻阳苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1902, '431200', '431227', '新晃侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1903, '431200', '431228', '芷江侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1904, '431200', '431229', '靖州苗族侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1905, '431200', '431230', '通道侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1906, '431200', '431281', '洪江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1907, '430000', '431300', '娄底市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1908, '431300', '431302', '娄星区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1909, '431300', '431321', '双峰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1910, '431300', '431322', '新化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1911, '431300', '431381', '冷水江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1912, '431300', '431382', '涟源市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1913, '430000', '433100', '湘西土家族苗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (1914, '433100', '433101', '吉首市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1915, '433100', '433122', '泸溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1916, '433100', '433123', '凤凰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1917, '433100', '433124', '花垣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1918, '433100', '433125', '保靖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1919, '433100', '433126', '古丈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1920, '433100', '433127', '永顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1921, '433100', '433130', '龙山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1922, '000000', '440000', '广东省', 1);
INSERT INTO `sys_administrative_division`
VALUES (1923, '440000', '440100', '广州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1924, '440100', '440103', '荔湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1925, '440100', '440104', '越秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1926, '440100', '440105', '海珠区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1927, '440100', '440106', '天河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1928, '440100', '440111', '白云区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1929, '440100', '440112', '黄埔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1930, '440100', '440113', '番禺区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1931, '440100', '440114', '花都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1932, '440100', '440115', '南沙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1933, '440100', '440117', '从化区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1934, '440100', '440118', '增城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1935, '440000', '440200', '韶关市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1936, '440200', '440203', '武江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1937, '440200', '440204', '浈江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1938, '440200', '440205', '曲江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1939, '440200', '440222', '始兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1940, '440200', '440224', '仁化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1941, '440200', '440229', '翁源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1942, '440200', '440232', '乳源瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1943, '440200', '440233', '新丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1944, '440200', '440281', '乐昌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1945, '440200', '440282', '南雄市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1946, '440000', '440300', '深圳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1947, '440300', '440303', '罗湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1948, '440300', '440304', '福田区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1949, '440300', '440305', '南山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1950, '440300', '440306', '宝安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1951, '440300', '440307', '龙岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1952, '440300', '440308', '盐田区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1953, '440300', '440309', '龙华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1954, '440300', '440310', '坪山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1955, '440300', '440311', '光明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1956, '440000', '440400', '珠海市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1957, '440400', '440402', '香洲区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1958, '440400', '440403', '斗门区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1959, '440400', '440404', '金湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1960, '440000', '440500', '汕头市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1961, '440500', '440507', '龙湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1962, '440500', '440511', '金平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1963, '440500', '440512', '濠江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1964, '440500', '440513', '潮阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1965, '440500', '440514', '潮南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1966, '440500', '440515', '澄海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1967, '440500', '440523', '南澳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1968, '440000', '440600', '佛山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1969, '440600', '440604', '禅城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1970, '440600', '440605', '南海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1971, '440600', '440606', '顺德区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1972, '440600', '440607', '三水区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1973, '440600', '440608', '高明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1974, '440000', '440700', '江门市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1975, '440700', '440703', '蓬江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1976, '440700', '440704', '江海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1977, '440700', '440705', '新会区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1978, '440700', '440781', '台山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1979, '440700', '440783', '开平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1980, '440700', '440784', '鹤山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1981, '440700', '440785', '恩平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1982, '440000', '440800', '湛江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1983, '440800', '440802', '赤坎区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1984, '440800', '440803', '霞山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1985, '440800', '440804', '坡头区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1986, '440800', '440811', '麻章区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1987, '440800', '440823', '遂溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1988, '440800', '440825', '徐闻县', 3);
INSERT INTO `sys_administrative_division`
VALUES (1989, '440800', '440881', '廉江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1990, '440800', '440882', '雷州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1991, '440800', '440883', '吴川市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1992, '440000', '440900', '茂名市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1993, '440900', '440902', '茂南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1994, '440900', '440904', '电白区', 3);
INSERT INTO `sys_administrative_division`
VALUES (1995, '440900', '440981', '高州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1996, '440900', '440982', '化州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1997, '440900', '440983', '信宜市', 3);
INSERT INTO `sys_administrative_division`
VALUES (1998, '440000', '441200', '肇庆市', 2);
INSERT INTO `sys_administrative_division`
VALUES (1999, '441200', '441202', '端州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2000, '441200', '441203', '鼎湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2001, '441200', '441204', '高要区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2002, '441200', '441223', '广宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2003, '441200', '441224', '怀集县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2004, '441200', '441225', '封开县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2005, '441200', '441226', '德庆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2006, '441200', '441284', '四会市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2007, '440000', '441300', '惠州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2008, '441300', '441302', '惠城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2009, '441300', '441303', '惠阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2010, '441300', '441322', '博罗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2011, '441300', '441323', '惠东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2012, '441300', '441324', '龙门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2013, '440000', '441400', '梅州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2014, '441400', '441402', '梅江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2015, '441400', '441403', '梅县区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2016, '441400', '441422', '大埔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2017, '441400', '441423', '丰顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2018, '441400', '441424', '五华县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2019, '441400', '441426', '平远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2020, '441400', '441427', '蕉岭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2021, '441400', '441481', '兴宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2022, '440000', '441500', '汕尾市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2023, '441500', '441502', '城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2024, '441500', '441521', '海丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2025, '441500', '441523', '陆河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2026, '441500', '441581', '陆丰市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2027, '440000', '441600', '河源市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2028, '441600', '441602', '源城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2029, '441600', '441621', '紫金县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2030, '441600', '441622', '龙川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2031, '441600', '441623', '连平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2032, '441600', '441624', '和平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2033, '441600', '441625', '东源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2034, '440000', '441700', '阳江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2035, '441700', '441702', '江城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2036, '441700', '441704', '阳东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2037, '441700', '441721', '阳西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2038, '441700', '441781', '阳春市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2039, '440000', '441800', '清远市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2040, '441800', '441802', '清城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2041, '441800', '441803', '清新区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2042, '441800', '441821', '佛冈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2043, '441800', '441823', '阳山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2044, '441800', '441825', '连山壮族瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2045, '441800', '441826', '连南瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2046, '441800', '441881', '英德市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2047, '441800', '441882', '连州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2048, '440000', '441900', '东莞市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2049, '440000', '442000', '中山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2050, '440000', '445100', '潮州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2051, '445100', '445102', '湘桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2052, '445100', '445103', '潮安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2053, '445100', '445122', '饶平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2054, '440000', '445200', '揭阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2055, '445200', '445202', '榕城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2056, '445200', '445203', '揭东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2057, '445200', '445222', '揭西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2058, '445200', '445224', '惠来县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2059, '445200', '445281', '普宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2060, '440000', '445300', '云浮市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2061, '445300', '445302', '云城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2062, '445300', '445303', '云安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2063, '445300', '445321', '新兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2064, '445300', '445322', '郁南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2065, '445300', '445381', '罗定市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2066, '000000', '450000', '广西壮族自治区', 1);
INSERT INTO `sys_administrative_division`
VALUES (2067, '450000', '450100', '南宁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2068, '450100', '450102', '兴宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2069, '450100', '450103', '青秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2070, '450100', '450105', '江南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2071, '450100', '450107', '西乡塘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2072, '450100', '450108', '良庆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2073, '450100', '450109', '邕宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2074, '450100', '450110', '武鸣区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2075, '450100', '450123', '隆安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2076, '450100', '450124', '马山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2077, '450100', '450125', '上林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2078, '450100', '450126', '宾阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2079, '450100', '450127', '横县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2080, '450000', '450200', '柳州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2081, '450200', '450202', '城中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2082, '450200', '450203', '鱼峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2083, '450200', '450204', '柳南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2084, '450200', '450205', '柳北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2085, '450200', '450206', '柳江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2086, '450200', '450222', '柳城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2087, '450200', '450223', '鹿寨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2088, '450200', '450224', '融安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2089, '450200', '450225', '融水苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2090, '450200', '450226', '三江侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2091, '450000', '450300', '桂林市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2092, '450300', '450302', '秀峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2093, '450300', '450303', '叠彩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2094, '450300', '450304', '象山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2095, '450300', '450305', '七星区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2096, '450300', '450311', '雁山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2097, '450300', '450312', '临桂区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2098, '450300', '450321', '阳朔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2099, '450300', '450323', '灵川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2100, '450300', '450324', '全州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2101, '450300', '450325', '兴安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2102, '450300', '450326', '永福县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2103, '450300', '450327', '灌阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2104, '450300', '450328', '龙胜各族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2105, '450300', '450329', '资源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2106, '450300', '450330', '平乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2107, '450300', '450332', '恭城瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2108, '450300', '450381', '荔浦市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2109, '450000', '450400', '梧州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2110, '450400', '450403', '万秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2111, '450400', '450405', '长洲区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2112, '450400', '450406', '龙圩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2113, '450400', '450421', '苍梧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2114, '450400', '450422', '藤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2115, '450400', '450423', '蒙山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2116, '450400', '450481', '岑溪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2117, '450000', '450500', '北海市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2118, '450500', '450502', '海城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2119, '450500', '450503', '银海区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2120, '450500', '450512', '铁山港区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2121, '450500', '450521', '合浦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2122, '450000', '450600', '防城港市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2123, '450600', '450602', '港口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2124, '450600', '450603', '防城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2125, '450600', '450621', '上思县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2126, '450600', '450681', '东兴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2127, '450000', '450700', '钦州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2128, '450700', '450702', '钦南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2129, '450700', '450703', '钦北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2130, '450700', '450721', '灵山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2131, '450700', '450722', '浦北县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2132, '450000', '450800', '贵港市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2133, '450800', '450802', '港北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2134, '450800', '450803', '港南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2135, '450800', '450804', '覃塘区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2136, '450800', '450821', '平南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2137, '450800', '450881', '桂平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2138, '450000', '450900', '玉林市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2139, '450900', '450902', '玉州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2140, '450900', '450903', '福绵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2141, '450900', '450921', '容县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2142, '450900', '450922', '陆川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2143, '450900', '450923', '博白县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2144, '450900', '450924', '兴业县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2145, '450900', '450981', '北流市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2146, '450000', '451000', '百色市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2147, '451000', '451002', '右江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2148, '451000', '451003', '田阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2149, '451000', '451022', '田东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2150, '451000', '451024', '德保县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2151, '451000', '451026', '那坡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2152, '451000', '451027', '凌云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2153, '451000', '451028', '乐业县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2154, '451000', '451029', '田林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2155, '451000', '451030', '西林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2156, '451000', '451031', '隆林各族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2157, '451000', '451081', '靖西市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2158, '451000', '451082', '平果市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2159, '450000', '451100', '贺州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2160, '451100', '451102', '八步区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2161, '451100', '451103', '平桂区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2162, '451100', '451121', '昭平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2163, '451100', '451122', '钟山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2164, '451100', '451123', '富川瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2165, '450000', '451200', '河池市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2166, '451200', '451202', '金城江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2167, '451200', '451203', '宜州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2168, '451200', '451221', '南丹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2169, '451200', '451222', '天峨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2170, '451200', '451223', '凤山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2171, '451200', '451224', '东兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2172, '451200', '451225', '罗城仫佬族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2173, '451200', '451226', '环江毛南族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2174, '451200', '451227', '巴马瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2175, '451200', '451228', '都安瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2176, '451200', '451229', '大化瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2177, '450000', '451300', '来宾市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2178, '451300', '451302', '兴宾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2179, '451300', '451321', '忻城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2180, '451300', '451322', '象州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2181, '451300', '451323', '武宣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2182, '451300', '451324', '金秀瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2183, '451300', '451381', '合山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2184, '450000', '451400', '崇左市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2185, '451400', '451402', '江州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2186, '451400', '451421', '扶绥县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2187, '451400', '451422', '宁明县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2188, '451400', '451423', '龙州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2189, '451400', '451424', '大新县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2190, '451400', '451425', '天等县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2191, '451400', '451481', '凭祥市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2192, '000000', '460000', '海南省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2193, '460000', '460100', '海口市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2194, '460100', '460105', '秀英区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2195, '460100', '460106', '龙华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2196, '460100', '460107', '琼山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2197, '460100', '460108', '美兰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2198, '460000', '460200', '三亚市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2199, '460200', '460202', '海棠区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2200, '460200', '460203', '吉阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2201, '460200', '460204', '天涯区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2202, '460200', '460205', '崖州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2203, '460000', '460300', '三沙市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2204, '460000', '460400', '儋州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2205, '469000', '469001', '五指山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2206, '469000', '469002', '琼海市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2207, '469000', '469005', '文昌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2208, '469000', '469006', '万宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2209, '469000', '469007', '东方市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2210, '469000', '469021', '定安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2211, '469000', '469022', '屯昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2212, '469000', '469023', '澄迈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2213, '469000', '469024', '临高县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2214, '469000', '469025', '白沙黎族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2215, '469000', '469026', '昌江黎族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2216, '469000', '469027', '乐东黎族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2217, '469000', '469028', '陵水黎族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2218, '469000', '469029', '保亭黎族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2219, '469000', '469030', '琼中黎族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2220, '000000', '500000', '重庆市', 1);
INSERT INTO `sys_administrative_division`
VALUES (2221, '500000', '500100', '市辖区', 2);
INSERT INTO `sys_administrative_division`
VALUES (2222, '500100', '500101', '万州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2223, '500100', '500102', '涪陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2224, '500100', '500103', '渝中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2225, '500100', '500104', '大渡口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2226, '500100', '500105', '江北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2227, '500100', '500106', '沙坪坝区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2228, '500100', '500107', '九龙坡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2229, '500100', '500108', '南岸区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2230, '500100', '500109', '北碚区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2231, '500100', '500110', '綦江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2232, '500100', '500111', '大足区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2233, '500100', '500112', '渝北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2234, '500100', '500113', '巴南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2235, '500100', '500114', '黔江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2236, '500100', '500115', '长寿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2237, '500100', '500116', '江津区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2238, '500100', '500117', '合川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2239, '500100', '500118', '永川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2240, '500100', '500119', '南川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2241, '500100', '500120', '璧山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2242, '500100', '500151', '铜梁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2243, '500100', '500152', '潼南区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2244, '500100', '500153', '荣昌区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2245, '500100', '500154', '开州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2246, '500100', '500155', '梁平区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2247, '500100', '500156', '武隆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2248, '500200', '500229', '城口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2249, '500200', '500230', '丰都县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2250, '500200', '500231', '垫江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2251, '500200', '500233', '忠县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2252, '500200', '500235', '云阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2253, '500200', '500236', '奉节县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2254, '500200', '500237', '巫山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2255, '500200', '500238', '巫溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2256, '500200', '500240', '石柱土家族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2257, '500200', '500241', '秀山土家族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2258, '500200', '500242', '酉阳土家族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2259, '500200', '500243', '彭水苗族土家族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2260, '000000', '510000', '四川省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2261, '510000', '510100', '成都市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2262, '510100', '510104', '锦江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2263, '510100', '510105', '青羊区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2264, '510100', '510106', '金牛区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2265, '510100', '510107', '武侯区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2266, '510100', '510108', '成华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2267, '510100', '510112', '龙泉驿区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2268, '510100', '510113', '青白江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2269, '510100', '510114', '新都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2270, '510100', '510115', '温江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2271, '510100', '510116', '双流区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2272, '510100', '510117', '郫都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2273, '510100', '510118', '新津区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2274, '510100', '510121', '金堂县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2275, '510100', '510129', '大邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2276, '510100', '510131', '蒲江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2277, '510100', '510181', '都江堰市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2278, '510100', '510182', '彭州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2279, '510100', '510183', '邛崃市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2280, '510100', '510184', '崇州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2281, '510100', '510185', '简阳市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2282, '510000', '510300', '自贡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2283, '510300', '510302', '自流井区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2284, '510300', '510303', '贡井区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2285, '510300', '510304', '大安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2286, '510300', '510311', '沿滩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2287, '510300', '510321', '荣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2288, '510300', '510322', '富顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2289, '510000', '510400', '攀枝花市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2290, '510400', '510402', '东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2291, '510400', '510403', '西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2292, '510400', '510411', '仁和区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2293, '510400', '510421', '米易县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2294, '510400', '510422', '盐边县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2295, '510000', '510500', '泸州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2296, '510500', '510502', '江阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2297, '510500', '510503', '纳溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2298, '510500', '510504', '龙马潭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2299, '510500', '510521', '泸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2300, '510500', '510522', '合江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2301, '510500', '510524', '叙永县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2302, '510500', '510525', '古蔺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2303, '510000', '510600', '德阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2304, '510600', '510603', '旌阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2305, '510600', '510604', '罗江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2306, '510600', '510623', '中江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2307, '510600', '510681', '广汉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2308, '510600', '510682', '什邡市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2309, '510600', '510683', '绵竹市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2310, '510000', '510700', '绵阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2311, '510700', '510703', '涪城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2312, '510700', '510704', '游仙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2313, '510700', '510705', '安州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2314, '510700', '510722', '三台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2315, '510700', '510723', '盐亭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2316, '510700', '510725', '梓潼县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2317, '510700', '510726', '北川羌族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2318, '510700', '510727', '平武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2319, '510700', '510781', '江油市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2320, '510000', '510800', '广元市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2321, '510800', '510802', '利州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2322, '510800', '510811', '昭化区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2323, '510800', '510812', '朝天区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2324, '510800', '510821', '旺苍县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2325, '510800', '510822', '青川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2326, '510800', '510823', '剑阁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2327, '510800', '510824', '苍溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2328, '510000', '510900', '遂宁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2329, '510900', '510903', '船山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2330, '510900', '510904', '安居区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2331, '510900', '510921', '蓬溪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2332, '510900', '510923', '大英县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2333, '510900', '510981', '射洪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2334, '510000', '511000', '内江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2335, '511000', '511002', '市中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2336, '511000', '511011', '东兴区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2337, '511000', '511024', '威远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2338, '511000', '511025', '资中县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2339, '511000', '511083', '隆昌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2340, '510000', '511100', '乐山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2341, '511100', '511102', '市中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2342, '511100', '511111', '沙湾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2343, '511100', '511112', '五通桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2344, '511100', '511113', '金口河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2345, '511100', '511123', '犍为县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2346, '511100', '511124', '井研县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2347, '511100', '511126', '夹江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2348, '511100', '511129', '沐川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2349, '511100', '511132', '峨边彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2350, '511100', '511133', '马边彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2351, '511100', '511181', '峨眉山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2352, '510000', '511300', '南充市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2353, '511300', '511302', '顺庆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2354, '511300', '511303', '高坪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2355, '511300', '511304', '嘉陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2356, '511300', '511321', '南部县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2357, '511300', '511322', '营山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2358, '511300', '511323', '蓬安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2359, '511300', '511324', '仪陇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2360, '511300', '511325', '西充县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2361, '511300', '511381', '阆中市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2362, '510000', '511400', '眉山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2363, '511400', '511402', '东坡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2364, '511400', '511403', '彭山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2365, '511400', '511421', '仁寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2366, '511400', '511423', '洪雅县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2367, '511400', '511424', '丹棱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2368, '511400', '511425', '青神县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2369, '510000', '511500', '宜宾市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2370, '511500', '511502', '翠屏区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2371, '511500', '511503', '南溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2372, '511500', '511504', '叙州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2373, '511500', '511523', '江安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2374, '511500', '511524', '长宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2375, '511500', '511525', '高县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2376, '511500', '511526', '珙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2377, '511500', '511527', '筠连县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2378, '511500', '511528', '兴文县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2379, '511500', '511529', '屏山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2380, '510000', '511600', '广安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2381, '511600', '511602', '广安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2382, '511600', '511603', '前锋区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2383, '511600', '511621', '岳池县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2384, '511600', '511622', '武胜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2385, '511600', '511623', '邻水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2386, '511600', '511681', '华蓥市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2387, '510000', '511700', '达州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2388, '511700', '511702', '通川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2389, '511700', '511703', '达川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2390, '511700', '511722', '宣汉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2391, '511700', '511723', '开江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2392, '511700', '511724', '大竹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2393, '511700', '511725', '渠县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2394, '511700', '511781', '万源市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2395, '510000', '511800', '雅安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2396, '511800', '511802', '雨城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2397, '511800', '511803', '名山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2398, '511800', '511822', '荥经县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2399, '511800', '511823', '汉源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2400, '511800', '511824', '石棉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2401, '511800', '511825', '天全县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2402, '511800', '511826', '芦山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2403, '511800', '511827', '宝兴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2404, '510000', '511900', '巴中市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2405, '511900', '511902', '巴州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2406, '511900', '511903', '恩阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2407, '511900', '511921', '通江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2408, '511900', '511922', '南江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2409, '511900', '511923', '平昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2410, '510000', '512000', '资阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2411, '512000', '512002', '雁江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2412, '512000', '512021', '安岳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2413, '512000', '512022', '乐至县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2414, '510000', '513200', '阿坝藏族羌族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2415, '513200', '513201', '马尔康市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2416, '513200', '513221', '汶川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2417, '513200', '513222', '理县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2418, '513200', '513223', '茂县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2419, '513200', '513224', '松潘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2420, '513200', '513225', '九寨沟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2421, '513200', '513226', '金川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2422, '513200', '513227', '小金县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2423, '513200', '513228', '黑水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2424, '513200', '513230', '壤塘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2425, '513200', '513231', '阿坝县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2426, '513200', '513232', '若尔盖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2427, '513200', '513233', '红原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2428, '510000', '513300', '甘孜藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2429, '513300', '513301', '康定市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2430, '513300', '513322', '泸定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2431, '513300', '513323', '丹巴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2432, '513300', '513324', '九龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2433, '513300', '513325', '雅江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2434, '513300', '513326', '道孚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2435, '513300', '513327', '炉霍县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2436, '513300', '513328', '甘孜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2437, '513300', '513329', '新龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2438, '513300', '513330', '德格县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2439, '513300', '513331', '白玉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2440, '513300', '513332', '石渠县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2441, '513300', '513333', '色达县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2442, '513300', '513334', '理塘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2443, '513300', '513335', '巴塘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2444, '513300', '513336', '乡城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2445, '513300', '513337', '稻城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2446, '513300', '513338', '得荣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2447, '510000', '513400', '凉山彝族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2448, '513400', '513401', '西昌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2449, '513400', '513422', '木里藏族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2450, '513400', '513423', '盐源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2451, '513400', '513424', '德昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2452, '513400', '513425', '会理县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2453, '513400', '513426', '会东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2454, '513400', '513427', '宁南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2455, '513400', '513428', '普格县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2456, '513400', '513429', '布拖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2457, '513400', '513430', '金阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2458, '513400', '513431', '昭觉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2459, '513400', '513432', '喜德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2460, '513400', '513433', '冕宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2461, '513400', '513434', '越西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2462, '513400', '513435', '甘洛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2463, '513400', '513436', '美姑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2464, '513400', '513437', '雷波县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2465, '000000', '520000', '贵州省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2466, '520000', '520100', '贵阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2467, '520100', '520102', '南明区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2468, '520100', '520103', '云岩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2469, '520100', '520111', '花溪区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2470, '520100', '520112', '乌当区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2471, '520100', '520113', '白云区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2472, '520100', '520115', '观山湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2473, '520100', '520121', '开阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2474, '520100', '520122', '息烽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2475, '520100', '520123', '修文县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2476, '520100', '520181', '清镇市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2477, '520000', '520200', '六盘水市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2478, '520200', '520201', '钟山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2479, '520200', '520203', '六枝特区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2480, '520200', '520221', '水城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2481, '520200', '520281', '盘州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2482, '520000', '520300', '遵义市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2483, '520300', '520302', '红花岗区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2484, '520300', '520303', '汇川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2485, '520300', '520304', '播州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2486, '520300', '520322', '桐梓县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2487, '520300', '520323', '绥阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2488, '520300', '520324', '正安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2489, '520300', '520325', '道真仡佬族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2490, '520300', '520326', '务川仡佬族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2491, '520300', '520327', '凤冈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2492, '520300', '520328', '湄潭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2493, '520300', '520329', '余庆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2494, '520300', '520330', '习水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2495, '520300', '520381', '赤水市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2496, '520300', '520382', '仁怀市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2497, '520000', '520400', '安顺市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2498, '520400', '520402', '西秀区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2499, '520400', '520403', '平坝区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2500, '520400', '520422', '普定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2501, '520400', '520423', '镇宁布依族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2502, '520400', '520424', '关岭布依族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2503, '520400', '520425', '紫云苗族布依族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2504, '520000', '520500', '毕节市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2505, '520500', '520502', '七星关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2506, '520500', '520521', '大方县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2507, '520500', '520522', '黔西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2508, '520500', '520523', '金沙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2509, '520500', '520524', '织金县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2510, '520500', '520525', '纳雍县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2511, '520500', '520526', '威宁彝族回族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2512, '520500', '520527', '赫章县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2513, '520000', '520600', '铜仁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2514, '520600', '520602', '碧江区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2515, '520600', '520603', '万山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2516, '520600', '520621', '江口县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2517, '520600', '520622', '玉屏侗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2518, '520600', '520623', '石阡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2519, '520600', '520624', '思南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2520, '520600', '520625', '印江土家族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2521, '520600', '520626', '德江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2522, '520600', '520627', '沿河土家族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2523, '520600', '520628', '松桃苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2524, '520000', '522300', '黔西南布依族苗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2525, '522300', '522301', '兴义市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2526, '522300', '522302', '兴仁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2527, '522300', '522323', '普安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2528, '522300', '522324', '晴隆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2529, '522300', '522325', '贞丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2530, '522300', '522326', '望谟县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2531, '522300', '522327', '册亨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2532, '522300', '522328', '安龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2533, '520000', '522600', '黔东南苗族侗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2534, '522600', '522601', '凯里市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2535, '522600', '522622', '黄平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2536, '522600', '522623', '施秉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2537, '522600', '522624', '三穗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2538, '522600', '522625', '镇远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2539, '522600', '522626', '岑巩县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2540, '522600', '522627', '天柱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2541, '522600', '522628', '锦屏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2542, '522600', '522629', '剑河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2543, '522600', '522630', '台江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2544, '522600', '522631', '黎平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2545, '522600', '522632', '榕江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2546, '522600', '522633', '从江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2547, '522600', '522634', '雷山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2548, '522600', '522635', '麻江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2549, '522600', '522636', '丹寨县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2550, '520000', '522700', '黔南布依族苗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2551, '522700', '522701', '都匀市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2552, '522700', '522702', '福泉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2553, '522700', '522722', '荔波县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2554, '522700', '522723', '贵定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2555, '522700', '522725', '瓮安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2556, '522700', '522726', '独山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2557, '522700', '522727', '平塘县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2558, '522700', '522728', '罗甸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2559, '522700', '522729', '长顺县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2560, '522700', '522730', '龙里县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2561, '522700', '522731', '惠水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2562, '522700', '522732', '三都水族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2563, '000000', '530000', '云南省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2564, '530000', '530100', '昆明市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2565, '530100', '530102', '五华区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2566, '530100', '530103', '盘龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2567, '530100', '530111', '官渡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2568, '530100', '530112', '西山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2569, '530100', '530113', '东川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2570, '530100', '530114', '呈贡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2571, '530100', '530115', '晋宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2572, '530100', '530124', '富民县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2573, '530100', '530125', '宜良县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2574, '530100', '530126', '石林彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2575, '530100', '530127', '嵩明县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2576, '530100', '530128', '禄劝彝族苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2577, '530100', '530129', '寻甸回族彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2578, '530100', '530181', '安宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2579, '530000', '530300', '曲靖市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2580, '530300', '530302', '麒麟区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2581, '530300', '530303', '沾益区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2582, '530300', '530304', '马龙区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2583, '530300', '530322', '陆良县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2584, '530300', '530323', '师宗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2585, '530300', '530324', '罗平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2586, '530300', '530325', '富源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2587, '530300', '530326', '会泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2588, '530300', '530381', '宣威市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2589, '530000', '530400', '玉溪市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2590, '530400', '530402', '红塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2591, '530400', '530403', '江川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2592, '530400', '530423', '通海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2593, '530400', '530424', '华宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2594, '530400', '530425', '易门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2595, '530400', '530426', '峨山彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2596, '530400', '530427', '新平彝族傣族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2597, '530400', '530428', '元江哈尼族彝族傣族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2598, '530400', '530481', '澄江市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2599, '530000', '530500', '保山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2600, '530500', '530502', '隆阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2601, '530500', '530521', '施甸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2602, '530500', '530523', '龙陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2603, '530500', '530524', '昌宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2604, '530500', '530581', '腾冲市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2605, '530000', '530600', '昭通市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2606, '530600', '530602', '昭阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2607, '530600', '530621', '鲁甸县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2608, '530600', '530622', '巧家县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2609, '530600', '530623', '盐津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2610, '530600', '530624', '大关县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2611, '530600', '530625', '永善县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2612, '530600', '530626', '绥江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2613, '530600', '530627', '镇雄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2614, '530600', '530628', '彝良县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2615, '530600', '530629', '威信县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2616, '530600', '530681', '水富市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2617, '530000', '530700', '丽江市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2618, '530700', '530702', '古城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2619, '530700', '530721', '玉龙纳西族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2620, '530700', '530722', '永胜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2621, '530700', '530723', '华坪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2622, '530700', '530724', '宁蒗彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2623, '530000', '530800', '普洱市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2624, '530800', '530802', '思茅区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2625, '530800', '530821', '宁洱哈尼族彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2626, '530800', '530822', '墨江哈尼族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2627, '530800', '530823', '景东彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2628, '530800', '530824', '景谷傣族彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2629, '530800', '530825', '镇沅彝族哈尼族拉祜族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2630, '530800', '530826', '江城哈尼族彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2631, '530800', '530827', '孟连傣族拉祜族佤族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2632, '530800', '530828', '澜沧拉祜族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2633, '530800', '530829', '西盟佤族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2634, '530000', '530900', '临沧市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2635, '530900', '530902', '临翔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2636, '530900', '530921', '凤庆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2637, '530900', '530922', '云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2638, '530900', '530923', '永德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2639, '530900', '530924', '镇康县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2640, '530900', '530925', '双江拉祜族佤族布朗族傣族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2641, '530900', '530926', '耿马傣族佤族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2642, '530900', '530927', '沧源佤族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2643, '530000', '532300', '楚雄彝族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2644, '532300', '532301', '楚雄市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2645, '532300', '532322', '双柏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2646, '532300', '532323', '牟定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2647, '532300', '532324', '南华县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2648, '532300', '532325', '姚安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2649, '532300', '532326', '大姚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2650, '532300', '532327', '永仁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2651, '532300', '532328', '元谋县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2652, '532300', '532329', '武定县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2653, '532300', '532331', '禄丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2654, '530000', '532500', '红河哈尼族彝族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2655, '532500', '532501', '个旧市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2656, '532500', '532502', '开远市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2657, '532500', '532503', '蒙自市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2658, '532500', '532504', '弥勒市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2659, '532500', '532523', '屏边苗族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2660, '532500', '532524', '建水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2661, '532500', '532525', '石屏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2662, '532500', '532527', '泸西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2663, '532500', '532528', '元阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2664, '532500', '532529', '红河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2665, '532500', '532530', '金平苗族瑶族傣族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2666, '532500', '532531', '绿春县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2667, '532500', '532532', '河口瑶族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2668, '530000', '532600', '文山壮族苗族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2669, '532600', '532601', '文山市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2670, '532600', '532622', '砚山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2671, '532600', '532623', '西畴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2672, '532600', '532624', '麻栗坡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2673, '532600', '532625', '马关县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2674, '532600', '532626', '丘北县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2675, '532600', '532627', '广南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2676, '532600', '532628', '富宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2677, '530000', '532800', '西双版纳傣族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2678, '532800', '532801', '景洪市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2679, '532800', '532822', '勐海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2680, '532800', '532823', '勐腊县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2681, '530000', '532900', '大理白族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2682, '532900', '532901', '大理市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2683, '532900', '532922', '漾濞彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2684, '532900', '532923', '祥云县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2685, '532900', '532924', '宾川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2686, '532900', '532925', '弥渡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2687, '532900', '532926', '南涧彝族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2688, '532900', '532927', '巍山彝族回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2689, '532900', '532928', '永平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2690, '532900', '532929', '云龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2691, '532900', '532930', '洱源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2692, '532900', '532931', '剑川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2693, '532900', '532932', '鹤庆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2694, '530000', '533100', '德宏傣族景颇族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2695, '533100', '533102', '瑞丽市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2696, '533100', '533103', '芒市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2697, '533100', '533122', '梁河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2698, '533100', '533123', '盈江县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2699, '533100', '533124', '陇川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2700, '530000', '533300', '怒江傈僳族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2701, '533300', '533301', '泸水市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2702, '533300', '533323', '福贡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2703, '533300', '533324', '贡山独龙族怒族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2704, '533300', '533325', '兰坪白族普米族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2705, '530000', '533400', '迪庆藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2706, '533400', '533401', '香格里拉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2707, '533400', '533422', '德钦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2708, '533400', '533423', '维西傈僳族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2709, '000000', '540000', '西藏自治区', 1);
INSERT INTO `sys_administrative_division`
VALUES (2710, '540000', '540100', '拉萨市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2711, '540100', '540102', '城关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2712, '540100', '540103', '堆龙德庆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2713, '540100', '540104', '达孜区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2714, '540100', '540121', '林周县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2715, '540100', '540122', '当雄县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2716, '540100', '540123', '尼木县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2717, '540100', '540124', '曲水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2718, '540100', '540127', '墨竹工卡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2719, '540000', '540200', '日喀则市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2720, '540200', '540202', '桑珠孜区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2721, '540200', '540221', '南木林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2722, '540200', '540222', '江孜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2723, '540200', '540223', '定日县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2724, '540200', '540224', '萨迦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2725, '540200', '540225', '拉孜县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2726, '540200', '540226', '昂仁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2727, '540200', '540227', '谢通门县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2728, '540200', '540228', '白朗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2729, '540200', '540229', '仁布县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2730, '540200', '540230', '康马县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2731, '540200', '540231', '定结县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2732, '540200', '540232', '仲巴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2733, '540200', '540233', '亚东县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2734, '540200', '540234', '吉隆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2735, '540200', '540235', '聂拉木县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2736, '540200', '540236', '萨嘎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2737, '540200', '540237', '岗巴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2738, '540000', '540300', '昌都市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2739, '540300', '540302', '卡若区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2740, '540300', '540321', '江达县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2741, '540300', '540322', '贡觉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2742, '540300', '540323', '类乌齐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2743, '540300', '540324', '丁青县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2744, '540300', '540325', '察雅县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2745, '540300', '540326', '八宿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2746, '540300', '540327', '左贡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2747, '540300', '540328', '芒康县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2748, '540300', '540329', '洛隆县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2749, '540300', '540330', '边坝县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2750, '540000', '540400', '林芝市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2751, '540400', '540402', '巴宜区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2752, '540400', '540421', '工布江达县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2753, '540400', '540422', '米林县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2754, '540400', '540423', '墨脱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2755, '540400', '540424', '波密县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2756, '540400', '540425', '察隅县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2757, '540400', '540426', '朗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2758, '540000', '540500', '山南市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2759, '540500', '540502', '乃东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2760, '540500', '540521', '扎囊县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2761, '540500', '540522', '贡嘎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2762, '540500', '540523', '桑日县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2763, '540500', '540524', '琼结县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2764, '540500', '540525', '曲松县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2765, '540500', '540526', '措美县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2766, '540500', '540527', '洛扎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2767, '540500', '540528', '加查县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2768, '540500', '540529', '隆子县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2769, '540500', '540530', '错那县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2770, '540500', '540531', '浪卡子县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2771, '540000', '540600', '那曲市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2772, '540600', '540602', '色尼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2773, '540600', '540621', '嘉黎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2774, '540600', '540622', '比如县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2775, '540600', '540623', '聂荣县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2776, '540600', '540624', '安多县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2777, '540600', '540625', '申扎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2778, '540600', '540626', '索县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2779, '540600', '540627', '班戈县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2780, '540600', '540628', '巴青县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2781, '540600', '540629', '尼玛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2782, '540600', '540630', '双湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2783, '540000', '542500', '阿里地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (2784, '542500', '542521', '普兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2785, '542500', '542522', '札达县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2786, '542500', '542523', '噶尔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2787, '542500', '542524', '日土县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2788, '542500', '542525', '革吉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2789, '542500', '542526', '改则县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2790, '542500', '542527', '措勤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2791, '000000', '610000', '陕西省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2792, '610000', '610100', '西安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2793, '610100', '610102', '新城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2794, '610100', '610103', '碑林区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2795, '610100', '610104', '莲湖区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2796, '610100', '610111', '灞桥区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2797, '610100', '610112', '未央区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2798, '610100', '610113', '雁塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2799, '610100', '610114', '阎良区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2800, '610100', '610115', '临潼区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2801, '610100', '610116', '长安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2802, '610100', '610117', '高陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2803, '610100', '610118', '鄠邑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2804, '610100', '610122', '蓝田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2805, '610100', '610124', '周至县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2806, '610000', '610200', '铜川市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2807, '610200', '610202', '王益区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2808, '610200', '610203', '印台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2809, '610200', '610204', '耀州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2810, '610200', '610222', '宜君县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2811, '610000', '610300', '宝鸡市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2812, '610300', '610302', '渭滨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2813, '610300', '610303', '金台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2814, '610300', '610304', '陈仓区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2815, '610300', '610322', '凤翔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2816, '610300', '610323', '岐山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2817, '610300', '610324', '扶风县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2818, '610300', '610326', '眉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2819, '610300', '610327', '陇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2820, '610300', '610328', '千阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2821, '610300', '610329', '麟游县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2822, '610300', '610330', '凤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2823, '610300', '610331', '太白县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2824, '610000', '610400', '咸阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2825, '610400', '610402', '秦都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2826, '610400', '610403', '杨陵区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2827, '610400', '610404', '渭城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2828, '610400', '610422', '三原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2829, '610400', '610423', '泾阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2830, '610400', '610424', '乾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2831, '610400', '610425', '礼泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2832, '610400', '610426', '永寿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2833, '610400', '610428', '长武县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2834, '610400', '610429', '旬邑县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2835, '610400', '610430', '淳化县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2836, '610400', '610431', '武功县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2837, '610400', '610481', '兴平市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2838, '610400', '610482', '彬州市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2839, '610000', '610500', '渭南市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2840, '610500', '610502', '临渭区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2841, '610500', '610503', '华州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2842, '610500', '610522', '潼关县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2843, '610500', '610523', '大荔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2844, '610500', '610524', '合阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2845, '610500', '610525', '澄城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2846, '610500', '610526', '蒲城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2847, '610500', '610527', '白水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2848, '610500', '610528', '富平县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2849, '610500', '610581', '韩城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2850, '610500', '610582', '华阴市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2851, '610000', '610600', '延安市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2852, '610600', '610602', '宝塔区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2853, '610600', '610603', '安塞区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2854, '610600', '610621', '延长县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2855, '610600', '610622', '延川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2856, '610600', '610625', '志丹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2857, '610600', '610626', '吴起县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2858, '610600', '610627', '甘泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2859, '610600', '610628', '富县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2860, '610600', '610629', '洛川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2861, '610600', '610630', '宜川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2862, '610600', '610631', '黄龙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2863, '610600', '610632', '黄陵县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2864, '610600', '610681', '子长市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2865, '610000', '610700', '汉中市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2866, '610700', '610702', '汉台区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2867, '610700', '610703', '南郑区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2868, '610700', '610722', '城固县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2869, '610700', '610723', '洋县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2870, '610700', '610724', '西乡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2871, '610700', '610725', '勉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2872, '610700', '610726', '宁强县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2873, '610700', '610727', '略阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2874, '610700', '610728', '镇巴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2875, '610700', '610729', '留坝县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2876, '610700', '610730', '佛坪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2877, '610000', '610800', '榆林市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2878, '610800', '610802', '榆阳区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2879, '610800', '610803', '横山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2880, '610800', '610822', '府谷县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2881, '610800', '610824', '靖边县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2882, '610800', '610825', '定边县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2883, '610800', '610826', '绥德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2884, '610800', '610827', '米脂县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2885, '610800', '610828', '佳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2886, '610800', '610829', '吴堡县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2887, '610800', '610830', '清涧县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2888, '610800', '610831', '子洲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2889, '610800', '610881', '神木市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2890, '610000', '610900', '安康市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2891, '610900', '610902', '汉滨区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2892, '610900', '610921', '汉阴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2893, '610900', '610922', '石泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2894, '610900', '610923', '宁陕县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2895, '610900', '610924', '紫阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2896, '610900', '610925', '岚皋县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2897, '610900', '610926', '平利县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2898, '610900', '610927', '镇坪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2899, '610900', '610928', '旬阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2900, '610900', '610929', '白河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2901, '610000', '611000', '商洛市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2902, '611000', '611002', '商州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2903, '611000', '611021', '洛南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2904, '611000', '611022', '丹凤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2905, '611000', '611023', '商南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2906, '611000', '611024', '山阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2907, '611000', '611025', '镇安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2908, '611000', '611026', '柞水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2909, '000000', '620000', '甘肃省', 1);
INSERT INTO `sys_administrative_division`
VALUES (2910, '620000', '620100', '兰州市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2911, '620100', '620102', '城关区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2912, '620100', '620103', '七里河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2913, '620100', '620104', '西固区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2914, '620100', '620105', '安宁区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2915, '620100', '620111', '红古区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2916, '620100', '620121', '永登县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2917, '620100', '620122', '皋兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2918, '620100', '620123', '榆中县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2919, '620000', '620200', '嘉峪关市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2920, '620000', '620300', '金昌市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2921, '620300', '620302', '金川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2922, '620300', '620321', '永昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2923, '620000', '620400', '白银市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2924, '620400', '620402', '白银区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2925, '620400', '620403', '平川区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2926, '620400', '620421', '靖远县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2927, '620400', '620422', '会宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2928, '620400', '620423', '景泰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2929, '620000', '620500', '天水市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2930, '620500', '620502', '秦州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2931, '620500', '620503', '麦积区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2932, '620500', '620521', '清水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2933, '620500', '620522', '秦安县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2934, '620500', '620523', '甘谷县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2935, '620500', '620524', '武山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2936, '620500', '620525', '张家川回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2937, '620000', '620600', '武威市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2938, '620600', '620602', '凉州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2939, '620600', '620621', '民勤县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2940, '620600', '620622', '古浪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2941, '620600', '620623', '天祝藏族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2942, '620000', '620700', '张掖市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2943, '620700', '620702', '甘州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2944, '620700', '620721', '肃南裕固族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2945, '620700', '620722', '民乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2946, '620700', '620723', '临泽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2947, '620700', '620724', '高台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2948, '620700', '620725', '山丹县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2949, '620000', '620800', '平凉市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2950, '620800', '620802', '崆峒区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2951, '620800', '620821', '泾川县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2952, '620800', '620822', '灵台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2953, '620800', '620823', '崇信县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2954, '620800', '620825', '庄浪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2955, '620800', '620826', '静宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2956, '620800', '620881', '华亭市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2957, '620000', '620900', '酒泉市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2958, '620900', '620902', '肃州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2959, '620900', '620921', '金塔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2960, '620900', '620922', '瓜州县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2961, '620900', '620923', '肃北蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2962, '620900', '620924', '阿克塞哈萨克族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2963, '620900', '620981', '玉门市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2964, '620900', '620982', '敦煌市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2965, '620000', '621000', '庆阳市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2966, '621000', '621002', '西峰区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2967, '621000', '621021', '庆城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2968, '621000', '621022', '环县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2969, '621000', '621023', '华池县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2970, '621000', '621024', '合水县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2971, '621000', '621025', '正宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2972, '621000', '621026', '宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2973, '621000', '621027', '镇原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2974, '620000', '621100', '定西市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2975, '621100', '621102', '安定区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2976, '621100', '621121', '通渭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2977, '621100', '621122', '陇西县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2978, '621100', '621123', '渭源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2979, '621100', '621124', '临洮县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2980, '621100', '621125', '漳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2981, '621100', '621126', '岷县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2982, '620000', '621200', '陇南市', 2);
INSERT INTO `sys_administrative_division`
VALUES (2983, '621200', '621202', '武都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (2984, '621200', '621221', '成县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2985, '621200', '621222', '文县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2986, '621200', '621223', '宕昌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2987, '621200', '621224', '康县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2988, '621200', '621225', '西和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2989, '621200', '621226', '礼县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2990, '621200', '621227', '徽县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2991, '621200', '621228', '两当县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2992, '620000', '622900', '临夏回族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (2993, '622900', '622901', '临夏市', 3);
INSERT INTO `sys_administrative_division`
VALUES (2994, '622900', '622921', '临夏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2995, '622900', '622922', '康乐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2996, '622900', '622923', '永靖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2997, '622900', '622924', '广河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2998, '622900', '622925', '和政县', 3);
INSERT INTO `sys_administrative_division`
VALUES (2999, '622900', '622926', '东乡族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3000, '622900', '622927', '积石山保安族东乡族撒拉族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3001, '620000', '623000', '甘南藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3002, '623000', '623001', '合作市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3003, '623000', '623021', '临潭县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3004, '623000', '623022', '卓尼县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3005, '623000', '623023', '舟曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3006, '623000', '623024', '迭部县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3007, '623000', '623025', '玛曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3008, '623000', '623026', '碌曲县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3009, '623000', '623027', '夏河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3010, '000000', '630000', '青海省', 1);
INSERT INTO `sys_administrative_division`
VALUES (3011, '630000', '630100', '西宁市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3012, '630100', '630102', '城东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3013, '630100', '630103', '城中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3014, '630100', '630104', '城西区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3015, '630100', '630105', '城北区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3016, '630100', '630106', '湟中区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3017, '630100', '630121', '大通回族土族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3018, '630100', '630123', '湟源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3019, '630000', '630200', '海东市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3020, '630200', '630202', '乐都区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3021, '630200', '630203', '平安区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3022, '630200', '630222', '民和回族土族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3023, '630200', '630223', '互助土族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3024, '630200', '630224', '化隆回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3025, '630200', '630225', '循化撒拉族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3026, '630000', '632200', '海北藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3027, '632200', '632221', '门源回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3028, '632200', '632222', '祁连县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3029, '632200', '632223', '海晏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3030, '632200', '632224', '刚察县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3031, '630000', '632300', '黄南藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3032, '632300', '632301', '同仁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3033, '632300', '632322', '尖扎县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3034, '632300', '632323', '泽库县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3035, '632300', '632324', '河南蒙古族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3036, '630000', '632500', '海南藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3037, '632500', '632521', '共和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3038, '632500', '632522', '同德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3039, '632500', '632523', '贵德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3040, '632500', '632524', '兴海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3041, '632500', '632525', '贵南县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3042, '630000', '632600', '果洛藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3043, '632600', '632621', '玛沁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3044, '632600', '632622', '班玛县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3045, '632600', '632623', '甘德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3046, '632600', '632624', '达日县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3047, '632600', '632625', '久治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3048, '632600', '632626', '玛多县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3049, '630000', '632700', '玉树藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3050, '632700', '632701', '玉树市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3051, '632700', '632722', '杂多县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3052, '632700', '632723', '称多县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3053, '632700', '632724', '治多县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3054, '632700', '632725', '囊谦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3055, '632700', '632726', '曲麻莱县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3056, '630000', '632800', '海西蒙古族藏族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3057, '632800', '632801', '格尔木市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3058, '632800', '632802', '德令哈市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3059, '632800', '632803', '茫崖市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3060, '632800', '632821', '乌兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3061, '632800', '632822', '都兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3062, '632800', '632823', '天峻县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3063, '000000', '640000', '宁夏回族自治区', 1);
INSERT INTO `sys_administrative_division`
VALUES (3064, '640000', '640100', '银川市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3065, '640100', '640104', '兴庆区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3066, '640100', '640105', '西夏区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3067, '640100', '640106', '金凤区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3068, '640100', '640121', '永宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3069, '640100', '640122', '贺兰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3070, '640100', '640181', '灵武市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3071, '640000', '640200', '石嘴山市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3072, '640200', '640202', '大武口区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3073, '640200', '640205', '惠农区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3074, '640200', '640221', '平罗县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3075, '640000', '640300', '吴忠市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3076, '640300', '640302', '利通区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3077, '640300', '640303', '红寺堡区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3078, '640300', '640323', '盐池县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3079, '640300', '640324', '同心县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3080, '640300', '640381', '青铜峡市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3081, '640000', '640400', '固原市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3082, '640400', '640402', '原州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3083, '640400', '640422', '西吉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3084, '640400', '640423', '隆德县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3085, '640400', '640424', '泾源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3086, '640400', '640425', '彭阳县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3087, '640000', '640500', '中卫市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3088, '640500', '640502', '沙坡头区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3089, '640500', '640521', '中宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3090, '640500', '640522', '海原县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3091, '000000', '650000', '新疆维吾尔自治区', 1);
INSERT INTO `sys_administrative_division`
VALUES (3092, '650000', '650100', '乌鲁木齐市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3093, '650100', '650102', '天山区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3094, '650100', '650103', '沙依巴克区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3095, '650100', '650104', '新市区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3096, '650100', '650105', '水磨沟区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3097, '650100', '650106', '头屯河区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3098, '650100', '650107', '达坂城区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3099, '650100', '650109', '米东区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3100, '650100', '650121', '乌鲁木齐县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3101, '650000', '650200', '克拉玛依市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3102, '650200', '650202', '独山子区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3103, '650200', '650203', '克拉玛依区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3104, '650200', '650204', '白碱滩区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3105, '650200', '650205', '乌尔禾区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3106, '650000', '650400', '吐鲁番市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3107, '650400', '650402', '高昌区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3108, '650400', '650421', '鄯善县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3109, '650400', '650422', '托克逊县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3110, '650000', '650500', '哈密市', 2);
INSERT INTO `sys_administrative_division`
VALUES (3111, '650500', '650502', '伊州区', 3);
INSERT INTO `sys_administrative_division`
VALUES (3112, '650500', '650521', '巴里坤哈萨克自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3113, '650500', '650522', '伊吾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3114, '650000', '652300', '昌吉回族自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3115, '652300', '652301', '昌吉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3116, '652300', '652302', '阜康市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3117, '652300', '652323', '呼图壁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3118, '652300', '652324', '玛纳斯县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3119, '652300', '652325', '奇台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3120, '652300', '652327', '吉木萨尔县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3121, '652300', '652328', '木垒哈萨克自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3122, '650000', '652700', '博尔塔拉蒙古自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3123, '652700', '652701', '博乐市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3124, '652700', '652702', '阿拉山口市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3125, '652700', '652722', '精河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3126, '652700', '652723', '温泉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3127, '650000', '652800', '巴音郭楞蒙古自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3128, '652800', '652801', '库尔勒市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3129, '652800', '652822', '轮台县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3130, '652800', '652823', '尉犁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3131, '652800', '652824', '若羌县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3132, '652800', '652825', '且末县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3133, '652800', '652826', '焉耆回族自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3134, '652800', '652827', '和静县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3135, '652800', '652828', '和硕县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3136, '652800', '652829', '博湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3137, '650000', '652900', '阿克苏地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3138, '652900', '652901', '阿克苏市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3139, '652900', '652902', '库车市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3140, '652900', '652922', '温宿县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3141, '652900', '652924', '沙雅县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3142, '652900', '652925', '新和县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3143, '652900', '652926', '拜城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3144, '652900', '652927', '乌什县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3145, '652900', '652928', '阿瓦提县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3146, '652900', '652929', '柯坪县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3147, '650000', '653000', '克孜勒苏柯尔克孜自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3148, '653000', '653001', '阿图什市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3149, '653000', '653022', '阿克陶县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3150, '653000', '653023', '阿合奇县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3151, '653000', '653024', '乌恰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3152, '650000', '653100', '喀什地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3153, '653100', '653101', '喀什市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3154, '653100', '653121', '疏附县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3155, '653100', '653122', '疏勒县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3156, '653100', '653123', '英吉沙县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3157, '653100', '653124', '泽普县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3158, '653100', '653125', '莎车县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3159, '653100', '653126', '叶城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3160, '653100', '653127', '麦盖提县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3161, '653100', '653128', '岳普湖县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3162, '653100', '653129', '伽师县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3163, '653100', '653130', '巴楚县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3164, '653100', '653131', '塔什库尔干塔吉克自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3165, '650000', '653200', '和田地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3166, '653200', '653201', '和田市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3167, '653200', '653221', '和田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3168, '653200', '653222', '墨玉县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3169, '653200', '653223', '皮山县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3170, '653200', '653224', '洛浦县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3171, '653200', '653225', '策勒县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3172, '653200', '653226', '于田县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3173, '653200', '653227', '民丰县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3174, '650000', '654000', '伊犁哈萨克自治州', 2);
INSERT INTO `sys_administrative_division`
VALUES (3175, '654000', '654002', '伊宁市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3176, '654000', '654003', '奎屯市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3177, '654000', '654004', '霍尔果斯市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3178, '654000', '654021', '伊宁县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3179, '654000', '654022', '察布查尔锡伯自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3180, '654000', '654023', '霍城县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3181, '654000', '654024', '巩留县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3182, '654000', '654025', '新源县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3183, '654000', '654026', '昭苏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3184, '654000', '654027', '特克斯县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3185, '654000', '654028', '尼勒克县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3186, '650000', '654200', '塔城地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3187, '654200', '654201', '塔城市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3188, '654200', '654202', '乌苏市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3189, '654200', '654221', '额敏县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3190, '654200', '654223', '沙湾县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3191, '654200', '654224', '托里县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3192, '654200', '654225', '裕民县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3193, '654200', '654226', '和布克赛尔蒙古自治县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3194, '650000', '654300', '阿勒泰地区', 2);
INSERT INTO `sys_administrative_division`
VALUES (3195, '654300', '654301', '阿勒泰市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3196, '654300', '654321', '布尔津县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3197, '654300', '654322', '富蕴县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3198, '654300', '654323', '福海县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3199, '654300', '654324', '哈巴河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3200, '654300', '654325', '青河县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3201, '654300', '654326', '吉木乃县', 3);
INSERT INTO `sys_administrative_division`
VALUES (3202, '659000', '659001', '石河子市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3203, '659000', '659002', '阿拉尔市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3204, '659000', '659003', '图木舒克市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3205, '659000', '659004', '五家渠市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3206, '659000', '659005', '北屯市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3207, '659000', '659006', '铁门关市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3208, '659000', '659007', '双河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3209, '659000', '659008', '可克达拉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3210, '659000', '659009', '昆玉市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3211, '659000', '659010', '胡杨河市', 3);
INSERT INTO `sys_administrative_division`
VALUES (3212, '000000', '710000', '台湾省', 1);
INSERT INTO `sys_administrative_division`
VALUES (3213, '000000', '810000', '香港特别行政区', 1);
INSERT INTO `sys_administrative_division`
VALUES (3214, '000000', '820000', '澳门特别行政区', 1);

-- ----------------------------
-- Table structure for sys_data_catalog
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_catalog`;
CREATE TABLE `sys_data_catalog`
(
    `id`             varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
    `catalog_code`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录编码',
    `catalog_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录名称',
    `description`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
    `status`         smallint(1) NOT NULL COMMENT '状态 0：禁用，1：启用',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`    datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `index_catalog_code`(`catalog_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典目录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_data_catalog
-- ----------------------------
INSERT INTO `sys_data_catalog`
VALUES ('20c7b18612d711edbcd4000c298f5d36', 'spending_type', '支出类型', '账单模块——支出类型目录', 1, NULL,
        '2022-08-03 10:51:09', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_data_catalog_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_catalog_item`;
CREATE TABLE `sys_data_catalog_item`
(
    `id`             varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
    `catalog_id`     varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录id',
    `item_code`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '条目编码',
    `item_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '条目名称',
    `sort`           smallint(1) NULL DEFAULT 0 COMMENT '排序',
    `status`         smallint(1) NOT NULL DEFAULT 1 COMMENT '状态 0：禁用，1：启用',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `index_catalog_id`(`catalog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典条目表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_data_catalog_item
-- ----------------------------
INSERT INTO `sys_data_catalog_item`
VALUES ('8fe772d312d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '0', '其他', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8fee6da012d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '1', '餐饮', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff187a512d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '2', '交通', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff369c412d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '3', '房租', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff3c48e12d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '4', '娱乐', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff40f8b12d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '5', '通讯', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff4764c12d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '6', '学习', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);
INSERT INTO `sys_data_catalog_item`
VALUES ('8ff4be8112d611edbcd4000c298f5d36', '20c7b18612d711edbcd4000c298f5d36', '7', '购物', 0, 1, NULL,
        '2022-08-03 10:47:35', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_logs`;
CREATE TABLE `sys_login_logs`
(
    `id`            varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '主键id',
    `account`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
    `login_type`    int(1) NOT NULL DEFAULT 1 COMMENT '登录方式 （1：账号密码登录、2：邮箱快捷登录、3：扫码登录）',
    `login_time`    datetime                                                      NOT NULL COMMENT '登录时间',
    `login_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录地点',
    `login_ip`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '登录IP',
    `remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`   datetime                                                      NOT NULL,
    `update_time`   datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
INSERT INTO `sys_login_logs`
VALUES ('066bec047be640549a17e37b009eca0c', 'SuperAdmin', 1, '2022-02-09 16:27:54', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 16:27:54', NULL);
INSERT INTO `sys_login_logs`
VALUES ('0b44a113d401477ea34d8f9f2b70545b', 'SuperAdmin', 1, '2022-03-29 10:14:14', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-29 10:14:14', NULL);
INSERT INTO `sys_login_logs`
VALUES ('0f65f77d388f463792f99d3f177a3eba', 'SuperAdmin', 1, '2022-04-02 11:06:00', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 11:06:00', NULL);
INSERT INTO `sys_login_logs`
VALUES ('101d2e39ab574ff19a788cef1f48bed9', 'SuperAdmin', 1, '2022-02-09 11:12:59', '广州市越秀区', '192', '登录成功',
        '2022-02-09 11:12:59', NULL);
INSERT INTO `sys_login_logs`
VALUES ('11d09f6bd16542eebe2f66ae5c06720b', 'SuperAdmin', 1, '2022-05-16 09:51:10', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-16 09:51:10', NULL);
INSERT INTO `sys_login_logs`
VALUES ('13f675b898b3407a8101889867276ca6', 'SuperAdmin', 1, '2022-04-12 17:07:50', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 17:07:50', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1c81e57c4ac1415eb3062fb2d9d6967b', 'SuperAdmin', 1, '2022-05-13 17:31:44', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:31:44', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1ca9ad8d0053415b80d859aacdce1ea4', 'SuperAdmin', 1, '2022-04-02 10:55:22', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 10:55:22', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1d073f623762478eb5bba0f0b46d1e13', 'SuperAdmin', 1, '2022-02-09 12:06:30', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 12:06:30', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1d99e545f2c84a63a9e6699324706320', 'SuperAdmin', 1, '2022-04-16 12:11:35', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-16 12:11:35', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1f17448c2f0748899c3119b72d5593ee', 'SuperAdmin', 1, '2022-02-09 15:20:33', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 15:20:33', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1f20da977f324b3da9a0de7a3a8444bc', 'SuperAdmin', 1, '2022-02-09 11:11:44', '广州市越秀区', '192', '登录成功',
        '2022-02-09 11:11:44', NULL);
INSERT INTO `sys_login_logs`
VALUES ('207da818c3bb45eca234f4a6b1d0b323', 'SuperAdmin', 1, '2022-03-28 17:53:36', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-28 17:53:36', NULL);
INSERT INTO `sys_login_logs`
VALUES ('2304a07bff4443bf9c992163763d6080', 'SuperAdmin', 1, '2022-02-11 10:00:27', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 10:00:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('2651460be8a848b98d86696b24f64870', 'SuperAdmin', 1, '2022-02-11 10:00:35', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 10:00:35', NULL);
INSERT INTO `sys_login_logs`
VALUES ('2c0825a04f104f2c8be5e170742d5357', 'liudong', 1, '2022-01-30 22:45:18', '江西丰城', '192', NULL,
        '2022-01-30 22:45:18', NULL);
INSERT INTO `sys_login_logs`
VALUES ('2c6daebd0e5a45cc981adc906cc56fb4', 'SuperAdmin', 1, '2022-04-02 10:41:15', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 10:41:15', NULL);
INSERT INTO `sys_login_logs`
VALUES ('324b7b95032f4aa4bb08f4ef127f347c', 'SuperAdmin', 1, '2022-02-09 12:05:30', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 12:05:30', NULL);
INSERT INTO `sys_login_logs`
VALUES ('37da6efa50b944ec8dac5b35e6a2d864', 'SuperAdmin', 1, '2022-04-18 14:37:38', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 14:37:38', NULL);
INSERT INTO `sys_login_logs`
VALUES ('3b640158b49c435f85be430c9ba0f7eb', 'SuperAdmin', 1, '2022-02-09 11:55:12', '广州市越秀区', '0:0:0:0:0:0:0:1',
        '登录成功', '2022-02-09 11:55:12', NULL);
INSERT INTO `sys_login_logs`
VALUES ('3ed37f39d4f546c5ab3c1b1dc484c600', 'SuperAdmin', 1, '2022-03-28 17:57:27', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-28 17:57:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('40c5241cb2a34bf78d3cf128d1fd9eb8', 'SuperAdmin', 1, '2022-02-09 11:35:29', '广州市越秀区', '192', '登录成功',
        '2022-02-09 11:35:29', NULL);
INSERT INTO `sys_login_logs`
VALUES ('41577751704b4be08f2e8c26ffeaebf3', 'SuperAdmin', 1, '2022-02-09 12:05:03', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 12:05:03', NULL);
INSERT INTO `sys_login_logs`
VALUES ('43a30ea127014b2e928326c6e9d22582', 'SuperAdmin', 1, '2022-05-13 14:22:40', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 14:22:40', NULL);
INSERT INTO `sys_login_logs`
VALUES ('44cc7b9bf14949d88984049cb6233e69', 'SuperAdmin', 1, '2022-02-09 12:00:38', '广州市越秀区', '192.168.137.1',
        '登录成功', '2022-02-09 12:00:38', NULL);
INSERT INTO `sys_login_logs`
VALUES ('4957269d055747908df68196d9eb4fec', 'SuperAdmin', 1, '2022-02-11 17:55:59', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 17:55:59', NULL);
INSERT INTO `sys_login_logs`
VALUES ('516e960d0dad4d89b12edb13ed19dc6f', 'SuperAdmin', 1, '2022-03-17 09:59:40', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-17 09:59:40', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5569206dd13f418aabf9e6cc08f20eda', 'SuperAdmin', 1, '2022-02-09 15:20:21', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 15:20:21', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5ae9776f0a994697aa3bb908300329a4', 'SuperAdmin', 1, '2022-02-11 09:50:41', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 09:50:41', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5c36fe42467a4de69b8f4be4d8fb9951', 'SuperAdmin', 1, '2022-02-11 17:57:36', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 17:57:36', NULL);
INSERT INTO `sys_login_logs`
VALUES ('6b78fba0f99d4126816d351d7dbef4ea', 'SuperAdmin', 1, '2022-05-12 14:44:23', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-12 14:44:23', NULL);
INSERT INTO `sys_login_logs`
VALUES ('6e65fbe083384ceab7284c3fe793bf41', 'SuperAdmin', 1, '2022-04-18 09:59:39', '广州市越秀区', '192.168.137.1',
        '登录成功', '2022-04-18 09:59:39', NULL);
INSERT INTO `sys_login_logs`
VALUES ('70e3e976872d416db7802fac12d17816', 'SuperAdmin', 1, '2022-04-12 14:58:01', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 14:58:01', NULL);
INSERT INTO `sys_login_logs`
VALUES ('71e2ed0976704429bcdb870d2dd8be2e', 'SuperAdmin', 1, '2022-02-09 11:43:50', '广州市越秀区', '0:0:0:0:0:0:0:1',
        '登录成功', '2022-02-09 11:43:50', NULL);
INSERT INTO `sys_login_logs`
VALUES ('7c9dc566be05415d84052573d3f6eef4', 'SuperAdmin', 1, '2022-02-09 16:26:42', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 16:26:42', NULL);
INSERT INTO `sys_login_logs`
VALUES ('7e03e427f3054485a51f4a8a4537aee3', 'SuperAdmin', 1, '2022-05-13 11:08:45', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 11:08:45', NULL);
INSERT INTO `sys_login_logs`
VALUES ('8113f540b30f4b89be2ab3490b150134', 'SuperAdmin', 1, '2022-04-02 10:44:00', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 10:44:00', NULL);
INSERT INTO `sys_login_logs`
VALUES ('89864e7094a24eff85fe31f7cb6ec81f', 'SuperAdmin', 1, '2022-04-12 10:40:42', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 10:40:42', NULL);
INSERT INTO `sys_login_logs`
VALUES ('9563e36cd29b4cb688fec13b7d518584', 'SuperAdmin', 1, '2022-04-18 15:21:05', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 15:21:05', NULL);
INSERT INTO `sys_login_logs`
VALUES ('9a6fae1b12c249ea962b80d3067f703e', 'SuperAdmin', 1, '2022-03-28 17:57:25', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-28 17:57:25', NULL);
INSERT INTO `sys_login_logs`
VALUES ('a0ab1b883fb0465fa8215c6d8aa55cce', 'SuperAdmin', 1, '2022-05-13 15:07:36', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 15:07:36', NULL);
INSERT INTO `sys_login_logs`
VALUES ('a21ea9e4393b498a8a0feb455e1489ff', 'SuperAdmin', 1, '2022-04-01 17:09:27', '广州市越秀区', '2.0.11.172',
        '登录成功', '2022-04-01 17:09:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('a24673b651db4f81b49a0aecee48e637', 'SuperAdmin', 1, '2022-03-28 17:57:27', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-28 17:57:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('ac8a7d82fff741ed99db5af941229762', 'SuperAdmin', 1, '2022-05-12 14:38:06', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-12 14:38:06', NULL);
INSERT INTO `sys_login_logs`
VALUES ('aedecddcfcc642958875689c9d8b1305', 'SuperAdmin', 1, '2022-05-13 11:37:07', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 11:37:07', NULL);
INSERT INTO `sys_login_logs`
VALUES ('b51951c6eaee4de8998a686f06bfd5c5', 'SuperAdmin', 1, '2022-02-11 09:30:28', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 09:30:28', NULL);
INSERT INTO `sys_login_logs`
VALUES ('b55b9f54c3374ef69e247d521ff7169f', 'SuperAdmin', 1, '2022-02-11 17:56:21', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 17:56:21', NULL);
INSERT INTO `sys_login_logs`
VALUES ('b6ec1aef8b0d43239c68998081252c97', 'SuperAdmin', 1, '2022-02-09 16:30:02', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 16:30:02', NULL);
INSERT INTO `sys_login_logs`
VALUES ('b70d8d28f34e4af784d66bda2477ecba', 'SuperAdmin', 1, '2022-04-01 17:45:26', '广州市越秀区', '2.0.11.172',
        '登录成功', '2022-04-01 17:45:26', NULL);
INSERT INTO `sys_login_logs`
VALUES ('bf50b8df07324a9199f221787cc38aa9', 'SuperAdmin', 1, '2022-04-02 11:07:46', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 11:07:46', NULL);
INSERT INTO `sys_login_logs`
VALUES ('c0d1dcf0312447588171fa10ee91e363', 'SuperAdmin', 1, '2022-02-11 14:56:51', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 14:56:51', NULL);
INSERT INTO `sys_login_logs`
VALUES ('c3a3b0adf8b94e93b6bd5bff3c3940e2', 'SuperAdmin', 1, '2022-05-13 15:16:03', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 15:16:03', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d337a17a509d4964a97d1315339baa10', 'liudong', 2, '2022-01-30 22:45:34', '江西丰城', '192', NULL,
        '2022-01-30 22:45:34', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d509db3beab74a48966806102a613eb6', 'SuperAdmin', 1, '2022-05-16 09:51:10', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-16 09:51:10', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d7d7f4f18fbc42bf93dd7499ca77ea71', 'SuperAdmin', 1, '2022-05-13 10:59:04', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 10:59:04', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d9fe616ffd6d49068ee6baabb4f08f87', 'SuperAdmin', 1, '2022-04-18 17:21:55', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 17:21:55', NULL);
INSERT INTO `sys_login_logs`
VALUES ('dbadb804b1c04989aa1fb13cbf02811f', 'SuperAdmin', 1, '2022-02-11 09:51:47', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 09:51:47', NULL);
INSERT INTO `sys_login_logs`
VALUES ('dbd5a091e79a4a66bdce50c283ed64f0', 'SuperAdmin', 1, '2022-04-12 16:28:27', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 16:28:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('dd2793c19fa6436e8612f629b6ea8e39', 'SuperAdmin', 1, '2022-02-09 10:58:41', '广州市越秀区', '192', NULL,
        '2022-02-09 10:58:41', NULL);
INSERT INTO `sys_login_logs`
VALUES ('df324669e0514577abc459458bbb58e8', 'SuperAdmin', 1, '2022-04-05 16:01:28', '广州市越秀区', '192.168.0.104',
        '登录成功', '2022-04-05 16:01:28', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e106542fb0724ca3ad999978ef34258f', 'SuperAdmin', 1, '2022-02-09 16:35:57', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 16:35:57', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e17a6721dbad47afa98a581d81405e31', 'SuperAdmin', 1, '2022-04-02 11:03:19', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 11:03:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e224e6990a2e4481a21c4114adf1be00', 'SuperAdmin', 1, '2022-02-09 16:29:04', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-09 16:29:04', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e6b2e41db57646d4ae8266ac51cdfae9', 'SuperAdmin', 1, '2022-02-10 15:07:52', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-10 15:07:52', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e76ac1ac24ba4e588854ba52195d39a4', 'SuperAdmin', 1, '2022-04-12 16:05:08', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 16:05:08', NULL);
INSERT INTO `sys_login_logs`
VALUES ('ee0588a70b034a3ebc44696580eb099e', 'SuperAdmin', 1, '2022-02-11 10:07:48', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-02-11 10:07:48', NULL);
INSERT INTO `sys_login_logs`
VALUES ('f2393f37fe434a75aec2409f95e4a756', 'SuperAdmin', 1, '2022-03-29 09:37:03', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-03-29 09:37:03', NULL);
INSERT INTO `sys_login_logs`
VALUES ('fae5c13d8b014abd9de6180295358485', 'SuperAdmin', 1, '2022-05-13 15:13:51', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 15:13:51', NULL);
INSERT INTO `sys_login_logs`
VALUES ('fc9dbc0ca98548319e812eb457ed34e1', 'SuperAdmin', 1, '2022-04-05 00:21:13', '广州市越秀区', '192.168.0.104',
        '登录成功', '2022-04-05 00:21:13', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`          varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `parent_id`   varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
    `menu_level`  int(1) NOT NULL DEFAULT 1 COMMENT '菜单所在的层级',
    `menu_icon`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图标样式',
    `menu_order`  int(1) NULL DEFAULT 0 COMMENT '菜单显示顺序',
    `menu_url`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单链接，没有用“#”表示',
    `menu_path`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
    `menu_status` int(1) NULL DEFAULT 1 COMMENT '菜单状态 0：不显示、1：显示',
    `has_child`   int(1) NOT NULL DEFAULT 0 COMMENT '是否有子菜单 0：无 1：有',
    `create_time` datetime                                               NOT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES ('06c7e1107c0911ea851100ff54d246f9', 'd3d9e5e07c0811ea851100ff54d246f9', '菜单列表', 2, 'fa fa fa-institution',
        1, '/menuList', '/菜单管理/菜单列表', 1, 0, '2020-04-11 23:27:41', '2021-08-17 17:10:39');
INSERT INTO `sys_menu`
VALUES ('19a2f346e74245e0a8d73f3425342d24', '1', '订单管理', 1, '', 22, '/', '/订单管理', 1, 1, '2021-01-14 16:45:49',
        '2021-01-14 16:46:14');
INSERT INTO `sys_menu`
VALUES ('2412e00fef4f4bf184269fd026e44898', 'd6144b9cc4d143eab50ba969dc11a230', '单位列表', 2, '', 1, '/orgList',
        '/单位管理/单位列表', 1, 0, '2022-02-09 16:52:10', '2022-04-05 16:02:48');
INSERT INTO `sys_menu`
VALUES ('2b53a969f12144c38457ad0dfdc1f3d0', '96d910ecf9054df8bdf605dac90fb16c', '测试三级菜单', 3, '', 1, '/', '/', 1,
        0, '2021-07-16 18:32:48', '2021-07-16 18:32:48');
INSERT INTO `sys_menu`
VALUES ('329deababc1a4a7fbb898dd3fad0e1d2', '1', '权限管理', 1, '', 4, '/', '/权限管理', 1, 1, '2021-08-02 11:39:28',
        '2021-08-02 11:40:31');
INSERT INTO `sys_menu`
VALUES ('3373c048cfde4321b0d6d52f792e5613', '85368030064346238f66d8cbcd068106', '数据字典列表', 2, '', 1,
        '/dictionaryList', '/数据字典/数据字典列表', 1, 0, '2021-05-28 18:11:33', '2021-08-11 19:56:49');
INSERT INTO `sys_menu`
VALUES ('3c00fad6e46f4142804b1421190ab2a2', '721ab33d901346cca58c54c7f64e1664', '人员列表', 2, '', 1, '/personList',
        '/人员管理/人员列表', 1, 0, '2020-11-26 16:13:57', '2020-11-26 16:18:31');
INSERT INTO `sys_menu`
VALUES ('47e4c6d174df40babce84fb10d76fd3f', '1', '角色管理', 1, '', 3, '/', '/角色管理', 1, 1, '2020-11-26 16:12:21',
        '2020-11-26 16:13:03');
INSERT INTO `sys_menu`
VALUES ('4995d6ed8b424258bbce1e3554159011', '1', '模块管理', 1, '', 31, '/', '/模块管理', 1, 1, '2020-12-12 15:12:07',
        '2020-12-12 15:12:21');
INSERT INTO `sys_menu`
VALUES ('4ea07aac6f3f11eaa28400ff54d246f9', 'f98889f86f3d11eaa28400ff54d246f9', '账号列表', 2, 'fa fa fa-user-secret',
        1, '/accountList', '/账号管理/账号列表', 1, 0, '2020-03-26 16:53:34', '2020-11-25 22:35:54');
INSERT INTO `sys_menu`
VALUES ('4ea793bc6f3f11eaa28400ff54d246f9', '47e4c6d174df40babce84fb10d76fd3f', '角色列表', 2, 'fa fa-user-circle-o', 2,
        '/roleList', '/角色管理/角色列表', 1, 0, '2020-03-26 16:53:34', '2020-11-26 16:12:35');
INSERT INTO `sys_menu`
VALUES ('62cecac21da8469f906220b20e26e848', '329deababc1a4a7fbb898dd3fad0e1d2', '权限列表', 2, '', 1, '/permissionList',
        '/权限管理/权限列表', 1, 0, '2021-08-02 11:40:09', '2021-08-12 11:22:30');
INSERT INTO `sys_menu`
VALUES ('6b6ee4ab1cab4a76a12cd5e425612a96', 'd3d9e5e07c0811ea851100ff54d246f9', '菜单树', 2, '', 2, '/menuTree',
        '/菜单管理/菜单树', 1, 0, '2021-07-16 11:36:31', '2021-07-16 11:36:46');
INSERT INTO `sys_menu`
VALUES ('721ab33d901346cca58c54c7f64e1664', '1', '人员管理', 1, 'img', 5, '/', '/人员管理', 1, 1, '2020-11-25 22:55:31',
        '2020-11-26 16:11:14');
INSERT INTO `sys_menu`
VALUES ('7565856ed2a140f387348acd5fe818a1', '329deababc1a4a7fbb898dd3fad0e1d2', '权限树', 2, '', 2, '/permissionTree',
        '/权限管理/权限树', 1, 0, '2021-08-12 11:24:12', '2021-08-12 11:24:12');
INSERT INTO `sys_menu`
VALUES ('7f8b82d96a124b8ea44ec3d09c20657d', '73829acd08374584b10360da6a32e66d', '测试二级菜单2', 2, '', 1,
        '测试二级菜单2', '测试二级菜单2', 1, 0, '2021-07-19 15:26:57', '2021-07-19 15:26:57');
INSERT INTO `sys_menu`
VALUES ('85368030064346238f66d8cbcd068106', '1', '数据字典', 1, '', 99, '/', '/数据字典', 1, 1, '2021-05-28 18:09:07',
        '2021-05-28 18:09:33');
INSERT INTO `sys_menu`
VALUES ('8d112eace99d455e9ee59970f1a48299', '4995d6ed8b424258bbce1e3554159011', '生成代码', 2, '', 2, '/generatorView',
        '/模块管理/生成代码', 1, 0, '2020-12-12 15:13:33', '2020-12-12 15:13:33');
INSERT INTO `sys_menu`
VALUES ('9437557a6b634a7d82938c1f8ecdcb59', '19a2f346e74245e0a8d73f3425342d24', '订单列表', 2, '', 1, '/orderList',
        '/订单管理/订单列表', 1, 0, '2021-01-14 16:47:15', '2021-01-14 16:47:15');
INSERT INTO `sys_menu`
VALUES ('96d910ecf9054df8bdf605dac90fb16c', '4995d6ed8b424258bbce1e3554159011', '模板管理', 2, '', 3, '/templateView',
        '/模块管理/模板管理', 1, 1, '2020-12-12 15:15:34', '2021-07-16 18:32:16');
INSERT INTO `sys_menu`
VALUES ('a89469ce76cb4fbe8e82842594953507', '73829acd08374584b10360da6a32e66d', '测试二级菜单3', 2, '', 1,
        '测试二级菜单3', '测试二级菜单3', 1, 0, '2021-07-19 15:27:13', '2021-07-19 15:27:13');
INSERT INTO `sys_menu`
VALUES ('c6c732e6a55b4bbc8d3d606cbccffc5c', '4995d6ed8b424258bbce1e3554159011', '生成结果', 2, '', 1,
        '/generatorResultView', '/模块管理/生成结果', 1, 0, '2020-12-12 15:14:31', '2020-12-12 15:14:31');
INSERT INTO `sys_menu`
VALUES ('d3d9e5e07c0811ea851100ff54d246f9', '1', '菜单管理', 1, 'fa fa fa-institution', 1, '/', '/菜单管理', 1, 1,
        '2020-04-11 23:26:16', '2020-11-26 16:10:23');
INSERT INTO `sys_menu`
VALUES ('d6144b9cc4d143eab50ba969dc11a230', '1', '单位管理', 1, '', 10, '/company', '/单位管理', 1, 1,
        '2022-02-09 16:50:56', '2022-02-09 16:52:29');
INSERT INTO `sys_menu`
VALUES ('f2b77ba107b34d1f98f5d79d7c7c39b1', '1', '商品管理', 1, 'img', 21, '/', '/商品管理', 1, 1,
        '2020-11-28 13:08:17', '2020-11-28 13:08:17');
INSERT INTO `sys_menu`
VALUES ('f6bb1eeef206479f877969ca29331fe6', 'f2b77ba107b34d1f98f5d79d7c7c39b1', '商品列表', 2, 'img', 1, '/productList',
        '/商品管理/商品列表', 1, 0, '2020-11-28 13:09:12', '2020-11-28 13:09:43');
INSERT INTO `sys_menu`
VALUES ('f98889f86f3d11eaa28400ff54d246f9', '1', '账号管理', 1, 'fa fa fa-user-secret', 2, '/', '/账号管理', 1, 1,
        '2020-03-26 16:44:02', '2020-11-26 16:10:44');

-- ----------------------------
-- Table structure for sys_operate_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_logs`;
CREATE TABLE `sys_operate_logs`
(
    `id`             varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '主键id',
    `account`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作账号',
    `operate_type`   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '1' COMMENT '操作类型 （add：新增、delete：删除、update：修改、select：查询）',
    `operate_time`   datetime                                                      NOT NULL COMMENT '操作时间',
    `module_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '模块名称',
    `module_code`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '模块编码',
    `operate_object` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作对象',
    `login_ip`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
    `content`        varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作内容',
    `create_time`    datetime                                                      NOT NULL,
    `update_time`    datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operate_logs
-- ----------------------------
INSERT INTO `sys_operate_logs`
VALUES ('00b06315ec26489e98926e3259492e59', 'SuperAdmin', 'select', '2022-04-18 16:39:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:39:20', '2022-04-18 16:39:20');
INSERT INTO `sys_operate_logs`
VALUES ('0150d346145f484fb0baa95124e153c3', 'SuperAdmin', 'select', '2022-04-12 17:12:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:12:35', '2022-04-12 17:12:35');
INSERT INTO `sys_operate_logs`
VALUES ('016aa92c00424c9fa4000b199610f6be', 'SuperAdmin', 'select', '2022-05-13 11:08:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 11:08:45',
        '2022-05-13 11:08:45');
INSERT INTO `sys_operate_logs`
VALUES ('01d5030930964d9a8363a9c4752f406b', 'SuperAdmin', 'select', '2022-04-12 16:40:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:40:51', '2022-04-12 16:40:51');
INSERT INTO `sys_operate_logs`
VALUES ('0219c0a59d1b4970957a6c65a54620bc', 'SuperAdmin', 'select', '2022-04-12 18:14:21', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:14:21', '2022-04-12 18:14:21');
INSERT INTO `sys_operate_logs`
VALUES ('0253e2e52e4d465880d3808bc13887e6', 'SuperAdmin', 'select', '2022-04-18 16:30:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:53', '2022-04-18 16:30:53');
INSERT INTO `sys_operate_logs`
VALUES ('0294332d75774748a2d10e7bbc07870f', 'SuperAdmin', 'select', '2022-04-18 17:28:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:20', '2022-04-18 17:28:20');
INSERT INTO `sys_operate_logs`
VALUES ('02d21ba5f53f49da840bf2b93ed421af', 'SuperAdmin', 'select', '2022-04-12 18:09:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:09:53', '2022-04-12 18:09:53');
INSERT INTO `sys_operate_logs`
VALUES ('0330f4346d464698903c2ff1fc2ccc8f', 'SuperAdmin', 'select', '2022-04-18 16:51:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:31', '2022-04-18 16:51:31');
INSERT INTO `sys_operate_logs`
VALUES ('0444a71a52ef4f19aba09498c8fbaafd', 'SuperAdmin', 'select', '2022-04-12 17:16:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:16:11', '2022-04-12 17:16:11');
INSERT INTO `sys_operate_logs`
VALUES ('044ea777622a46d683961adaaba0081d', 'SuperAdmin', 'select', '2022-04-18 16:39:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:39:20', '2022-04-18 16:39:20');
INSERT INTO `sys_operate_logs`
VALUES ('0489f8c65b77468ab82104976fb103d9', 'SuperAdmin', 'select', '2022-04-18 17:19:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:19:41', '2022-04-18 17:19:41');
INSERT INTO `sys_operate_logs`
VALUES ('04fd513e4596472c987dc42e43854577', 'SuperAdmin', 'select', '2022-04-18 16:53:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 16:53:56', '2022-04-18 16:53:56');
INSERT INTO `sys_operate_logs`
VALUES ('0554a2cdce714bf0ab9f1db6c415c84e', 'SuperAdmin', 'select', '2022-04-18 17:37:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:37:41', '2022-04-18 17:37:41');
INSERT INTO `sys_operate_logs`
VALUES ('06618c3c2bb64e62b73aa90895846fce', 'SuperAdmin', 'select', '2022-04-18 17:12:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:12:32', '2022-04-18 17:12:32');
INSERT INTO `sys_operate_logs`
VALUES ('069ff0f7dcfb45f8bde51109acf1c7bd', '未登录', 'select', '2022-04-02 10:40:49', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867245790\\\"]}\"}',
        '2022-04-02 10:40:49', '2022-04-02 10:40:49');
INSERT INTO `sys_operate_logs`
VALUES ('06b92e21c6564f1a8d95d8152b4475d3', 'SuperAdmin', 'select', '2022-04-18 17:37:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:37:41', '2022-04-18 17:37:41');
INSERT INTO `sys_operate_logs`
VALUES ('07d0afc0ec054a0aa8d2daf6e2220d67', 'SuperAdmin', 'select', '2022-04-18 17:18:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:18:55', '2022-04-18 17:18:55');
INSERT INTO `sys_operate_logs`
VALUES ('08b615f5b90d47f09ab4ca4ca539c5c1', 'SuperAdmin', 'select', '2022-04-16 12:12:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:12:15', '2022-04-16 12:12:15');
INSERT INTO `sys_operate_logs`
VALUES ('0939ac7e2e474527a8fd076aafbc2a6b', 'SuperAdmin', 'select', '2022-04-18 17:25:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:25:29', '2022-04-18 17:25:29');
INSERT INTO `sys_operate_logs`
VALUES ('0a12c3d76a904fb0a3a8eb74217cd13f', 'SuperAdmin', 'select', '2022-04-18 16:53:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:56', '2022-04-18 16:53:56');
INSERT INTO `sys_operate_logs`
VALUES ('0a30a43c5659406896fa782e1d0692ff', 'SuperAdmin', 'select', '2022-04-18 17:11:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:11:45', '2022-04-18 17:11:45');
INSERT INTO `sys_operate_logs`
VALUES ('0adbadf2df6b4b84996a5b9c1f361326', 'SuperAdmin', 'select', '2022-05-12 14:44:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-12 14:44:23',
        '2022-05-12 14:44:23');
INSERT INTO `sys_operate_logs`
VALUES ('0afd49437a4d48f791e309a6e1b6107b', 'SuperAdmin', 'select', '2022-04-18 16:53:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:58', '2022-04-18 16:53:58');
INSERT INTO `sys_operate_logs`
VALUES ('0baec269ff164aaa9cb2cb27628a8283', 'SuperAdmin', 'select', '2022-04-18 16:37:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:37:45', '2022-04-18 16:37:45');
INSERT INTO `sys_operate_logs`
VALUES ('0c0ac656da09426c8a157377089be44c', 'SuperAdmin', 'select', '2022-04-18 17:38:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:34', '2022-04-18 17:38:34');
INSERT INTO `sys_operate_logs`
VALUES ('0c1e62f3ec5a4d33ae572f6d0129f656', 'SuperAdmin', 'select', '2022-04-18 17:34:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:37', '2022-04-18 17:34:37');
INSERT INTO `sys_operate_logs`
VALUES ('0c44e86ec65a4d40acfbadbbd5a96be3', '未登录', 'select', '2022-04-12 10:40:42', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-12 10:40:42',
        '2022-04-12 10:40:42');
INSERT INTO `sys_operate_logs`
VALUES ('0c84dfe9b1364859b3ac44fec2445b4f', 'SuperAdmin', 'select', '2022-04-18 16:45:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:45:03', '2022-04-18 16:45:03');
INSERT INTO `sys_operate_logs`
VALUES ('0cae0b3eac97494ca9ae39ad662b0698', 'SuperAdmin', 'select', '2022-04-18 16:01:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:01:07', '2022-04-18 16:01:07');
INSERT INTO `sys_operate_logs`
VALUES ('0d672feccb4a4844997cf8e3ccbab309', 'SuperAdmin', 'select', '2022-04-18 17:37:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:37:43', '2022-04-18 17:37:43');
INSERT INTO `sys_operate_logs`
VALUES ('0db78e04b5e94e3b94ce5c273fe40dbe', 'SuperAdmin', 'select', '2022-04-12 16:02:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:02:07', '2022-04-12 16:02:07');
INSERT INTO `sys_operate_logs`
VALUES ('0dbef93de3ea4195bbb8c7f976e97296', '未登录', 'select', '2022-04-02 10:40:48', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867245790\\\"]}\"}',
        '2022-04-02 10:40:48', '2022-04-02 10:40:48');
INSERT INTO `sys_operate_logs`
VALUES ('0e048c38c1cc403280e4f73662909bda', 'SuperAdmin', 'select', '2022-04-12 18:00:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:00:14', '2022-04-12 18:00:14');
INSERT INTO `sys_operate_logs`
VALUES ('0e1cd6a1c63944a29e9ee759240f7f77', 'SuperAdmin', 'select', '2022-04-12 18:00:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 18:00:12', '2022-04-12 18:00:12');
INSERT INTO `sys_operate_logs`
VALUES ('0e2efdca4bc046969ef06644f93fe07f', '未登录', 'select', '2022-04-02 10:40:49', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867245790\\\"]}\"}',
        '2022-04-02 10:40:49', '2022-04-02 10:40:49');
INSERT INTO `sys_operate_logs`
VALUES ('0e3dd5564bca48a2a95e183470bfe207', 'SuperAdmin', 'select', '2022-04-18 16:54:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:54:08', '2022-04-18 16:54:08');
INSERT INTO `sys_operate_logs`
VALUES ('0ea2fe7abe29498aaa6f05d93040cd06', 'SuperAdmin', 'select', '2022-04-18 15:32:47', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:32:47', '2022-04-18 15:32:47');
INSERT INTO `sys_operate_logs`
VALUES ('0f7f2af0f05243da9d36286fac5e3222', 'SuperAdmin', 'select', '2022-04-18 16:42:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:42:27', '2022-04-18 16:42:27');
INSERT INTO `sys_operate_logs`
VALUES ('0fc259924f79437889a4aec9c7e23c38', 'SuperAdmin', 'select', '2022-04-18 17:12:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:12:38', '2022-04-18 17:12:38');
INSERT INTO `sys_operate_logs`
VALUES ('1011ddeeb75a4d0b870a87c116b8cbfa', 'SuperAdmin', 'select', '2022-04-18 17:28:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:29', '2022-04-18 17:28:29');
INSERT INTO `sys_operate_logs`
VALUES ('110f4139b80c46db9e89af972bbca848', 'SuperAdmin', 'select', '2022-04-18 16:54:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:06', '2022-04-18 16:54:06');
INSERT INTO `sys_operate_logs`
VALUES ('1166c9cb2b4e4616b54f859e6b53ed9f', 'SuperAdmin', 'select', '2022-04-12 17:42:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:42:35', '2022-04-12 17:42:35');
INSERT INTO `sys_operate_logs`
VALUES ('11cb8b2f7f32470dadbbd93fa106a472', '未登录', 'select', '2022-04-02 10:55:22', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868122131\\\"]}\"}',
        '2022-04-02 10:55:22', '2022-04-02 10:55:22');
INSERT INTO `sys_operate_logs`
VALUES ('122c74b5d9f64678bfd3f37e22389a38', 'SuperAdmin', 'select', '2022-04-18 17:11:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:11:45', '2022-04-18 17:11:45');
INSERT INTO `sys_operate_logs`
VALUES ('12514c8ade5c46bb8fac5817dc6ad97e', 'SuperAdmin', 'select', '2022-04-12 17:34:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:34:19',
        '2022-04-12 17:34:19');
INSERT INTO `sys_operate_logs`
VALUES ('12676d1f5a3848cfb28046d4c6e4652d', 'SuperAdmin', 'select', '2022-04-01 18:14:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.findMenuInfoList', '2.0.11.172',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/menuInfo/findMenuInfoList\",\"请求参数\":\"{\\\"limit\\\":[\\\"10\\\"],\\\"page\\\":[\\\"1\\\"]}\"}',
        '2022-04-01 18:14:51', '2022-04-01 18:14:51');
INSERT INTO `sys_operate_logs`
VALUES ('128af88b3a58469691995f74ea33e18b', 'SuperAdmin', 'select', '2022-04-12 16:38:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:38:05', '2022-04-12 16:38:05');
INSERT INTO `sys_operate_logs`
VALUES ('1305bf2dc3f743298a3247d7f59785d4', 'SuperAdmin', 'select', '2022-04-18 15:21:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:21:13', '2022-04-18 15:21:13');
INSERT INTO `sys_operate_logs`
VALUES ('13a60e12ad844479aef5af0512077042', 'SuperAdmin', 'select', '2022-04-18 17:38:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:00', '2022-04-18 17:38:00');
INSERT INTO `sys_operate_logs`
VALUES ('13d11f2946d24fa9b4b02143747e7639', 'SuperAdmin', 'select', '2022-04-18 17:05:10', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:05:10', '2022-04-18 17:05:10');
INSERT INTO `sys_operate_logs`
VALUES ('142f6fc9d56345cea33b18afea42631d', 'SuperAdmin', 'select', '2022-04-18 17:28:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:28:07', '2022-04-18 17:28:07');
INSERT INTO `sys_operate_logs`
VALUES ('1435fecb332845f38614221c992fdbb5', 'SuperAdmin', 'select', '2022-04-18 17:29:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:28', '2022-04-18 17:29:28');
INSERT INTO `sys_operate_logs`
VALUES ('15464fa5f1d64b0f9e57e85f6e996cc4', 'SuperAdmin', 'select', '2022-04-12 17:18:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:18:18', '2022-04-12 17:18:18');
INSERT INTO `sys_operate_logs`
VALUES ('1614dcdefed54fd38b522cb43b4d0073', 'SuperAdmin', 'select', '2022-04-12 17:52:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:52:03', '2022-04-12 17:52:03');
INSERT INTO `sys_operate_logs`
VALUES ('16502121749440ebbfbfae84f1720fad', 'SuperAdmin', 'select', '2022-04-18 16:54:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:54:01', '2022-04-18 16:54:01');
INSERT INTO `sys_operate_logs`
VALUES ('16606c1c5acf4733bc20a575cfbb3652', 'SuperAdmin', 'select', '2022-04-12 16:41:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:41:50', '2022-04-12 16:41:50');
INSERT INTO `sys_operate_logs`
VALUES ('168c62196a8b434e8ceda03092eb8034', '未登录', 'select', '2022-04-12 14:58:01', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-12 14:58:01',
        '2022-04-12 14:58:01');
INSERT INTO `sys_operate_logs`
VALUES ('169b210f89814a85bf954660f33eaa4e', 'SuperAdmin', 'select', '2022-04-12 15:53:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 15:53:35', '2022-04-12 15:53:35');
INSERT INTO `sys_operate_logs`
VALUES ('16a39a0c0bdc4397aa1e7cb97e8dd690', '未登录', 'select', '2022-04-02 10:40:48', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867245790\\\"]}\"}',
        '2022-04-02 10:40:48', '2022-04-02 10:40:48');
INSERT INTO `sys_operate_logs`
VALUES ('17324e2c544d4af2a5338c5f56053fed', 'SuperAdmin', 'select', '2022-04-18 16:54:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 16:54:25', '2022-04-18 16:54:25');
INSERT INTO `sys_operate_logs`
VALUES ('1745ca80b23744999fca210bb0bc747c', 'SuperAdmin', 'select', '2022-04-12 17:18:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-12 17:18:27', '2022-04-12 17:18:27');
INSERT INTO `sys_operate_logs`
VALUES ('175f572226814e6fa6fee630722edd6d', 'SuperAdmin', 'select', '2022-04-12 17:18:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:18:25', '2022-04-12 17:18:25');
INSERT INTO `sys_operate_logs`
VALUES ('17905bfd9558480cb72ee3d443ecd404', 'SuperAdmin', 'select', '2022-04-18 17:36:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:36:57', '2022-04-18 17:36:57');
INSERT INTO `sys_operate_logs`
VALUES ('17fa4f0efb70426e8e9f0896413831be', 'SuperAdmin', 'select', '2022-04-12 17:21:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:21:29', '2022-04-12 17:21:29');
INSERT INTO `sys_operate_logs`
VALUES ('1900aace9167455991c0131eca2c23c3', 'SuperAdmin', 'select', '2022-04-18 17:37:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:37:58', '2022-04-18 17:37:58');
INSERT INTO `sys_operate_logs`
VALUES ('1979930ef949466fa5f745d84d167a47', 'SuperAdmin', 'select', '2022-04-18 16:51:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:51:12', '2022-04-18 16:51:12');
INSERT INTO `sys_operate_logs`
VALUES ('1aa90bcfe2624ef2961f70642846cc5b', 'SuperAdmin', 'select', '2022-04-18 17:37:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:37:39', '2022-04-18 17:37:39');
INSERT INTO `sys_operate_logs`
VALUES ('1b885a17f05a49fea334d6fb43a4209a', 'SuperAdmin', 'select', '2022-04-12 17:46:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PermissionInfoController.getPermissionTree',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/permissionInfo/getPermissionTree\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:46:43', '2022-04-12 17:46:43');
INSERT INTO `sys_operate_logs`
VALUES ('1bcb0f054215401aaa304c4c3fb9dbf8', 'SuperAdmin', 'select', '2022-04-18 17:31:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:31:17', '2022-04-18 17:31:17');
INSERT INTO `sys_operate_logs`
VALUES ('1cf513babc0d4b948563f47a222002c2', 'SuperAdmin', 'select', '2022-04-18 17:36:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:36:44', '2022-04-18 17:36:44');
INSERT INTO `sys_operate_logs`
VALUES ('1d19d6288327429eb6082847171c49ec', 'SuperAdmin', 'select', '2022-04-18 17:35:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:35:18', '2022-04-18 17:35:18');
INSERT INTO `sys_operate_logs`
VALUES ('1e1d0105d9cc4f75acb27749cf670e38', 'SuperAdmin', 'select', '2022-04-12 17:51:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:51:59', '2022-04-12 17:51:59');
INSERT INTO `sys_operate_logs`
VALUES ('1ee35ca9a3e84bf99d79e873653e1a24', 'SuperAdmin', 'select', '2022-04-12 18:20:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:20:01', '2022-04-12 18:20:01');
INSERT INTO `sys_operate_logs`
VALUES ('1f11da25886b470195fe4710c8bcbd45', 'SuperAdmin', 'select', '2022-04-12 17:45:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:45:22', '2022-04-12 17:45:22');
INSERT INTO `sys_operate_logs`
VALUES ('1f452b1045e54b6584c3013c6ac095fe', 'SuperAdmin', 'select', '2022-04-18 17:11:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:11:59', '2022-04-18 17:11:59');
INSERT INTO `sys_operate_logs`
VALUES ('1f73c05326f24991bf300373919fdfea', 'SuperAdmin', 'select', '2022-04-18 17:23:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:23:00', '2022-04-18 17:23:00');
INSERT INTO `sys_operate_logs`
VALUES ('1fb1876de21140da8946cc7a988807ad', 'SuperAdmin', 'select', '2022-04-12 16:19:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:19:29', '2022-04-12 16:19:29');
INSERT INTO `sys_operate_logs`
VALUES ('1ff271cb919f435eb7631e20558ab69e', 'SuperAdmin', 'select', '2022-04-12 17:41:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:41:43', '2022-04-12 17:41:43');
INSERT INTO `sys_operate_logs`
VALUES ('205af48af9464e47a321a38dd9dac51f', 'SuperAdmin', 'select', '2022-04-18 16:54:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:00', '2022-04-18 16:54:00');
INSERT INTO `sys_operate_logs`
VALUES ('20c5984a48df477c9825e77a8e46a2ac', 'SuperAdmin', 'select', '2022-04-12 17:08:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:08:32', '2022-04-12 17:08:32');
INSERT INTO `sys_operate_logs`
VALUES ('21388a874dd342149853f376b8241dbf', 'SuperAdmin', 'select', '2022-04-12 16:40:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:40:05', '2022-04-12 16:40:05');
INSERT INTO `sys_operate_logs`
VALUES ('2145e7b832454d0b80ca10721de64994', 'SuperAdmin', 'select', '2022-04-18 15:30:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:15', '2022-04-18 15:30:15');
INSERT INTO `sys_operate_logs`
VALUES ('21bca71c98ec4fe595309ecf175fcc27', 'SuperAdmin', 'select', '2022-04-18 14:45:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 14:45:22', '2022-04-18 14:45:22');
INSERT INTO `sys_operate_logs`
VALUES ('22958597721a48b894b33174f5e0c406', 'SuperAdmin', 'select', '2022-04-18 16:01:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:01:07', '2022-04-18 16:01:07');
INSERT INTO `sys_operate_logs`
VALUES ('22a58af269a94c15b25ef2d8cfd0e631', 'SuperAdmin', 'select', '2022-04-18 17:36:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:36:54', '2022-04-18 17:36:54');
INSERT INTO `sys_operate_logs`
VALUES ('22c433cfe1a34d40a255c361c98364e0', 'SuperAdmin', 'select', '2022-04-12 17:04:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:04:51', '2022-04-12 17:04:51');
INSERT INTO `sys_operate_logs`
VALUES ('232a753e5fba4652a9155a1e25f758ba', 'SuperAdmin', 'select', '2022-04-12 18:05:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:05:32', '2022-04-12 18:05:32');
INSERT INTO `sys_operate_logs`
VALUES ('232ea423a4134367bd506b1caddb0aa1', 'SuperAdmin', 'select', '2022-04-12 17:18:21', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-12 17:18:21', '2022-04-12 17:18:21');
INSERT INTO `sys_operate_logs`
VALUES ('2361b425deea465bae1f2037525debaf', 'SuperAdmin', 'select', '2022-04-18 15:30:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:07', '2022-04-18 15:30:07');
INSERT INTO `sys_operate_logs`
VALUES ('24245087bd9d40cbab98a4c15620ca3b', 'SuperAdmin', 'select', '2022-04-18 16:54:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 16:54:11', '2022-04-18 16:54:11');
INSERT INTO `sys_operate_logs`
VALUES ('247b4668a5e941f580ed1b213f5dad0c', 'SuperAdmin', 'select', '2022-04-12 17:28:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:28:51', '2022-04-12 17:28:51');
INSERT INTO `sys_operate_logs`
VALUES ('24d40678d2fe4d9eab9909af7e002f63', 'SuperAdmin', 'select', '2022-04-18 14:42:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:42:25', '2022-04-18 14:42:25');
INSERT INTO `sys_operate_logs`
VALUES ('253b551701a5484a90f3dc7ba4b845ab', 'SuperAdmin', 'select', '2022-04-12 16:37:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:37:59', '2022-04-12 16:37:59');
INSERT INTO `sys_operate_logs`
VALUES ('25a2aff773c8493688e9aadaebdae8da', 'SuperAdmin', 'select', '2022-04-18 16:30:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:30:19', '2022-04-18 16:30:19');
INSERT INTO `sys_operate_logs`
VALUES ('25dc43196b034419814542e5c989354e', 'SuperAdmin', 'select', '2022-04-18 15:30:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:30:36', '2022-04-18 15:30:36');
INSERT INTO `sys_operate_logs`
VALUES ('25eb8adbae47401a9fd3289a41c78ecb', 'SuperAdmin', 'select', '2022-04-12 16:39:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:39:05', '2022-04-12 16:39:05');
INSERT INTO `sys_operate_logs`
VALUES ('25f48035c8dc417aa5453e5297c45f03', 'SuperAdmin', 'select', '2022-04-16 12:12:47', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.addPerson', '192.168.154.1',
        '{\"请求结果\":\"添加人员失败，单位id不能为空\",\"请求路径\":\"/orgInfo/addPerson\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:12:47', '2022-04-16 12:12:47');
INSERT INTO `sys_operate_logs`
VALUES ('2645399d7b54412e808ef462ab37533c', 'SuperAdmin', 'select', '2022-04-18 17:36:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:36:56', '2022-04-18 17:36:56');
INSERT INTO `sys_operate_logs`
VALUES ('2663db3e99fb4be3b93a5fcf36413e3f', 'SuperAdmin', 'select', '2022-04-18 17:35:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 17:35:11', '2022-04-18 17:35:11');
INSERT INTO `sys_operate_logs`
VALUES ('2666aba6f2a144dd9c3b46affa515718', 'SuperAdmin', 'select', '2022-04-18 15:30:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:12', '2022-04-18 15:30:12');
INSERT INTO `sys_operate_logs`
VALUES ('2696ceee60034c229bc95a2ddf1afc4e', 'SuperAdmin', 'select', '2022-04-18 17:15:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:15:19', '2022-04-18 17:15:19');
INSERT INTO `sys_operate_logs`
VALUES ('26b53d87a3b94bc1ac8ef2394a0436ee', 'SuperAdmin', 'select', '2022-04-12 17:37:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:37:00', '2022-04-12 17:37:00');
INSERT INTO `sys_operate_logs`
VALUES ('271a817a11e645c0b9a251df3a637339', 'SuperAdmin', 'select', '2022-04-18 16:53:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:51', '2022-04-18 16:53:51');
INSERT INTO `sys_operate_logs`
VALUES ('27317f47903d42b58950eea5773f9964', 'SuperAdmin', 'select', '2022-04-18 17:32:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:32:43', '2022-04-18 17:32:43');
INSERT INTO `sys_operate_logs`
VALUES ('275fec92bc9a42238e538e98e78e3c77', 'SuperAdmin', 'select', '2022-04-18 16:51:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:42', '2022-04-18 16:51:42');
INSERT INTO `sys_operate_logs`
VALUES ('27741dd53c254911b37c0d5375c4ac2b', 'SuperAdmin', 'select', '2022-04-18 17:37:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:37:44', '2022-04-18 17:37:44');
INSERT INTO `sys_operate_logs`
VALUES ('28500ce645f74a6a8068c6f7a51a29b4', 'SuperAdmin', 'select', '2022-04-18 17:16:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:16:36', '2022-04-18 17:16:36');
INSERT INTO `sys_operate_logs`
VALUES ('2917f884c6ce497698f0748458fcafb6', '未登录', 'select', '2022-04-02 11:01:38', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868496947\\\"]}\"}',
        '2022-04-02 11:01:38', '2022-04-02 11:01:38');
INSERT INTO `sys_operate_logs`
VALUES ('2936cbcc13a149248228c7d11197abdf', 'SuperAdmin', 'select', '2022-04-12 17:21:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:21:43', '2022-04-12 17:21:43');
INSERT INTO `sys_operate_logs`
VALUES ('296461e47aee47b7a876590019d814f4', 'SuperAdmin', 'select', '2022-04-12 17:10:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:10:45', '2022-04-12 17:10:45');
INSERT INTO `sys_operate_logs`
VALUES ('2a8db356209b45aeaafc6e2ad41abc8a', 'SuperAdmin', 'select', '2022-04-18 17:35:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:35:17', '2022-04-18 17:35:17');
INSERT INTO `sys_operate_logs`
VALUES ('2ab404ec61334b31af40d792359d4059', 'SuperAdmin', 'select', '2022-04-12 16:18:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:18:39', '2022-04-12 16:18:39');
INSERT INTO `sys_operate_logs`
VALUES ('2b3cbdd09f4548d89ba29c4c36f636c1', 'SuperAdmin', 'select', '2022-04-18 16:30:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:30:46', '2022-04-18 16:30:46');
INSERT INTO `sys_operate_logs`
VALUES ('2b3edb502caf429383cb216bc59070a5', 'SuperAdmin', 'select', '2022-04-18 16:53:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:53:51', '2022-04-18 16:53:51');
INSERT INTO `sys_operate_logs`
VALUES ('2b4a8c7356484729a5c2027dc832bb98', 'SuperAdmin', 'select', '2022-04-18 17:28:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:20', '2022-04-18 17:28:20');
INSERT INTO `sys_operate_logs`
VALUES ('2b7cea1548614f0ebda660ad0ab16786', 'SuperAdmin', 'select', '2022-04-18 17:19:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:19:41', '2022-04-18 17:19:41');
INSERT INTO `sys_operate_logs`
VALUES ('2b94314c66f547ea98e5092513e310d7', 'SuperAdmin', 'select', '2022-04-12 17:06:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:06:17', '2022-04-12 17:06:17');
INSERT INTO `sys_operate_logs`
VALUES ('2bff2bcf5b1e4e7c94c05c9417c71c13', 'SuperAdmin', 'select', '2022-04-18 16:36:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:19', '2022-04-18 16:36:19');
INSERT INTO `sys_operate_logs`
VALUES ('2c0cea01665e4f0da3aff5c2a4c6d7cb', 'SuperAdmin', 'select', '2022-04-12 17:51:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:51:59', '2022-04-12 17:51:59');
INSERT INTO `sys_operate_logs`
VALUES ('2c94b28e365b4d938071ca502453d23e', 'SuperAdmin', 'select', '2022-04-18 17:18:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:18:51', '2022-04-18 17:18:51');
INSERT INTO `sys_operate_logs`
VALUES ('2cd71798bfe1422cbe81a1ace3582cdd', 'SuperAdmin', 'select', '2022-04-18 17:24:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:24:45', '2022-04-18 17:24:45');
INSERT INTO `sys_operate_logs`
VALUES ('2cf1e831331e4be789edfcbbf8ad83e8', 'SuperAdmin', 'select', '2022-04-18 17:27:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:15', '2022-04-18 17:27:15');
INSERT INTO `sys_operate_logs`
VALUES ('2dfaa27b8ebc4f629ba5b805c73f7406', 'SuperAdmin', 'select', '2022-04-12 17:53:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:53:59', '2022-04-12 17:53:59');
INSERT INTO `sys_operate_logs`
VALUES ('2ea13cd99fdb4d998de0cb187d201c02', '未登录', 'select', '2022-04-02 10:55:22', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868122131\\\"]}\"}',
        '2022-04-02 10:55:22', '2022-04-02 10:55:22');
INSERT INTO `sys_operate_logs`
VALUES ('2edea113591d430695e1bfc8a6f75288', 'SuperAdmin', 'select', '2022-04-12 17:26:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:26:36',
        '2022-04-12 17:26:36');
INSERT INTO `sys_operate_logs`
VALUES ('2f01890cbc0f437eb0e7242d3113686c', 'SuperAdmin', 'select', '2022-04-12 16:01:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:01:30', '2022-04-12 16:01:30');
INSERT INTO `sys_operate_logs`
VALUES ('2f4d0413c77f4f34bf4408cd4452d30b', 'SuperAdmin', 'select', '2022-04-12 16:41:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:41:51', '2022-04-12 16:41:51');
INSERT INTO `sys_operate_logs`
VALUES ('2fc3a541fd8a4e7d8c9584a71053887c', 'SuperAdmin', 'select', '2022-04-18 17:23:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:23:05', '2022-04-18 17:23:05');
INSERT INTO `sys_operate_logs`
VALUES ('3020f61425a749d3b727b9712ecdc47f', 'SuperAdmin', 'select', '2022-04-18 17:29:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:51', '2022-04-18 17:29:51');
INSERT INTO `sys_operate_logs`
VALUES ('30d8c0bc1ad34a47bea6207307f9ba25', 'SuperAdmin', 'select', '2022-04-12 16:28:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 16:28:28', '2022-04-12 16:28:28');
INSERT INTO `sys_operate_logs`
VALUES ('311cc0a4f41e459da7863a919f049d21', 'SuperAdmin', 'select', '2022-04-18 17:19:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 17:19:35', '2022-04-18 17:19:35');
INSERT INTO `sys_operate_logs`
VALUES ('314302edc48042019055a8226067b014', 'SuperAdmin', 'select', '2022-04-18 16:31:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:31:12', '2022-04-18 16:31:12');
INSERT INTO `sys_operate_logs`
VALUES ('31c79558483e45e4bf7cf7ae92c2ae53', 'SuperAdmin', 'select', '2022-04-18 16:39:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:39:20', '2022-04-18 16:39:20');
INSERT INTO `sys_operate_logs`
VALUES ('325b3b237cd94f63889044c65eeaffd5', 'SuperAdmin', 'select', '2022-04-18 17:34:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:34:36', '2022-04-18 17:34:36');
INSERT INTO `sys_operate_logs`
VALUES ('331cdf1cef7a473b889d1a3cd4088caa', 'SuperAdmin', 'select', '2022-04-18 16:54:02', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:02', '2022-04-18 16:54:02');
INSERT INTO `sys_operate_logs`
VALUES ('333fc9927a464308aba6ef414073320f', 'SuperAdmin', 'select', '2022-04-12 17:41:26', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:41:26', '2022-04-12 17:41:26');
INSERT INTO `sys_operate_logs`
VALUES ('336cbace61ae42eaab6af85148e90b2a', 'SuperAdmin', 'select', '2022-04-18 14:39:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:39:59', '2022-04-18 14:39:59');
INSERT INTO `sys_operate_logs`
VALUES ('336d8f1d26a241dbb124ededb6d50610', 'SuperAdmin', 'select', '2022-04-18 17:34:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:23', '2022-04-18 17:34:23');
INSERT INTO `sys_operate_logs`
VALUES ('3443368513b5406e8a3647b5cba32b71', 'SuperAdmin', 'select', '2022-04-12 14:58:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 14:58:06', '2022-04-12 14:58:06');
INSERT INTO `sys_operate_logs`
VALUES ('34bf3a1c569a4d43a7f5337c4def4e46', 'SuperAdmin', 'select', '2022-04-18 17:11:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:11:55', '2022-04-18 17:11:55');
INSERT INTO `sys_operate_logs`
VALUES ('353b5709c22a483e9b7b0371e5894c9e', 'SuperAdmin', 'select', '2022-04-18 16:38:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:38:56', '2022-04-18 16:38:56');
INSERT INTO `sys_operate_logs`
VALUES ('3581a3e5d6cc4a10ad68c6dbd499b8ef', 'SuperAdmin', 'select', '2022-04-12 17:39:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:39:00', '2022-04-12 17:39:00');
INSERT INTO `sys_operate_logs`
VALUES ('358d60bdc39c482298cc679624e359a3', 'SuperAdmin', 'select', '2022-04-12 15:53:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:53:17', '2022-04-12 15:53:17');
INSERT INTO `sys_operate_logs`
VALUES ('35ac5334711b478bba869d096c3e0ac1', 'SuperAdmin', 'select', '2022-04-12 15:26:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:26:33', '2022-04-12 15:26:33');
INSERT INTO `sys_operate_logs`
VALUES ('35f9d3bb4e8a45d5a3f8615a7980d28a', 'SuperAdmin', 'select', '2022-04-16 12:14:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:14:29', '2022-04-16 12:14:29');
INSERT INTO `sys_operate_logs`
VALUES ('36027fd4f02d4d97a24b501feb3579e4', '未登录', 'select', '2022-04-02 11:03:17', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868596450\\\"]}\"}',
        '2022-04-02 11:03:17', '2022-04-02 11:03:17');
INSERT INTO `sys_operate_logs`
VALUES ('377f24cb6662437ab801b116cba71172', 'SuperAdmin', 'select', '2022-04-18 16:51:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:51:42', '2022-04-18 16:51:42');
INSERT INTO `sys_operate_logs`
VALUES ('37fc41fe1f7348f3b25c226588cb61b1', '未登录', 'select', '2022-04-02 11:05:58', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868757792\\\"]}\"}',
        '2022-04-02 11:05:58', '2022-04-02 11:05:58');
INSERT INTO `sys_operate_logs`
VALUES ('3808595fb54b42228f44ec28935731fc', 'SuperAdmin', 'select', '2022-04-12 17:14:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:14:56', '2022-04-12 17:14:56');
INSERT INTO `sys_operate_logs`
VALUES ('38771356fe274e06a3a399f8ccc07c3b', 'SuperAdmin', 'select', '2022-04-18 17:31:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:31:00', '2022-04-18 17:31:00');
INSERT INTO `sys_operate_logs`
VALUES ('393bf6f8c3924c80a60d0230f81df6e5', 'SuperAdmin', 'select', '2022-04-12 17:59:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:59:55', '2022-04-12 17:59:55');
INSERT INTO `sys_operate_logs`
VALUES ('397904b4bfa24d23a26b585fd5f24fa4', '未登录', 'select', '2022-04-02 11:03:17', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868596450\\\"]}\"}',
        '2022-04-02 11:03:17', '2022-04-02 11:03:17');
INSERT INTO `sys_operate_logs`
VALUES ('398127397938479990eb7c3e115a2e70', 'SuperAdmin', 'select', '2022-04-18 15:35:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.getPersonInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/personInfo/getPersonInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6869a49c3b2a4f8dae0ba848a40a023f\\\"]}\"}',
        '2022-04-18 15:35:06', '2022-04-18 15:35:06');
INSERT INTO `sys_operate_logs`
VALUES ('39a3c77a0cef412fb290e3b66c89e803', 'SuperAdmin', 'select', '2022-04-18 17:20:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:20:42', '2022-04-18 17:20:42');
INSERT INTO `sys_operate_logs`
VALUES ('3a01e6b063b9480c94b5e73202bfc724', '未登录', 'select', '2022-05-16 09:51:10', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-16 09:51:10',
        '2022-05-16 09:51:10');
INSERT INTO `sys_operate_logs`
VALUES ('3a0c778379a54cd9bc597c5d20cea203', 'SuperAdmin', 'select', '2022-04-18 17:36:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:44', '2022-04-18 17:36:44');
INSERT INTO `sys_operate_logs`
VALUES ('3a139f7b33a94808b99e50db729b3402', 'SuperAdmin', 'select', '2022-04-12 16:18:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:18:50', '2022-04-12 16:18:50');
INSERT INTO `sys_operate_logs`
VALUES ('3a591d2b648c40ccaf63ba6c1446978f', 'SuperAdmin', 'select', '2022-04-18 17:12:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:12:35', '2022-04-18 17:12:35');
INSERT INTO `sys_operate_logs`
VALUES ('3a767912480d4c3d8e391d8372669ae1', 'SuperAdmin', 'select', '2022-04-18 17:18:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:18:53', '2022-04-18 17:18:53');
INSERT INTO `sys_operate_logs`
VALUES ('3b4a87907b354a919137a97325c1dc60', 'SuperAdmin', 'select', '2022-04-12 17:51:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PermissionInfoController.getPermissionTree',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/permissionInfo/getPermissionTree\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:51:28', '2022-04-12 17:51:28');
INSERT INTO `sys_operate_logs`
VALUES ('3b829cfe89394ee1abe960c989ba207e', 'SuperAdmin', 'select', '2022-04-18 15:42:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 15:42:33', '2022-04-18 15:42:33');
INSERT INTO `sys_operate_logs`
VALUES ('3d08e94e65de42b5812f8aa81beb46b9', 'SuperAdmin', 'select', '2022-04-12 17:52:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:52:07', '2022-04-12 17:52:07');
INSERT INTO `sys_operate_logs`
VALUES ('3d3e08a6b4094ca3b97fc811bb99b28b', 'SuperAdmin', 'select', '2022-04-12 15:26:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 15:26:23', '2022-04-12 15:26:23');
INSERT INTO `sys_operate_logs`
VALUES ('3df9cdae0792440db9206d9fcd53d746', 'SuperAdmin', 'select', '2022-04-12 18:09:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.getPersonInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/personInfo/getPersonInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6869a49c3b2a4f8dae0ba848a40a023f\\\"]}\"}',
        '2022-04-12 18:09:56', '2022-04-12 18:09:56');
INSERT INTO `sys_operate_logs`
VALUES ('3dfd498511c047b99d07bb00a02daaa2', 'SuperAdmin', 'select', '2022-04-18 14:48:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:48:30', '2022-04-18 14:48:30');
INSERT INTO `sys_operate_logs`
VALUES ('3e150655ab224839b06e561956e548ce', 'SuperAdmin', 'select', '2022-04-12 17:05:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:05:04', '2022-04-12 17:05:04');
INSERT INTO `sys_operate_logs`
VALUES ('3e195ca4c5154e24b095b06742918277', 'SuperAdmin', 'select', '2022-04-18 16:51:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:42', '2022-04-18 16:51:42');
INSERT INTO `sys_operate_logs`
VALUES ('3e665613289e484eb5d7f394ad0009eb', 'SuperAdmin', 'select', '2022-04-12 17:12:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:12:32', '2022-04-12 17:12:32');
INSERT INTO `sys_operate_logs`
VALUES ('3e6b6be54f4a4f37a02085f0c0a278ec', 'SuperAdmin', 'select', '2022-04-12 16:38:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 16:38:03', '2022-04-12 16:38:03');
INSERT INTO `sys_operate_logs`
VALUES ('3ea2057356ea4456aa43d30a41687a35', 'SuperAdmin', 'select', '2022-04-16 12:14:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:14:16', '2022-04-16 12:14:16');
INSERT INTO `sys_operate_logs`
VALUES ('3f73a94c72a14aa4b473a6e4eff23c88', 'SuperAdmin', 'select', '2022-04-18 16:49:48', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:49:48', '2022-04-18 16:49:48');
INSERT INTO `sys_operate_logs`
VALUES ('3fdd70a18f494440927c6ef37e3e10ab', 'SuperAdmin', 'select', '2022-04-18 15:40:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:40:35', '2022-04-18 15:40:35');
INSERT INTO `sys_operate_logs`
VALUES ('409bda81844349839d5d4cd19bebcf56', 'SuperAdmin', 'select', '2022-04-18 16:53:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:53:29', '2022-04-18 16:53:29');
INSERT INTO `sys_operate_logs`
VALUES ('40d28a799e814eedacd0806a0d3c2ead', 'SuperAdmin', 'select', '2022-04-18 17:18:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:18:56', '2022-04-18 17:18:56');
INSERT INTO `sys_operate_logs`
VALUES ('4100ecd23c484a659332c87f418af2ba', 'SuperAdmin', 'select', '2022-04-18 17:11:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:11:58', '2022-04-18 17:11:58');
INSERT INTO `sys_operate_logs`
VALUES ('411929dead3a40ff960540e5006b0fff', 'SuperAdmin', 'select', '2022-04-18 17:18:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:18:53', '2022-04-18 17:18:53');
INSERT INTO `sys_operate_logs`
VALUES ('4139dc1473de4df5b81839230c870484', 'SuperAdmin', 'select', '2022-05-13 15:16:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 15:16:03',
        '2022-05-13 15:16:03');
INSERT INTO `sys_operate_logs`
VALUES ('41fcbcd546ca4f2fa16f058ee55d0d2f', 'SuperAdmin', 'select', '2022-04-18 16:54:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:54:05', '2022-04-18 16:54:05');
INSERT INTO `sys_operate_logs`
VALUES ('42a4b8c3ce2f45fda802f8a136d369b3', 'SuperAdmin', 'select', '2022-04-01 18:15:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-01 18:15:33', '2022-04-01 18:15:33');
INSERT INTO `sys_operate_logs`
VALUES ('431263d760e745048e86a6443e4867cc', 'SuperAdmin', 'select', '2022-04-18 17:36:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:41', '2022-04-18 17:36:41');
INSERT INTO `sys_operate_logs`
VALUES ('4319fc89c3d64cd1b323c80ac1f2f10b', 'SuperAdmin', 'select', '2022-04-12 15:24:26', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 15:24:26', '2022-04-12 15:24:26');
INSERT INTO `sys_operate_logs`
VALUES ('43ac4913120e46719dcbcec4eeb1df56', 'SuperAdmin', 'select', '2022-04-12 18:18:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:18:28', '2022-04-12 18:18:28');
INSERT INTO `sys_operate_logs`
VALUES ('43dd9d23825e4258bbfee7ca76723337', 'SuperAdmin', 'select', '2022-04-12 17:51:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PermissionInfoController.getPermissionTree',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/permissionInfo/getPermissionTree\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:51:19', '2022-04-12 17:51:19');
INSERT INTO `sys_operate_logs`
VALUES ('442600fd63a245cfa6d38a2230ce75df', 'SuperAdmin', 'select', '2022-04-18 15:30:09', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 15:30:09', '2022-04-18 15:30:09');
INSERT INTO `sys_operate_logs`
VALUES ('44b3d6ee11534b23bdab28106de296f0', 'SuperAdmin', 'select', '2022-04-18 16:51:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:51:14', '2022-04-18 16:51:14');
INSERT INTO `sys_operate_logs`
VALUES ('44bb8ddc23fe4d498e86353dea0293d1', 'SuperAdmin', 'select', '2022-04-18 15:21:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-18 15:21:05',
        '2022-04-18 15:21:05');
INSERT INTO `sys_operate_logs`
VALUES ('44c34f73ec244aed9d607deca7cbad2c', 'SuperAdmin', 'select', '2022-04-18 17:37:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:37:46', '2022-04-18 17:37:46');
INSERT INTO `sys_operate_logs`
VALUES ('44e0ca3ce35844079d2d8b9a0553dd3d', 'SuperAdmin', 'select', '2022-04-12 18:02:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:02:49', '2022-04-12 18:02:49');
INSERT INTO `sys_operate_logs`
VALUES ('450fee6ebc244ecb94175453fb9c2498', 'SuperAdmin', 'select', '2022-04-18 16:50:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:50:29', '2022-04-18 16:50:29');
INSERT INTO `sys_operate_logs`
VALUES ('452d0d39b6aa47e195b817e710be4d62', 'SuperAdmin', 'select', '2022-04-12 16:40:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:40:15', '2022-04-12 16:40:15');
INSERT INTO `sys_operate_logs`
VALUES ('45385dc267e44c2b882401ed8c9c81a7', 'SuperAdmin', 'select', '2022-04-18 17:16:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:16:36', '2022-04-18 17:16:36');
INSERT INTO `sys_operate_logs`
VALUES ('46d1a157f9d54241a06a6b0e8ac6924a', 'SuperAdmin', 'select', '2022-04-18 17:36:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:36:41', '2022-04-18 17:36:41');
INSERT INTO `sys_operate_logs`
VALUES ('47216e642edd4068a571c2e949ce0597', 'SuperAdmin', 'select', '2022-04-18 16:50:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:50:29', '2022-04-18 16:50:29');
INSERT INTO `sys_operate_logs`
VALUES ('473ece3fe82c481891ca2304d84284a3', 'SuperAdmin', 'select', '2022-04-18 15:27:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:27:56', '2022-04-18 15:27:56');
INSERT INTO `sys_operate_logs`
VALUES ('474c7af43e0346a28e7fca907854f18d', 'SuperAdmin', 'select', '2022-04-12 16:37:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:37:58', '2022-04-12 16:37:58');
INSERT INTO `sys_operate_logs`
VALUES ('4752c6c0cd034fbcbd38225767180879', 'SuperAdmin', 'select', '2022-04-12 17:52:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:52:42', '2022-04-12 17:52:42');
INSERT INTO `sys_operate_logs`
VALUES ('47d5ff62653347f390070f9872c8018e', 'SuperAdmin', 'select', '2022-04-18 17:12:26', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:12:26', '2022-04-18 17:12:26');
INSERT INTO `sys_operate_logs`
VALUES ('483c98564d3e44aeb26b321265c1d8ca', 'SuperAdmin', 'select', '2022-04-18 17:33:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:33:13', '2022-04-18 17:33:13');
INSERT INTO `sys_operate_logs`
VALUES ('494a8c8770584be790878cd8176ad3b5', 'SuperAdmin', 'select', '2022-04-16 12:14:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-16 12:14:19', '2022-04-16 12:14:19');
INSERT INTO `sys_operate_logs`
VALUES ('497383fe68214c17bdd5b46116492f7d', 'SuperAdmin', 'select', '2022-04-18 17:28:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:28:20', '2022-04-18 17:28:20');
INSERT INTO `sys_operate_logs`
VALUES ('49f13480beae4d7ab29be94c3520280d', 'SuperAdmin', 'select', '2022-04-18 17:25:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:25:36', '2022-04-18 17:25:36');
INSERT INTO `sys_operate_logs`
VALUES ('49f21ad79fd54be7abbe09aa6b96788c', 'SuperAdmin', 'select', '2022-04-18 16:39:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:39:18', '2022-04-18 16:39:18');
INSERT INTO `sys_operate_logs`
VALUES ('4a11703045024f9499aecb23b32dd9fb', 'SuperAdmin', 'select', '2022-04-18 17:11:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:11:35', '2022-04-18 17:11:35');
INSERT INTO `sys_operate_logs`
VALUES ('4abe7ba8a91a43a993cc7607846becf3', 'SuperAdmin', 'select', '2022-04-18 16:43:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:43:39', '2022-04-18 16:43:39');
INSERT INTO `sys_operate_logs`
VALUES ('4b32278ef332405d8fa3dd4844f6d2ce', 'SuperAdmin', 'select', '2022-04-12 17:41:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:41:44', '2022-04-12 17:41:44');
INSERT INTO `sys_operate_logs`
VALUES ('4b67985e4e314323b5f266308aa57bfe', 'SuperAdmin', 'select', '2022-04-01 18:15:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.findMenuInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/menuInfo/findMenuInfoList\",\"请求参数\":\"{\\\"limit\\\":[\\\"10\\\"],\\\"page\\\":[\\\"1\\\"]}\"}',
        '2022-04-01 18:15:32', '2022-04-01 18:15:32');
INSERT INTO `sys_operate_logs`
VALUES ('4d4cf524a1e641c5abccd36a30169f4d', 'SuperAdmin', 'select', '2022-04-16 12:12:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-16 12:12:15', '2022-04-16 12:12:15');
INSERT INTO `sys_operate_logs`
VALUES ('4d5cfce8c22e4dd7a6a822c1ba3738c4', 'SuperAdmin', 'select', '2022-04-18 15:27:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:27:17', '2022-04-18 15:27:17');
INSERT INTO `sys_operate_logs`
VALUES ('4d7f5fd2996446d19249bb4e5326d3d4', 'SuperAdmin', 'select', '2022-04-18 17:24:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:24:45', '2022-04-18 17:24:45');
INSERT INTO `sys_operate_logs`
VALUES ('4e0425c428374a639d7ccd6320807289', 'SuperAdmin', 'select', '2022-04-16 12:12:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-16 12:12:49', '2022-04-16 12:12:49');
INSERT INTO `sys_operate_logs`
VALUES ('4f6f575c95fd4681873a8eaf003d531e', 'SuperAdmin', 'select', '2022-04-18 17:12:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:12:40', '2022-04-18 17:12:40');
INSERT INTO `sys_operate_logs`
VALUES ('4fd0408a61f143878ae52774b7ebac0b', 'SuperAdmin', 'select', '2022-04-12 16:05:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:05:13', '2022-04-12 16:05:13');
INSERT INTO `sys_operate_logs`
VALUES ('52c091853fe249e3b85dc9413034ad47', 'SuperAdmin', 'select', '2022-04-18 17:25:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:25:33', '2022-04-18 17:25:33');
INSERT INTO `sys_operate_logs`
VALUES ('53a50728d866431ba9c7cdb6f4915a1c', 'SuperAdmin', 'select', '2022-04-18 17:34:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:34:27', '2022-04-18 17:34:27');
INSERT INTO `sys_operate_logs`
VALUES ('54090cac48be4425aba772b7ee69c9cb', 'SuperAdmin', 'select', '2022-04-18 15:42:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 15:42:33', '2022-04-18 15:42:33');
INSERT INTO `sys_operate_logs`
VALUES ('54b7829a6ca44931b08f775d2263558f', 'SuperAdmin', 'select', '2022-04-12 17:08:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:08:33', '2022-04-12 17:08:33');
INSERT INTO `sys_operate_logs`
VALUES ('54d56e80b7d5421691deb08f8a455ec1', 'SuperAdmin', 'select', '2022-04-18 10:05:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.137.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 10:05:30', '2022-04-18 10:05:30');
INSERT INTO `sys_operate_logs`
VALUES ('5637e8c42a1e47b69935b0a6f1afb213', 'SuperAdmin', 'select', '2022-04-12 17:45:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:45:31', '2022-04-12 17:45:31');
INSERT INTO `sys_operate_logs`
VALUES ('566fff56b018443eac6964f5aa36f8d4', 'SuperAdmin', 'select', '2022-04-12 15:55:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:55:35', '2022-04-12 15:55:35');
INSERT INTO `sys_operate_logs`
VALUES ('5673872ffc284b53853ff32b3beb0f95', 'SuperAdmin', 'select', '2022-04-02 11:05:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.logout', '192.168.154.1',
        '{\"请求结果\":\"退出登录成功!\",\"请求路径\":\"/accountInfo/logout\",\"请求参数\":\"{\\\"username\\\":[\\\"SuperAdmin\\\"]}\"}',
        '2022-04-02 11:05:58', '2022-04-02 11:05:58');
INSERT INTO `sys_operate_logs`
VALUES ('56a947e740bf435b91008c34c22834f7', 'SuperAdmin', 'select', '2022-04-18 17:29:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:29:28', '2022-04-18 17:29:28');
INSERT INTO `sys_operate_logs`
VALUES ('56e4dcd03d13437e9165f07f39547593', 'SuperAdmin', 'select', '2022-04-18 15:33:26', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:33:26', '2022-04-18 15:33:26');
INSERT INTO `sys_operate_logs`
VALUES ('57191844d685411685c1c2c10fd8eb98', 'SuperAdmin', 'select', '2022-04-12 15:55:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:55:03', '2022-04-12 15:55:03');
INSERT INTO `sys_operate_logs`
VALUES ('576a3bc8b6a04d47994718e20b58ec40', 'SuperAdmin', 'select', '2022-04-18 17:32:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:32:43', '2022-04-18 17:32:43');
INSERT INTO `sys_operate_logs`
VALUES ('58148762e854498c851a5f5536da3511', 'SuperAdmin', 'select', '2022-04-12 17:50:09', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PermissionInfoController.getPermissionTree',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/permissionInfo/getPermissionTree\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:50:09', '2022-04-12 17:50:09');
INSERT INTO `sys_operate_logs`
VALUES ('589a948e1c944bd089a64da1a2a76fb8', 'SuperAdmin', 'select', '2022-04-18 17:34:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:23', '2022-04-18 17:34:23');
INSERT INTO `sys_operate_logs`
VALUES ('58d720e072784f2cbfe081a33e50367a', 'SuperAdmin', 'select', '2022-04-18 17:29:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:51', '2022-04-18 17:29:51');
INSERT INTO `sys_operate_logs`
VALUES ('592fcfbf61ac4e93a087b6ef00c23425', 'SuperAdmin', 'select', '2022-04-18 17:28:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:28:29', '2022-04-18 17:28:29');
INSERT INTO `sys_operate_logs`
VALUES ('598a5b78324c4a34849bc8d09e8678ce', 'SuperAdmin', 'select', '2022-04-18 16:30:21', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:21', '2022-04-18 16:30:21');
INSERT INTO `sys_operate_logs`
VALUES ('5d66e2d7d3124c9dbad2cbf671fc43b8', 'SuperAdmin', 'select', '2022-04-18 17:27:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:23', '2022-04-18 17:27:23');
INSERT INTO `sys_operate_logs`
VALUES ('5d8a78fd390f426a9ff8243928a42098', 'SuperAdmin', 'select', '2022-04-18 17:36:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:36:57', '2022-04-18 17:36:57');
INSERT INTO `sys_operate_logs`
VALUES ('5dbd09c5a2624da690202a509873aef9', 'SuperAdmin', 'select', '2022-04-18 17:36:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 17:36:52', '2022-04-18 17:36:52');
INSERT INTO `sys_operate_logs`
VALUES ('5e10426812a14039b07b517effebb7dc', 'SuperAdmin', 'select', '2022-04-18 10:00:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.137.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 10:00:56', '2022-04-18 10:00:56');
INSERT INTO `sys_operate_logs`
VALUES ('6004cde1429b4434a5bbc4c1382ee8fc', '未登录', 'select', '2022-04-02 11:05:58', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868757792\\\"]}\"}',
        '2022-04-02 11:05:58', '2022-04-02 11:05:58');
INSERT INTO `sys_operate_logs`
VALUES ('60a1e9b31e4e4069b08ea1923646d25f', 'SuperAdmin', 'select', '2022-04-16 12:12:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.addPerson', '192.168.154.1',
        '{\"请求结果\":\"添加成功!\",\"请求路径\":\"/orgInfo/addPerson\",\"请求参数\":\"{}\"}', '2022-04-16 12:12:59',
        '2022-04-16 12:12:59');
INSERT INTO `sys_operate_logs`
VALUES ('6118c7111ca945838748dd3de6889ec1', 'SuperAdmin', 'select', '2022-04-18 16:54:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:01', '2022-04-18 16:54:01');
INSERT INTO `sys_operate_logs`
VALUES ('6129d34f55fa4970a20c5e1a9fb05ba8', 'SuperAdmin', 'select', '2022-04-18 17:35:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:35:19', '2022-04-18 17:35:19');
INSERT INTO `sys_operate_logs`
VALUES ('61a698f6a6c34d5ba3596a1a694d71dd', 'SuperAdmin', 'select', '2022-04-12 16:05:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:05:11', '2022-04-12 16:05:11');
INSERT INTO `sys_operate_logs`
VALUES ('6233f85c73f54dfb818a4d70458be840', '未登录', 'select', '2022-04-02 10:44:00', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867440281\\\"]}\"}',
        '2022-04-02 10:44:00', '2022-04-02 10:44:00');
INSERT INTO `sys_operate_logs`
VALUES ('624151bac225428b8a3fa5fb3b29b5a2', 'SuperAdmin', 'select', '2022-04-18 16:49:48', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:49:48', '2022-04-18 16:49:48');
INSERT INTO `sys_operate_logs`
VALUES ('62832d0b96b44fd59717d261b6c18998', '未登录', 'select', '2022-04-02 10:55:18', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868117253\\\"]}\"}',
        '2022-04-02 10:55:18', '2022-04-02 10:55:18');
INSERT INTO `sys_operate_logs`
VALUES ('633472e3dc3942f799207cb67c4828d0', 'SuperAdmin', 'select', '2022-04-12 17:46:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:46:52', '2022-04-12 17:46:52');
INSERT INTO `sys_operate_logs`
VALUES ('634975d1a0774c5f948cf57887fcccef', 'SuperAdmin', 'select', '2022-04-18 17:31:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:31:17', '2022-04-18 17:31:17');
INSERT INTO `sys_operate_logs`
VALUES ('63c8fa1154124329a644b642ecb6ec97', 'SuperAdmin', 'select', '2022-04-18 15:21:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 15:21:06', '2022-04-18 15:21:06');
INSERT INTO `sys_operate_logs`
VALUES ('63df23f14bb54ba79c20df3bf02ea950', '未登录', 'select', '2022-05-13 17:31:44', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 17:31:44',
        '2022-05-13 17:31:44');
INSERT INTO `sys_operate_logs`
VALUES ('640463e7fa184d069de4d1f4d9e9b472', 'SuperAdmin', 'select', '2022-04-18 16:44:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 16:44:51', '2022-04-18 16:44:51');
INSERT INTO `sys_operate_logs`
VALUES ('65af0a44e1fc4b5a917ed5fb416115d1', 'SuperAdmin', 'select', '2022-04-18 17:22:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 17:22:00', '2022-04-18 17:22:00');
INSERT INTO `sys_operate_logs`
VALUES ('65c708aec6de47b794b4e4a969e749c4', 'SuperAdmin', 'select', '2022-04-18 17:23:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:23:05', '2022-04-18 17:23:05');
INSERT INTO `sys_operate_logs`
VALUES ('65d4ffcf7e9d4c6c8517725aa318356d', 'SuperAdmin', 'select', '2022-04-16 12:14:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:14:22', '2022-04-16 12:14:22');
INSERT INTO `sys_operate_logs`
VALUES ('66fd8057bcc74137b4492763358d89ac', 'SuperAdmin', 'select', '2022-04-12 18:01:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:01:55', '2022-04-12 18:01:55');
INSERT INTO `sys_operate_logs`
VALUES ('674ffdad505d4b7faf6b99f222670317', 'SuperAdmin', 'select', '2022-04-18 17:19:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:19:38', '2022-04-18 17:19:38');
INSERT INTO `sys_operate_logs`
VALUES ('67c10019a41740368c5ceef35dfb1988', 'SuperAdmin', 'select', '2022-04-18 17:27:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:35', '2022-04-18 17:27:35');
INSERT INTO `sys_operate_logs`
VALUES ('67ddebe7f8b9422d90de4e3b305ac985', '未登录', 'select', '2022-04-12 16:28:27', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-12 16:28:27',
        '2022-04-12 16:28:27');
INSERT INTO `sys_operate_logs`
VALUES ('6807a4165e6441a2b6727805b394e707', 'SuperAdmin', 'select', '2022-04-12 16:41:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:41:31', '2022-04-12 16:41:31');
INSERT INTO `sys_operate_logs`
VALUES ('6832d2fda8774333af1ff3b03545b737', 'SuperAdmin', 'select', '2022-04-12 18:09:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询失败，id不能为空!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:09:57', '2022-04-12 18:09:57');
INSERT INTO `sys_operate_logs`
VALUES ('685532e2194746d0b3a67e14d478468f', 'SuperAdmin', 'select', '2022-04-18 17:35:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:35:08', '2022-04-18 17:35:08');
INSERT INTO `sys_operate_logs`
VALUES ('68f343752ade482b97a0397b715d3e39', 'SuperAdmin', 'select', '2022-04-18 17:12:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:12:36', '2022-04-18 17:12:36');
INSERT INTO `sys_operate_logs`
VALUES ('69581e338717417ca4271cab00fdb528', 'SuperAdmin', 'select', '2022-04-12 17:17:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:17:19', '2022-04-12 17:17:19');
INSERT INTO `sys_operate_logs`
VALUES ('6966cff63501435391c68b9d82177f63', 'SuperAdmin', 'select', '2022-04-12 17:27:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-12 17:27:04', '2022-04-12 17:27:04');
INSERT INTO `sys_operate_logs`
VALUES ('69be3d4661d04f34abf9265ffe9ae04c', 'SuperAdmin', 'select', '2022-04-18 17:27:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:27:33', '2022-04-18 17:27:33');
INSERT INTO `sys_operate_logs`
VALUES ('69c9e0c900ef44799a629e53a8f5a3da', '未登录', 'select', '2022-05-12 14:38:07', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-12 14:38:07',
        '2022-05-12 14:38:07');
INSERT INTO `sys_operate_logs`
VALUES ('6a32ad5aece34265bd90dfd00e3a1052', 'SuperAdmin', 'select', '2022-04-18 17:35:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:35:15', '2022-04-18 17:35:15');
INSERT INTO `sys_operate_logs`
VALUES ('6a8a58d813e24852862da3d4be6c35df', 'SuperAdmin', 'select', '2022-04-18 16:51:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:14', '2022-04-18 16:51:14');
INSERT INTO `sys_operate_logs`
VALUES ('6ba467f586a342fabe9fbf22f6a79aeb', 'SuperAdmin', 'select', '2022-04-18 16:44:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 16:44:46', '2022-04-18 16:44:46');
INSERT INTO `sys_operate_logs`
VALUES ('6bb124c0d03449588eefb98d64639235', 'SuperAdmin', 'select', '2022-04-18 09:59:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.137.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 09:59:45', '2022-04-18 09:59:45');
INSERT INTO `sys_operate_logs`
VALUES ('6c57f85f2c8b4bb3a5afcd189687d8ce', 'SuperAdmin', 'select', '2022-04-18 17:38:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:38:13', '2022-04-18 17:38:13');
INSERT INTO `sys_operate_logs`
VALUES ('6c590663affb4affb3f62d51f3f93eea', 'SuperAdmin', 'select', '2022-04-12 15:53:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 15:53:15', '2022-04-12 15:53:15');
INSERT INTO `sys_operate_logs`
VALUES ('6c6a2e8ce92a4589a699ace06ffb8e38', 'SuperAdmin', 'select', '2022-04-18 16:54:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:54:01', '2022-04-18 16:54:01');
INSERT INTO `sys_operate_logs`
VALUES ('6c9c175e076b481dabd945eb095e6894', 'SuperAdmin', 'select', '2022-04-18 17:11:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:11:52', '2022-04-18 17:11:52');
INSERT INTO `sys_operate_logs`
VALUES ('6cc8f1bddcf64f94a0f19ff9b298901d', '未登录', 'select', '2022-05-13 11:37:07', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 11:37:08',
        '2022-05-13 11:37:08');
INSERT INTO `sys_operate_logs`
VALUES ('6ce1e3b8bdaa4cc98ac250117a16e545', 'SuperAdmin', 'select', '2022-04-12 18:10:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:10:56', '2022-04-12 18:10:56');
INSERT INTO `sys_operate_logs`
VALUES ('6d420451f4344b20ac98fdb51b8d4485', 'SuperAdmin', 'select', '2022-04-18 17:11:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:11:59', '2022-04-18 17:11:59');
INSERT INTO `sys_operate_logs`
VALUES ('6decb3e78f37437db77360900bf9c458', 'SuperAdmin', 'select', '2022-04-12 17:53:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:53:57', '2022-04-12 17:53:57');
INSERT INTO `sys_operate_logs`
VALUES ('6df32e52371e4910b7704c9b88762b27', 'SuperAdmin', 'select', '2022-04-12 16:40:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:40:35', '2022-04-12 16:40:35');
INSERT INTO `sys_operate_logs`
VALUES ('6e12b3a1bdbf479ead86f2bb546fe528', 'SuperAdmin', 'select', '2022-04-12 17:10:24', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:10:24', '2022-04-12 17:10:24');
INSERT INTO `sys_operate_logs`
VALUES ('6e406dd1fbca47f0a947852ba9579ecf', 'SuperAdmin', 'select', '2022-04-18 16:48:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:48:05', '2022-04-18 16:48:05');
INSERT INTO `sys_operate_logs`
VALUES ('6e76d3c5f3a04f83a3eb332d286b0896', 'SuperAdmin', 'select', '2022-04-18 16:36:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:19', '2022-04-18 16:36:19');
INSERT INTO `sys_operate_logs`
VALUES ('6ede4f72ab6240aaa70b14762e189b3b', 'SuperAdmin', 'select', '2022-04-18 17:12:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:12:28', '2022-04-18 17:12:28');
INSERT INTO `sys_operate_logs`
VALUES ('6f15a03b5f4e4379bf62a23269713861', 'SuperAdmin', 'select', '2022-04-12 18:13:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:13:55', '2022-04-12 18:13:55');
INSERT INTO `sys_operate_logs`
VALUES ('6fc7dbdcec0247f49b21b511b9e53018', 'SuperAdmin', 'select', '2022-04-12 17:34:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:34:52', '2022-04-12 17:34:52');
INSERT INTO `sys_operate_logs`
VALUES ('6fd8107e36b04f8da033a9b57a89d548', 'SuperAdmin', 'select', '2022-04-18 15:30:02', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:02', '2022-04-18 15:30:02');
INSERT INTO `sys_operate_logs`
VALUES ('6ff0c675859247a393339bc68540a638', 'SuperAdmin', 'select', '2022-04-18 16:54:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:08', '2022-04-18 16:54:08');
INSERT INTO `sys_operate_logs`
VALUES ('700b5e9847da41a085492225ebedc0b9', 'SuperAdmin', 'select', '2022-04-12 16:28:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:28:31', '2022-04-12 16:28:31');
INSERT INTO `sys_operate_logs`
VALUES ('7026fc1527734538af5a7fb80c234535', 'SuperAdmin', 'select', '2022-04-12 17:59:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:59:53', '2022-04-12 17:59:53');
INSERT INTO `sys_operate_logs`
VALUES ('70f55c70a3734f429e97c5d0c150212c', 'SuperAdmin', 'select', '2022-04-12 17:45:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:45:35', '2022-04-12 17:45:35');
INSERT INTO `sys_operate_logs`
VALUES ('71633181f4c243dea755973f92729bf1', 'SuperAdmin', 'select', '2022-04-18 17:20:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:20:40', '2022-04-18 17:20:40');
INSERT INTO `sys_operate_logs`
VALUES ('71c71c08192d40468fd7df3795e07ca8', 'SuperAdmin', 'select', '2022-04-18 17:38:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:34', '2022-04-18 17:38:34');
INSERT INTO `sys_operate_logs`
VALUES ('724d5578e2d04f929c5d7f27a5e5696a', 'SuperAdmin', 'select', '2022-04-18 10:00:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.137.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 10:00:56', '2022-04-18 10:00:56');
INSERT INTO `sys_operate_logs`
VALUES ('725b07fa728b4037939a4f007b80a8d8', 'SuperAdmin', 'select', '2022-04-18 17:37:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:37:44', '2022-04-18 17:37:44');
INSERT INTO `sys_operate_logs`
VALUES ('7280e690c3984bfa8a66cab88da176c4', 'SuperAdmin', 'select', '2022-04-18 17:29:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:29:31', '2022-04-18 17:29:31');
INSERT INTO `sys_operate_logs`
VALUES ('7286690b4a334b059e08cefbbe0debfa', 'SuperAdmin', 'select', '2022-04-12 16:41:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:41:30', '2022-04-12 16:41:30');
INSERT INTO `sys_operate_logs`
VALUES ('735b0c042fed48faafa63dbe8e7410be', 'SuperAdmin', 'select', '2022-04-12 18:05:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:05:38', '2022-04-12 18:05:38');
INSERT INTO `sys_operate_logs`
VALUES ('735f2c57ee5947f6ba702d5940ae7ff2', 'SuperAdmin', 'select', '2022-04-18 17:20:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:20:42', '2022-04-18 17:20:42');
INSERT INTO `sys_operate_logs`
VALUES ('7402e97354f541ccb7665944d3270339', 'SuperAdmin', 'select', '2022-04-18 17:16:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:16:36', '2022-04-18 17:16:36');
INSERT INTO `sys_operate_logs`
VALUES ('74155e6dda574b9095dd0cdd4edd2a27', 'SuperAdmin', 'select', '2022-04-18 17:38:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:16', '2022-04-18 17:38:16');
INSERT INTO `sys_operate_logs`
VALUES ('7648b011ae7e48beac5cdbf1fbc29b7b', 'SuperAdmin', 'select', '2022-04-18 15:45:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 15:45:30', '2022-04-18 15:45:30');
INSERT INTO `sys_operate_logs`
VALUES ('778ca9304206464c96d83f2f21141914', 'SuperAdmin', 'select', '2022-04-12 17:17:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:17:44', '2022-04-12 17:17:44');
INSERT INTO `sys_operate_logs`
VALUES ('77d559dddfaf4cacb1f7f5ac314e5338', 'SuperAdmin', 'select', '2022-04-18 16:01:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:01:45', '2022-04-18 16:01:45');
INSERT INTO `sys_operate_logs`
VALUES ('77e54b2104234681acaa587249e4a221', 'SuperAdmin', 'select', '2022-04-12 17:04:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:04:04', '2022-04-12 17:04:04');
INSERT INTO `sys_operate_logs`
VALUES ('7844796d0a2c440d809120fed79da6ff', 'SuperAdmin', 'select', '2022-04-18 10:06:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.137.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 10:06:16', '2022-04-18 10:06:16');
INSERT INTO `sys_operate_logs`
VALUES ('7918e30d307948bdb2697a4ba452d1ab', 'SuperAdmin', 'select', '2022-04-12 17:13:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:13:14', '2022-04-12 17:13:14');
INSERT INTO `sys_operate_logs`
VALUES ('796ff60d3b324c3ea40d4fba15e3b795', 'SuperAdmin', 'select', '2022-04-12 17:38:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PermissionInfoController.findPermissionInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/permissionInfo/findPermissionInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:38:55', '2022-04-12 17:38:55');
INSERT INTO `sys_operate_logs`
VALUES ('798a2b4219684b50b89c620611b914bd', 'SuperAdmin', 'select', '2022-04-18 16:30:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:30:22', '2022-04-18 16:30:22');
INSERT INTO `sys_operate_logs`
VALUES ('7a1ba4a1c0b14cfc84641a3c7f6e46c4', 'SuperAdmin', 'select', '2022-04-12 18:06:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:06:07', '2022-04-12 18:06:07');
INSERT INTO `sys_operate_logs`
VALUES ('7a51f5bed3ee48ee92151bb0a23e0d4b', 'SuperAdmin', 'select', '2022-04-18 14:38:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:38:31', '2022-04-18 14:38:31');
INSERT INTO `sys_operate_logs`
VALUES ('7a637d903ebd4b2fb3b5d39c11b69eba', 'SuperAdmin', 'select', '2022-04-18 16:53:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:53:51', '2022-04-18 16:53:51');
INSERT INTO `sys_operate_logs`
VALUES ('7a660aca2d0e4493b5cf64a9030a42cb', '未登录', 'select', '2022-05-16 09:51:10', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-16 09:51:10',
        '2022-05-16 09:51:10');
INSERT INTO `sys_operate_logs`
VALUES ('7ad7a5686796489fa023a093b3b7cbe8', 'SuperAdmin', 'select', '2022-04-18 16:49:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:49:55', '2022-04-18 16:49:55');
INSERT INTO `sys_operate_logs`
VALUES ('7ba8ec9dcb74409783b8fab85a254ba8', 'SuperAdmin', 'select', '2022-04-18 16:49:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:49:56', '2022-04-18 16:49:56');
INSERT INTO `sys_operate_logs`
VALUES ('7c7f0cb667324331a0332034d40cfefc', 'SuperAdmin', 'select', '2022-04-18 17:27:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:23', '2022-04-18 17:27:23');
INSERT INTO `sys_operate_logs`
VALUES ('7cd5c823a70245bdbd12bce8cd9d498f', 'SuperAdmin', 'select', '2022-04-12 17:38:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:38:19', '2022-04-12 17:38:19');
INSERT INTO `sys_operate_logs`
VALUES ('7d7eb91f03444f97ad6962d66274072c', 'SuperAdmin', 'select', '2022-04-12 18:01:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 18:01:53', '2022-04-12 18:01:53');
INSERT INTO `sys_operate_logs`
VALUES ('7de38982d1dc476885ee075949a74854', 'SuperAdmin', 'select', '2022-04-12 17:18:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:18:51', '2022-04-12 17:18:51');
INSERT INTO `sys_operate_logs`
VALUES ('7e3fe360220b4124a9a035234a9686a2', 'SuperAdmin', 'select', '2022-04-18 10:00:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.137.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 10:00:53', '2022-04-18 10:00:53');
INSERT INTO `sys_operate_logs`
VALUES ('7f280a91721e42b8a43e1a548b5b0a85', 'SuperAdmin', 'select', '2022-04-18 17:37:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:37:46', '2022-04-18 17:37:46');
INSERT INTO `sys_operate_logs`
VALUES ('7f5cc1cd9eb642ecb0a5885dfa3fc637', 'SuperAdmin', 'select', '2022-04-18 09:59:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.137.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 09:59:40', '2022-04-18 09:59:40');
INSERT INTO `sys_operate_logs`
VALUES ('8014727f0d0f43d194ff21d1b7ce3c69', 'SuperAdmin', 'select', '2022-04-02 11:03:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-02 11:03:23', '2022-04-02 11:03:23');
INSERT INTO `sys_operate_logs`
VALUES ('803872495f0b4e959c745c94b63527a4', 'SuperAdmin', 'select', '2022-04-12 17:57:10', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:57:10', '2022-04-12 17:57:10');
INSERT INTO `sys_operate_logs`
VALUES ('8059ad15c9a14bc3a1a12989fb2a09d1', 'SuperAdmin', 'select', '2022-04-18 15:45:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 15:45:30', '2022-04-18 15:45:30');
INSERT INTO `sys_operate_logs`
VALUES ('80fd8a49bdaf4d67bdf8205a14f4999f', 'SuperAdmin', 'select', '2022-04-12 18:21:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:21:23', '2022-04-12 18:21:23');
INSERT INTO `sys_operate_logs`
VALUES ('811a722598c94af38f5990ffca781004', 'SuperAdmin', 'select', '2022-04-18 17:36:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:59', '2022-04-18 17:36:59');
INSERT INTO `sys_operate_logs`
VALUES ('816400f89c504900b90b2fe8b0ce19fc', 'SuperAdmin', 'select', '2022-04-18 17:36:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:59', '2022-04-18 17:36:59');
INSERT INTO `sys_operate_logs`
VALUES ('81d231075af847c4965e8d856a3b0fef', 'SuperAdmin', 'select', '2022-04-18 16:42:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:42:27', '2022-04-18 16:42:27');
INSERT INTO `sys_operate_logs`
VALUES ('826aaefff71740588706ded8f99b763e', 'SuperAdmin', 'select', '2022-04-18 17:38:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:38:34', '2022-04-18 17:38:34');
INSERT INTO `sys_operate_logs`
VALUES ('82898171199148f4b246306ffde4c60c', 'SuperAdmin', 'select', '2022-04-12 17:17:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:17:46', '2022-04-12 17:17:46');
INSERT INTO `sys_operate_logs`
VALUES ('8295e96cd0d448ff98bf03e37bfa5ee9', 'SuperAdmin', 'select', '2022-04-18 17:16:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:16:34', '2022-04-18 17:16:34');
INSERT INTO `sys_operate_logs`
VALUES ('835852d6c40c42109adf92742bed0660', 'SuperAdmin', 'select', '2022-04-18 16:44:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:44:54', '2022-04-18 16:44:54');
INSERT INTO `sys_operate_logs`
VALUES ('8377098aa02445cbab2748dce52933af', 'SuperAdmin', 'select', '2022-04-18 17:12:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:12:38', '2022-04-18 17:12:38');
INSERT INTO `sys_operate_logs`
VALUES ('838b9964393c464093ccd31f2acedb39', 'SuperAdmin', 'select', '2022-04-18 15:31:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"3\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:31:04', '2022-04-18 15:31:04');
INSERT INTO `sys_operate_logs`
VALUES ('847dd8827fb3421282d5e2cdd38e017c', 'SuperAdmin', 'select', '2022-04-18 17:27:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:27:35', '2022-04-18 17:27:35');
INSERT INTO `sys_operate_logs`
VALUES ('84b19f91ac9f4b21a0fe366092287318', 'SuperAdmin', 'select', '2022-04-18 17:12:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 17:12:32', '2022-04-18 17:12:32');
INSERT INTO `sys_operate_logs`
VALUES ('850124024faa49abb9b3d7262b71dc2b', 'SuperAdmin', 'select', '2022-04-12 17:10:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:10:29', '2022-04-12 17:10:29');
INSERT INTO `sys_operate_logs`
VALUES ('8515181374254ca2aa5a1cb2fe2edadf', 'SuperAdmin', 'select', '2022-04-12 16:14:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:14:00', '2022-04-12 16:14:00');
INSERT INTO `sys_operate_logs`
VALUES ('8545108f8ca84f3fae79a5aae9ecc1d2', 'SuperAdmin', 'select', '2022-04-18 17:29:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:32', '2022-04-18 17:29:32');
INSERT INTO `sys_operate_logs`
VALUES ('85710c38a56e43d4948f1bf681b4e3c0', 'SuperAdmin', 'select', '2022-04-18 17:08:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:08:54', '2022-04-18 17:08:54');
INSERT INTO `sys_operate_logs`
VALUES ('8612c03c502d4dd2a870745a1492dc9b', 'SuperAdmin', 'select', '2022-04-12 16:13:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:13:46', '2022-04-12 16:13:46');
INSERT INTO `sys_operate_logs`
VALUES ('863df53882e2450d8a7de2d26600c5dd', 'SuperAdmin', 'select', '2022-04-18 16:43:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:43:35', '2022-04-18 16:43:35');
INSERT INTO `sys_operate_logs`
VALUES ('866a4ab60ff8409c824d50d0cc7ea233', '未登录', 'select', '2022-04-02 11:06:00', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 11:06:00',
        '2022-04-02 11:06:00');
INSERT INTO `sys_operate_logs`
VALUES ('86822f68814f4a87837ca75893c4ff05', 'SuperAdmin', 'select', '2022-04-18 16:54:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 16:54:25', '2022-04-18 16:54:25');
INSERT INTO `sys_operate_logs`
VALUES ('869146af10244fe58b93ea3319218eac', 'SuperAdmin', 'select', '2022-04-18 16:54:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:11', '2022-04-18 16:54:11');
INSERT INTO `sys_operate_logs`
VALUES ('86bc4fa50c4a406d83b52c19a9095ac0', 'SuperAdmin', 'select', '2022-04-12 16:06:47', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:06:47', '2022-04-12 16:06:47');
INSERT INTO `sys_operate_logs`
VALUES ('86ccd16c65664a79b28a08e3eb157fa9', 'SuperAdmin', 'select', '2022-04-12 17:09:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:09:54', '2022-04-12 17:09:54');
INSERT INTO `sys_operate_logs`
VALUES ('86f112dae40c45d69dd25379846b92ca', 'SuperAdmin', 'select', '2022-04-12 16:28:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:28:30', '2022-04-12 16:28:30');
INSERT INTO `sys_operate_logs`
VALUES ('872f88cdfbd8431b987132667cf2ccbc', 'SuperAdmin', 'select', '2022-04-18 17:35:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:35:16', '2022-04-18 17:35:16');
INSERT INTO `sys_operate_logs`
VALUES ('881140cd15e743999be29feb7515b0e5', 'SuperAdmin', 'select', '2022-04-12 18:06:02', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:06:02', '2022-04-12 18:06:02');
INSERT INTO `sys_operate_logs`
VALUES ('882013559ed449d48ca6578640821d25', 'SuperAdmin', 'select', '2022-04-12 18:10:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:10:59', '2022-04-12 18:10:59');
INSERT INTO `sys_operate_logs`
VALUES ('890da55c91c94ab8b6d816d646877d17', 'SuperAdmin', 'select', '2022-04-12 16:07:02', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:07:02', '2022-04-12 16:07:02');
INSERT INTO `sys_operate_logs`
VALUES ('89dcf2e2294e4373b6f75a21112286b2', 'SuperAdmin', 'select', '2022-04-18 17:12:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:12:28', '2022-04-18 17:12:28');
INSERT INTO `sys_operate_logs`
VALUES ('89f5a8c75bbc434686e05be700a20a08', 'SuperAdmin', 'select', '2022-04-18 17:15:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:15:20', '2022-04-18 17:15:20');
INSERT INTO `sys_operate_logs`
VALUES ('8a483a459f9d45b7ade623de1912e467', 'SuperAdmin', 'select', '2022-04-16 12:12:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-16 12:12:08', '2022-04-16 12:12:08');
INSERT INTO `sys_operate_logs`
VALUES ('8a6abf3168b84dea82812c7ed3559209', 'SuperAdmin', 'select', '2022-04-18 17:37:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:37:44', '2022-04-18 17:37:44');
INSERT INTO `sys_operate_logs`
VALUES ('8caa49b0b40f4a0780e3deed67d4e377', 'SuperAdmin', 'select', '2022-04-18 15:28:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:28:59', '2022-04-18 15:28:59');
INSERT INTO `sys_operate_logs`
VALUES ('8ccad401b18f410ca9effe1f6f8f45b4', 'SuperAdmin', 'select', '2022-04-12 17:34:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:34:58',
        '2022-04-12 17:34:58');
INSERT INTO `sys_operate_logs`
VALUES ('8ccd946d971e49d194c780524033771e', 'SuperAdmin', 'select', '2022-04-18 15:30:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:14', '2022-04-18 15:30:14');
INSERT INTO `sys_operate_logs`
VALUES ('8d5946f1006d4053aa72e29330ea7736', '未登录', 'select', '2022-04-02 11:07:39', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868858998\\\"]}\"}',
        '2022-04-02 11:07:39', '2022-04-02 11:07:39');
INSERT INTO `sys_operate_logs`
VALUES ('8d707296fdf24576a7fb2814676d6d12', 'SuperAdmin', 'select', '2022-04-18 15:39:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:39:28', '2022-04-18 15:39:28');
INSERT INTO `sys_operate_logs`
VALUES ('8d92835f31ec44abba9a9405aa7cfd4e', 'SuperAdmin', 'select', '2022-04-12 18:05:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:05:37', '2022-04-12 18:05:37');
INSERT INTO `sys_operate_logs`
VALUES ('8d94dcb3fb1743fdbd3e1689e39843e1', 'SuperAdmin', 'select', '2022-04-18 15:57:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 15:57:22', '2022-04-18 15:57:22');
INSERT INTO `sys_operate_logs`
VALUES ('8d9bea6a57b74f708f3eee2a4e63f173', 'SuperAdmin', 'select', '2022-04-18 16:53:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:57', '2022-04-18 16:53:57');
INSERT INTO `sys_operate_logs`
VALUES ('8de7e5800b1a499f85e96a633b7735a8', 'SuperAdmin', 'select', '2022-04-12 16:38:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:38:37', '2022-04-12 16:38:37');
INSERT INTO `sys_operate_logs`
VALUES ('8dec1bd2379f47d5a2349b632fde0b35', 'SuperAdmin', 'select', '2022-04-18 16:44:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:44:44', '2022-04-18 16:44:44');
INSERT INTO `sys_operate_logs`
VALUES ('8e12e6ca0bd541ab88d6f801f8722f75', 'SuperAdmin', 'select', '2022-04-18 16:40:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:40:49', '2022-04-18 16:40:49');
INSERT INTO `sys_operate_logs`
VALUES ('8e312b598c4f4061b155aab6f4534448', '未登录', 'select', '2022-04-12 17:07:50', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-12 17:07:50',
        '2022-04-12 17:07:50');
INSERT INTO `sys_operate_logs`
VALUES ('8e66297d3ea74451bb86b1f5d53265c4', 'SuperAdmin', 'select', '2022-04-18 16:45:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:45:05', '2022-04-18 16:45:05');
INSERT INTO `sys_operate_logs`
VALUES ('8eabeb37a89e451d91ca34163c79a95d', 'SuperAdmin', 'select', '2022-04-18 16:31:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:31:12', '2022-04-18 16:31:12');
INSERT INTO `sys_operate_logs`
VALUES ('8eeb8a1a047e4c56ac5ba935a583a4a4', 'SuperAdmin', 'select', '2022-04-12 17:53:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:53:57', '2022-04-12 17:53:57');
INSERT INTO `sys_operate_logs`
VALUES ('8f068139085b4659963c033f36acc310', 'SuperAdmin', 'select', '2022-04-18 16:01:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:01:40', '2022-04-18 16:01:40');
INSERT INTO `sys_operate_logs`
VALUES ('90b6b567e0e64b858f220921bf8bf714', 'SuperAdmin', 'select', '2022-04-12 17:13:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:13:06', '2022-04-12 17:13:06');
INSERT INTO `sys_operate_logs`
VALUES ('91d2a99ff9c347aeb44f9281dfd99f21', 'SuperAdmin', 'select', '2022-04-12 18:16:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:16:32', '2022-04-12 18:16:32');
INSERT INTO `sys_operate_logs`
VALUES ('92705c07221a44cf9ddc6d7a97b639ef', 'SuperAdmin', 'select', '2022-04-12 18:06:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:06:14', '2022-04-12 18:06:14');
INSERT INTO `sys_operate_logs`
VALUES ('929f6766b6e64d93ba621f8fa6a11848', 'SuperAdmin', 'select', '2022-04-18 17:11:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:11:55', '2022-04-18 17:11:55');
INSERT INTO `sys_operate_logs`
VALUES ('92a52ee3db574532abea1e5aa5c07c21', 'SuperAdmin', 'select', '2022-04-16 12:12:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:12:13', '2022-04-16 12:12:13');
INSERT INTO `sys_operate_logs`
VALUES ('92d1f620fed34253a20d8cbbd2b6aa2a', 'SuperAdmin', 'select', '2022-04-12 16:41:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:41:28', '2022-04-12 16:41:28');
INSERT INTO `sys_operate_logs`
VALUES ('937c677454cb4ceaa58b972e7bd57fa0', '未登录', 'select', '2022-04-02 10:55:19', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868117253\\\"]}\"}',
        '2022-04-02 10:55:19', '2022-04-02 10:55:19');
INSERT INTO `sys_operate_logs`
VALUES ('93996771f5a94d0ba1ba4d6f1fbbe6a4', 'SuperAdmin', 'select', '2022-04-12 17:45:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:45:31', '2022-04-12 17:45:31');
INSERT INTO `sys_operate_logs`
VALUES ('943a16b6a74541fdb546af90a73655fa', 'SuperAdmin', 'select', '2022-04-12 15:25:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 15:25:57', '2022-04-12 15:25:57');
INSERT INTO `sys_operate_logs`
VALUES ('947222c427bd4124b6a3488a88395370', 'SuperAdmin', 'select', '2022-04-18 17:12:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:12:31', '2022-04-18 17:12:31');
INSERT INTO `sys_operate_logs`
VALUES ('94afd96b8b394c2f95ab8944ada8e696', '未登录', 'select', '2022-05-13 10:59:04', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 10:59:04',
        '2022-05-13 10:59:04');
INSERT INTO `sys_operate_logs`
VALUES ('950a4c8e1e494ac69e26729f9eb4ac6b', 'SuperAdmin', 'select', '2022-04-18 15:30:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"20\\\"]}\"}',
        '2022-04-18 15:30:32', '2022-04-18 15:30:32');
INSERT INTO `sys_operate_logs`
VALUES ('969500f1c1d94b3789127d1c099fce62', 'SuperAdmin', 'select', '2022-04-18 16:53:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:53:58', '2022-04-18 16:53:58');
INSERT INTO `sys_operate_logs`
VALUES ('96ba7c3a43a7400c804ff8b9140216c2', '未登录', 'select', '2022-04-12 16:05:08', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-12 16:05:08',
        '2022-04-12 16:05:08');
INSERT INTO `sys_operate_logs`
VALUES ('977a1e54be93454d898fbc9decf00809', 'SuperAdmin', 'select', '2022-04-18 16:35:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:35:03', '2022-04-18 16:35:03');
INSERT INTO `sys_operate_logs`
VALUES ('97c31fe3845841f09c3942e751a9063d', 'SuperAdmin', 'select', '2022-04-12 17:26:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:26:37', '2022-04-12 17:26:37');
INSERT INTO `sys_operate_logs`
VALUES ('9800b9f5b1c04262b2f5c48971ac51ee', 'SuperAdmin', 'select', '2022-04-18 16:00:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:00:44', '2022-04-18 16:00:44');
INSERT INTO `sys_operate_logs`
VALUES ('982e5fa4667447b297ddd0a84db1f2e2', 'SuperAdmin', 'select', '2022-04-18 16:50:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:50:29', '2022-04-18 16:50:29');
INSERT INTO `sys_operate_logs`
VALUES ('9851a75eb09c41f4bd77d7aac27c51f0', 'SuperAdmin', 'select', '2022-04-18 17:38:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:00', '2022-04-18 17:38:00');
INSERT INTO `sys_operate_logs`
VALUES ('99000468e42e4071a1d98008a7107728', 'SuperAdmin', 'select', '2022-04-01 18:15:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.findMenuInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/menuInfo/findMenuInfoList\",\"请求参数\":\"{\\\"limit\\\":[\\\"10\\\"],\\\"page\\\":[\\\"1\\\"]}\"}',
        '2022-04-01 18:15:32', '2022-04-01 18:15:32');
INSERT INTO `sys_operate_logs`
VALUES ('992a77b2b5234ddb8cf18248410dce65', 'SuperAdmin', 'select', '2022-04-18 17:22:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:22:50', '2022-04-18 17:22:50');
INSERT INTO `sys_operate_logs`
VALUES ('993e07a4661348d2948584ee0a6c7178', 'SuperAdmin', 'select', '2022-04-18 16:36:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:36:19', '2022-04-18 16:36:19');
INSERT INTO `sys_operate_logs`
VALUES ('994ef4d57d1b446a9a46010d9f602d78', 'SuperAdmin', 'select', '2022-04-18 17:36:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:36:42', '2022-04-18 17:36:42');
INSERT INTO `sys_operate_logs`
VALUES ('99791fa9a5a2418cbc3d3ae67cb8048a', 'SuperAdmin', 'select', '2022-04-18 17:12:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:12:41', '2022-04-18 17:12:41');
INSERT INTO `sys_operate_logs`
VALUES ('9aa131dd9fe74df1bd3b01eb48335171', 'SuperAdmin', 'select', '2022-04-12 17:07:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:07:51', '2022-04-12 17:07:51');
INSERT INTO `sys_operate_logs`
VALUES ('9b73bc6278fd410089e01b1ff8070cad', 'SuperAdmin', 'select', '2022-04-18 17:25:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:25:37', '2022-04-18 17:25:37');
INSERT INTO `sys_operate_logs`
VALUES ('9c9b0f542e7f4e0e9b030670959fb59c', 'SuperAdmin', 'select', '2022-04-18 16:54:09', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:09', '2022-04-18 16:54:09');
INSERT INTO `sys_operate_logs`
VALUES ('9cc0d1e330e24498a030da76d0bfa0f8', 'SuperAdmin', 'select', '2022-04-18 16:45:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:45:05', '2022-04-18 16:45:05');
INSERT INTO `sys_operate_logs`
VALUES ('9d1bdc7752d6462fb4dc6ae830505433', 'SuperAdmin', 'select', '2022-04-18 17:38:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:38:16', '2022-04-18 17:38:16');
INSERT INTO `sys_operate_logs`
VALUES ('9d1d4763410c4114b74391fa85e5e110', 'SuperAdmin', 'select', '2022-04-18 17:38:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:38:00', '2022-04-18 17:38:00');
INSERT INTO `sys_operate_logs`
VALUES ('9d1fc7bcd3804f59b4c3d429ca897ecc', 'SuperAdmin', 'select', '2022-04-18 16:36:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:11', '2022-04-18 16:36:11');
INSERT INTO `sys_operate_logs`
VALUES ('9d57e13fe89446b6b922f88b786706f6', 'SuperAdmin', 'select', '2022-04-18 16:30:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:19', '2022-04-18 16:30:19');
INSERT INTO `sys_operate_logs`
VALUES ('9d7e326e3119488682b1537cfcdf19bc', 'SuperAdmin', 'select', '2022-04-18 15:32:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:32:30', '2022-04-18 15:32:30');
INSERT INTO `sys_operate_logs`
VALUES ('9e2ad12e15804eab89fd216875e1f585', 'SuperAdmin', 'select', '2022-04-18 17:12:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:12:35', '2022-04-18 17:12:35');
INSERT INTO `sys_operate_logs`
VALUES ('9f150586a1d94c94830d1b68db7cf35d', 'SuperAdmin', 'select', '2022-04-18 17:12:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:12:35', '2022-04-18 17:12:35');
INSERT INTO `sys_operate_logs`
VALUES ('a09078ca978440f390cd2ec5ce63ded7', 'SuperAdmin', 'select', '2022-04-12 17:28:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-12 17:28:54', '2022-04-12 17:28:54');
INSERT INTO `sys_operate_logs`
VALUES ('a1b1caf557de4e9db5d3f598579fd50b', 'SuperAdmin', 'select', '2022-04-18 17:35:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:35:15', '2022-04-18 17:35:15');
INSERT INTO `sys_operate_logs`
VALUES ('a1c2e7ca6f5f4bee97a578e20f631e56', 'SuperAdmin', 'select', '2022-04-18 16:30:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:30:53', '2022-04-18 16:30:53');
INSERT INTO `sys_operate_logs`
VALUES ('a21c4d29f5d1479292b6808ef6c2db7d', 'SuperAdmin', 'select', '2022-04-18 17:15:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:15:22', '2022-04-18 17:15:22');
INSERT INTO `sys_operate_logs`
VALUES ('a2c93ea1de6a4618afa99156791e611d', 'SuperAdmin', 'select', '2022-04-18 17:35:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:35:20', '2022-04-18 17:35:20');
INSERT INTO `sys_operate_logs`
VALUES ('a2dcc374ccb44177a1f5132a5f100ba5', 'SuperAdmin', 'select', '2022-04-18 17:11:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:11:45', '2022-04-18 17:11:45');
INSERT INTO `sys_operate_logs`
VALUES ('a2fbecdfa8864550a2a02c570dc948b4', '未登录', 'select', '2022-04-02 10:41:16', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867275129\\\"]}\"}',
        '2022-04-02 10:41:16', '2022-04-02 10:41:16');
INSERT INTO `sys_operate_logs`
VALUES ('a4ddf2464e8a48899f3538c3a0960fed', 'SuperAdmin', 'select', '2022-04-12 17:18:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-12 17:18:55', '2022-04-12 17:18:55');
INSERT INTO `sys_operate_logs`
VALUES ('a54858e9711c4c0e8ddc33282b618922', 'SuperAdmin', 'select', '2022-04-18 16:00:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:00:41', '2022-04-18 16:00:41');
INSERT INTO `sys_operate_logs`
VALUES ('a552d85d7963482a9602bb14d93d381e', 'SuperAdmin', 'select', '2022-04-12 16:26:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:26:23', '2022-04-12 16:26:23');
INSERT INTO `sys_operate_logs`
VALUES ('a5a7c9bfc24949bf920f638316066db5', 'SuperAdmin', 'select', '2022-04-18 15:30:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:30:40', '2022-04-18 15:30:40');
INSERT INTO `sys_operate_logs`
VALUES ('a63357ab04ab4983a9d4cd92496117c3', 'SuperAdmin', 'select', '2022-04-18 15:40:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.getPersonInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/personInfo/getPersonInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6869a49c3b2a4f8dae0ba848a40a023f\\\"]}\"}',
        '2022-04-18 15:40:37', '2022-04-18 15:40:37');
INSERT INTO `sys_operate_logs`
VALUES ('a657c60c95ae46dd87e79017f9cad2cb', 'SuperAdmin', 'select', '2022-04-12 16:39:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:39:06', '2022-04-12 16:39:06');
INSERT INTO `sys_operate_logs`
VALUES ('a735377079634bf1b7623e16db71b21f', 'SuperAdmin', 'select', '2022-04-12 18:00:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:00:28', '2022-04-12 18:00:28');
INSERT INTO `sys_operate_logs`
VALUES ('a75a784ab90042b2bc3f978a20215caa', 'SuperAdmin', 'select', '2022-04-18 16:43:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:43:39', '2022-04-18 16:43:39');
INSERT INTO `sys_operate_logs`
VALUES ('a7c664edb3fc425da430e570c5603cdf', 'SuperAdmin', 'select', '2022-04-18 17:12:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:12:33', '2022-04-18 17:12:33');
INSERT INTO `sys_operate_logs`
VALUES ('a7c9522df08a4d9c9747731ccd72de79', 'SuperAdmin', 'select', '2022-04-18 17:27:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:35', '2022-04-18 17:27:35');
INSERT INTO `sys_operate_logs`
VALUES ('a81fcc0261404d8284a79546229f2326', 'SuperAdmin', 'select', '2022-04-16 12:14:24', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-16 12:14:24', '2022-04-16 12:14:24');
INSERT INTO `sys_operate_logs`
VALUES ('a841087e9169480795d5d236a213136f', '未登录', 'select', '2022-04-02 11:05:58', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868757792\\\"]}\"}',
        '2022-04-02 11:05:58', '2022-04-02 11:05:58');
INSERT INTO `sys_operate_logs`
VALUES ('a87e2ff78eaa41348a4d7488fa909905', '未登录', 'select', '2022-04-02 10:41:15', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867275129\\\"]}\"}',
        '2022-04-02 10:41:15', '2022-04-02 10:41:15');
INSERT INTO `sys_operate_logs`
VALUES ('a897f0d3e66b44c6ad04c87b9eb0380d', 'SuperAdmin', 'select', '2022-04-18 17:34:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:27', '2022-04-18 17:34:27');
INSERT INTO `sys_operate_logs`
VALUES ('a8ab298d115f4607abf5384d3c119741', 'SuperAdmin', 'select', '2022-04-12 18:18:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:18:57', '2022-04-12 18:18:57');
INSERT INTO `sys_operate_logs`
VALUES ('a8f9544fd7e9459ea1a1a9cc6b617a42', 'SuperAdmin', 'select', '2022-04-12 18:09:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:09:11', '2022-04-12 18:09:11');
INSERT INTO `sys_operate_logs`
VALUES ('a9c2d570602f4f90ac6813a28d991f8b', 'SuperAdmin', 'select', '2022-04-18 17:34:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:34:23', '2022-04-18 17:34:23');
INSERT INTO `sys_operate_logs`
VALUES ('a9c38e6d08e545e19357e3209fd1b6d5', '未登录', 'select', '2022-04-02 11:03:17', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868596450\\\"]}\"}',
        '2022-04-02 11:03:17', '2022-04-02 11:03:17');
INSERT INTO `sys_operate_logs`
VALUES ('a9f2ac19f7dc4cdfb03b9b48b23eed70', 'SuperAdmin', 'select', '2022-04-16 12:14:24', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:14:24', '2022-04-16 12:14:24');
INSERT INTO `sys_operate_logs`
VALUES ('aa1cbfb9ff384ba386a24a8810400c46', 'SuperAdmin', 'select', '2022-04-12 17:38:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:38:04',
        '2022-04-12 17:38:04');
INSERT INTO `sys_operate_logs`
VALUES ('aa648ceca1c047019cf826f21f73f787', 'SuperAdmin', 'select', '2022-04-12 18:18:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:18:57', '2022-04-12 18:18:57');
INSERT INTO `sys_operate_logs`
VALUES ('aae805636c664353a2ea5a432379750f', 'SuperAdmin', 'select', '2022-04-18 17:12:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:12:38', '2022-04-18 17:12:38');
INSERT INTO `sys_operate_logs`
VALUES ('ab7d6c056bb442af9d518cfd80e70247', 'SuperAdmin', 'select', '2022-04-02 11:03:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.findMenuInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/menuInfo/findMenuInfoList\",\"请求参数\":\"{\\\"limit\\\":[\\\"10\\\"],\\\"page\\\":[\\\"1\\\"]}\"}',
        '2022-04-02 11:03:23', '2022-04-02 11:03:23');
INSERT INTO `sys_operate_logs`
VALUES ('ab8ab12590d54ceaaca1c7a071b6df53', 'SuperAdmin', 'select', '2022-04-18 17:33:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:33:13', '2022-04-18 17:33:13');
INSERT INTO `sys_operate_logs`
VALUES ('abece0a832044e5db07207d8a11e5714', 'SuperAdmin', 'select', '2022-04-18 16:43:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:43:35', '2022-04-18 16:43:35');
INSERT INTO `sys_operate_logs`
VALUES ('acd9f08040c84e47b587b8cb1a54a7fd', 'SuperAdmin', 'select', '2022-04-18 17:34:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:37', '2022-04-18 17:34:37');
INSERT INTO `sys_operate_logs`
VALUES ('ae5174308df5437f9732206c27615700', 'SuperAdmin', 'select', '2022-04-18 16:43:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:43:35', '2022-04-18 16:43:35');
INSERT INTO `sys_operate_logs`
VALUES ('aeab5178a73a4c6c94450d2439f2456a', 'SuperAdmin', 'select', '2022-04-18 17:35:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:35:15', '2022-04-18 17:35:15');
INSERT INTO `sys_operate_logs`
VALUES ('aebead70009a4bf5ba9a09fb52111eef', 'SuperAdmin', 'select', '2022-04-12 18:05:35', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:05:35', '2022-04-12 18:05:35');
INSERT INTO `sys_operate_logs`
VALUES ('aeef1b546bc14329b6e8a3186b89864b', 'SuperAdmin', 'select', '2022-04-18 17:11:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:11:55', '2022-04-18 17:11:55');
INSERT INTO `sys_operate_logs`
VALUES ('af09a7ee6fca40faa43a40799340664f', 'SuperAdmin', 'select', '2022-04-18 17:35:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:35:17', '2022-04-18 17:35:17');
INSERT INTO `sys_operate_logs`
VALUES ('af7a776ba9fb4840b4a66fe3f88446b1', 'SuperAdmin', 'select', '2022-04-18 14:42:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 14:42:23', '2022-04-18 14:42:23');
INSERT INTO `sys_operate_logs`
VALUES ('afd31efc29fb41bfb1b74a2ff90ea101', 'SuperAdmin', 'select', '2022-04-12 17:18:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:18:15',
        '2022-04-12 17:18:15');
INSERT INTO `sys_operate_logs`
VALUES ('b052945c4f0a457099f0a1895d2b68bc', 'SuperAdmin', 'select', '2022-04-01 18:14:47', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '2.0.11.172',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-01 18:14:47', '2022-04-01 18:14:47');
INSERT INTO `sys_operate_logs`
VALUES ('b06a8fe6e6a74dc39700cbc81a0ec1e0', 'SuperAdmin', 'select', '2022-04-18 17:28:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:07', '2022-04-18 17:28:07');
INSERT INTO `sys_operate_logs`
VALUES ('b0fd2683f53648adbd3a564d1ced4a6b', 'SuperAdmin', 'select', '2022-04-18 15:30:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:30:44', '2022-04-18 15:30:44');
INSERT INTO `sys_operate_logs`
VALUES ('b1a50bec8aa74c549809bbb54f667e96', 'SuperAdmin', 'select', '2022-04-18 16:51:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:51:31', '2022-04-18 16:51:31');
INSERT INTO `sys_operate_logs`
VALUES ('b1a97342207f4dac9f1b295dc257bd9d', 'SuperAdmin', 'select', '2022-04-18 09:59:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.137.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 09:59:43', '2022-04-18 09:59:43');
INSERT INTO `sys_operate_logs`
VALUES ('b226c03da7d3467b9dd73ff75122200d', 'SuperAdmin', 'select', '2022-04-12 15:59:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:59:06', '2022-04-12 15:59:06');
INSERT INTO `sys_operate_logs`
VALUES ('b27d79aa5840475a8063d6df9b4a4f56', 'SuperAdmin', 'select', '2022-04-18 17:11:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:11:59', '2022-04-18 17:11:59');
INSERT INTO `sys_operate_logs`
VALUES ('b32620d26bdd4f6fbb1d703033db4449', 'SuperAdmin', 'select', '2022-05-13 15:13:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 15:13:51',
        '2022-05-13 15:13:51');
INSERT INTO `sys_operate_logs`
VALUES ('b35a50e999484c069a562082b78dba09', 'SuperAdmin', 'select', '2022-04-18 11:27:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 11:27:15', '2022-04-18 11:27:15');
INSERT INTO `sys_operate_logs`
VALUES ('b35ee2c4ecf64cc28e575400d0907a71', 'SuperAdmin', 'select', '2022-04-18 17:31:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:31:00', '2022-04-18 17:31:00');
INSERT INTO `sys_operate_logs`
VALUES ('b3a5da3aab744c93930257478a187e71', '未登录', 'select', '2022-04-02 10:55:22', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 10:55:22',
        '2022-04-02 10:55:22');
INSERT INTO `sys_operate_logs`
VALUES ('b43e4dc1013741d49234d1a661297815', 'SuperAdmin', 'select', '2022-04-18 16:43:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:43:37', '2022-04-18 16:43:37');
INSERT INTO `sys_operate_logs`
VALUES ('b457376a0c004f6b90e5013b03ab3e07', 'SuperAdmin', 'select', '2022-04-18 15:33:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:33:33', '2022-04-18 15:33:33');
INSERT INTO `sys_operate_logs`
VALUES ('b4d211075dc546a18e1514829ac68325', '未登录', 'select', '2022-04-02 11:01:38', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868496947\\\"]}\"}',
        '2022-04-02 11:01:38', '2022-04-02 11:01:38');
INSERT INTO `sys_operate_logs`
VALUES ('b55f3ff58b5d468f80d6a807bb85193a', 'SuperAdmin', 'select', '2022-04-18 14:42:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:42:18', '2022-04-18 14:42:18');
INSERT INTO `sys_operate_logs`
VALUES ('b5a89b7f40e8481c83209bde3f066d27', 'SuperAdmin', 'select', '2022-04-18 16:54:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:05', '2022-04-18 16:54:05');
INSERT INTO `sys_operate_logs`
VALUES ('b62d6025e9c14887b1791976f90fc35f', 'SuperAdmin', 'select', '2022-04-01 18:15:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-01 18:15:32', '2022-04-01 18:15:32');
INSERT INTO `sys_operate_logs`
VALUES ('b68d8199e39d492d8cb356e031add984', 'SuperAdmin', 'select', '2022-04-12 18:05:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-12 18:05:30', '2022-04-12 18:05:30');
INSERT INTO `sys_operate_logs`
VALUES ('b6c9d9dfd2c448c8971542fa607e8021', 'SuperAdmin', 'select', '2022-04-12 17:28:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:28:53', '2022-04-12 17:28:53');
INSERT INTO `sys_operate_logs`
VALUES ('b6e0d5db02a847339f2ef9151225e9ee', 'SuperAdmin', 'select', '2022-04-02 11:07:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 11:07:46',
        '2022-04-02 11:07:46');
INSERT INTO `sys_operate_logs`
VALUES ('b705a407dd6d418fb2f9b2dd33d31b3c', 'SuperAdmin', 'select', '2022-04-18 16:44:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:44:54', '2022-04-18 16:44:54');
INSERT INTO `sys_operate_logs`
VALUES ('b8d2dbe64ff8413b9eb3c90ee1042361', 'SuperAdmin', 'select', '2022-04-12 17:09:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:09:11', '2022-04-12 17:09:11');
INSERT INTO `sys_operate_logs`
VALUES ('b92d9ef7937d4df990112503d111a98e', 'SuperAdmin', 'select', '2022-04-18 17:34:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:34:37', '2022-04-18 17:34:37');
INSERT INTO `sys_operate_logs`
VALUES ('b9a2d736dfb54008a74d8fba014ffaa2', 'SuperAdmin', 'select', '2022-04-18 16:37:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:37:42', '2022-04-18 16:37:42');
INSERT INTO `sys_operate_logs`
VALUES ('bb39297baac640698d59b9e572f8a1d1', 'SuperAdmin', 'select', '2022-04-18 17:34:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:34:25', '2022-04-18 17:34:25');
INSERT INTO `sys_operate_logs`
VALUES ('bb71dec501334c90a35f7eb7390f8f71', 'SuperAdmin', 'select', '2022-04-18 15:29:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:29:18', '2022-04-18 15:29:18');
INSERT INTO `sys_operate_logs`
VALUES ('bba1eaeb4a5c423ba35e7bede09c52e8', 'SuperAdmin', 'select', '2022-04-12 16:06:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:06:49', '2022-04-12 16:06:49');
INSERT INTO `sys_operate_logs`
VALUES ('bba307c6600a41619b1e6f5685eae546', 'SuperAdmin', 'select', '2022-04-18 16:44:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:44:54', '2022-04-18 16:44:54');
INSERT INTO `sys_operate_logs`
VALUES ('bbead8623efb4c6fba0ed30a195fe78f', 'SuperAdmin', 'select', '2022-04-18 16:36:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:36:42', '2022-04-18 16:36:42');
INSERT INTO `sys_operate_logs`
VALUES ('bbebc93bdcd64f858093011f4ddce127', 'SuperAdmin', 'select', '2022-04-12 17:45:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 17:45:18', '2022-04-12 17:45:18');
INSERT INTO `sys_operate_logs`
VALUES ('bbf0314a95df483db04290974b7f0242', 'SuperAdmin', 'select', '2022-04-18 17:36:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:36:45', '2022-04-18 17:36:45');
INSERT INTO `sys_operate_logs`
VALUES ('bc81be17dd0447d29aeff0bd474ea6ab', 'SuperAdmin', 'select', '2022-04-18 16:38:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:38:56', '2022-04-18 16:38:56');
INSERT INTO `sys_operate_logs`
VALUES ('bc879d29cd69410fbba1eaefe8379183', 'SuperAdmin', 'select', '2022-04-12 17:34:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-12 17:34:55', '2022-04-12 17:34:55');
INSERT INTO `sys_operate_logs`
VALUES ('bd0b440ffeb54e1781f726d07b756c86', 'SuperAdmin', 'select', '2022-04-18 17:35:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:35:17', '2022-04-18 17:35:17');
INSERT INTO `sys_operate_logs`
VALUES ('bd96122d6b5c40ff95a0f7db07c19cb7', 'SuperAdmin', 'select', '2022-04-18 15:42:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 15:42:31', '2022-04-18 15:42:31');
INSERT INTO `sys_operate_logs`
VALUES ('bd9de72e5a094329a5282e2fb2f38e14', 'SuperAdmin', 'select', '2022-04-12 17:07:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:07:54', '2022-04-12 17:07:54');
INSERT INTO `sys_operate_logs`
VALUES ('bdb485d9cb1d4403a142e20a1a35d230', 'SuperAdmin', 'select', '2022-04-18 15:36:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:36:49', '2022-04-18 15:36:49');
INSERT INTO `sys_operate_logs`
VALUES ('be163bade1004541bf7e90f9e80003e5', 'SuperAdmin', 'select', '2022-04-18 16:37:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:37:45', '2022-04-18 16:37:45');
INSERT INTO `sys_operate_logs`
VALUES ('bf638dbcb91b4861aefe86442d954537', '未登录', 'select', '2022-04-02 11:07:39', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868858998\\\"]}\"}',
        '2022-04-02 11:07:39', '2022-04-02 11:07:39');
INSERT INTO `sys_operate_logs`
VALUES ('bf649e10b0fe4738869e2face54f7eea', 'SuperAdmin', 'select', '2022-04-18 16:51:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 16:51:08', '2022-04-18 16:51:08');
INSERT INTO `sys_operate_logs`
VALUES ('bfb4a56f9eb34fb6b40e55938faf851f', 'SuperAdmin', 'select', '2022-04-12 17:52:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.getRoleInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/roleInfo/getRoleInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"32047ea768ff4c72a784e0bc02650eaa\\\"]}\"}',
        '2022-04-12 17:52:04', '2022-04-12 17:52:04');
INSERT INTO `sys_operate_logs`
VALUES ('bfb94ea734bb442d8a1bdb28657a6024', 'SuperAdmin', 'select', '2022-04-18 15:40:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.savePersonInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/personInfo/savePersonInfo\",\"请求参数\":\"{}\"}',
        '2022-04-18 15:40:43', '2022-04-18 15:40:43');
INSERT INTO `sys_operate_logs`
VALUES ('bfc47c29344842ef88adcb1cb32625c8', 'SuperAdmin', 'select', '2022-04-18 17:23:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:23:05', '2022-04-18 17:23:05');
INSERT INTO `sys_operate_logs`
VALUES ('bff26f49484b4e6b8131f82bd305fff6', '未登录', 'select', '2022-04-16 12:11:35', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-16 12:11:35',
        '2022-04-16 12:11:35');
INSERT INTO `sys_operate_logs`
VALUES ('c0143159b83b46e2a30ee3d984f6c873', 'SuperAdmin', 'select', '2022-04-18 16:35:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:35:03', '2022-04-18 16:35:03');
INSERT INTO `sys_operate_logs`
VALUES ('c0e4898b002849869263c36d66c1a7e1', 'SuperAdmin', 'select', '2022-04-18 15:30:38', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:30:38', '2022-04-18 15:30:38');
INSERT INTO `sys_operate_logs`
VALUES ('c10a01251e7b4452ad3611c9dc181470', 'SuperAdmin', 'select', '2022-04-18 16:30:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:03', '2022-04-18 16:30:03');
INSERT INTO `sys_operate_logs`
VALUES ('c14329d7291d40eca1be5d2743462946', 'SuperAdmin', 'select', '2022-04-18 16:30:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:51', '2022-04-18 16:30:51');
INSERT INTO `sys_operate_logs`
VALUES ('c18a49256bcd493580c048e55cb42dd5', 'SuperAdmin', 'select', '2022-04-12 10:40:48', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 10:40:48', '2022-04-12 10:40:48');
INSERT INTO `sys_operate_logs`
VALUES ('c1919bb267e04963a23a8fcadbfe6d51', '未登录', 'select', '2022-04-18 09:59:39', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.137.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-18 09:59:39',
        '2022-04-18 09:59:39');
INSERT INTO `sys_operate_logs`
VALUES ('c19ae0df1e3b485bb4b035d6f322d5f1', 'SuperAdmin', 'select', '2022-04-18 17:15:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:15:20', '2022-04-18 17:15:20');
INSERT INTO `sys_operate_logs`
VALUES ('c1a2e794c7d845f0bcec9d5525d80dd4', 'SuperAdmin', 'select', '2022-04-18 16:53:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 16:53:56', '2022-04-18 16:53:56');
INSERT INTO `sys_operate_logs`
VALUES ('c1b9dcf6f0a1476cb29cf0f17bcb2b98', 'SuperAdmin', 'select', '2022-04-18 17:35:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:35:13', '2022-04-18 17:35:13');
INSERT INTO `sys_operate_logs`
VALUES ('c1ba7a51b1524071a40f477b5145daa6', '未登录', 'select', '2022-04-02 10:44:00', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648867440281\\\"]}\"}',
        '2022-04-02 10:44:00', '2022-04-02 10:44:00');
INSERT INTO `sys_operate_logs`
VALUES ('c1e9a4780d394952a10bdd9a6e8fbf63', 'SuperAdmin', 'select', '2022-04-18 17:33:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:33:13', '2022-04-18 17:33:13');
INSERT INTO `sys_operate_logs`
VALUES ('c260581659c34612abf05188084b1767', 'SuperAdmin', 'select', '2022-04-18 15:40:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:40:13', '2022-04-18 15:40:13');
INSERT INTO `sys_operate_logs`
VALUES ('c29b18b19ffe4851819c8f545bbeeb85', 'SuperAdmin', 'select', '2022-04-18 14:41:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:41:36', '2022-04-18 14:41:36');
INSERT INTO `sys_operate_logs`
VALUES ('c2bcf5dab64646ce9952defa806b8be9', 'SuperAdmin', 'select', '2022-04-12 16:41:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:41:49', '2022-04-12 16:41:49');
INSERT INTO `sys_operate_logs`
VALUES ('c3b4dcb5678a4421a97f416bdfd2f7a6', 'SuperAdmin', 'select', '2022-04-18 15:40:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:40:16', '2022-04-18 15:40:16');
INSERT INTO `sys_operate_logs`
VALUES ('c40409b02e0b48b5b548ec1c421c166f', 'SuperAdmin', 'select', '2022-04-18 16:53:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:29', '2022-04-18 16:53:29');
INSERT INTO `sys_operate_logs`
VALUES ('c4252ce330eb40c080caea4163242fc0', 'SuperAdmin', 'select', '2022-04-18 17:38:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:38:16', '2022-04-18 17:38:16');
INSERT INTO `sys_operate_logs`
VALUES ('c490e73705644ae1903819f11d36157e', 'SuperAdmin', 'select', '2022-04-18 17:29:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:28', '2022-04-18 17:29:28');
INSERT INTO `sys_operate_logs`
VALUES ('c5863ffba1a14692bfcee3d738303735', 'SuperAdmin', 'select', '2022-04-18 17:36:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:36:59', '2022-04-18 17:36:59');
INSERT INTO `sys_operate_logs`
VALUES ('c594a2aa3f344fb5895c80f94e5a1e55', 'SuperAdmin', 'select', '2022-04-12 17:21:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:21:41', '2022-04-12 17:21:41');
INSERT INTO `sys_operate_logs`
VALUES ('c5997d24792f4d44a979fecacf2fb911', 'SuperAdmin', 'select', '2022-05-13 15:07:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 15:07:36',
        '2022-05-13 15:07:36');
INSERT INTO `sys_operate_logs`
VALUES ('c68028782ebd4759baee12b2b9b5cea3', 'SuperAdmin', 'select', '2022-04-18 16:36:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:42', '2022-04-18 16:36:42');
INSERT INTO `sys_operate_logs`
VALUES ('c6a435053af94f6389c73d9793dbc124', '未登录', 'select', '2022-04-02 10:55:19', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868117253\\\"]}\"}',
        '2022-04-02 10:55:19', '2022-04-02 10:55:19');
INSERT INTO `sys_operate_logs`
VALUES ('c83c67ae40d2428eb131132308ff7644', 'SuperAdmin', 'select', '2022-04-12 17:09:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:09:44', '2022-04-12 17:09:44');
INSERT INTO `sys_operate_logs`
VALUES ('c857fc5b34184fd2a1e04871a456ee36', 'SuperAdmin', 'select', '2022-04-18 16:30:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:30:03', '2022-04-18 16:30:03');
INSERT INTO `sys_operate_logs`
VALUES ('c860667af27c4d9eba3a1cabee7c4358', 'SuperAdmin', 'select', '2022-04-18 16:51:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:14', '2022-04-18 16:51:14');
INSERT INTO `sys_operate_logs`
VALUES ('c925d2b9d6c648b487e5e90e1ea887c0', 'SuperAdmin', 'select', '2022-04-18 17:31:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:31:17', '2022-04-18 17:31:17');
INSERT INTO `sys_operate_logs`
VALUES ('c9a804207cfd46628f2ee39e05003a11', 'SuperAdmin', 'select', '2022-04-12 17:18:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:18:49',
        '2022-04-12 17:18:49');
INSERT INTO `sys_operate_logs`
VALUES ('c9c2d64bad674bcbad8284f22a0f96a7', 'SuperAdmin', 'select', '2022-04-12 17:29:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 17:29:45',
        '2022-04-12 17:29:45');
INSERT INTO `sys_operate_logs`
VALUES ('c9e60b456a0c4cd29409057bf3fd068d', 'SuperAdmin', 'select', '2022-04-18 16:34:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 16:34:58', '2022-04-18 16:34:58');
INSERT INTO `sys_operate_logs`
VALUES ('c9f95056fef0467682ac06320a015339', 'SuperAdmin', 'select', '2022-04-18 16:45:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:45:05', '2022-04-18 16:45:05');
INSERT INTO `sys_operate_logs`
VALUES ('ca1b18f576da4b5fa4beafb698a9ac26', 'SuperAdmin', 'select', '2022-04-18 17:38:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:38:33', '2022-04-18 17:38:33');
INSERT INTO `sys_operate_logs`
VALUES ('ca8ad5ecf46341eb8e3ce3aa09215c53', 'SuperAdmin', 'select', '2022-04-18 17:37:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:37:46', '2022-04-18 17:37:46');
INSERT INTO `sys_operate_logs`
VALUES ('caded831c9794161bcc98d3a5b9ecce5', 'SuperAdmin', 'select', '2022-04-18 16:36:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:42', '2022-04-18 16:36:42');
INSERT INTO `sys_operate_logs`
VALUES ('cc750fe889fc42a7ac49f8afb8c6a05f', 'SuperAdmin', 'select', '2022-04-18 17:25:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:25:29', '2022-04-18 17:25:29');
INSERT INTO `sys_operate_logs`
VALUES ('cca4eb4d08724ed6bb706b9a69bf1dac', 'SuperAdmin', 'select', '2022-04-18 17:29:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:29:32', '2022-04-18 17:29:32');
INSERT INTO `sys_operate_logs`
VALUES ('cca8eb4118dc4faeb6f8902ff08c8c6c', 'SuperAdmin', 'select', '2022-04-12 17:46:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:46:52', '2022-04-12 17:46:52');
INSERT INTO `sys_operate_logs`
VALUES ('ccab91dbefe24a7fba190e72ccfdbefc', 'SuperAdmin', 'select', '2022-04-18 17:24:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:24:45', '2022-04-18 17:24:45');
INSERT INTO `sys_operate_logs`
VALUES ('cd5d7cd4492e46d8902de1878b4dae06', '未登录', 'select', '2022-04-02 10:55:19', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868117253\\\"]}\"}',
        '2022-04-02 10:55:19', '2022-04-02 10:55:19');
INSERT INTO `sys_operate_logs`
VALUES ('cd643023a3cc4da4848d051ac333c19b', 'SuperAdmin', 'select', '2022-04-18 16:54:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 16:54:05', '2022-04-18 16:54:05');
INSERT INTO `sys_operate_logs`
VALUES ('cd799cd764b74a01bfa59831d52c0987', 'SuperAdmin', 'select', '2022-04-18 17:22:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:22:16', '2022-04-18 17:22:16');
INSERT INTO `sys_operate_logs`
VALUES ('ce73b4eb9d7c4355bef159f99e63fa9c', 'SuperAdmin', 'select', '2022-04-12 18:11:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:11:46', '2022-04-12 18:11:46');
INSERT INTO `sys_operate_logs`
VALUES ('cea262781f694dc2add6f7fdb8cc3c15', 'SuperAdmin', 'select', '2022-04-12 17:52:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:52:42', '2022-04-12 17:52:42');
INSERT INTO `sys_operate_logs`
VALUES ('cefe5ce101fe45049fa1fa6089450e03', 'SuperAdmin', 'select', '2022-04-18 17:29:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:29:50', '2022-04-18 17:29:50');
INSERT INTO `sys_operate_logs`
VALUES ('cf0c2289e8ca4990805a37f1b61dcde1', 'SuperAdmin', 'select', '2022-04-18 16:30:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:22', '2022-04-18 16:30:22');
INSERT INTO `sys_operate_logs`
VALUES ('cf9c25a873824829a4d4ea5cd71d2784', 'SuperAdmin', 'select', '2022-04-18 10:06:13', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.getPersonInfo', '192.168.137.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/personInfo/getPersonInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6869a49c3b2a4f8dae0ba848a40a023f\\\"]}\"}',
        '2022-04-18 10:06:13', '2022-04-18 10:06:13');
INSERT INTO `sys_operate_logs`
VALUES ('cfc57057c4b54bcb86a0da96f3e92423', 'SuperAdmin', 'select', '2022-04-18 16:54:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:54:08', '2022-04-18 16:54:08');
INSERT INTO `sys_operate_logs`
VALUES ('cfe40fc8d5ff47aa9f3f97b6bb4416bc', 'SuperAdmin', 'select', '2022-04-18 17:12:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 17:12:41', '2022-04-18 17:12:41');
INSERT INTO `sys_operate_logs`
VALUES ('d0dc0edbacaa48d8b50d227e20847096', 'SuperAdmin', 'select', '2022-04-18 17:36:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:41', '2022-04-18 17:36:41');
INSERT INTO `sys_operate_logs`
VALUES ('d11b734403ed4c1cb8277694b1e0e7f4', 'SuperAdmin', 'select', '2022-04-12 16:05:09', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 16:05:09', '2022-04-12 16:05:09');
INSERT INTO `sys_operate_logs`
VALUES ('d1486a29847f4fa88cee04ef5a38d00f', 'SuperAdmin', 'select', '2022-04-18 14:37:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 14:37:43', '2022-04-18 14:37:43');
INSERT INTO `sys_operate_logs`
VALUES ('d1bce4cafdb54cd8ab221dc7505e0dad', '未登录', 'select', '2022-04-02 11:07:39', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getKaptcha',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getKaptcha\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868858998\\\"]}\"}',
        '2022-04-02 11:07:39', '2022-04-02 11:07:39');
INSERT INTO `sys_operate_logs`
VALUES ('d1cbd2b35ca7451b808bf7cae301d26e', 'SuperAdmin', 'select', '2022-04-18 16:37:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:37:45', '2022-04-18 16:37:45');
INSERT INTO `sys_operate_logs`
VALUES ('d21968ad828c417ca2a9f1336ba742f8', 'SuperAdmin', 'select', '2022-05-16 10:03:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.2.236',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-05-16 10:03:30', '2022-05-16 10:03:30');
INSERT INTO `sys_operate_logs`
VALUES ('d270ea7123124f88837d2c33bec2bbe1', 'SuperAdmin', 'select', '2022-04-18 15:30:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"20\\\"]}\"}',
        '2022-04-18 15:30:32', '2022-04-18 15:30:32');
INSERT INTO `sys_operate_logs`
VALUES ('d2a09be0facb47fd991c879ad34da631', '未登录', 'select', '2022-04-18 17:21:55', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-18 17:21:55',
        '2022-04-18 17:21:55');
INSERT INTO `sys_operate_logs`
VALUES ('d2aa9dacc864422bb5f910ea468ac988', 'SuperAdmin', 'select', '2022-04-18 17:12:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 17:12:32', '2022-04-18 17:12:32');
INSERT INTO `sys_operate_logs`
VALUES ('d3a9edb61659489abf2942389d8be5f5', 'SuperAdmin', 'select', '2022-04-12 17:12:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:12:36', '2022-04-12 17:12:36');
INSERT INTO `sys_operate_logs`
VALUES ('d41e1111ac834f90a162e310aeeef18c', '未登录', 'select', '2022-04-02 11:07:39', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868858998\\\"]}\"}',
        '2022-04-02 11:07:39', '2022-04-02 11:07:39');
INSERT INTO `sys_operate_logs`
VALUES ('d4212d983e2e4144be0c610ed1556a74', 'SuperAdmin', 'select', '2022-04-12 17:51:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:51:57', '2022-04-12 17:51:57');
INSERT INTO `sys_operate_logs`
VALUES ('d51e5a67b76d49cfbfbd2f5c8441de92', 'SuperAdmin', 'select', '2022-04-18 16:53:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:53:29', '2022-04-18 16:53:29');
INSERT INTO `sys_operate_logs`
VALUES ('d54c4f98bcdd44a1b6cb72518ca4dac1', 'SuperAdmin', 'select', '2022-04-12 16:06:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:06:30', '2022-04-12 16:06:30');
INSERT INTO `sys_operate_logs`
VALUES ('d59e0e2b49ab401fbb823d15db00906e', 'SuperAdmin', 'select', '2022-04-18 17:31:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:31:00', '2022-04-18 17:31:00');
INSERT INTO `sys_operate_logs`
VALUES ('d5b259e9d7c0460c87d4e508cd0dff09', 'SuperAdmin', 'select', '2022-04-18 16:49:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:49:56', '2022-04-18 16:49:56');
INSERT INTO `sys_operate_logs`
VALUES ('d5b5161ea8cb4eb7b8749bc471f6c3a2', 'SuperAdmin', 'select', '2022-04-18 17:35:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:35:19', '2022-04-18 17:35:19');
INSERT INTO `sys_operate_logs`
VALUES ('d5f20f54c323413593822925ff094ca2', 'SuperAdmin', 'select', '2022-04-18 16:00:47', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:00:47', '2022-04-18 16:00:47');
INSERT INTO `sys_operate_logs`
VALUES ('d652f9116efa4e8f95164f0d58b8e8c9', 'SuperAdmin', 'select', '2022-04-18 17:32:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:32:43', '2022-04-18 17:32:43');
INSERT INTO `sys_operate_logs`
VALUES ('d6f270c34e254b6e8b06cef606d6f136', 'SuperAdmin', 'select', '2022-04-18 15:40:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:40:46', '2022-04-18 15:40:46');
INSERT INTO `sys_operate_logs`
VALUES ('d741b003dd614e2e93907660ee2b4067', 'SuperAdmin', 'select', '2022-04-12 17:38:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:38:07', '2022-04-12 17:38:07');
INSERT INTO `sys_operate_logs`
VALUES ('d74bb0d947cf4d70a6a4f83dee344910', 'SuperAdmin', 'select', '2022-04-18 17:34:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:34:27', '2022-04-18 17:34:27');
INSERT INTO `sys_operate_logs`
VALUES ('d787f210f56745049757f9b64b914992', 'SuperAdmin', 'select', '2022-04-18 17:35:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:35:19', '2022-04-18 17:35:19');
INSERT INTO `sys_operate_logs`
VALUES ('d7e220ec661f49cf9926308afda32c78', 'SuperAdmin', 'select', '2022-04-12 18:09:17', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-12 18:09:17', '2022-04-12 18:09:17');
INSERT INTO `sys_operate_logs`
VALUES ('d8f3c0203a544452a65a305ff394e450', 'SuperAdmin', 'select', '2022-04-18 17:18:53', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:18:53', '2022-04-18 17:18:53');
INSERT INTO `sys_operate_logs`
VALUES ('d998b43efb5041b58139bb267797aab0', 'SuperAdmin', 'select', '2022-04-18 16:53:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:55', '2022-04-18 16:53:55');
INSERT INTO `sys_operate_logs`
VALUES ('d9d8126cb00c41f68bdbee865f3bae3d', 'SuperAdmin', 'select', '2022-04-18 15:28:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:28:52', '2022-04-18 15:28:52');
INSERT INTO `sys_operate_logs`
VALUES ('d9e17ff277bf43d68ed98efc7c167ed5', 'SuperAdmin', 'select', '2022-04-18 15:30:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"3\\\"],\\\"limit\\\":[\\\"5\\\"]}\"}',
        '2022-04-18 15:30:45', '2022-04-18 15:30:45');
INSERT INTO `sys_operate_logs`
VALUES ('da8ad0cad50c4dd08c30acdc886a7c92', 'SuperAdmin', 'select', '2022-04-18 16:29:59', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:29:59', '2022-04-18 16:29:59');
INSERT INTO `sys_operate_logs`
VALUES ('dad5f85551034cf6b3895b9600816e6d', 'SuperAdmin', 'select', '2022-04-18 16:43:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:43:39', '2022-04-18 16:43:39');
INSERT INTO `sys_operate_logs`
VALUES ('db0fb143cd3f4035b54c5af5aaf64eb5', 'SuperAdmin', 'select', '2022-04-18 16:00:39', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:00:39', '2022-04-18 16:00:39');
INSERT INTO `sys_operate_logs`
VALUES ('dbbd0253682a48aea4b4b29f15befcdf', '未登录', 'select', '2022-04-18 14:37:38', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-18 14:37:38',
        '2022-04-18 14:37:38');
INSERT INTO `sys_operate_logs`
VALUES ('dc939577996b43a9885ea1e295923c5c', 'SuperAdmin', 'select', '2022-04-18 17:36:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:36:57', '2022-04-18 17:36:57');
INSERT INTO `sys_operate_logs`
VALUES ('dcf9e47f386f4bfa977fe7f9f7b72ad7', 'SuperAdmin', 'select', '2022-04-18 17:36:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:36:44', '2022-04-18 17:36:44');
INSERT INTO `sys_operate_logs`
VALUES ('dd0aa3dcad32478882e2aa9f3c8f18d1', 'SuperAdmin', 'select', '2022-04-12 17:47:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:47:04', '2022-04-12 17:47:04');
INSERT INTO `sys_operate_logs`
VALUES ('dd3f81d011f24b9e86c2755838665762', 'SuperAdmin', 'select', '2022-04-12 17:26:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:26:32', '2022-04-12 17:26:32');
INSERT INTO `sys_operate_logs`
VALUES ('dd94bac79def4a22980760ce665afe70', 'SuperAdmin', 'select', '2022-04-18 17:37:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 17:37:41', '2022-04-18 17:37:41');
INSERT INTO `sys_operate_logs`
VALUES ('ddb326e98c44471baf214c4654cb1133', 'SuperAdmin', 'select', '2022-04-18 16:44:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.addPerson', '192.168.154.1',
        '{\"请求结果\":\"添加成功!\",\"请求路径\":\"/orgInfo/addPerson\",\"请求参数\":\"{}\"}', '2022-04-18 16:44:43',
        '2022-04-18 16:44:43');
INSERT INTO `sys_operate_logs`
VALUES ('de395ec5caf94a258cda057c2bbe4293', 'SuperAdmin', 'select', '2022-04-12 14:58:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-12 14:58:03', '2022-04-12 14:58:03');
INSERT INTO `sys_operate_logs`
VALUES ('decd0c2b256740ec86e4c24d8947f938', 'SuperAdmin', 'select', '2022-04-01 18:15:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-01 18:15:32', '2022-04-01 18:15:32');
INSERT INTO `sys_operate_logs`
VALUES ('df112666a5d24dc996354372a2bf50bb', 'SuperAdmin', 'select', '2022-04-18 17:27:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:27:23', '2022-04-18 17:27:23');
INSERT INTO `sys_operate_logs`
VALUES ('df6e92ccdf5546c897d48fe042c6fac9', 'SuperAdmin', 'select', '2022-04-18 17:27:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:27:15', '2022-04-18 17:27:15');
INSERT INTO `sys_operate_logs`
VALUES ('dfb0cfccdbf54fdca697a7aec53c7c9f', '未登录', 'select', '2022-04-02 11:01:38', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868496947\\\"]}\"}',
        '2022-04-02 11:01:38', '2022-04-02 11:01:38');
INSERT INTO `sys_operate_logs`
VALUES ('e05d000016a74c9fa075524dc97506d6', 'SuperAdmin', 'select', '2022-04-12 17:08:30', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:08:30', '2022-04-12 17:08:30');
INSERT INTO `sys_operate_logs`
VALUES ('e0715abce3cc4be790ec810fe0b92b75', 'SuperAdmin', 'select', '2022-04-12 18:21:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:21:23', '2022-04-12 18:21:23');
INSERT INTO `sys_operate_logs`
VALUES ('e076f93ba53945a2ab9ccc9ad6fd17c9', 'SuperAdmin', 'select', '2022-04-18 16:35:03', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:35:03', '2022-04-18 16:35:03');
INSERT INTO `sys_operate_logs`
VALUES ('e07a35f8263341078c27fd1b9ae7104d', 'SuperAdmin', 'select', '2022-04-18 17:28:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:29', '2022-04-18 17:28:29');
INSERT INTO `sys_operate_logs`
VALUES ('e09d7fc4309941b4b2d564540d802165', 'SuperAdmin', 'select', '2022-04-12 18:18:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:18:28', '2022-04-12 18:18:28');
INSERT INTO `sys_operate_logs`
VALUES ('e0f865de59fc445b99a2910a0c1fdd3d', '未登录', 'select', '2022-05-13 14:22:40', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.2.236',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-05-13 14:22:40',
        '2022-05-13 14:22:40');
INSERT INTO `sys_operate_logs`
VALUES ('e10df447fbb341009ff4476b92de248d', 'SuperAdmin', 'select', '2022-04-18 15:20:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-18 15:20:31', '2022-04-18 15:20:31');
INSERT INTO `sys_operate_logs`
VALUES ('e1984fc61c8e413ab432043ecd439b8b', 'SuperAdmin', 'select', '2022-04-18 16:36:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:36:11', '2022-04-18 16:36:11');
INSERT INTO `sys_operate_logs`
VALUES ('e1cda7e138cf4c80a0bf14fe4ae27d7c', 'SuperAdmin', 'select', '2022-04-12 17:10:12', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:10:12', '2022-04-12 17:10:12');
INSERT INTO `sys_operate_logs`
VALUES ('e2221f13f5e4429183389a559bbf7bcd', 'SuperAdmin', 'select', '2022-04-18 17:37:45', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:37:45', '2022-04-18 17:37:45');
INSERT INTO `sys_operate_logs`
VALUES ('e222231d2d7849f6b3b2738d728bd04f', '未登录', 'select', '2022-04-02 11:03:19', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 11:03:19',
        '2022-04-02 11:03:19');
INSERT INTO `sys_operate_logs`
VALUES ('e25963d17cf64eb6a64850b131836ded', 'SuperAdmin', 'select', '2022-04-12 16:25:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:25:04', '2022-04-12 16:25:04');
INSERT INTO `sys_operate_logs`
VALUES ('e28be90dbb16476f88de4d023ad7ebb0', 'SuperAdmin', 'select', '2022-04-18 16:36:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:36:11', '2022-04-18 16:36:11');
INSERT INTO `sys_operate_logs`
VALUES ('e2e0d059ec2c4189b7750a1b302a3624', 'SuperAdmin', 'select', '2022-04-18 14:45:23', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 14:45:23', '2022-04-18 14:45:23');
INSERT INTO `sys_operate_logs`
VALUES ('e3437d935b904f6ebeb443ebcddd40ab', 'SuperAdmin', 'select', '2022-04-18 17:10:54', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:10:54', '2022-04-18 17:10:54');
INSERT INTO `sys_operate_logs`
VALUES ('e3a34564d0ba4af5bfe0e9ea0334bbd8', 'SuperAdmin', 'select', '2022-04-18 17:12:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-18 17:12:28', '2022-04-18 17:12:28');
INSERT INTO `sys_operate_logs`
VALUES ('e422708b76d5442b9fbac3fea4bba3a0', 'SuperAdmin', 'select', '2022-04-01 18:15:04', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '2.0.11.172',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-01 18:15:04', '2022-04-01 18:15:04');
INSERT INTO `sys_operate_logs`
VALUES ('e4335d632ec449f1a4edcf2ab8126e29', 'SuperAdmin', 'select', '2022-04-18 16:40:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:40:49', '2022-04-18 16:40:49');
INSERT INTO `sys_operate_logs`
VALUES ('e44d2dbf9d69465d985ca833a3b71efa', 'SuperAdmin', 'select', '2022-04-18 16:54:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:25', '2022-04-18 16:54:25');
INSERT INTO `sys_operate_logs`
VALUES ('e46b2a8696d34fc49a96778d5b02af54', 'SuperAdmin', 'select', '2022-04-18 16:42:27', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:42:27', '2022-04-18 16:42:27');
INSERT INTO `sys_operate_logs`
VALUES ('e4d593c539ea4313ae21aa665b50c8dd', 'SuperAdmin', 'select', '2022-04-18 17:22:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:22:16', '2022-04-18 17:22:16');
INSERT INTO `sys_operate_logs`
VALUES ('e629fc46179f453c962f3b2999ca2129', 'SuperAdmin', 'select', '2022-04-12 16:26:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:26:51', '2022-04-12 16:26:51');
INSERT INTO `sys_operate_logs`
VALUES ('e715fa5418d94e10b980ff996fd1d81b', 'SuperAdmin', 'select', '2022-04-12 17:38:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.AccountInfoController.findAccountInfoList',
        '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/accountInfo/findAccountInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:38:50', '2022-04-12 17:38:50');
INSERT INTO `sys_operate_logs`
VALUES ('e7643052e1374a69b5de25989e504454', 'SuperAdmin', 'select', '2022-04-18 17:22:08', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:22:08', '2022-04-18 17:22:08');
INSERT INTO `sys_operate_logs`
VALUES ('e7819654e7624e9986b552a7e78203e6', 'SuperAdmin', 'select', '2022-04-18 16:51:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:51:34', '2022-04-18 16:51:34');
INSERT INTO `sys_operate_logs`
VALUES ('e7bb2e8e2e43496a8da7d1f45f3392bc', 'SuperAdmin', 'select', '2022-04-18 17:36:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:36:58', '2022-04-18 17:36:58');
INSERT INTO `sys_operate_logs`
VALUES ('e7e27df9e9fb40d983ea44073511691b', 'SuperAdmin', 'select', '2022-04-12 18:20:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 18:20:01', '2022-04-12 18:20:01');
INSERT INTO `sys_operate_logs`
VALUES ('e837a817586d475da96d927ed545ddf3', '未登录', 'select', '2022-04-02 11:03:17', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868596450\\\"]}\"}',
        '2022-04-02 11:03:17', '2022-04-02 11:03:17');
INSERT INTO `sys_operate_logs`
VALUES ('e9284cdee33645d591af883899f54aea', 'SuperAdmin', 'select', '2022-04-12 17:19:00', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:19:00', '2022-04-12 17:19:00');
INSERT INTO `sys_operate_logs`
VALUES ('e92ed90eb13d408983faf6a577abd876', 'SuperAdmin', 'select', '2022-04-18 16:30:46', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:30:46', '2022-04-18 16:30:46');
INSERT INTO `sys_operate_logs`
VALUES ('e9df3c6a215f447c9569aaeb06f62697', 'SuperAdmin', 'select', '2022-04-18 16:49:48', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:49:48', '2022-04-18 16:49:48');
INSERT INTO `sys_operate_logs`
VALUES ('ea2c2b6a35ee4f1cbb286dbd12aa70a8', 'SuperAdmin', 'select', '2022-04-18 17:25:37', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:25:37', '2022-04-18 17:25:37');
INSERT INTO `sys_operate_logs`
VALUES ('ea62c0c62a6a4e209af4d44cfbe0cf07', 'SuperAdmin', 'select', '2022-04-12 16:07:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:07:14', '2022-04-12 16:07:14');
INSERT INTO `sys_operate_logs`
VALUES ('ea70e6ae6bee43fdab76186e280b4df0', 'SuperAdmin', 'select', '2022-04-18 17:18:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:18:56', '2022-04-18 17:18:56');
INSERT INTO `sys_operate_logs`
VALUES ('eb5e075fdf794146a4792bbcf2fc4fbc', 'SuperAdmin', 'select', '2022-04-18 17:28:26', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:28:26', '2022-04-18 17:28:26');
INSERT INTO `sys_operate_logs`
VALUES ('ec85095e208249aaa8c36772d1750d04', 'SuperAdmin', 'select', '2022-04-18 16:35:01', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:35:01', '2022-04-18 16:35:01');
INSERT INTO `sys_operate_logs`
VALUES ('eca2661e622f470dbab6f175dfdeebf2', 'SuperAdmin', 'select', '2022-04-18 16:49:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:49:56', '2022-04-18 16:49:56');
INSERT INTO `sys_operate_logs`
VALUES ('ed3f7b97233d452caac31e4c9d480eb8', 'SuperAdmin', 'select', '2022-04-18 15:30:25', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"2\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 15:30:25', '2022-04-18 15:30:25');
INSERT INTO `sys_operate_logs`
VALUES ('ee58d071d1d340b28ae7517072dc2a1f', 'SuperAdmin', 'select', '2022-04-12 16:20:19', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:20:19', '2022-04-12 16:20:19');
INSERT INTO `sys_operate_logs`
VALUES ('eebc591e358d494fa9e70cf16b4b3af1', 'SuperAdmin', 'select', '2022-04-18 17:12:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"6d5fd38adaed4049aaf7b9eec4726e62\\\"]}\"}',
        '2022-04-18 17:12:41', '2022-04-18 17:12:41');
INSERT INTO `sys_operate_logs`
VALUES ('eee406049d94438b93f347be4eb7e2a9', 'SuperAdmin', 'select', '2022-04-18 16:01:40', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:01:40', '2022-04-18 16:01:40');
INSERT INTO `sys_operate_logs`
VALUES ('ef639fade54e4620aef86edea09067fc', 'SuperAdmin', 'select', '2022-04-18 17:20:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:20:42', '2022-04-18 17:20:42');
INSERT INTO `sys_operate_logs`
VALUES ('efc20932c84944e194f543fb070f0953', 'SuperAdmin', 'select', '2022-04-18 16:00:43', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:00:43', '2022-04-18 16:00:43');
INSERT INTO `sys_operate_logs`
VALUES ('efd458e7e7eb445780c003b79250740d', 'SuperAdmin', 'select', '2022-04-18 16:53:58', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:53:58', '2022-04-18 16:53:58');
INSERT INTO `sys_operate_logs`
VALUES ('f00c302d749a4d7bb9b4e8b1ad8dce88', 'SuperAdmin', 'select', '2022-04-18 16:53:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:53:49', '2022-04-18 16:53:49');
INSERT INTO `sys_operate_logs`
VALUES ('f18fc0562ec345da9c08fa737fba7b14', 'SuperAdmin', 'select', '2022-04-12 17:26:34', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-12 17:26:34', '2022-04-12 17:26:34');
INSERT INTO `sys_operate_logs`
VALUES ('f2092e164570474fb7db83465788853b', 'SuperAdmin', 'select', '2022-04-12 16:40:14', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 16:40:14', '2022-04-12 16:40:14');
INSERT INTO `sys_operate_logs`
VALUES ('f263a6b7a3434f83bc84d37b8abeae45', 'SuperAdmin', 'select', '2022-04-18 16:51:31', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:51:31', '2022-04-18 16:51:31');
INSERT INTO `sys_operate_logs`
VALUES ('f2b48e8b5b1443369e800aaa824ea88e', '未登录', 'select', '2022-04-02 10:41:15', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 10:41:15',
        '2022-04-02 10:41:15');
INSERT INTO `sys_operate_logs`
VALUES ('f3d167ea72714905ac968e7a68a0b291', 'SuperAdmin', 'select', '2022-04-18 17:18:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:18:56', '2022-04-18 17:18:56');
INSERT INTO `sys_operate_logs`
VALUES ('f3dd324226354a28862f9138c76ba50b', 'SuperAdmin', 'select', '2022-04-18 16:54:11', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-18 16:54:11', '2022-04-18 16:54:11');
INSERT INTO `sys_operate_logs`
VALUES ('f4ad1c044ad8448b993dcf3b17f99114', 'SuperAdmin', 'select', '2022-04-18 16:51:10', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 16:51:10', '2022-04-18 16:51:10');
INSERT INTO `sys_operate_logs`
VALUES ('f548ba6cbb6d41d4b61fd6d240304129', 'SuperAdmin', 'select', '2022-04-18 16:40:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:40:49', '2022-04-18 16:40:49');
INSERT INTO `sys_operate_logs`
VALUES ('f55c74b289a6411ab7a046e0d8b00760', 'SuperAdmin', 'select', '2022-04-18 16:48:05', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:48:05', '2022-04-18 16:48:05');
INSERT INTO `sys_operate_logs`
VALUES ('f55d0407c30d444b871d45c4fd002f61', 'SuperAdmin', 'select', '2022-04-12 17:17:48', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"112ea259542f4af3b5375df54ebbb70c\\\"]}\"}',
        '2022-04-12 17:17:48', '2022-04-12 17:17:48');
INSERT INTO `sys_operate_logs`
VALUES ('f5e72aaacff94532ad43f8cc8343279f', 'SuperAdmin', 'select', '2022-04-18 16:54:28', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:54:28', '2022-04-18 16:54:28');
INSERT INTO `sys_operate_logs`
VALUES ('f613d70ef53a43ff9d86651e33eae0e6', 'SuperAdmin', 'select', '2022-04-18 16:44:52', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:44:52', '2022-04-18 16:44:52');
INSERT INTO `sys_operate_logs`
VALUES ('f65ab1d4e31d4e56a73571ebb37503a4', 'SuperAdmin', 'select', '2022-04-12 16:29:22', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:29:22', '2022-04-12 16:29:22');
INSERT INTO `sys_operate_logs`
VALUES ('f69fb26323c044c6b9dd68491168b583', 'SuperAdmin', 'select', '2022-04-18 16:34:57', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 16:34:57', '2022-04-18 16:34:57');
INSERT INTO `sys_operate_logs`
VALUES ('f6b8eaa2cf8444af95d569bccc4a9e24', 'SuperAdmin', 'select', '2022-04-12 16:38:06', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:38:06', '2022-04-12 16:38:06');
INSERT INTO `sys_operate_logs`
VALUES ('f77ed6763d7c45e48538f5f38684b71f', 'SuperAdmin', 'select', '2022-04-02 11:03:21', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.MenuInfoController.getMenuTree', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/menuInfo/getMenuTree\",\"请求参数\":\"{\\\"type\\\":[\\\"2\\\"]}\"}',
        '2022-04-02 11:03:21', '2022-04-02 11:03:21');
INSERT INTO `sys_operate_logs`
VALUES ('f7b114d57aef46bf96d2859f401e2f0f', 'SuperAdmin', 'select', '2022-04-12 15:53:36', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 15:53:36', '2022-04-12 15:53:36');
INSERT INTO `sys_operate_logs`
VALUES ('f7ba2ec6fa80463f9e3de6588ee41f45', 'SuperAdmin', 'select', '2022-04-12 17:46:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:46:49', '2022-04-12 17:46:49');
INSERT INTO `sys_operate_logs`
VALUES ('f8109d197cf74b7081069ae5d9fe2830', 'SuperAdmin', 'select', '2022-04-18 17:15:20', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:15:20', '2022-04-18 17:15:20');
INSERT INTO `sys_operate_logs`
VALUES ('f87e0acd417f4ae7afa340d595255aa9', '未登录', 'select', '2022-04-02 11:05:58', '认证服务',
        'authentication-server', 'com.dong.authenticationserver.web.controller.AuthorizationController.getQRCode',
        '192.168.154.1',
        '{\"请求路径\":\"/authorization/getQRCode\",\"请求参数\":\"{\\\"t\\\":[\\\"1648868757792\\\"]}\"}',
        '2022-04-02 11:05:58', '2022-04-02 11:05:58');
INSERT INTO `sys_operate_logs`
VALUES ('f8d89195392d4add94f47071473f4c12', 'SuperAdmin', 'select', '2022-04-18 17:22:16', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:22:16', '2022-04-18 17:22:16');
INSERT INTO `sys_operate_logs`
VALUES ('f90d38e83d804c2389d8e7d40ca1d925', 'SuperAdmin', 'select', '2022-04-12 17:41:50', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:41:50', '2022-04-12 17:41:50');
INSERT INTO `sys_operate_logs`
VALUES ('f9f440f8042c4f8cb390bdaad125ccb5', 'SuperAdmin', 'select', '2022-04-18 17:28:07', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:28:07', '2022-04-18 17:28:07');
INSERT INTO `sys_operate_logs`
VALUES ('fa6a1da850a0440c88560d193f353c45', 'SuperAdmin', 'select', '2022-04-18 17:28:18', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgInfoList', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/findOrgInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 17:28:18', '2022-04-18 17:28:18');
INSERT INTO `sys_operate_logs`
VALUES ('fac783097e7e4983a02d0029c49b03fa', 'SuperAdmin', 'select', '2022-04-18 16:38:56', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"id\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 16:38:56', '2022-04-18 16:38:56');
INSERT INTO `sys_operate_logs`
VALUES ('fb600ebf566c4dd39d736e0ecd8b1d5c', 'SuperAdmin', 'select', '2022-04-18 11:29:42', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{\\\"page\\\":[\\\"1\\\"],\\\"limit\\\":[\\\"10\\\"]}\"}',
        '2022-04-18 11:29:42', '2022-04-18 11:29:42');
INSERT INTO `sys_operate_logs`
VALUES ('fbe86ebbaeba4a8f8b4761676f59f18b', 'SuperAdmin', 'select', '2022-04-12 15:22:33', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.saveOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/orgInfo/saveOrgInfo\",\"请求参数\":\"{}\"}', '2022-04-12 15:22:33',
        '2022-04-12 15:22:33');
INSERT INTO `sys_operate_logs`
VALUES ('fc6750dc6f854d969d8008e3a490f241', 'SuperAdmin', 'select', '2022-04-12 16:13:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 16:13:15', '2022-04-12 16:13:15');
INSERT INTO `sys_operate_logs`
VALUES ('fcb2303aab1b45ff9496a27c839cbd10', 'SuperAdmin', 'select', '2022-04-18 17:29:32', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:29:32', '2022-04-18 17:29:32');
INSERT INTO `sys_operate_logs`
VALUES ('fcc46301dfc0452dbf88f5e33034555c', 'SuperAdmin', 'select', '2022-04-18 17:25:29', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.findOrgPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/findOrgPersonInfoList\",\"请求参数\":\"{\\\"orgId\\\":[\\\"9988b8e1267e4ce7acf3d6d31623ea2e\\\"]}\"}',
        '2022-04-18 17:25:29', '2022-04-18 17:25:29');
INSERT INTO `sys_operate_logs`
VALUES ('fcc4ea36345c45d8b691781d4afe0099', 'SuperAdmin', 'select', '2022-04-18 17:19:41', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:19:41', '2022-04-18 17:19:41');
INSERT INTO `sys_operate_logs`
VALUES ('fd87d8f6811948aaa829408f6b64c29b', '未登录', 'select', '2022-04-02 10:44:00', '后台管理服务', 'admin-server',
        'com.dong.adminserver.web.controller.LogsController.saveLoginLogs', '192.168.154.1',
        '{\"请求结果\":\"保存成功!\",\"请求路径\":\"/logs/saveLoginLogs\",\"请求参数\":\"{}\"}', '2022-04-02 10:44:00',
        '2022-04-02 10:44:00');
INSERT INTO `sys_operate_logs`
VALUES ('fdeee72e5cbe46c8a2a1089be1d24aae', 'SuperAdmin', 'select', '2022-04-18 17:27:15', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:27:15', '2022-04-18 17:27:15');
INSERT INTO `sys_operate_logs`
VALUES ('fe522600c62a46d49f5693260c4aed69', 'SuperAdmin', 'select', '2022-04-18 17:29:51', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功！\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-18 17:29:51', '2022-04-18 17:29:51');
INSERT INTO `sys_operate_logs`
VALUES ('fe7d04ee34d740c3bd3ce6803fb3baec', 'SuperAdmin', 'select', '2022-04-16 12:12:49', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.PersonInfoController.findPersonInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/personInfo/findPersonInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-16 12:12:49', '2022-04-16 12:12:49');
INSERT INTO `sys_operate_logs`
VALUES ('fe8c9d1287084798b9d6e62df9ecabdd', 'SuperAdmin', 'select', '2022-04-12 17:07:55', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.OrgInfoController.getOrgInfo', '192.168.154.1',
        '{\"请求结果\":\"查询成功!\",\"请求路径\":\"/orgInfo/getOrgInfo\",\"请求参数\":\"{\\\"id\\\":[\\\"d369d9479f844169b1d7d457c69b998c\\\"]}\"}',
        '2022-04-12 17:07:55', '2022-04-12 17:07:55');
INSERT INTO `sys_operate_logs`
VALUES ('feff89cbcd5a437ea45c66ba9b5b602f', 'SuperAdmin', 'select', '2022-04-12 17:52:44', '后台管理服务',
        'admin-server', 'com.dong.adminserver.web.controller.RoleInfoController.findRoleInfoList', '192.168.154.1',
        '{\"请求结果\":\"查询成功\",\"请求路径\":\"/roleInfo/findRoleInfoList\",\"请求参数\":\"{}\"}',
        '2022-04-12 17:52:44', '2022-04-12 17:52:44');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`
(
    `id`                varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '主键id',
    `org_name`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位名称',
    `org_code`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '单位编码',
    `org_type`          int(1) NOT NULL COMMENT '单位类型',
    `org_division_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位区域代码',
    `org_address`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
    `delete_status`     int(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0：未删除、1：已删除',
    `create_time`       datetime                                                      NOT NULL COMMENT '创建时间',
    `create_user_id`    varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
    `update_time`       datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id`    varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org`
VALUES ('112ea259542f4af3b5375df54ebbb70c', '德云社文化有限公司', '20201011', 0, '110102', '北京市市辖区西城区德云社',
        0, '2020-10-11 21:24:36', NULL, '2022-04-12 17:34:58', NULL);
INSERT INTO `sys_org`
VALUES ('6d5fd38adaed4049aaf7b9eec4726e62', '广州健新科技股份有限公司', '20201012', 1, '440112',
        '广东省广州市黄埔区云升科学园', 0, '2020-10-11 21:30:51', NULL, '2022-04-12 17:34:18', NULL);
INSERT INTO `sys_org`
VALUES ('9988b8e1267e4ce7acf3d6d31623ea2e', '淘宝', '202204121737', 1, '330106', '浙江省杭州市西湖区阿里巴巴总部', 0,
        '2022-04-12 17:38:04', NULL, '2022-04-12 17:38:04', NULL);
INSERT INTO `sys_org`
VALUES ('d369d9479f844169b1d7d457c69b998c', '中智', '202204121458', 1, '440104',
        '广东省广州市越秀区东风中路300号金安大厦', 0, '2022-04-12 15:22:33', NULL, '2022-04-12 15:22:33', NULL);

-- ----------------------------
-- Table structure for sys_org_person
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_person`;
CREATE TABLE `sys_org_person`
(
    `id`          varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
    `person_id`   varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员id',
    `org_id`      varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位id',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改事件',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单位人员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_org_person
-- ----------------------------
INSERT INTO `sys_org_person`
VALUES ('0a7747caa9a44d30917c0358d245e2d4', '6869a49c3b2a4f8dae0ba848a40a023f', '9988b8e1267e4ce7acf3d6d31623ea2e',
        '2022-04-18 16:44:43', NULL);
INSERT INTO `sys_org_person`
VALUES ('e5fd0cd3c2814748af814810284a38ca', 'b7baaee0c1e1493d9eec5f833c7bb51a', '9988b8e1267e4ce7acf3d6d31623ea2e',
        '2022-04-18 16:44:43', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`
(
    `id`              varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `permission_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编码',
    `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '权限名称',
    `permission_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '0' COMMENT '权限类型  view：页面权限、operate：操作权限、data：数据权限',
    `parent_id`       varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级菜单',
    `resource_id`     varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源id(菜单表id)',
    `create_time`     datetime                                                NOT NULL,
    `update_time`     datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission`
VALUES ('2723005fff2711eb87dc000c298f5d36', 'VIEW_MENU_LIST', '菜单列表', 'view', '272aaf00ff2711eb87dc000c298f5d36',
        '06c7e1107c0911ea851100ff54d246f9', '2021-08-17 14:48:39', '2021-08-17 15:09:56');
INSERT INTO `sys_permission`
VALUES ('2728c894ff2711eb87dc000c298f5d36', 'VIEW_ORDER_MANAGEMENT', '订单管理', 'view',
        '7387531585d742b69e5af2ac97dde840', '19a2f346e74245e0a8d73f3425342d24', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('2728d482ff2711eb87dc000c298f5d36', 'VIEW_', '测试三级菜单', 'view', '272a9aecff2711eb87dc000c298f5d36',
        '2b53a969f12144c38457ad0dfdc1f3d0', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a6a23ff2711eb87dc000c298f5d36', 'VIEW_PERMISSION_MANAGEMENT', '权限管理', 'view',
        '7387531585d742b69e5af2ac97dde840', '329deababc1a4a7fbb898dd3fad0e1d2', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a6cdfff2711eb87dc000c298f5d36', 'VIEW_DATA_DIC_LIST', '数据字典列表', 'view',
        '272a9934ff2711eb87dc000c298f5d36', '3373c048cfde4321b0d6d52f792e5613', '2021-08-17 14:48:39',
        '2021-08-17 15:09:43');
INSERT INTO `sys_permission`
VALUES ('272a76c8ff2711eb87dc000c298f5d36', 'VIEW_PERSON_LIST', '人员列表', 'view', '272a983bff2711eb87dc000c298f5d36',
        '3c00fad6e46f4142804b1421190ab2a2', '2021-08-17 14:48:39', '2021-08-17 15:09:29');
INSERT INTO `sys_permission`
VALUES ('272a7963ff2711eb87dc000c298f5d36', 'VIEW_ROLE_MANAGEMENT', '角色管理', 'view',
        '7387531585d742b69e5af2ac97dde840', '47e4c6d174df40babce84fb10d76fd3f', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a89d3ff2711eb87dc000c298f5d36', 'VIEW_MODULE_MANAGEMENT', '模块管理', 'view',
        '7387531585d742b69e5af2ac97dde840', '4995d6ed8b424258bbce1e3554159011', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a8b86ff2711eb87dc000c298f5d36', 'VIEW_ACCOUNT_LIST', '账号列表', 'view', '272ab8cbff2711eb87dc000c298f5d36',
        '4ea07aac6f3f11eaa28400ff54d246f9', '2021-08-17 14:48:39', '2021-08-17 15:10:33');
INSERT INTO `sys_permission`
VALUES ('272a8d80ff2711eb87dc000c298f5d36', 'VIEW_ROLE_LIST', '角色列表', 'view', '272a7963ff2711eb87dc000c298f5d36',
        '4ea793bc6f3f11eaa28400ff54d246f9', '2021-08-17 14:48:39', '2021-08-17 15:08:36');
INSERT INTO `sys_permission`
VALUES ('272a8ed7ff2711eb87dc000c298f5d36', 'VIEW_PERMISSION_LIST', '权限列表', 'view',
        '272a6a23ff2711eb87dc000c298f5d36', '62cecac21da8469f906220b20e26e848', '2021-08-17 14:48:39',
        '2021-08-17 15:08:23');
INSERT INTO `sys_permission`
VALUES ('272a96afff2711eb87dc000c298f5d36', 'VIEW_MENU_TREE', '菜单树', 'view', '272aaf00ff2711eb87dc000c298f5d36',
        '6b6ee4ab1cab4a76a12cd5e425612a96', '2021-08-17 14:48:39', '2021-08-17 15:10:07');
INSERT INTO `sys_permission`
VALUES ('272a983bff2711eb87dc000c298f5d36', 'VIEW_PERSON_MANAGEMENT', '人员管理', 'view',
        '7387531585d742b69e5af2ac97dde840', '721ab33d901346cca58c54c7f64e1664', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a98a7ff2711eb87dc000c298f5d36', 'VIEW_PERMISSION_TREE', '权限树', 'view',
        '272a6a23ff2711eb87dc000c298f5d36', '7565856ed2a140f387348acd5fe818a1', '2021-08-17 14:48:39',
        '2021-08-17 15:08:31');
INSERT INTO `sys_permission`
VALUES ('272a98edff2711eb87dc000c298f5d36', 'VIEW_', '测试二级菜单2', 'view', '272a9aecff2711eb87dc000c298f5d36',
        '7f8b82d96a124b8ea44ec3d09c20657d', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a9934ff2711eb87dc000c298f5d36', 'VIEW_DATA_DIC', '数据字典', 'view', '7387531585d742b69e5af2ac97dde840',
        '85368030064346238f66d8cbcd068106', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272a9974ff2711eb87dc000c298f5d36', 'VIEW_EASY_CODE', '生成代码', 'view', '272a89d3ff2711eb87dc000c298f5d36',
        '8d112eace99d455e9ee59970f1a48299', '2021-08-17 14:48:39', '2021-08-17 15:08:49');
INSERT INTO `sys_permission`
VALUES ('272a99c7ff2711eb87dc000c298f5d36', 'VIEW_ORDER_LIST', '订单列表', 'view', '2728c894ff2711eb87dc000c298f5d36',
        '9437557a6b634a7d82938c1f8ecdcb59', '2021-08-17 14:48:39', '2021-08-17 15:08:03');
INSERT INTO `sys_permission`
VALUES ('272a9aecff2711eb87dc000c298f5d36', 'VIEW_', '模板管理', 'view', '272a89d3ff2711eb87dc000c298f5d36',
        '96d910ecf9054df8bdf605dac90fb16c', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272aa38fff2711eb87dc000c298f5d36', 'VIEW_', '测试二级菜单3', 'view', '272a9aecff2711eb87dc000c298f5d36',
        'a89469ce76cb4fbe8e82842594953507', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272aad81ff2711eb87dc000c298f5d36', 'VIEW_GENERATE_RESULT', '生成结果', 'view',
        '272a89d3ff2711eb87dc000c298f5d36', 'c6c732e6a55b4bbc8d3d606cbccffc5c', '2021-08-17 14:48:39',
        '2021-08-17 15:09:19');
INSERT INTO `sys_permission`
VALUES ('272aaf00ff2711eb87dc000c298f5d36', 'VIEW_MENU_MANAGEMENT', '菜单管理', 'view',
        '7387531585d742b69e5af2ac97dde840', 'd3d9e5e07c0811ea851100ff54d246f9', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272ab020ff2711eb87dc000c298f5d36', 'VIEW_PRODUCT_MANAGEMENT', '商品管理', 'view',
        '7387531585d742b69e5af2ac97dde840', 'f2b77ba107b34d1f98f5d79d7c7c39b1', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('272ab075ff2711eb87dc000c298f5d36', 'VIEW_PRODUCT_LIST', '商品列表', 'view', '272ab020ff2711eb87dc000c298f5d36',
        'f6bb1eeef206479f877969ca29331fe6', '2021-08-17 14:48:39', '2021-08-17 15:10:23');
INSERT INTO `sys_permission`
VALUES ('272ab8cbff2711eb87dc000c298f5d36', 'VIEW_ACCOUNT_MANAGEMENT', '账号管理', 'view',
        '7387531585d742b69e5af2ac97dde840', 'f98889f86f3d11eaa28400ff54d246f9', '2021-08-17 14:48:39', NULL);
INSERT INTO `sys_permission`
VALUES ('7387531585d742b69e5af2ac97dde840', 'meet', '平台', 'view', '', NULL, '2021-08-12 20:13:45',
        '2021-08-12 20:13:45');

-- ----------------------------
-- Table structure for sys_person
-- ----------------------------
DROP TABLE IF EXISTS `sys_person`;
CREATE TABLE `sys_person`
(
    `id`                varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `org_id`            varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '暂未入职' COMMENT '所属单位id',
    `name`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `identity_card`     varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证',
    `age`               int(1) NOT NULL DEFAULT 25,
    `birthdate`         datetime NULL DEFAULT NULL COMMENT '出生日期',
    `sex`               smallint(1) NOT NULL DEFAULT 0 COMMENT '0：男、1：女',
    `phone`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `email`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `present_address`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现住址',
    `native_place`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
    `individual_resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
    `delete_status`     int(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0：否、1：是',
    `create_time`       datetime                                                     NOT NULL,
    `create_user_id`    varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
    `update_time`       datetime NULL DEFAULT NULL,
    `update_user_id`    varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '人员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_person
-- ----------------------------
INSERT INTO `sys_person`
VALUES ('3e0468155a3f4679b060c904d6cc8d42', '6d5fd38adaed4049aaf7b9eec4726e62', '刘东', '201909221449', 1,
        '1996-10-08 00:00:00', 1, '15170519059', '964708273@qq.com', '广东省广州市', '江西丰城', '超级管理员', 0,
        '2019-09-22 14:52:02', NULL, NULL, NULL);
INSERT INTO `sys_person`
VALUES ('56339ad1808744fda899167232b35729', '112ea259542f4af3b5375df54ebbb70c', '刘东1', '362202202010121324', 25, NULL,
        0, '15170519058', NULL, NULL, NULL, NULL, 0, '2020-10-12 15:29:20', NULL, NULL, NULL);
INSERT INTO `sys_person`
VALUES ('58e1f32220854523997bfd9a6305df04', '暂未入职', '刘东2', '362202202010121324', 25, NULL, 0, NULL, NULL, NULL,
        NULL, NULL, 0, '2020-10-12 15:29:34', NULL, NULL, NULL);
INSERT INTO `sys_person`
VALUES ('600e5cff674e4594819674f624b3cf0c', '112ea259542f4af3b5375df54ebbb70c', '刘东3', '362202202010121324', 25, NULL,
        0, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-12 13:34:15', NULL, '2020-10-12 21:45:21', NULL);
INSERT INTO `sys_person`
VALUES ('6869a49c3b2a4f8dae0ba848a40a023f', '暂未入职', '马云', '202105261621300001', 25, NULL, 0, NULL, NULL,
        '北京市市辖区东城区', NULL, NULL, 0, '2021-05-26 16:21:56', NULL, '2022-04-18 15:40:43', NULL);
INSERT INTO `sys_person`
VALUES ('71e89c7c6aef45d7982ab733f7ec76ab', '暂未入职', '刘东4', '362202202010121324', 25, NULL, 0, '15170511111', NULL,
        NULL, NULL, NULL, 0, '2020-10-12 15:32:19', NULL, '2020-11-27 12:39:48', NULL);
INSERT INTO `sys_person`
VALUES ('7ba92ef0dab542e6bd1061770e11c4cb', '112ea259542f4af3b5375df54ebbb70c', '刘东5', '362202202010121324', 25, NULL,
        0, '15170510000', NULL, NULL, NULL, NULL, 0, '2020-10-12 15:34:57', NULL, '2020-11-27 12:39:00', NULL);
INSERT INTO `sys_person`
VALUES ('8699634f0a344f9da713ac7d91c90e21', '暂未入职', '刘东6', '362202202010121324', 25, NULL, 0, NULL, NULL, NULL,
        NULL, NULL, 0, '2020-10-12 14:21:59', NULL, NULL, NULL);
INSERT INTO `sys_person`
VALUES ('8b80f924f19746e6bdfc18964f81e33d', '暂未入职', '君不语', '202011281301', 25, '2020-11-27 08:00:00', 0,
        '15170512222', NULL, '广东省广州市越秀区', '黄泉界', '问君君不语', 0, '2020-11-28 13:01:26', NULL,
        '2021-04-25 15:48:34', NULL);
INSERT INTO `sys_person`
VALUES ('9f0774f7d43c4b4ca1b75cf330da9999', '112ea259542f4af3b5375df54ebbb70c', '刘东7', '362202202010121329', 25, NULL,
        0, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-12 13:29:26', NULL, '2020-10-12 21:45:21', NULL);
INSERT INTO `sys_person`
VALUES ('a4950c6b5da3414b81be3379a9c7c492', '暂未入职', '刘东8', '202010111950', 25, '1996-10-18 00:00:00', 0,
        '16620419059', '15170519059', '广东广州', '江西丰城', '年与时驰，意与日去', 0, '2020-10-11 20:30:03', NULL,
        '2020-10-11 20:30:03', NULL);
INSERT INTO `sys_person`
VALUES ('b7baaee0c1e1493d9eec5f833c7bb51a', '暂未入职', '刘', '362202202010121541', 25, NULL, 0, '1510000000', NULL,
        NULL, NULL, NULL, 0, '2020-10-12 15:48:39', NULL, '2020-11-27 12:38:05', NULL);
INSERT INTO `sys_person`
VALUES ('efb6f0eb3ba541429d80e83f1cb80e7c', '112ea259542f4af3b5375df54ebbb70c', '刘东9', '362202202010121324', 25, NULL,
        0, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-12 14:31:27', NULL, '2020-10-12 21:45:21', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`          varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '主键id',
    `role_code`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '角色编码',
    `role_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
    `remark`      varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色描述',
    `create_time` datetime                                                NOT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `index_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES ('32047ea768ff4c72a784e0bc02650eaa', 'User', '普通用户', '普通用户权限，注册账号默认该权限',
        '2020-11-03 16:40:58', '2020-11-03 16:40:58');
INSERT INTO `sys_role`
VALUES ('55456caee85c4537b309f3ba72bc1096', 'SuperAdmin', '超级管理员', '超级管理员，具备最大权限',
        '2019-09-22 14:52:02', '2020-11-03 16:55:22');
INSERT INTO `sys_role`
VALUES ('604b3be374934dc59ce475236726d9bc', 'BusinessUser', '商家用户', '卖家角色，有订单管理、商品管理权限',
        '2021-05-26 09:44:12', '2021-05-26 09:55:20');
INSERT INTO `sys_role`
VALUES ('9ab25edf8c624bd391ddeb9275bc97f8', 'Admin', '管理员', '普通管理员，拥有系统管理权限', '2020-11-03 16:40:18',
        '2021-05-26 09:56:41');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`
(
    `id`            varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `role_id`       varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
    `permission_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission`
VALUES ('028c4e45d0314c48b2237f61f0345106', '55456caee85c4537b309f3ba72bc1096', '272a6cdfff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('036fd7ad0039424c8bdb9a37f3d1764d', '55456caee85c4537b309f3ba72bc1096', 'ff60f535f30e42869484d25907810f45');
INSERT INTO `sys_role_permission`
VALUES ('0bddb9a4b1c940c4a710481a14643e36', '55456caee85c4537b309f3ba72bc1096', '3fbed20391d34458944c52a4cc5e6e45');
INSERT INTO `sys_role_permission`
VALUES ('1f05be5134fc40ac900c70b93137120d', '55456caee85c4537b309f3ba72bc1096', '7387531585d742b69e5af2ac97dde840');
INSERT INTO `sys_role_permission`
VALUES ('208a118268a247daa6058f7b111d7562', '55456caee85c4537b309f3ba72bc1096', '272a6a23ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('295eb7a8eeea41a5b0f4a04b2850caa4', '55456caee85c4537b309f3ba72bc1096', '272ab8cbff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('29fcd3e7dba34924aaec8e346162bd9c', '55456caee85c4537b309f3ba72bc1096', '7387531585d742b69e5af2ac97dde840');
INSERT INTO `sys_role_permission`
VALUES ('2e5fa026e26f4d45ad4f13d1410ae305', '55456caee85c4537b309f3ba72bc1096', '272a89d3ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('2fff7e67d1334f7c99650d89fb6d2470', '55456caee85c4537b309f3ba72bc1096', '0df84e922a4e4753bf03fa351615f8f1');
INSERT INTO `sys_role_permission`
VALUES ('35469fddf5fd476ea0e2ecc82329c5f0', '55456caee85c4537b309f3ba72bc1096', '272a9974ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('3ff957a7bf5a41d3817d6fb809229a27', '55456caee85c4537b309f3ba72bc1096', '272a76c8ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('40fde5e822f84683b310ea282e1f5c4e', '55456caee85c4537b309f3ba72bc1096', '272a8b86ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('436df7130afd4ce0aa53f1dddd03924c', '55456caee85c4537b309f3ba72bc1096', '272ab020ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('45e01601baf944aa8d762bce36aa47ae', '55456caee85c4537b309f3ba72bc1096', '2728c894ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('486412c1eb0e4be7bf109a76ba4ca8c7', '55456caee85c4537b309f3ba72bc1096', '272a983bff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('4b3db1afb96b411fb54db215acb2aaf7', '55456caee85c4537b309f3ba72bc1096', '272a98a7ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('4ca4a81fb4ba42ba810afcc6d57b021b', '55456caee85c4537b309f3ba72bc1096', '272a98edff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('4d5ab21ebd604086a6397aa9279512c5', '55456caee85c4537b309f3ba72bc1096', '0f7f1c7f94c44b07871d965f005eea96');
INSERT INTO `sys_role_permission`
VALUES ('68e4913e43224d14ba51f164bace6bef', '55456caee85c4537b309f3ba72bc1096', '7b00f5074c4348258d351e8fff0ec238');
INSERT INTO `sys_role_permission`
VALUES ('75bc1a6416e14c648c31a2295c99494f', '55456caee85c4537b309f3ba72bc1096', 'd8bf1ad23f85404099d93162a6561440');
INSERT INTO `sys_role_permission`
VALUES ('7807784452554efc865ccfd6baa24951', '55456caee85c4537b309f3ba72bc1096', '2723005fff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('7d413317bb5047829857cfc7a7c020da', '55456caee85c4537b309f3ba72bc1096', '272a7963ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('884fc17855a44ba986b7aa15fdef96c5', '55456caee85c4537b309f3ba72bc1096', '967a1788857c48bf8cafadbc045f5f94');
INSERT INTO `sys_role_permission`
VALUES ('8ea9cb23628445bd8a963e2c97e4acef', '55456caee85c4537b309f3ba72bc1096', '272ab075ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('91ab52f19ad84428b0a7b09a94b81f45', '55456caee85c4537b309f3ba72bc1096', '272aa38fff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('957f4bcc55a948f6ae7c7de32325b3a8', '55456caee85c4537b309f3ba72bc1096', '272a8d80ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('981530caa5b34d478984c0884dfbaac2', '55456caee85c4537b309f3ba72bc1096', '272a8ed7ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('99b30f80106540029ccd761420aae03b', '55456caee85c4537b309f3ba72bc1096', '272a99c7ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('a2a338ce8db24feb95ea38c5096ee535', '55456caee85c4537b309f3ba72bc1096', '272a96afff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('a42ea750b44c4cccac544c30013aeb0b', '55456caee85c4537b309f3ba72bc1096', '272aaf00ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('ac94b9b28243408fabcf13f636675dfc', '55456caee85c4537b309f3ba72bc1096', '272a9aecff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('bef1c9068c1a4667aa814a70714cb319', '55456caee85c4537b309f3ba72bc1096', '272a9934ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('c0157e203ec74c658e474034261522a3', '55456caee85c4537b309f3ba72bc1096', 'c60ccb74310c4ed1884930052258e19b');
INSERT INTO `sys_role_permission`
VALUES ('c116bd710e5142da966cc88313aa55b3', '55456caee85c4537b309f3ba72bc1096', 'd23fef0dbb3c4adf8cf834a1dd6b830e');
INSERT INTO `sys_role_permission`
VALUES ('c7c54275ddaa455999a2220820035c29', '55456caee85c4537b309f3ba72bc1096', 'db521391028745fb806e1d993c6424b3');
INSERT INTO `sys_role_permission`
VALUES ('cc25db5a717f405288db97e74c7583d8', '55456caee85c4537b309f3ba72bc1096', 'dbab3cc0cf194fa0b31439fc418d5915');
INSERT INTO `sys_role_permission`
VALUES ('e44fe119af1140a3bae78ca693b8e9c7', '55456caee85c4537b309f3ba72bc1096', '2728d482ff2711eb87dc000c298f5d36');
INSERT INTO `sys_role_permission`
VALUES ('e4f54807f135424d9ebb46f3eed9f1be', '55456caee85c4537b309f3ba72bc1096', 'abec2bae23ab45af806631cba2a5153d');
INSERT INTO `sys_role_permission`
VALUES ('e86c800964184aa78ed4dca9aeb654d4', '55456caee85c4537b309f3ba72bc1096', '9ec5ef2ffe3840e4bab82b93325f6564');
INSERT INTO `sys_role_permission`
VALUES ('ec669ce8151e4cfea67d9ea88a660b95', '55456caee85c4537b309f3ba72bc1096', '272aad81ff2711eb87dc000c298f5d36');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`              varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `user_type`       int(1) NULL DEFAULT 2 COMMENT '用户类型 （2：普通、1：管理员、0：超级管理员）',
    `username`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
    `password`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `person_id`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员id',
    `real_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `last_login_time` datetime NULL DEFAULT NULL COMMENT '上传登录时间',
    `login_count`     int(11) NULL DEFAULT NULL COMMENT '登录次数',
    `user_status`     int(1) NOT NULL DEFAULT 0 COMMENT '用户状态（0：正常、）',
    `create_time`     datetime                                                     NOT NULL,
    `update_time`     datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES ('3fb446ea013f4c2b8ae3d9d03787a079', 2, 'liudong', '123456', '2720116b54d740d5a84162598d08a99a', '刘东', NULL,
        NULL, 0, '2019-07-23 22:34:28', NULL);
INSERT INTO `sys_user`
VALUES ('5c9a8ebe6d2f40239f077c3d59688084', 2, 'ld2301', '123456', 'b3c8c3bc7a9d48fdae9f601e3124d5d6', '刘东', NULL,
        NULL, 0, '2019-07-23 23:01:31', NULL);
INSERT INTO `sys_user`
VALUES ('a486459ee8cc416d92e0ddd8864aed12', 2, 'ld2304', '123456', '7a09f8c4024d40309561a439a5699c18', '刘东2304', NULL,
        NULL, 0, '2019-07-23 23:04:34', NULL);
INSERT INTO `sys_user`
VALUES ('ae9fa31e61af48258fa97d7657368d1f', 2, 'ld2312', '123456', '1017c0822fbb4a8a88e5bdde5aebd522', '刘东2313', NULL,
        NULL, 0, '2019-07-23 23:13:29', NULL);
INSERT INTO `sys_user`
VALUES ('be3ea2a2973f48219cc38444eba0e992', 2, 'zjx', '123456', '2ed55aef3a9d43b1a825aed1ba09602d', '张嘉欣', NULL,
        NULL, 0, '2019-07-23 22:39:04', NULL);
INSERT INTO `sys_user`
VALUES ('cb656253ac4911e9a5f800ff8b578937', 0, 'admin', '123456', '0204592fd871428a869ae60bf8e75e87', '刘东', NULL,
        NULL, 0, '2019-07-22 14:26:22', '2019-07-22 14:28:06');
INSERT INTO `sys_user`
VALUES ('f50a310fd45a464db38308a0e5f58716', 2, 'ld2259', '123456', '8ffa48539c6d45be9a58f7e306be495e', '刘东2300', NULL,
        NULL, 0, '2019-07-23 23:00:10', NULL);

SET
FOREIGN_KEY_CHECKS = 1;
