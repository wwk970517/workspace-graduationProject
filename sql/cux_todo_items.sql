/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hand_todo

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-01-16 18:20:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cux_todo_items
-- ----------------------------
DROP TABLE IF EXISTS `cux_todo_items`;
CREATE TABLE `cux_todo_items` (
  `todo_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `todo_item_title` varchar(250) NOT NULL,
  `todo_item_content` varchar(2000) DEFAULT NULL,
  `priority` varchar(10) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`todo_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cux_todo_items
-- ----------------------------
INSERT INTO `cux_todo_items` VALUES ('1', '1', '开始', '初始值', 'low', '2018-12-09 11:08:35', null, '‘初始值’');
INSERT INTO `cux_todo_items` VALUES ('4', '1', '事项2', '事项2的内容', 'low', '2018-12-09 22:45:20', '2018-12-12 15:45:19', '这是事项2');
INSERT INTO `cux_todo_items` VALUES ('5', '1', '事项3', '事项3的内容', 'middle', '2018-12-09 22:45:36', null, '这是事项3');
INSERT INTO `cux_todo_items` VALUES ('6', '1', '事项3', '事项3的内容', 'low', '2018-12-12 15:42:38', null, '这是事项3');
INSERT INTO `cux_todo_items` VALUES ('7', '1', '', '', 'low', '2018-12-12 15:42:51', null, '');
