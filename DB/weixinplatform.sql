/*
Navicat MySQL Data Transfer

Source Server         : liwentao
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : weixinplatform

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2014-06-17 23:49:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auto_apply`
-- ----------------------------
DROP TABLE IF EXISTS `auto_apply`;
CREATE TABLE `auto_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(50) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL,
  `reply_content` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auto_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `wx_name` varchar(100) DEFAULT NULL,
  `wx_number` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `appid` varchar(200) DEFAULT NULL,
  `appkey` varchar(200) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `description` text,
  `openid` varchar(100) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户，包括系统管理员和客户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(20) DEFAULT NULL,
  `menu_type` int(11) DEFAULT NULL,
  `menu_url` text,
  `menu_key` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `reply_type` int(11) DEFAULT NULL,
  `reply_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_message`
-- ----------------------------
DROP TABLE IF EXISTS `wx_message`;
CREATE TABLE `wx_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_title` varchar(50) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `msg_content` text,
  `msg_url` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  `main_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_message
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  `nick_name` text,
  `sex` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `head_img_url` text,
  `subscribe_time` datetime DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_group`;
CREATE TABLE `wx_user_group` (
  `id` int(11) NOT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  `group_name` varchar(10) DEFAULT NULL,
  `wx_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_group
-- ----------------------------
