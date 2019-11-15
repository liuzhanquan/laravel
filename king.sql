/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50720
Source Host           : 192.168.31.131:3306
Source Database       : king

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-11-15 18:05:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Dashboard', 'fa-bar-chart', '/', null, null, null);
INSERT INTO `admin_menu` VALUES ('2', '0', '2', '系统管理', 'fa-tasks', null, null, null, '2019-11-15 03:29:23');
INSERT INTO `admin_menu` VALUES ('3', '2', '3', '管理员管理', 'fa-users', 'auth/users', null, null, '2019-11-15 03:30:01');
INSERT INTO `admin_menu` VALUES ('4', '2', '4', '管理员角色', 'fa-user', 'auth/roles', null, null, '2019-11-15 03:30:18');
INSERT INTO `admin_menu` VALUES ('5', '2', '5', 'Permission', 'fa-ban', 'auth/permissions', null, null, null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', '菜单管理', 'fa-bars', 'auth/menu', null, null, '2019-11-15 03:30:33');
INSERT INTO `admin_menu` VALUES ('7', '2', '7', 'Operation log', 'fa-history', 'auth/logs', null, null, null);
INSERT INTO `admin_menu` VALUES ('8', '0', '8', '产品管理', 'fa-suitcase', null, 'product', '2019-11-15 03:32:06', '2019-11-15 03:35:17');
INSERT INTO `admin_menu` VALUES ('9', '8', '0', '商品列表', 'fa-align-left', '/Goods', null, '2019-11-15 03:36:27', '2019-11-15 05:57:56');
INSERT INTO `admin_menu` VALUES ('10', '8', '0', '规格属性', 'fa-braille', '/GoodsSpec', null, '2019-11-15 06:11:36', '2019-11-15 06:11:36');
INSERT INTO `admin_menu` VALUES ('11', '0', '0', '用户', 'fa-github-alt', 'users', null, '2019-11-15 07:21:42', '2019-11-15 07:21:42');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.31.181', '[]', '2019-11-15 03:22:10', '2019-11-15 03:22:10');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:22:21', '2019-11-15 03:22:21');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:22:53', '2019-11-15 03:22:53');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:25:08', '2019-11-15 03:25:08');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:25:40', '2019-11-15 03:25:40');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/roles', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:25:45', '2019-11-15 03:25:45');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:25:55', '2019-11-15 03:25:55');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/users/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:26:20', '2019-11-15 03:26:20');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/users', 'POST', '192.168.31.181', '{\"username\":\"admin1\",\"name\":\"\\u7ba1\\u7406\\u54581\",\"password\":\"admin\",\"password_confirmation\":\"admin\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/users\"}', '2019-11-15 03:27:04', '2019-11-15 03:27:04');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/users', 'GET', '192.168.31.181', '[]', '2019-11-15 03:27:04', '2019-11-15 03:27:04');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:27:11', '2019-11-15 03:27:11');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/permissions/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:27:25', '2019-11-15 03:27:25');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/permissions', 'POST', '192.168.31.181', '{\"slug\":\"product\",\"name\":\"\\u5546\\u54c1\\u5217\\u8868\",\"http_method\":[null],\"http_path\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/permissions\"}', '2019-11-15 03:27:44', '2019-11-15 03:27:44');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '[]', '2019-11-15 03:27:44', '2019-11-15 03:27:44');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/permissions/6', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:27:52', '2019-11-15 03:27:52');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:28:02', '2019-11-15 03:28:02');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '[]', '2019-11-15 03:28:25', '2019-11-15 03:28:25');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:28:34', '2019-11-15 03:28:34');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:28:48', '2019-11-15 03:28:48');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:28:54', '2019-11-15 03:28:54');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:29:03', '2019-11-15 03:29:03');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu/2', 'PUT', '192.168.31.181', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:29:23', '2019-11-15 03:29:23');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:29:23', '2019-11-15 03:29:23');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:29:31', '2019-11-15 03:29:31');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:29:36', '2019-11-15 03:29:36');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:29:45', '2019-11-15 03:29:45');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu/3', 'PUT', '192.168.31.181', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:30:01', '2019-11-15 03:30:01');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:30:01', '2019-11-15 03:30:01');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:30:05', '2019-11-15 03:30:05');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/auth/menu/4', 'PUT', '192.168.31.181', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:30:18', '2019-11-15 03:30:18');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:30:19', '2019-11-15 03:30:19');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:30:27', '2019-11-15 03:30:27');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu/6', 'PUT', '192.168.31.181', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:30:33', '2019-11-15 03:30:33');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:30:33', '2019-11-15 03:30:33');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:30:55', '2019-11-15 03:30:55');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:31:01', '2019-11-15 03:31:01');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/menu', 'POST', '192.168.31.181', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":\"product\",\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\"}', '2019-11-15 03:32:06', '2019-11-15 03:32:06');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:32:06', '2019-11-15 03:32:06');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:32:22', '2019-11-15 03:32:22');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:32:26', '2019-11-15 03:32:26');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:32:28', '2019-11-15 03:32:28');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:32:30', '2019-11-15 03:32:30');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:34:50', '2019-11-15 03:34:50');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/menu/8', 'PUT', '192.168.31.181', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-suitcase\",\"uri\":null,\"roles\":[null],\"permission\":\"product\",\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:35:07', '2019-11-15 03:35:07');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:35:08', '2019-11-15 03:35:08');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'POST', '192.168.31.181', '{\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2019-11-15 03:35:17', '2019-11-15 03:35:17');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:35:17', '2019-11-15 03:35:17');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:35:19', '2019-11-15 03:35:19');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:35:23', '2019-11-15 03:35:23');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:35:31', '2019-11-15 03:35:31');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/auth/menu', 'POST', '192.168.31.181', '{\"parent_id\":\"8\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa-align-left\",\"uri\":\"\\/product\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\"}', '2019-11-15 03:36:27', '2019-11-15 03:36:27');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:36:27', '2019-11-15 03:36:27');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:36:33', '2019-11-15 03:36:33');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:36:40', '2019-11-15 03:36:40');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:36:44', '2019-11-15 03:36:44');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:36:50', '2019-11-15 03:36:50');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/auth/menu/9', 'PUT', '192.168.31.181', '{\"parent_id\":\"8\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa-align-left\",\"uri\":\"\\/Product\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 03:36:57', '2019-11-15 03:36:57');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 03:36:57', '2019-11-15 03:36:57');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 03:50:55', '2019-11-15 03:50:55');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin', 'GET', '192.168.31.181', '[]', '2019-11-15 04:06:29', '2019-11-15 04:06:29');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/auth/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:06:33', '2019-11-15 04:06:33');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/Product', 'GET', '192.168.31.181', '[]', '2019-11-15 04:08:20', '2019-11-15 04:08:20');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/Product', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:08:23', '2019-11-15 04:08:23');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/Product', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:08:23', '2019-11-15 04:08:23');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/auth/roles', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:08:49', '2019-11-15 04:08:49');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/auth/roles/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:08:51', '2019-11-15 04:08:51');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/auth/permissions', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:09:25', '2019-11-15 04:09:25');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 04:09:51', '2019-11-15 04:09:51');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 05:57:47', '2019-11-15 05:57:47');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/auth/menu/9', 'PUT', '192.168.31.181', '{\"parent_id\":\"8\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa-align-left\",\"uri\":\"\\/Goods\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/auth\\/menu\"}', '2019-11-15 05:57:56', '2019-11-15 05:57:56');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 05:57:56', '2019-11-15 05:57:56');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 05:58:00', '2019-11-15 05:58:00');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/Product', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 05:58:08', '2019-11-15 05:58:08');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 06:01:18', '2019-11-15 06:01:18');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 06:01:20', '2019-11-15 06:01:20');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 06:10:36', '2019-11-15 06:10:36');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/auth/menu', 'POST', '192.168.31.181', '{\"parent_id\":\"8\",\"title\":\"\\u89c4\\u683c\\u5c5e\\u6027\",\"icon\":\"fa-braille\",\"uri\":\"\\/GoodsSpec\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\"}', '2019-11-15 06:11:36', '2019-11-15 06:11:36');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 06:11:36', '2019-11-15 06:11:36');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 06:11:39', '2019-11-15 06:11:39');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 06:11:41', '2019-11-15 06:11:41');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 06:41:06', '2019-11-15 06:41:06');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 06:41:08', '2019-11-15 06:41:08');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:41:19', '2019-11-15 06:41:19');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:41:49', '2019-11-15 06:41:49');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:43:55', '2019-11-15 06:43:55');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:45:40', '2019-11-15 06:45:40');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:02', '2019-11-15 06:46:02');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:11', '2019-11-15 06:46:11');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:12', '2019-11-15 06:46:12');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:18', '2019-11-15 06:46:18');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:21', '2019-11-15 06:46:21');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:24', '2019-11-15 06:46:24');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:46:45', '2019-11-15 06:46:45');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:49:28', '2019-11-15 06:49:28');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:52:08', '2019-11-15 06:52:08');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:53:35', '2019-11-15 06:53:35');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:54:25', '2019-11-15 06:54:25');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:55:48', '2019-11-15 06:55:48');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:55:49', '2019-11-15 06:55:49');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 06:59:10', '2019-11-15 06:59:10');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:12', '2019-11-15 07:05:12');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:13', '2019-11-15 07:05:13');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:14', '2019-11-15 07:05:14');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:15', '2019-11-15 07:05:15');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:15', '2019-11-15 07:05:15');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:05:16', '2019-11-15 07:05:16');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:06:45', '2019-11-15 07:06:45');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:07:09', '2019-11-15 07:07:09');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:08:01', '2019-11-15 07:08:01');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:08:02', '2019-11-15 07:08:02');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:09:10', '2019-11-15 07:09:10');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:09:29', '2019-11-15 07:09:29');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:13:29', '2019-11-15 07:13:29');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:13:38', '2019-11-15 07:13:38');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:15:00', '2019-11-15 07:15:00');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:15:14', '2019-11-15 07:15:14');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:17:27', '2019-11-15 07:17:27');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:17:29', '2019-11-15 07:17:29');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:20:44', '2019-11-15 07:20:44');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/auth/menu', 'POST', '192.168.31.181', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-github-alt\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\"}', '2019-11-15 07:21:42', '2019-11-15 07:21:42');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 07:21:42', '2019-11-15 07:21:42');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/auth/menu', 'GET', '192.168.31.181', '[]', '2019-11-15 07:21:49', '2019-11-15 07:21:49');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:21:51', '2019-11-15 07:21:51');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:21:52', '2019-11-15 07:21:52');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/users/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:24:09', '2019-11-15 07:24:09');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/users', 'POST', '192.168.31.181', '{\"name\":\"\\u5218\\u5148\\u751f\",\"email\":\"123@123.com\",\"email_verified_at\":\"2019-11-15 07:24:09\",\"password\":\"123456\",\"remember_token\":\"123456\",\"_token\":\"IlEcHRsOufQQF8v2KsduAFbnrHt79SLZc0rbvpq1\",\"_previous_\":\"http:\\/\\/www.l2.com\\/admin\\/users\"}', '2019-11-15 07:24:57', '2019-11-15 07:24:57');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/users', 'GET', '192.168.31.181', '[]', '2019-11-15 07:24:57', '2019-11-15 07:24:57');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/users/1', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:25:02', '2019-11-15 07:25:02');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:25:12', '2019-11-15 07:25:12');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/users/1/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:25:18', '2019-11-15 07:25:18');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:25:21', '2019-11-15 07:25:21');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/users/1/edit', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:25:50', '2019-11-15 07:25:50');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/users', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:27:30', '2019-11-15 07:27:30');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:32:38', '2019-11-15 07:32:38');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:33:39', '2019-11-15 07:33:39');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:36:57', '2019-11-15 07:36:57');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:37:27', '2019-11-15 07:37:27');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:38:09', '2019-11-15 07:38:09');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:38:21', '2019-11-15 07:38:21');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:38:52', '2019-11-15 07:38:52');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:39:14', '2019-11-15 07:39:14');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:39:17', '2019-11-15 07:39:17');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:39:49', '2019-11-15 07:39:49');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:39:53', '2019-11-15 07:39:53');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:39:54', '2019-11-15 07:39:54');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:40:21', '2019-11-15 07:40:21');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:40:35', '2019-11-15 07:40:35');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/users/index1', 'GET', '192.168.31.181', '[]', '2019-11-15 07:52:07', '2019-11-15 07:52:07');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:55:05', '2019-11-15 07:55:05');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:55:40', '2019-11-15 07:55:40');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:56:27', '2019-11-15 07:56:27');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:56:44', '2019-11-15 07:56:44');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:57:18', '2019-11-15 07:57:18');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_columns_\":\"id,title\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:57:38', '2019-11-15 07:57:38');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 07:57:41', '2019-11-15 07:57:41');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:58:16', '2019-11-15 07:58:16');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:58:18', '2019-11-15 07:58:18');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 07:58:48', '2019-11-15 07:58:48');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/Goods', 'GET', '192.168.31.181', '[]', '2019-11-15 08:00:42', '2019-11-15 08:00:42');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 08:00:48', '2019-11-15 08:00:48');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2019-11-15 08:00:50', '2019-11-15 08:00:50');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"1\"}', '2019-11-15 08:01:06', '2019-11-15 08:01:06');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"1\"}', '2019-11-15 08:01:17', '2019-11-15 08:01:17');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"1\"}', '2019-11-15 08:01:47', '2019-11-15 08:01:47');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 08:02:07', '2019-11-15 08:02:07');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2019-11-15 08:02:59', '2019-11-15 08:02:59');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2019-11-15 08:03:43', '2019-11-15 08:03:43');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:06:24', '2019-11-15 08:06:24');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:07:49', '2019-11-15 08:07:49');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:12:13', '2019-11-15 08:12:13');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:26:02', '2019-11-15 08:26:02');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:27:30', '2019-11-15 08:27:30');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"id\":null}', '2019-11-15 08:27:34', '2019-11-15 08:27:34');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 08:28:26', '2019-11-15 08:28:26');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin', 'GET', '192.168.31.181', '[]', '2019-11-15 08:28:27', '2019-11-15 08:28:27');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/Goods', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 08:28:31', '2019-11-15 08:28:31');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 08:28:34', '2019-11-15 08:28:34');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:31:58', '2019-11-15 08:31:58');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:35:58', '2019-11-15 08:35:58');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:43:17', '2019-11-15 08:43:17');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:43:59', '2019-11-15 08:43:59');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:44:14', '2019-11-15 08:44:14');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:46:58', '2019-11-15 08:46:58');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/Goods/create', 'GET', '192.168.31.181', '[]', '2019-11-15 08:58:40', '2019-11-15 08:58:40');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:04:32', '2019-11-15 09:04:32');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:10:06', '2019-11-15 09:10:06');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:11:02', '2019-11-15 09:11:02');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:11:17', '2019-11-15 09:11:17');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:18:15', '2019-11-15 09:18:15');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:18:26', '2019-11-15 09:18:26');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '[]', '2019-11-15 09:18:34', '2019-11-15 09:18:34');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:30', '2019-11-15 09:19:30');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:32', '2019-11-15 09:19:32');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-11-15 09:19:40', '2019-11-15 09:19:40');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"sort\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:43', '2019-11-15 09:19:43');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"sort\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:44', '2019-11-15 09:19:44');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"sort\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:47', '2019-11-15 09:19:47');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:19:50', '2019-11-15 09:19:50');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-11-15 09:21:11', '2019-11-15 09:21:11');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-11-15 09:21:21', '2019-11-15 09:21:21');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-11-15 09:21:34', '2019-11-15 09:21:34');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-11-15 09:22:28', '2019-11-15 09:22:28');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-11-15 09:22:32', '2019-11-15 09:22:32');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:22:36', '2019-11-15 09:22:36');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-11-15 09:23:17', '2019-11-15 09:23:17');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"10\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:23:23', '2019-11-15 09:23:23');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:23:27', '2019-11-15 09:23:27');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:23:30', '2019-11-15 09:23:30');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:23:35', '2019-11-15 09:23:35');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:23:42', '2019-11-15 09:23:42');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:24:51', '2019-11-15 09:24:51');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin/GoodsSpec/create', 'GET', '192.168.31.181', '[]', '2019-11-15 09:25:42', '2019-11-15 09:25:42');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/GoodsSpec/create', 'GET', '192.168.31.181', '[]', '2019-11-15 09:25:53', '2019-11-15 09:25:53');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/GoodsSpec/create', 'GET', '192.168.31.181', '[]', '2019-11-15 09:28:56', '2019-11-15 09:28:56');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:31:38', '2019-11-15 09:31:38');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:31:39', '2019-11-15 09:31:39');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:32:05', '2019-11-15 09:32:05');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:32:15', '2019-11-15 09:32:15');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:39:25', '2019-11-15 09:39:25');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:39:28', '2019-11-15 09:39:28');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:39:33', '2019-11-15 09:39:33');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:39:33', '2019-11-15 09:39:33');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:49:37', '2019-11-15 09:49:37');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:49:51', '2019-11-15 09:49:51');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:52:03', '2019-11-15 09:52:03');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:53:00', '2019-11-15 09:53:00');
INSERT INTO `admin_operation_log` VALUES ('227', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 09:53:54', '2019-11-15 09:53:54');
INSERT INTO `admin_operation_log` VALUES ('228', '1', 'admin/GoodsSpec/create', 'GET', '192.168.31.181', '{\"_pjax\":\"#pjax-container\"}', '2019-11-15 09:58:30', '2019-11-15 09:58:30');
INSERT INTO `admin_operation_log` VALUES ('229', '1', 'admin/GoodsSpec/create', 'GET', '192.168.31.181', '[]', '2019-11-15 10:05:13', '2019-11-15 10:05:13');
INSERT INTO `admin_operation_log` VALUES ('230', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\",\"_pjax\":\"#pjax-container\"}', '2019-11-15 10:05:15', '2019-11-15 10:05:15');
INSERT INTO `admin_operation_log` VALUES ('231', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 10:05:16', '2019-11-15 10:05:16');
INSERT INTO `admin_operation_log` VALUES ('232', '1', 'admin/GoodsSpec', 'GET', '192.168.31.181', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"per_page\":\"20\"}', '2019-11-15 10:05:26', '2019-11-15 10:05:26');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', '商品列表', 'product', '', null, '2019-11-15 03:27:44', '2019-11-15 03:27:44');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_users` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2019-11-15 03:21:41', '2019-11-15 03:21:41');

-- ----------------------------
-- Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
INSERT INTO `admin_user_permissions` VALUES ('2', '1', null, null);

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$W97UwdP.P4UWSQ4m3Ts2T.9GkxjzvxYr8ZiEKyzIDe2INOMvPrd6G', 'Administrator', null, 'AiwKJ4OC8lzPSd2G5WcuWBU1ZPLxeqVMTAFVEu3UpOoCtCwoDms5VN8Gdh09', '2019-11-15 03:21:41', '2019-11-15 03:21:41');
INSERT INTO `admin_users` VALUES ('2', 'admin1', '$2y$10$l62PdoIlwrn9rCqUiiq.feJOas212/NqiGQlx9ldVOjpU9PED7Wsu', '管理员1', 'images/cy.png', null, '2019-11-15 03:27:04', '2019-11-15 03:27:04');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) DEFAULT NULL COMMENT '标题',
  `title_list` varchar(255) DEFAULT NULL COMMENT '副标题',
  `agent` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `goods_tag` varchar(200) DEFAULT NULL COMMENT '线路标签',
  `spec_type` tinyint(4) DEFAULT '0' COMMENT '0  默认  1  标签（连cm_goods_s  【标签表 goods_specs】）  2 自定义    所有信息都存在cm_goods_specslist',
  `goods_type` int(11) DEFAULT '0' COMMENT '推荐标签',
  `content` text COMMENT '路线详情',
  `tips` text COMMENT '提示  出发前准备',
  `show_banner` tinyint(4) DEFAULT '0' COMMENT '是否banner展示',
  `start_time` int(11) DEFAULT NULL COMMENT '旅途开始时间',
  `stop_time` int(11) DEFAULT NULL COMMENT '旅途结束时间',
  `show_time` int(11) DEFAULT NULL COMMENT '活动展示时间',
  `hide_time` int(11) DEFAULT NULL COMMENT '活动关闭时间',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `timestamp` datetime DEFAULT NULL,
  `rank_num` int(11) DEFAULT '0' COMMENT '排序',
  `collect_num` int(11) DEFAULT '0' COMMENT '收藏次数',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '泰山2', '登顶2', '1', '/uploads/20191008\\1136a13f91e1c2499d52b5b2bf59f323.jpg', '3', '0', '3', '<p>旅游大巴<img src=\"/uploads//20180906/5a6ea1025d5c2bd8102498e424e44a88.jpg\" alt=\"5a6ea1025d5c2bd8102498e424e44a88.jpg\"/></p><p>2312313123</p>', '<p>天气寒冷；注意防寒fdasfdsaf</p>', '1', '1558474304', '1578474304', '1558291504', '1579069104', '0', '1572003439', null, '2', '31051', '1');
INSERT INTO `goods` VALUES ('2', '黄山', '下棋', '0', '/uploads/20180927\\286131d54b259796358953c602dd22c0.jpg', null, '0', '1', '飞机', '天气炎热，注意防晒', '1', '0', '0', '1558474304', '1578474304', '0', '0', null, '0', '6485', '3');
INSERT INTO `goods` VALUES ('4', '庐山', '云雾', '0', '/uploads/20180910\\0ca66a23643bc82030b386c135b03c40.jpg', null, '0', '2', '火车', '高山带上爬山装备', '0', '0', '0', '1558474304', '1578474304', '0', '0', null, '0', '12345', '3');
INSERT INTO `goods` VALUES ('5', '珠海', '水族馆', '1', '/uploads/20190926\\7402d39586c3ff7172b7122ec5e4647e.jpg', '3', '0', '1', '<p>火车</p>', '高原', '0', '0', '0', '1558474304', '1578474304', '0', '1570759679', null, '3', '4696', '3');
INSERT INTO `goods` VALUES ('6', '西藏神山', '西藏神山圣湖一日游', '0', '/uploads/20190926\\7402d39586c3ff7172b7122ec5e4647e.jpg', null, '0', '0', '<p>天天天天团</p>', '高原缺氧', '1', '0', '0', '1558474304', '1578474304', '0', '1570518294', null, '0', '78952', '3');
INSERT INTO `goods` VALUES ('7', '西藏神山圣湖', '西藏神山圣湖一日游', '0', '/uploads/20190926\\7402d39586c3ff7172b7122ec5e4647e.jpg', null, '0', '2', '飞机', '高原缺氧', '0', '0', '0', '1558474304', '1578474304', '0', '0', null, '2', '0', '0');
INSERT INTO `goods` VALUES ('8', '西藏神山圣湖', '西藏神山圣湖一日游', '0', '/uploads/20190926\\7402d39586c3ff7172b7122ec5e4647e.jpg', null, '0', '3', '天天天天团', '高原缺氧', '0', '0', '0', '1558474304', '1578474304', '0', '0', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('10', 'fdsa', '1321', '1', '/uploads/20191008\\56ed07ac5aaed742675a2c5fb9baae72.jpg', null, '0', '2', '<p>agffdsgfdsfdsafa</p>', null, '1', '1184817600', '1743469200', '1376611200', '1672534800', '0', '1570522791', null, '2', '0', '1');
INSERT INTO `goods` VALUES ('12', 'fffff', 'ssssss', null, '/storage/2019_11_08/eb48589e79976cb0c90191a6062af8458221.jpg', null, '0', '8', null, null, '0', null, null, '1573240620', '1573240620', '1573212023', '1573212023', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('13', 'fffff', 'ssssss', null, '/storage/2019_11_08/eb48589e79976cb0c90191a6062af8458221.jpg', null, '0', '8', null, null, '0', null, null, '1573240620', '1573240620', '1573212030', '1573212030', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('14', 'fffff', 'ssssss', null, '/storage/2019_11_08/eb48589e79976cb0c90191a6062af8458221.jpg', null, '0', '8', null, null, '0', null, null, '1573240620', '1573240620', '1573212072', '1573212072', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('15', 'fffff', 'ssssss', null, '/storage/2019_11_08/5cf2e3c6f49ad6d4bbee737c92bed50c2516.png', null, '0', '8', null, null, '0', null, null, '1573240620', '1573240620', '1573212357', '1573212357', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('16', 'dsaff', 'dsaf', null, '/storage/2019_11_08/ffcb20bc96d6f93f83bf5fa0b870b1ba1622.png', null, '0', '7', null, null, '0', null, null, '1573241160', '1573241160', '1573212389', '1573212389', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('17', 'dsaff', 'dsaf', null, '/storage/2019_11_08/238080ae51763b158e464fd16884f61585.png', null, '0', '7', null, null, '0', null, null, '1573241160', '1573241160', '1573212416', '1573212416', null, '0', '0', '3');
INSERT INTO `goods` VALUES ('18', 'fdsa', 'fdsaf', null, '/storage/2019_11_08/bc586017bc9f66ae4efdcd94db9909517511.png', null, '0', '2', null, null, '0', null, null, '1573241220', '1573241220', '1573212457', '1573212457', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('19', 'test', 'sdafdsa', null, '/storage/2019_11_09/27797954cce74aae4b801a009186dbf22633.png', null, '0', '8', null, null, '0', null, null, '1573294260', '1573294260', '1573265497', '1573265497', null, '0', '0', '3');
INSERT INTO `goods` VALUES ('20', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/75cabca29a9623fdefb95dfa8c164dd91339.png', null, '0', '6', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/storage/2019_11_14/60501fd25d2e91acc79f1d2fe46e7f996597.png\" width=\"300\"></p><p>给对方和过分的话</p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/storage/2019_11_14/ca9131325e42d60b1bc211a8b8a987802571.png\" width=\"300\"></p><p><br></p><p><br></p>', null, '0', null, null, '1573658580', '1636816980', '1573721446', '1573721446', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('21', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/f75e331013920352e2076b090a5058a12901.png', null, '0', '6', null, null, '0', null, null, '1573658580', '1636816980', '1573630051', '1573630051', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('22', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/f75e331013920352e2076b090a5058a12901.png', null, '0', '6', null, null, '0', null, null, '1573658580', '1636816980', '1573630056', '1573630056', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('23', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/f75e331013920352e2076b090a5058a12901.png', null, '0', '6', null, null, '0', null, null, '1573658580', '1636816980', '1573630085', '1573630085', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('24', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/3a05b4f1206fdab74febc1876f2194002564.jpg', null, '0', '6', '<p><br></p>', null, '0', null, null, '1573658580', '1636816980', '1573630653', '1573630653', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('25', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/75cabca29a9623fdefb95dfa8c164dd91339.png', null, '0', '6', '<p>55555</p>', null, '0', null, null, '1573658580', '1636816980', '1573700974', '1573700974', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('26', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/75cabca29a9623fdefb95dfa8c164dd91339.png', null, '0', '6', '<p>55555</p>', null, '0', null, null, '1573658580', '1636816980', '1573700986', '1573700986', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('27', '银士顿', '银士顿内存条', null, '/storage/2019_11_13/75cabca29a9623fdefb95dfa8c164dd91339.png', null, '0', '6', '<p>55555</p>', null, '0', null, null, '1573658580', '1636816980', '1573701055', '1573701055', null, '0', '0', '1');
INSERT INTO `goods` VALUES ('28', '小汉堡', '一个小汉堡', null, '/storage/2019_11_14/95533d6f7b150c23e5c3f6cd4be1f03e872.png', null, '0', '8', '<p>花港饭店范德萨<img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/storage/2019_11_14/ffddb025955f6815c129e763864bc2959549.jpg\" width=\"300\">发洒范德萨范德萨<img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/storage/2019_11_14/55c00629c9b11f342ea15d6d1d87830e8727.png\" width=\"300\"></p>', null, '0', null, null, '1573750320', '1605372720', '1573721547', '1573721547', null, '0', '0', '1');

-- ----------------------------
-- Table structure for `goods_son`
-- ----------------------------
DROP TABLE IF EXISTS `goods_son`;
CREATE TABLE `goods_son` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `pro_num` bigint(20) DEFAULT NULL COMMENT '产品id',
  `title` varchar(50) DEFAULT NULL COMMENT '产品子标题',
  `typelist` varchar(50) DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL COMMENT '产品类型、分类',
  `photo` varchar(80) DEFAULT NULL COMMENT '图片',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL COMMENT '产品数量',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  `show` tinyint(4) DEFAULT '1' COMMENT '是否显示',
  `status` tinyint(4) DEFAULT '1' COMMENT '产品状态',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='产品子表';

-- ----------------------------
-- Records of goods_son
-- ----------------------------
INSERT INTO `goods_son` VALUES ('2', '1', '1911121932506982931', null, null, '/蓝色/2T/fdsa', null, '123', '444', null, '1', '1', '1573558370', '1573558370');
INSERT INTO `goods_son` VALUES ('3', '1', '1911121932502896040', null, null, '/蓝色/128/fdsa', null, '333', '555', null, '1', '1', '1573558370', '1573558370');
INSERT INTO `goods_son` VALUES ('4', '1', '1911121932507940639', null, null, '/白色/2T/fdsa', null, '1111', '2222', null, '1', '1', '1573558370', '1573558370');
INSERT INTO `goods_son` VALUES ('5', '1', '1911121932502312651', null, null, '/白色/128/fdsa', null, '4444', '8888', null, '1', '1', '1573558370', '1573558370');
INSERT INTO `goods_son` VALUES ('6', '24', '1911131541554674141', null, null, '/红色/512G', null, '999', '1000', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('7', '24', '1911131541551165446', null, null, '/红色/1T', null, '888', '999', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('8', '24', '1911131541554996926', null, null, '/绿色/512G', null, '998', '998', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('9', '24', '1911131541551821447', null, null, '/绿色/1T', null, '889', '997', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('10', '24', '1911131541551409148', null, null, '/蓝色/512G', null, '997', '996', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('11', '24', '1911131541553682836', null, null, '/蓝色/1T', null, '887', '995', null, '1', '1', '1573630915', '1573630915');
INSERT INTO `goods_son` VALUES ('18', '10', '1911131916224261842', null, '颜色/内存/321', '红色/64G/1231', null, '123', '4561', null, '1', '1', '1573643782', '1573643782');
INSERT INTO `goods_son` VALUES ('19', '10', '1911131916225663439', null, '颜色/内存/321', '绿色/64G/1231', null, '789', '1234', null, '1', '1', '1573643782', '1573643782');
INSERT INTO `goods_son` VALUES ('20', '28', '1911141653454575929', null, '颜色/分量', '红色/大', null, '102', '15', null, '1', '1', '1573721625', '1573721625');
INSERT INTO `goods_son` VALUES ('21', '28', '1911141653459322736', null, '颜色/分量', '红色/中', null, '60', '55', null, '1', '1', '1573721625', '1573721625');
INSERT INTO `goods_son` VALUES ('22', '28', '1911141653458566430', null, '颜色/分量', '红色/小', null, '30', '33', null, '1', '1', '1573721625', '1573721625');
INSERT INTO `goods_son` VALUES ('23', '28', '1911141653455520839', null, '颜色/分量', '白色/大', null, '100', '22', null, '1', '1', '1573721625', '1573721625');
INSERT INTO `goods_son` VALUES ('24', '28', '1911141653451000949', null, '颜色/分量', '白色/中', null, '61', '33', null, '1', '1', '1573721625', '1573721625');
INSERT INTO `goods_son` VALUES ('25', '28', '1911141653455379233', null, '颜色/分量', '白色/小', null, '33', '11', null, '1', '1', '1573721625', '1573721625');

-- ----------------------------
-- Table structure for `goods_specs`
-- ----------------------------
DROP TABLE IF EXISTS `goods_specs`;
CREATE TABLE `goods_specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0' COMMENT '父id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '规格名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `created_at` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- ----------------------------
-- Records of goods_specs
-- ----------------------------
INSERT INTO `goods_specs` VALUES ('1', '0', '颜色', '0', '1573195951', '1');
INSERT INTO `goods_specs` VALUES ('2', '1', '红色', '0', '1573196047', '1');
INSERT INTO `goods_specs` VALUES ('3', '1', '绿色', '0', '1573196223', '1');
INSERT INTO `goods_specs` VALUES ('4', '1', '蓝色', '0', '1573196233', '1');
INSERT INTO `goods_specs` VALUES ('5', '1', '白色', '1', '1573196261', '0');
INSERT INTO `goods_specs` VALUES ('6', '0', '内存', '0', '1573196275', '1');
INSERT INTO `goods_specs` VALUES ('7', '6', '64G', '0', '1573196290', '1');
INSERT INTO `goods_specs` VALUES ('8', '6', '128G', '0', '1573196306', '1');
INSERT INTO `goods_specs` VALUES ('9', '0', '硬盘', '0', '1573285986', '1');
INSERT INTO `goods_specs` VALUES ('10', '9', '512G', '0', '1573286022', '1');
INSERT INTO `goods_specs` VALUES ('11', '9', '1T', '0', '1573286033', '1');
INSERT INTO `goods_specs` VALUES ('12', '9', '2T', '0', '1573286040', '1');
INSERT INTO `goods_specs` VALUES ('13', '6', '256G', '0', '1573454038', '1');
INSERT INTO `goods_specs` VALUES ('14', '6', '512', '0', '1573454067', '1');
INSERT INTO `goods_specs` VALUES ('15', '9', '128', '0', '1573454111', '1');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '刘先生', '123@123.com', '2019-11-15 07:24:09', '123456', '123456', '2019-11-15 07:24:57', '2019-11-15 07:24:57');
