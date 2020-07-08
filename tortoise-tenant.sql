/*
Navicat MySQL Data Transfer

Source Server         : 10.124.132.49
Source Server Version : 50642
Source Host           : 10.124.132.49:3306
Source Database       : tortoise-tenant-st

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2020-07-06 17:20:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(64) NOT NULL,
  `department_name` varchar(64) NOT NULL,
  `department_desc` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for err_log
-- ----------------------------
DROP TABLE IF EXISTS `err_log`;
CREATE TABLE `err_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `err_info` text NOT NULL COMMENT '错误信息',
  `server_name` varchar(128) DEFAULT NULL,
  `request_url` varchar(128) DEFAULT NULL,
  `query_args` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(64) NOT NULL,
  `permission_tag` varchar(64) NOT NULL,
  `permission_desc` varchar(255) DEFAULT NULL,
  `permission_type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '管理员', 'ADMIN', '系统管理员', 'Tortoise系统权限', '2020-05-05 13:39:33', '2020-05-05 13:39:38');
INSERT INTO `permission` VALUES ('2', '租户', 'TENANT', '租户基本权限', 'Tortoise系统权限', '2020-05-12 16:58:44', '2020-05-12 16:58:47');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(64) NOT NULL,
  `role_name` varchar(64) NOT NULL,
  `role_tag` varchar(64) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_type` varchar(64) DEFAULT NULL,
  `permissions` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '781ad5d4c3f544ea8508e7371b4ce154', '管理员', 'admin', 'tortoise系统管理员角色', 'Tortoise系统管理员角色', '1', '2020-05-05 11:29:26', '2020-05-05 11:29:28');
INSERT INTO `role` VALUES ('2', '781ad5d4c3f544ea8508e7371b4ce154', '租户', 'tenant', 'tortoise系统租户角色', 'Tortoise系统租户角色', '2', '2020-05-19 08:36:54', '2020-05-19 08:36:56');

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` varchar(64) NOT NULL,
  `tenant_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `company` varchar(64) DEFAULT NULL,
  `roles` varchar(64) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `head_url` varchar(255) DEFAULT NULL,
  `custom_info` text,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES ('781ad5d4c3f544ea8508e7371b4ce154', 'tortoise', 'awl/VrVsF0ZQcgxbdqloxw==', 'null', '1342685000@qq.com', 'Fii', '1', '1', '/file/responseImg?fileName=tenant_head.jpg', 'cscs', '2020-05-13 16:09:39', '2020-07-02 08:57:17');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` varchar(64) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `company` varchar(64) NOT NULL,
  `department_id` int(4) NOT NULL,
  `duty` varchar(64) DEFAULT NULL,
  `roles` varchar(64) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `head_url` varchar(255) DEFAULT NULL,
  `custom_info` text,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;