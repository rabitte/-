/*
Navicat MySQL Data Transfer

Source Server         : cepo
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-24 12:43:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vote_join`
-- ----------------------------
DROP TABLE IF EXISTS `vote_join`;
CREATE TABLE `vote_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `turename` varchar(255) DEFAULT NULL COMMENT '参赛选手姓名',
  `tel` varchar(255) DEFAULT NULL COMMENT '参赛选手电话',
  `picture` varchar(255) DEFAULT NULL COMMENT '参赛选手图片',
  `slogan` text COMMENT '参赛口号',
  `score` int(255) DEFAULT NULL COMMENT '选手获得投票数',
  `status` int(255) DEFAULT '0' COMMENT '0代表未审核的1代表已审核的',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户微信id',
  `age` varchar(255) DEFAULT NULL COMMENT '参赛选手年龄',
  `address` varchar(255) DEFAULT '' COMMENT '参赛选手地址',
  `nickname` varchar(255) DEFAULT '' COMMENT '参选赛选手微信昵称',
  `numberid` varchar(255) DEFAULT NULL COMMENT '参赛选手number号',
  `Invitation_code` varchar(255) DEFAULT NULL COMMENT '个人邀请码',
  `sex` varchar(255) DEFAULT NULL COMMENT '参赛选手性别男为1女为0',
  `bonus_votenum` int(11) DEFAULT NULL COMMENT '邀请投票奖励',
  `Invitation_codeman` varchar(255) DEFAULT NULL COMMENT '邀请人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_join
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_record`
-- ----------------------------
DROP TABLE IF EXISTS `vote_record`;
CREATE TABLE `vote_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `voteopenid` varchar(255) DEFAULT NULL COMMENT '投票人appid',
  `voteedopenid` varchar(255) DEFAULT NULL COMMENT '被投人appid',
  `votetime` date DEFAULT NULL COMMENT '投票时间',
  `isbouns` int(255) DEFAULT '0' COMMENT '0是使用的普通次数，1是使用的奖励投票次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_record
-- ----------------------------
