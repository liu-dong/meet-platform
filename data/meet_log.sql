/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.127
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.1.127:3306
 Source Schema         : meet_log

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/12/2022 23:53:36
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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
VALUES ('02b3aa976b624ad88f23f35623092990', 'SuperAdmin', 1, '2022-04-16 12:11:36', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-16 12:11:36', NULL);
INSERT INTO `sys_login_logs`
VALUES ('0ee300c79a3b4036a24756a24b02d04d', 'SuperAdmin', 1, '2022-04-18 09:59:39', '广州市越秀区', '192.168.137.1',
        '登录成功', '2022-04-18 09:59:39', NULL);
INSERT INTO `sys_login_logs`
VALUES ('1d10bf8ae4944e66b42bd1600657a44b', 'SuperAdmin', 1, '2022-04-12 16:05:08', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 16:05:08', NULL);
INSERT INTO `sys_login_logs`
VALUES ('2cebe283844a4f3ea375be1a5bcf5e69', 'SuperAdmin', 1, '2022-04-12 17:07:50', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 17:07:50', NULL);
INSERT INTO `sys_login_logs`
VALUES ('4b31e9dd230e4ea88511c50e7ba4970d', 'SuperAdmin', 1, '2022-05-13 10:59:06', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 10:59:06', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5092a4d82b29443d84286e2ebbc8fe5f', 'SuperAdmin', 1, '2022-05-16 09:51:10', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-16 09:51:10', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5192f463253b4fd2aac71a9425f2cb27', 'SuperAdmin', 1, '2022-04-02 11:07:46', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 11:07:46', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5b5c5b074a3d4358b6281a6cf89d612f', 'SuperAdmin', 1, '2022-05-12 14:44:24', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-12 14:44:24', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5b90e92f0e274f488a31d763370b0a5f', 'SuperAdmin', 1, '2022-04-12 10:40:43', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 10:40:43', NULL);
INSERT INTO `sys_login_logs`
VALUES ('5e2cbd633f064f828d1703d705bd7a86', 'SuperAdmin', 1, '2022-04-18 15:21:05', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 15:21:05', NULL);
INSERT INTO `sys_login_logs`
VALUES ('6264229d5b3941c2af10d463d602bfe8', 'SuperAdmin', 1, '2022-04-18 17:21:55', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 17:21:55', NULL);
INSERT INTO `sys_login_logs`
VALUES ('65e3de89dcc4422a8cd33846feaa1208', 'SuperAdmin', 1, '2022-05-13 17:01:19', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:01:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('68326a3fc1d74b6b91a530c0b79eeb95', 'SuperAdmin', 1, '2022-04-12 16:28:27', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 16:28:27', NULL);
INSERT INTO `sys_login_logs`
VALUES ('786a0bc3240543a794741cfbd1c74e47', 'SuperAdmin', 1, '2022-05-16 09:51:11', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-16 09:51:11', NULL);
INSERT INTO `sys_login_logs`
VALUES ('8050f298549d44c393e7cd97624b839a', 'SuperAdmin', 1, '2022-05-12 14:38:19', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-12 14:38:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('86afe6078d51475e8a55cd660ae5f6e0', 'SuperAdmin', 1, '2022-04-12 14:58:01', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-12 14:58:01', NULL);
INSERT INTO `sys_login_logs`
VALUES ('8b0ed6956b7b457aab03634a9438a725', 'SuperAdmin', 1, '2022-05-13 17:31:44', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:31:44', NULL);
INSERT INTO `sys_login_logs`
VALUES ('944590a7275c4e5d87c07e9fe8e17541', 'SuperAdmin', 1, '2022-05-13 17:01:19', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:01:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('9942b62da51f4a448ae047cf9ec9e1ff', 'SuperAdmin', 1, '2022-12-29 14:35:11', '广东省广州市越秀区东风中路300号',
        '127.0.0.1', '测试数据', '2022-12-29 14:35:11', NULL);
INSERT INTO `sys_login_logs`
VALUES ('a994bfe44f7d41f79b4ba38f6efc6a76', 'SuperAdmin', 1, '2022-04-02 11:07:34', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-02 11:07:34', NULL);
INSERT INTO `sys_login_logs`
VALUES ('b25cf4669ca043c99215f8ce89f43380', 'SuperAdmin', 1, '2022-05-13 17:01:19', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:01:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d84d82621dc7421f9c84c4f69732f500', 'SuperAdmin', 1, '2022-05-13 11:08:46', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 11:08:46', NULL);
INSERT INTO `sys_login_logs`
VALUES ('d9137c5ca1914e1689419b137e4b95f1', 'SuperAdmin', 1, '2022-05-13 17:01:19', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:01:19', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e3e012acfa1d44a48348206675a8da17', 'SuperAdmin', 1, '2022-04-18 14:37:38', '广州市越秀区', '192.168.154.1',
        '登录成功', '2022-04-18 14:37:38', NULL);
INSERT INTO `sys_login_logs`
VALUES ('e6d2831bf2244159880b0d3149237602', 'SuperAdmin', 1, '2022-05-13 17:01:18', '广州市越秀区', '192.168.2.236',
        '登录成功', '2022-05-13 17:01:18', NULL);

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
VALUES ('5d8c54d4fc684e6d9aed0630cf156c4d', 'test', 'add', '2022-12-29 15:18:03', 'test', 'test', 'test', '127.0.0.1',
        'test', '2022-12-29 15:18:03', '2022-12-29 15:18:03');
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

SET
FOREIGN_KEY_CHECKS = 1;
