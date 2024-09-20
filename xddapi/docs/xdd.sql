/*
 Navicat Premium Data Transfer

 Source Server         : mysqldb
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : xdd

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/09/2024 14:43:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 'add_logentry', 1);
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 'change_logentry', 1);
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 'delete_logentry', 1);
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 'view_logentry', 1);
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 'add_permission', 2);
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 'change_permission', 2);
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 'delete_permission', 2);
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 'view_permission', 2);
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 'add_group', 3);
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 'change_group', 3);
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 'delete_group', 3);
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 'view_group', 3);
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 'add_contenttype', 4);
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 'change_contenttype', 4);
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 'delete_contenttype', 4);
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 'view_contenttype', 4);
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 'add_session', 5);
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 'change_session', 5);
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 'delete_session', 5);
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 'view_session', 5);
INSERT INTO `auth_permission` VALUES (21, 'Can add 轮播广告', 'add_banner', 6);
INSERT INTO `auth_permission` VALUES (22, 'Can change 轮播广告', 'change_banner', 6);
INSERT INTO `auth_permission` VALUES (23, 'Can delete 轮播广告', 'delete_banner', 6);
INSERT INTO `auth_permission` VALUES (24, 'Can view 轮播广告', 'view_banner', 6);
INSERT INTO `auth_permission` VALUES (25, 'Can add 导航菜单', 'add_nav', 7);
INSERT INTO `auth_permission` VALUES (26, 'Can change 导航菜单', 'change_nav', 7);
INSERT INTO `auth_permission` VALUES (27, 'Can delete 导航菜单', 'delete_nav', 7);
INSERT INTO `auth_permission` VALUES (28, 'Can view 导航菜单', 'view_nav', 7);
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户信息', 'add_user', 8);
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户信息', 'change_user', 8);
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户信息', 'delete_user', 8);
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户信息', 'view_user', 8);
INSERT INTO `auth_permission` VALUES (33, 'Can add 课程分类', 'add_coursecategory', 9);
INSERT INTO `auth_permission` VALUES (34, 'Can change 课程分类', 'change_coursecategory', 9);
INSERT INTO `auth_permission` VALUES (35, 'Can delete 课程分类', 'delete_coursecategory', 9);
INSERT INTO `auth_permission` VALUES (36, 'Can view 课程分类', 'view_coursecategory', 9);
INSERT INTO `auth_permission` VALUES (37, 'Can add 讲师导师', 'add_teacher', 10);
INSERT INTO `auth_permission` VALUES (38, 'Can change 讲师导师', 'change_teacher', 10);
INSERT INTO `auth_permission` VALUES (39, 'Can delete 讲师导师', 'delete_teacher', 10);
INSERT INTO `auth_permission` VALUES (40, 'Can view 讲师导师', 'view_teacher', 10);
INSERT INTO `auth_permission` VALUES (41, 'Can add 课程章节', 'add_coursechapter', 11);
INSERT INTO `auth_permission` VALUES (42, 'Can change 课程章节', 'change_coursechapter', 11);
INSERT INTO `auth_permission` VALUES (43, 'Can delete 课程章节', 'delete_coursechapter', 11);
INSERT INTO `auth_permission` VALUES (44, 'Can view 课程章节', 'view_coursechapter', 11);
INSERT INTO `auth_permission` VALUES (45, 'Can add 专题课程', 'add_course', 12);
INSERT INTO `auth_permission` VALUES (46, 'Can change 专题课程', 'change_course', 12);
INSERT INTO `auth_permission` VALUES (47, 'Can delete 专题课程', 'delete_course', 12);
INSERT INTO `auth_permission` VALUES (48, 'Can view 专题课程', 'view_course', 12);
INSERT INTO `auth_permission` VALUES (49, 'Can add 课程课时', 'add_courselesson', 13);
INSERT INTO `auth_permission` VALUES (50, 'Can change 课程课时', 'change_courselesson', 13);
INSERT INTO `auth_permission` VALUES (51, 'Can delete 课程课时', 'delete_courselesson', 13);
INSERT INTO `auth_permission` VALUES (52, 'Can view 课程课时', 'view_courselesson', 13);
INSERT INTO `auth_permission` VALUES (53, 'Can add 课程优惠类型', 'add_coursediscounttype', 14);
INSERT INTO `auth_permission` VALUES (54, 'Can change 课程优惠类型', 'change_coursediscounttype', 14);
INSERT INTO `auth_permission` VALUES (55, 'Can delete 课程优惠类型', 'delete_coursediscounttype', 14);
INSERT INTO `auth_permission` VALUES (56, 'Can view 课程优惠类型', 'view_coursediscounttype', 14);
INSERT INTO `auth_permission` VALUES (57, 'Can add 课程有效期', 'add_courseexpire', 15);
INSERT INTO `auth_permission` VALUES (58, 'Can change 课程有效期', 'change_courseexpire', 15);
INSERT INTO `auth_permission` VALUES (59, 'Can delete 课程有效期', 'delete_courseexpire', 15);
INSERT INTO `auth_permission` VALUES (60, 'Can view 课程有效期', 'view_courseexpire', 15);
INSERT INTO `auth_permission` VALUES (61, 'Can add 商品活动', 'add_activity', 16);
INSERT INTO `auth_permission` VALUES (62, 'Can change 商品活动', 'change_activity', 16);
INSERT INTO `auth_permission` VALUES (63, 'Can delete 商品活动', 'delete_activity', 16);
INSERT INTO `auth_permission` VALUES (64, 'Can view 商品活动', 'view_activity', 16);
INSERT INTO `auth_permission` VALUES (65, 'Can add 课程与优惠策略的关系表', 'add_coursepricediscount', 17);
INSERT INTO `auth_permission` VALUES (66, 'Can change 课程与优惠策略的关系表', 'change_coursepricediscount', 17);
INSERT INTO `auth_permission` VALUES (67, 'Can delete 课程与优惠策略的关系表', 'delete_coursepricediscount', 17);
INSERT INTO `auth_permission` VALUES (68, 'Can view 课程与优惠策略的关系表', 'view_coursepricediscount', 17);
INSERT INTO `auth_permission` VALUES (69, 'Can add 价格优惠策略', 'add_coursediscount', 18);
INSERT INTO `auth_permission` VALUES (70, 'Can change 价格优惠策略', 'change_coursediscount', 18);
INSERT INTO `auth_permission` VALUES (71, 'Can delete 价格优惠策略', 'delete_coursediscount', 18);
INSERT INTO `auth_permission` VALUES (72, 'Can view 价格优惠策略', 'view_coursediscount', 18);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_xdd_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_xdd_user_id` FOREIGN KEY (`user_id`) REFERENCES `xdd_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-07-02 11:02:49.479421', '1', 'yugong', 2, '[{\"changed\": {\"fields\": [\"\\u624b\\u673a\\u53f7\\u7801\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2024-07-05 07:56:27.840546', '26', 'Beego框架入门', 2, '[{\"changed\": {\"fields\": [\"\\u8be6\\u60c5\\u4ecb\\u7ecd\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (3, '2024-07-06 02:44:10.448070', '1', 'flask框架', 2, '[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\\u89c6\\u9891\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (4, '2024-07-06 02:45:41.632933', '1', 'flask框架', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2024-07-06 02:47:10.773649', '1', 'flask框架', 2, '[{\"changed\": {\"fields\": [\"\\u8be6\\u60c5\\u4ecb\\u7ecd\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (6, '2024-07-06 03:19:40.226076', '1', '雨老师', 2, '[{\"changed\": {\"fields\": [\"\\u8bb2\\u5e08title\", \"\\u804c\\u4f4d\\u3001\\u804c\\u79f0\", \"\\u5bfc\\u5e08\\u7b7e\\u540d\", \"\\u8bb2\\u5e08\\u5c01\\u9762\", \"\\u8bb2\\u5e08\\u63cf\\u8ff0\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (7, '2024-07-06 03:20:26.190450', '1', '雨老师', 2, '[{\"changed\": {\"fields\": [\"\\u5bfc\\u5e08\\u7b7e\\u540d\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2024-07-06 09:54:21.488014', '5', 'django框架:(第1章)django框架快速入门', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (9, '2024-07-06 09:59:08.428683', '5', 'django框架:(第1章)django框架快速入门', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (10, '2024-07-06 09:59:14.296643', '6', 'django框架:(第2章)django的路由', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2024-07-06 10:22:12.662855', '23', 'flask框架:(第3章)flask的视图-视图类的声明和使用', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (12, '2024-07-06 10:22:31.373604', '22', 'flask框架:(第2章)flask的路由-路由的分类-命名绑定参数', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8bfe\\u65f6\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (13, '2024-07-08 06:21:55.741723', '1', 'yugong', 2, '[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u5934\\u50cf\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2024-07-08 23:41:21.558102', '1', '限时免费', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (15, '2024-07-08 23:42:06.249360', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (16, '2024-07-08 23:42:37.171377', '2', '限时减免', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (17, '2024-07-08 23:43:13.626079', '2', '价格优惠:限时减免,优惠条件:50,优惠值:-20', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (18, '2024-07-08 23:46:19.460814', '2', '价格优惠:限时减免,优惠条件:50,优惠值:-20', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (19, '2024-07-08 23:46:23.660689', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (20, '2024-07-08 23:46:28.572219', '2', '限时减免', 3, '', 14, 1);
INSERT INTO `django_admin_log` VALUES (21, '2024-07-08 23:46:31.796117', '1', '限时免费', 3, '', 14, 1);
INSERT INTO `django_admin_log` VALUES (22, '2024-07-08 23:49:00.902957', '2', '中秋节快乐购', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u7b56\\u7565\\u7684\\u5f00\\u59cb\\u65f6\\u95f4\", \"\\u4f18\\u60e0\\u7b56\\u7565\\u7684\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (23, '2024-07-08 23:49:08.130119', '1', '超级新品日', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u7b56\\u7565\\u7684\\u5f00\\u59cb\\u65f6\\u95f4\", \"\\u4f18\\u60e0\\u7b56\\u7565\\u7684\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (24, '2024-07-08 23:49:51.829647', '1', '课程：python入门，优惠活动: 超级新品日,开始时间:2024-08-19 02:00:00+00:00,结束时间:2024-09-18 16:00:00+00:00', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (25, '2024-07-09 01:08:56.212119', '1', '课程：python入门，优惠活动: 超级新品日,开始时间:2024-08-19 02:00:00+00:00,结束时间:2024-09-18 16:00:00+00:00', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (26, '2024-07-09 09:33:27.394301', '3', '定期免费课程', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (27, '2024-07-09 09:33:49.339926', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (28, '2024-07-09 09:34:09.220430', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (29, '2024-07-09 09:34:29.602966', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (30, '2024-07-09 09:35:44.958546', '3', '定期免费课程', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (31, '2024-07-09 09:37:27.665342', '3', '定期免费课程', 2, '[]', 16, 1);
INSERT INTO `django_admin_log` VALUES (32, '2024-07-09 09:38:53.332801', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u6298\\u6263\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (33, '2024-07-09 09:39:08.726404', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u6298\\u6263\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (34, '2024-07-09 09:40:00.892873', '3', '定期免费课程', 2, '[]', 16, 1);
INSERT INTO `django_admin_log` VALUES (35, '2024-07-09 09:41:38.052007', '3', '定期免费课程', 2, '[]', 16, 1);
INSERT INTO `django_admin_log` VALUES (36, '2024-07-09 09:44:05.944893', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 2, '[]', 18, 1);
INSERT INTO `django_admin_log` VALUES (37, '2024-07-09 09:45:18.854734', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (38, '2024-07-09 09:45:22.385733', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (39, '2024-07-09 09:45:25.636949', '2', '价格优惠:限时折扣,优惠条件:0,优惠值:*0.82', 2, '[]', 18, 1);
INSERT INTO `django_admin_log` VALUES (40, '2024-07-09 09:45:30.085566', '3', '价格优惠:限时折扣,优惠条件:0,优惠值:*0.75', 2, '[]', 18, 1);
INSERT INTO `django_admin_log` VALUES (41, '2024-07-09 09:45:34.410410', '5', '价格优惠:满减,优惠条件:0,优惠值:满500-80\r\n满400-40\r\n满300-20\r\n满200-10', 2, '[]', 18, 1);
INSERT INTO `django_admin_log` VALUES (42, '2024-07-09 09:46:52.049436', '2', '课程：负载均衡，优惠活动: 定期免费课程,开始时间:2024-07-01 06:00:00,结束时间:2024-07-31 09:33:11', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (43, '2024-07-09 09:47:05.718794', '1', '价格优惠:限时免费,优惠条件:0,优惠值:', 2, '[]', 18, 1);
INSERT INTO `django_admin_log` VALUES (44, '2024-07-09 09:47:32.187029', '3', '定期免费课程', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u7b56\\u7565\\u7684\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (45, '2024-07-09 09:48:23.060057', '3', '定期课程折扣', 2, '[{\"changed\": {\"fields\": [\"\\u6d3b\\u52a8\\u540d\\u79f0\", \"\\u5907\\u6ce8\\u4fe1\\u606f\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (46, '2024-07-09 09:48:47.468075', '2', '课程：负载均衡，优惠活动: 定期课程折扣,开始时间:2024-07-01 06:00:00,结束时间:2024-08-29 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u4f18\\u60e0\\u6298\\u6263\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (47, '2024-07-09 09:49:20.031311', '3', '课程：以太坊入门，优惠活动: 定期课程折扣,开始时间:2024-07-01 06:00:00,结束时间:2024-08-29 09:33:11', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (48, '2024-07-09 09:49:24.010342', '3', '课程：以太坊入门，优惠活动: 定期课程折扣,开始时间:2024-07-01 06:00:00,结束时间:2024-08-29 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (49, '2024-07-09 09:49:43.201300', '2', '课程：负载均衡，优惠活动: 定期课程折扣,开始时间:2024-07-01 06:00:00,结束时间:2024-08-29 09:33:11', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (50, '2024-07-09 09:51:19.883065', '18', '负载均衡', 2, '[{\"changed\": {\"fields\": [\"\\u8be6\\u60c5\\u4ecb\\u7ecd\", \"\\u8bfe\\u7a0b\\u539f\\u4ef7\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (51, '2024-07-09 09:51:46.191826', '29', '1', 2, '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u540d\\u79f0\", \"\\u8be6\\u60c5\\u4ecb\\u7ecd\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (52, '2024-07-09 09:52:01.251554', '18', '2', 2, '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u540d\\u79f0\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (53, '2024-07-09 09:52:09.368706', '29', '负载均衡', 2, '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u540d\\u79f0\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (54, '2024-07-09 09:52:22.337051', '18', '2', 2, '[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (55, '2024-07-09 09:52:56.518107', '29', '负载均衡', 2, '[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (56, '2024-07-09 09:53:18.631831', '2', '课程：负载均衡，优惠活动: 定期课程折扣,开始时间:2024-07-01 06:00:00,结束时间:2024-08-29 09:33:11', 2, '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\"]}}]', 17, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (16, 'course', 'activity');
INSERT INTO `django_content_type` VALUES (12, 'course', 'course');
INSERT INTO `django_content_type` VALUES (9, 'course', 'coursecategory');
INSERT INTO `django_content_type` VALUES (11, 'course', 'coursechapter');
INSERT INTO `django_content_type` VALUES (18, 'course', 'coursediscount');
INSERT INTO `django_content_type` VALUES (14, 'course', 'coursediscounttype');
INSERT INTO `django_content_type` VALUES (15, 'course', 'courseexpire');
INSERT INTO `django_content_type` VALUES (13, 'course', 'courselesson');
INSERT INTO `django_content_type` VALUES (17, 'course', 'coursepricediscount');
INSERT INTO `django_content_type` VALUES (10, 'course', 'teacher');
INSERT INTO `django_content_type` VALUES (6, 'home', 'banner');
INSERT INTO `django_content_type` VALUES (7, 'home', 'nav');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-07-02 05:59:47.899741');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-07-02 05:59:47.943625');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-07-02 05:59:48.094658');
INSERT INTO `django_migrations` VALUES (4, 'user', '0001_initial', '2024-07-02 05:59:48.260949');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0001_initial', '2024-07-02 05:59:48.304835');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0002_logentry_user', '2024-07-02 05:59:48.338745');
INSERT INTO `django_migrations` VALUES (7, 'home', '0001_initial', '2024-07-02 05:59:48.392601');
INSERT INTO `django_migrations` VALUES (8, 'sessions', '0001_initial', '2024-07-02 05:59:48.417534');
INSERT INTO `django_migrations` VALUES (9, 'course', '0001_initial', '2024-07-04 04:11:01.377449');
INSERT INTO `django_migrations` VALUES (10, 'course', '0002_courselesson_is_show_list', '2024-07-04 08:54:07.224919');
INSERT INTO `django_migrations` VALUES (11, 'course', '0003_courselesson_course', '2024-07-04 08:54:07.274154');
INSERT INTO `django_migrations` VALUES (12, 'course', '0004_alter_courselesson_is_show', '2024-07-04 11:16:40.165896');
INSERT INTO `django_migrations` VALUES (13, 'course', '0005_courselesson_lesson', '2024-07-04 11:46:19.656878');
INSERT INTO `django_migrations` VALUES (14, 'course', '0006_alter_course_brief', '2024-07-05 07:41:22.859103');
INSERT INTO `django_migrations` VALUES (15, 'course', '0007_course_course_video', '2024-07-06 02:37:45.859584');
INSERT INTO `django_migrations` VALUES (16, 'course', '0008_auto_20240709_0728', '2024-07-08 23:28:06.202611');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1cv1u2k3p0h2dk94cpjvuzkf7g49eb70', '.eJxVjEEOwiAQRe_C2hAYsIBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr-19Sb4YgyCYWAoQ2A1OBVIQYZMJafgFVobwIEP7PBM2hrUpFVhn7R4fwDLuzdv:1sPdc4:aBVCoiM84D52zulfVxgwVK91AmkpKsEYgI9lY0XyzS4', '2024-07-19 07:44:12.308038');
INSERT INTO `django_session` VALUES ('46si03phwprx6og5tmtf2mqgdxrjg1rc', '.eJxVjEEOwiAQRe_C2hAYsIBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr-19Sb4YgyCYWAoQ2A1OBVIQYZMJafgFVobwIEP7PBM2hrUpFVhn7R4fwDLuzdv:1sQxmt:x5njE0HV5uXW_cLCVIEr8nDOurZFjdKRFpxjnJQun6o', '2024-07-22 23:28:51.922779');
INSERT INTO `django_session` VALUES ('ea0eqr5a02tf751sfdiapsowy7kv2m22', '.eJxVjEEOwiAQRe_C2hAYsIBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr-19Sb4YgyCYWAoQ2A1OBVIQYZMJafgFVobwIEP7PBM2hrUpFVhn7R4fwDLuzdv:1sPdWW:WLJrur94_uVneFDI0A65tamQ56IjHWg6i-XDTB7CAnE', '2024-07-19 07:38:28.696562');
INSERT INTO `django_session` VALUES ('qyl7pfsn9cc1j8uj5p7aijg6edwylog7', '.eJxVjEEOwiAQRe_C2hAYsIBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr-19Sb4YgyCYWAoQ2A1OBVIQYZMJafgFVobwIEP7PBM2hrUpFVhn7R4fwDLuzdv:1sPdYV:4fxPYgqcz1W4sVtqK7PVgAN3QpVEeixCQiEceuYJZNQ', '2024-07-19 07:40:31.924107');
INSERT INTO `django_session` VALUES ('x9jwb0milm2pi1m8lco2qcweqqkzwfzm', '.eJxVjEEOwiAQRe_C2hAYsIBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr-19Sb4YgyCYWAoQ2A1OBVIQYZMJafgFVobwIEP7PBM2hrUpFVhn7R4fwDLuzdv:1sObFi:xYGxoqy2kAthnKpSKT4CuIWk8eeE9uGwkrzKsXP3-4o', '2024-07-16 11:00:50.934369');

-- ----------------------------
-- Table structure for xdd_activity
-- ----------------------------
DROP TABLE IF EXISTS `xdd_activity`;
CREATE TABLE `xdd_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `remark` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_activity
-- ----------------------------
INSERT INTO `xdd_activity` VALUES (1, 1, 1, 0, '2019-08-19 03:28:52.003151', '2024-07-08 23:49:08.129123', '超级新品日', '2024-08-19 02:00:00.000000', '2024-09-18 16:00:00.000000', NULL);
INSERT INTO `xdd_activity` VALUES (2, 1, 1, 0, '2019-08-19 03:29:52.662367', '2024-07-08 23:49:00.901959', '中秋节快乐购', '2024-09-24 16:00:00.000000', '2024-09-30 16:00:00.000000', NULL);
INSERT INTO `xdd_activity` VALUES (3, 1, 1, 0, '2024-07-09 09:33:27.389699', '2024-07-09 09:48:23.059091', '定期课程折扣', '2024-07-01 06:00:00.000000', '2024-08-29 09:33:11.000000', '定期活动');

-- ----------------------------
-- Table structure for xdd_banner
-- ----------------------------
DROP TABLE IF EXISTS `xdd_banner`;
CREATE TABLE `xdd_banner`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_banner
-- ----------------------------
INSERT INTO `xdd_banner` VALUES (1, 1, 1, 0, '2024-07-01 07:57:03.300012', '2024-07-01 07:57:03.300012', '第一张图片', 'https://www.baidu.com/', 'banner/banner1_Bob57re.png', '1');
INSERT INTO `xdd_banner` VALUES (2, 1, 2, 0, '2024-07-01 07:57:22.527155', '2024-07-01 07:57:22.527155', '第二张图片', 'https://www.baidu.com/', 'banner/banner2_WLyV0OU.png', '2');
INSERT INTO `xdd_banner` VALUES (3, 1, 3, 0, '2024-07-01 07:57:35.547371', '2024-07-01 07:57:35.547371', '第三张图片', 'https://www.baidu.com/', 'banner/banner3.png', '3');

-- ----------------------------
-- Table structure for xdd_course
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course`;
CREATE TABLE `xdd_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `course_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `level` smallint(6) NOT NULL,
  `pub_date` date NOT NULL,
  `period` int(11) NOT NULL,
  `attachment_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `students` int(11) NOT NULL,
  `lessons` int(11) NOT NULL,
  `pub_lessons` int(11) NOT NULL,
  `price` decimal(6, 2) NOT NULL,
  `course_category_id` bigint(20) NULL DEFAULT NULL,
  `teacher_id` bigint(20) NULL DEFAULT NULL,
  `course_video` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_course_category_id_ae1db0b7_fk_xdd_course_category_id`(`course_category_id`) USING BTREE,
  INDEX `xdd_course_teacher_id_b82a25c5_fk_xdd_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `xdd_course_course_category_id_ae1db0b7_fk_xdd_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `xdd_course_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_course_teacher_id_b82a25c5_fk_xdd_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `xdd_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course
-- ----------------------------
INSERT INTO `xdd_course` VALUES (1, 1, 1, 0, '2019-08-13 07:13:50.678948', '2024-07-06 02:47:10.772015', 'flask框架', 'course/flask.jpg', 0, '<p>零基础入门Flask框架</p>\r\n\r\n<p><img alt=\"\" src=\"/media/course/flask.jpg\" style=\"height:749px; width:1355px\" /></p>', 1, '2019-08-13', 7, 'README.md', 0, 99, 110, 110, 1110.00, 1, 1, 'video/1.mp4');
INSERT INTO `xdd_course` VALUES (2, 1, 2, 0, '2019-08-13 07:15:32.490163', '2019-08-15 04:13:22.430368', 'APP开发', 'course/app.jpg', 0, '<p>dxxx</p>', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 666.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (3, 1, 3, 0, '2019-08-13 07:15:32.490163', '2019-08-20 10:49:41.880490', 'django框架', 'course/django.jpg', 0, '<p>dxxx</p>', 1, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 330.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (15, 1, 4, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:15:32.490191', 'python入门', 'course/python.jpg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 411.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (16, 1, 5, 0, '2019-08-13 07:15:32.490163', '2019-08-14 02:28:04.791112', 'hbase入门', 'course/2.jpeg', 0, 'dxxx', 1, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 7, 1, NULL);
INSERT INTO `xdd_course` VALUES (17, 1, 6, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:15:32.490191', '学多多项目实战', 'course/2.jpeg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 899.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (18, 1, 7, 0, '2019-08-13 07:15:32.490163', '2024-07-09 09:52:22.334059', '2', 'course/12.jpg', 0, '<p>dxxx</p>', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 1200.00, 6, 1, '');
INSERT INTO `xdd_course` VALUES (19, 1, 8, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:15:32.490191', 'MVC', 'course/2.jpeg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 1500.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (20, 1, 9, 0, '2019-08-13 07:15:32.490163', '2019-08-14 02:28:52.126968', '21天java入门', 'course/2.jpeg', 0, 'dxxx', 0, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 3000.00, 7, 1, NULL);
INSERT INTO `xdd_course` VALUES (21, 1, 10, 0, '2019-08-13 07:15:32.490163', '2019-08-14 02:27:01.850049', '7天玩转Linux运维', 'course/2.jpeg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 3, 1, NULL);
INSERT INTO `xdd_course` VALUES (22, 1, 11, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:15:32.490191', '15天掌握flask框架', 'course/2.jpeg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 1, 1, NULL);
INSERT INTO `xdd_course` VALUES (23, 1, 12, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:23:56.015167', 'C编程嵌入式', 'course/2.jpeg', 0, 'dxxx', 1, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 399.00, 3, 1, NULL);
INSERT INTO `xdd_course` VALUES (24, 1, 13, 0, '2019-08-13 07:15:32.490163', '2019-08-14 02:29:17.872840', '3天玩转树莓派', 'course/2.jpeg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 3, 1, NULL);
INSERT INTO `xdd_course` VALUES (25, 1, 14, 0, '2019-08-13 07:15:32.490163', '2019-08-14 02:28:30.783768', 'MongoDB', 'course/2.jpeg', 0, 'dxxx', 0, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 3, 1, NULL);
INSERT INTO `xdd_course` VALUES (26, 1, 15, 0, '2019-08-13 07:15:32.490163', '2024-07-05 07:56:27.835846', 'Beego框架入门', 'course/2.jpeg', 0, '<p>Beego框架入门教学：Beego新闻发布系统后台视频课程</p>\r\n\r\n<p><img alt=\"\" src=\"/media/course/beego.jpg\" /></p>', 1, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 699.00, 2, 1, NULL);
INSERT INTO `xdd_course` VALUES (27, 1, 16, 0, '2019-08-13 07:15:32.490163', '2019-08-15 02:35:20.997672', 'beego框架进阶', 'course/beego.jpg', 0, '<p>dxxx</p>', 1, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 50, 400.00, 2, 1, NULL);
INSERT INTO `xdd_course` VALUES (28, 1, 17, 0, '2019-08-13 07:15:32.490163', '2019-08-13 07:23:44.546598', '以太坊入门', 'course/ytf.jpg', 0, 'dxxx', 2, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 899.00, 2, 1, NULL);
INSERT INTO `xdd_course` VALUES (29, 1, 18, 0, '2019-08-13 07:15:32.490163', '2024-07-09 09:52:56.512166', '负载均衡', 'course/fz_pHw7NE8.jpg', 0, '<p>dxxx<img alt=\"\" src=\"/media/2019/08/15/course-cover.jpeg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>123213232111333322112223</p>\r\n\r\n<p>&nbsp;</p>', 0, '2019-08-13', 7, 'logo.svg', 0, 10, 50, 40, 400.00, 3, 1, '');

-- ----------------------------
-- Table structure for xdd_course_category
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_category`;
CREATE TABLE `xdd_course_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_category
-- ----------------------------
INSERT INTO `xdd_course_category` VALUES (1, 1, 11, 0, '2019-08-13 07:08:47.100074', '2019-08-13 07:44:05.903782', 'python');
INSERT INTO `xdd_course_category` VALUES (2, 1, 0, 0, '2019-08-13 07:08:51.451093', '2019-08-13 07:43:54.558940', 'go编程');
INSERT INTO `xdd_course_category` VALUES (3, 1, 3, 0, '2019-08-13 07:08:57.390196', '2019-08-13 07:08:57.390226', 'Linux运维');
INSERT INTO `xdd_course_category` VALUES (4, 1, 4, 0, '2019-08-13 07:09:11.465963', '2019-08-13 07:09:11.465994', '前端开发');
INSERT INTO `xdd_course_category` VALUES (5, 1, 11, 0, '2019-08-13 07:08:47.100074', '2019-08-13 07:44:05.903782', 'php编程');
INSERT INTO `xdd_course_category` VALUES (6, 1, 0, 0, '2019-08-13 07:08:51.451093', '2019-08-13 07:43:54.558940', 'C/C++');
INSERT INTO `xdd_course_category` VALUES (7, 1, 3, 0, '2019-08-13 07:08:57.390196', '2019-08-13 07:08:57.390226', 'java web');
INSERT INTO `xdd_course_category` VALUES (8, 1, 4, 0, '2019-08-13 07:09:11.465963', '2019-08-13 07:09:11.465994', 'UI设计');
INSERT INTO `xdd_course_category` VALUES (9, 1, 11, 0, '2019-08-13 07:09:11.465963', '2019-08-13 07:09:11.465994', '语文');
INSERT INTO `xdd_course_category` VALUES (10, 2, 145, 0, '2019-08-13 07:09:11.465963', '2019-08-13 07:09:11.465994', '数学');
INSERT INTO `xdd_course_category` VALUES (11, 2, 1, 0, '2019-08-13 07:09:11.465963', '2019-08-13 07:09:11.465994', '英语');

-- ----------------------------
-- Table structure for xdd_course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_chapter`;
CREATE TABLE `xdd_course_chapter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `chapter` smallint(6) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `pub_date` date NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_chapter_course_id_eeba9447_fk_xdd_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `xdd_course_chapter_course_id_eeba9447_fk_xdd_course_id` FOREIGN KEY (`course_id`) REFERENCES `xdd_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_chapter
-- ----------------------------
INSERT INTO `xdd_course_chapter` VALUES (1, 1, 1, 0, '2019-08-13 07:24:21.889515', '2019-08-13 07:24:21.889542', 1, 'flask框架快速入门', 'flask框架快速入门', '2019-08-13', 1);
INSERT INTO `xdd_course_chapter` VALUES (2, 2, 1, 0, '2019-08-13 07:24:37.116231', '2019-08-15 03:59:17.598352', 2, 'flask的路由', 'flask的路由', '2019-08-13', 1);
INSERT INTO `xdd_course_chapter` VALUES (3, 3, 1, 0, '2019-08-13 07:24:51.153812', '2019-08-15 03:59:22.067057', 3, 'flask的视图', 'flask的视图', '2019-08-13', 1);
INSERT INTO `xdd_course_chapter` VALUES (4, 4, 1, 0, '2019-08-13 07:25:00.621686', '2019-08-15 03:59:29.642805', 4, 'flask的模型', 'flask的模型', '2019-08-13', 1);
INSERT INTO `xdd_course_chapter` VALUES (5, 1, 1, 0, '2019-08-13 07:24:21.889515', '2024-07-06 09:59:08.424695', 1, 'django框架快速入门', 'django框架快速入门', '2019-08-13', 15);
INSERT INTO `xdd_course_chapter` VALUES (6, 1, 1, 0, '2019-08-13 07:24:37.116231', '2024-07-06 09:59:14.294983', 2, 'django的路由', 'django的路由', '2019-08-13', 15);
INSERT INTO `xdd_course_chapter` VALUES (7, 7, 1, 0, '2019-08-13 07:24:51.153812', '2019-08-13 07:24:51.153846', 3, 'django的视图', 'django的视图', '2019-08-13', 15);
INSERT INTO `xdd_course_chapter` VALUES (8, 8, 1, 0, '2019-08-13 07:25:00.621686', '2019-08-13 07:25:00.621768', 4, 'django的模型', 'django的模型', '2019-08-13', 15);

-- ----------------------------
-- Table structure for xdd_course_discount
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_discount`;
CREATE TABLE `xdd_course_discount`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `condition` int(11) NOT NULL,
  `sale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `discount_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_discount_discount_type_id_70269aba_fk_xdd_cours`(`discount_type_id`) USING BTREE,
  CONSTRAINT `xdd_course_discount_discount_type_id_70269aba_fk_xdd_cours` FOREIGN KEY (`discount_type_id`) REFERENCES `xdd_course_discount_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_discount
-- ----------------------------
INSERT INTO `xdd_course_discount` VALUES (1, 1, 1, 0, '2019-08-19 03:30:42.064537', '2024-07-09 09:47:05.716799', 0, '', 1);
INSERT INTO `xdd_course_discount` VALUES (2, 1, 1, 0, '2019-08-19 03:31:02.636950', '2024-07-09 09:45:25.632993', 0, '*0.82', 2);
INSERT INTO `xdd_course_discount` VALUES (3, 1, 1, 0, '2019-08-19 03:31:14.827451', '2024-07-09 09:45:30.084567', 0, '*0.75', 2);
INSERT INTO `xdd_course_discount` VALUES (4, 3, 1, 0, '2019-08-19 03:32:02.323298', '2019-08-19 03:32:02.323329', 0, '-10', 3);
INSERT INTO `xdd_course_discount` VALUES (5, 1, 1, 0, '2019-08-19 03:32:25.227211', '2024-07-09 09:45:34.409413', 0, '满500-80\r\n满400-40\r\n满300-20\r\n满200-10', 4);

-- ----------------------------
-- Table structure for xdd_course_discount_type
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_discount_type`;
CREATE TABLE `xdd_course_discount_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_discount_type
-- ----------------------------
INSERT INTO `xdd_course_discount_type` VALUES (1, 1, 1, 0, '2019-08-19 03:26:43.250177', '2019-08-19 03:26:43.250209', '限时免费', '1');
INSERT INTO `xdd_course_discount_type` VALUES (2, 1, 1, 0, '2019-08-19 03:27:13.403084', '2019-08-19 03:27:13.403120', '限时折扣', '阶梯级别的折扣');
INSERT INTO `xdd_course_discount_type` VALUES (3, 3, 1, 0, '2019-08-19 03:27:20.496817', '2019-08-19 03:27:20.496854', '限时减免', NULL);
INSERT INTO `xdd_course_discount_type` VALUES (4, 4, 1, 0, '2019-08-19 03:27:29.321802', '2019-08-19 03:27:29.321834', '满减', NULL);

-- ----------------------------
-- Table structure for xdd_course_expire
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_expire`;
CREATE TABLE `xdd_course_expire`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `expire_time` int(11) NULL DEFAULT NULL,
  `expire_text` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `price` decimal(6, 2) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_expire_course_id_cd94411a_fk_xdd_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `xdd_course_expire_course_id_cd94411a_fk_xdd_course_id` FOREIGN KEY (`course_id`) REFERENCES `xdd_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_expire
-- ----------------------------
INSERT INTO `xdd_course_expire` VALUES (1, 1, 1, 0, '2019-08-19 02:05:22.368823', '2019-08-19 02:05:22.368855', 30, '一个月有效', 398.00, 1);
INSERT INTO `xdd_course_expire` VALUES (2, 1, 2, 0, '2019-08-19 02:05:37.397205', '2019-08-19 02:05:37.397233', 60, '2个月有效', 588.00, 1);
INSERT INTO `xdd_course_expire` VALUES (3, 1, 3, 0, '2019-08-19 02:05:57.029411', '2019-08-19 02:05:57.029440', 180, '半年内有效', 1000.00, 1);
INSERT INTO `xdd_course_expire` VALUES (4, 1, 4, 0, '2019-08-19 02:07:29.066617', '2019-08-19 02:08:29.156730', 3, '3天内有效', 0.88, 3);
INSERT INTO `xdd_course_expire` VALUES (5, 1, 3, 0, '2019-08-19 02:07:46.120827', '2019-08-19 02:08:18.652452', 30, '1个月有效', 188.00, 3);
INSERT INTO `xdd_course_expire` VALUES (6, 1, 3, 0, '2019-08-19 02:07:59.876421', '2019-08-19 02:07:59.876454', 60, '2个月有效', 298.00, 3);

-- ----------------------------
-- Table structure for xdd_course_lesson
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_lesson`;
CREATE TABLE `xdd_course_lesson`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `orders` smallint(5) UNSIGNED NOT NULL,
  `section_type` smallint(6) NOT NULL,
  `section_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `duration` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `chapter_id` bigint(20) NOT NULL,
  `is_show_list` tinyint(1) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `lesson` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_lesson_chapter_id_057f4aea_fk_xdd_course_chapter_id`(`chapter_id`) USING BTREE,
  INDEX `xdd_course_lesson_course_id_a50fccd2_fk_xdd_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `xdd_course_lesson_chapter_id_057f4aea_fk_xdd_course_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `xdd_course_chapter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_course_lesson_course_id_a50fccd2_fk_xdd_course_id` FOREIGN KEY (`course_id`) REFERENCES `xdd_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_lesson
-- ----------------------------
INSERT INTO `xdd_course_lesson` VALUES (1, 1, 0, '2019-08-13 07:27:06.873098', '2019-08-13 07:27:06.873149', 'flask基本介绍', 1, 0, 'http://www.baidu.com', '3:00', '2019-08-13 07:27:06.873188', 1, 1, 1, 1, 1);
INSERT INTO `xdd_course_lesson` VALUES (2, 1, 0, '2019-08-13 07:27:27.408740', '2019-08-13 07:27:27.408766', 'flask的优缺点', 2, 2, 'http://www.baidu.com', '3:30', '2019-08-13 07:27:27.408798', 1, 1, 1, 1, 2);
INSERT INTO `xdd_course_lesson` VALUES (3, 1, 0, '2019-08-13 07:27:45.659948', '2019-08-13 07:27:45.659980', 'flask的安装', 3, 2, 'http://www.baidu.com', '5:00', '2019-08-13 07:27:45.660016', 1, 1, 1, 1, 3);
INSERT INTO `xdd_course_lesson` VALUES (13, 1, 0, '2019-08-13 07:27:06.873098', '2019-08-13 07:27:06.873149', 'flask的项目搭建', 4, 2, 'http://www.baidu.com', '3:00', '2019-08-13 07:27:06.873188', 1, 1, 1, 1, 4);
INSERT INTO `xdd_course_lesson` VALUES (14, 1, 0, '2019-08-13 07:27:27.408740', '2019-08-13 07:27:27.408766', 'flask的项目基本目录结构', 5, 2, 'http://www.baidu.com', '3:30', '2019-08-13 07:27:27.408798', 1, 1, 1, 1, 5);
INSERT INTO `xdd_course_lesson` VALUES (15, 1, 0, '2019-08-13 07:27:45.659948', '2019-08-13 07:27:45.659980', 'flask的运行', 6, 2, 'http://www.baidu.com', '5:00', '2019-08-13 07:27:45.660016', 1, 1, 1, 1, 6);
INSERT INTO `xdd_course_lesson` VALUES (16, 1, 0, '2019-08-13 07:27:06.873098', '2019-08-26 12:57:10.455292', 'django基本介绍', 1, 2, '7ec57198590152fd3a647d73e218e385_7', '14:00', '2019-08-13 07:27:06.873188', 1, 5, 1, 3, 1);
INSERT INTO `xdd_course_lesson` VALUES (17, 1, 0, '2019-08-13 07:27:27.408740', '2019-08-13 07:27:27.408766', 'django的优缺点', 2, 2, 'http://www.baidu.com', '3:30', '2019-08-13 07:27:27.408798', 1, 5, 1, 3, 2);
INSERT INTO `xdd_course_lesson` VALUES (18, 1, 0, '2019-08-13 07:27:45.659948', '2019-08-14 02:13:52.517392', 'django的安装', 3, 2, 'http://www.baidu.com', '5:00', '2019-08-13 07:27:45.660016', 1, 5, 1, 3, 3);
INSERT INTO `xdd_course_lesson` VALUES (19, 1, 0, '2019-08-13 07:27:06.873098', '2019-08-13 07:27:06.873149', 'django的项目搭建', 4, 2, 'http://www.baidu.com', '3:00', '2019-08-13 07:27:06.873188', 1, 5, 1, 3, 4);
INSERT INTO `xdd_course_lesson` VALUES (20, 1, 0, '2019-08-13 07:27:27.408740', '2019-08-13 07:27:27.408766', 'django的项目基本目录结构', 5, 2, 'http://www.baidu.com', '3:30', '2019-08-13 07:27:27.408798', 1, 5, 1, 3, 5);
INSERT INTO `xdd_course_lesson` VALUES (21, 1, 0, '2019-08-13 07:27:45.659948', '2019-08-13 07:27:45.659980', 'django的运行', 6, 2, 'http://www.baidu.com', '5:00', '2019-08-13 07:27:45.660016', 1, 5, 1, 3, 6);
INSERT INTO `xdd_course_lesson` VALUES (22, 1, 0, '2019-08-15 03:50:02.221829', '2024-07-06 10:22:31.371054', '路由的分类-命名绑定参数', 1, 2, 'http://www.baidu.com', '16:00', '2019-08-15 03:50:02.221897', 1, 2, 1, 15, 1);
INSERT INTO `xdd_course_lesson` VALUES (23, 1, 0, '2024-07-06 10:22:12.657866', '2024-07-06 10:22:12.657866', '视图类的声明和使用', 1, 2, '123', '4：45', '2024-07-06 10:22:12.657866', 0, 3, 0, 1, 1);

-- ----------------------------
-- Table structure for xdd_course_price_dicount
-- ----------------------------
DROP TABLE IF EXISTS `xdd_course_price_dicount`;
CREATE TABLE `xdd_course_price_dicount`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `active_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `discount_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xdd_course_price_dicount_active_id_0e411fed_fk_xdd_activity_id`(`active_id`) USING BTREE,
  INDEX `xdd_course_price_dicount_course_id_92cdcff8_fk_xdd_course_id`(`course_id`) USING BTREE,
  INDEX `xdd_course_price_dic_discount_id_ba63a17f_fk_xdd_cours`(`discount_id`) USING BTREE,
  CONSTRAINT `xdd_course_price_dic_discount_id_ba63a17f_fk_xdd_cours` FOREIGN KEY (`discount_id`) REFERENCES `xdd_course_discount` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_course_price_dicount_active_id_0e411fed_fk_xdd_activity_id` FOREIGN KEY (`active_id`) REFERENCES `xdd_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_course_price_dicount_course_id_92cdcff8_fk_xdd_course_id` FOREIGN KEY (`course_id`) REFERENCES `xdd_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_course_price_dicount
-- ----------------------------
INSERT INTO `xdd_course_price_dicount` VALUES (1, 1, 1, 0, '2024-07-08 23:49:51.826713', '2024-07-09 01:08:56.194686', 1, 15, 4);
INSERT INTO `xdd_course_price_dicount` VALUES (2, 1, 1, 0, '2024-07-09 09:33:49.330951', '2024-07-09 09:53:18.626937', 3, 29, 3);
INSERT INTO `xdd_course_price_dicount` VALUES (3, 1, 1, 0, '2024-07-09 09:49:20.029080', '2024-07-09 09:49:24.007348', 3, 28, 3);

-- ----------------------------
-- Table structure for xdd_nav
-- ----------------------------
DROP TABLE IF EXISTS `xdd_nav`;
CREATE TABLE `xdd_nav`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `position` int(11) NOT NULL,
  `is_site` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_nav
-- ----------------------------
INSERT INTO `xdd_nav` VALUES (1, 1, 1, 0, '2024-07-01 08:03:11.677050', '2024-07-01 08:15:39.416565', '免费课', 'https://www.baidu.com/', 1, 1);
INSERT INTO `xdd_nav` VALUES (2, 1, 2, 0, '2024-07-01 08:03:24.775183', '2024-07-01 08:03:59.459579', '轻课', 'https://www.baidu.com/', 1, 0);
INSERT INTO `xdd_nav` VALUES (3, 1, 3, 0, '2024-07-01 08:04:08.397956', '2024-07-01 08:04:08.397956', '学位课', 'https://www.baidu.com/', 1, 0);
INSERT INTO `xdd_nav` VALUES (4, 1, 4, 0, '2024-07-01 08:04:20.716936', '2024-07-01 08:04:20.716936', '学多多教育', 'https://www.baidu.com/', 1, 0);
INSERT INTO `xdd_nav` VALUES (5, 1, 5, 0, '2024-07-01 08:04:48.821133', '2024-07-01 08:04:48.821133', '百度', 'https://www.baidu.com/', 2, 1);
INSERT INTO `xdd_nav` VALUES (6, 1, 6, 0, '2024-07-01 08:05:00.738063', '2024-07-01 08:05:00.738063', '关于我们', 'https://www.baidu.com/', 2, 0);

-- ----------------------------
-- Table structure for xdd_teacher
-- ----------------------------
DROP TABLE IF EXISTS `xdd_teacher`;
CREATE TABLE `xdd_teacher`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` smallint(6) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `brief` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_teacher
-- ----------------------------
INSERT INTO `xdd_teacher` VALUES (1, 1, 1, 0, '2019-08-13 07:13:01.531992', '2024-07-06 03:20:26.188717', '雨老师', 0, 'python高手', '热爱是源动力', 'teacher/7.jpg', '擅长python web 开发。');

-- ----------------------------
-- Table structure for xdd_user
-- ----------------------------
DROP TABLE IF EXISTS `xdd_user`;
CREATE TABLE `xdd_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `wxchat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_user
-- ----------------------------
INSERT INTO `xdd_user` VALUES (1, 'pbkdf2_sha256$260000$j0ZxyduxxAKulPe2DpwseA$JuS5f/E15F2Z60D8cNbk78T16QZiO7uOLrwE+Fbewew=', '2024-07-08 23:28:51.919801', 1, 'yugong', '', '', '', 1, 1, '2024-07-02 06:30:40.000000', '18138447743', 'avatar/12.jpg', 'True');
INSERT INTO `xdd_user` VALUES (2, 'pbkdf2_sha256$260000$MBGQQ7X97scHyO5pBZCq9e$YVztIC7WLXTgJrnmkx93nfn80HuFZ+KoCOVjKBEokfQ=', NULL, 0, '13602624712', '', '', '', 0, 1, '2024-07-03 06:32:55.420684', '13602624712', '', 'True');

-- ----------------------------
-- Table structure for xdd_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `xdd_user_groups`;
CREATE TABLE `xdd_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xdd_user_groups_user_id_group_id_d66119fc_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `xdd_user_groups_group_id_e26e3055_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `xdd_user_groups_group_id_e26e3055_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_user_groups_user_id_5b17ed67_fk_xdd_user_id` FOREIGN KEY (`user_id`) REFERENCES `xdd_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for xdd_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `xdd_user_user_permissions`;
CREATE TABLE `xdd_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xdd_user_user_permissions_user_id_permission_id_7fdb44ef_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `xdd_user_user_permis_permission_id_fbcb21b1_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `xdd_user_user_permis_permission_id_fbcb21b1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xdd_user_user_permissions_user_id_38df9b42_fk_xdd_user_id` FOREIGN KEY (`user_id`) REFERENCES `xdd_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xdd_user_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
