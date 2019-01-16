/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hand_todo

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-01-16 18:20:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cux_users
-- ----------------------------
DROP TABLE IF EXISTS `cux_users`;
CREATE TABLE `cux_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` char(10) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cux_users
-- ----------------------------
INSERT INTO `cux_users` VALUES ('1', 'admin', '123456', '男', '45', '15107014403', '2018-12-07 15:10:48', '2018-12-12 15:51:12', 'this is admin1');
