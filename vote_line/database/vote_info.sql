/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-29 14:35:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vote_info
-- ----------------------------
DROP TABLE IF EXISTS `vote_info`;
CREATE TABLE `vote_info` (
  `joinerId` varchar(32) NOT NULL COMMENT '参赛者id',
  `nickName` varchar(64) DEFAULT NULL COMMENT '参赛者微信昵称',
  `openId` varchar(64) DEFAULT NULL COMMENT '参赛者openId',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`joinerId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vote_info
-- ----------------------------
