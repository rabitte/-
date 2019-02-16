/*
Navicat MySQL Data Transfer

Source Server         : cepo
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-30 10:05:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `joiner_info`
-- ----------------------------
DROP TABLE IF EXISTS `joiner_info`;
CREATE TABLE `joiner_info` (
  `joinerId` varchar(32) NOT NULL COMMENT '参赛者id',
  `nickName` varchar(64) DEFAULT NULL COMMENT '参赛者微信昵称',
  `openId` varchar(64) DEFAULT NULL COMMENT '参赛者openId',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`joinerId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of joiner_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` varchar(32) NOT NULL COMMENT '管理员账号id',
  `adminAccount` varchar(128) NOT NULL COMMENT '管理员账号',
  `adminPwd` varchar(255) NOT NULL COMMENT '管理员密码',
  `adminStatus` tinyint(2) NOT NULL DEFAULT '0' COMMENT '管理员状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_info`
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
  `ischeck` int(11) DEFAULT '0' COMMENT '0代表没有审核，1代表已经审核过',
  `Invitation_times` int(11) DEFAULT '0' COMMENT '邀请成功次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_join
-- ----------------------------
INSERT INTO `vote_join` VALUES ('12', '陆逊', '18376677172', '/picture/886471543460340df48c22b321a2a2a6a7bf62e48e729ba.jpeg', '漓江的山水享誉全国，桂林是山水融合的最高境界，是仙人的完美杰作，而阳朔徜徉在水墨丹青之中，是自然与青春的跳跃，是尼克松也会留恋的地方，是《国家地理》都称赞的地方，也是一个人一生中必去一次的地方。听说，这里的山水会讲故事...', '6', '1', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '0~20', '广西桂林市', 'z.', 'E290022', 'E0022', '1', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('11', '王宁', '15697731663', '/picture/219571543460092ad27341240fa91ef6beda1b066fc39d2.jpeg', '灭霸（Thanos）是美国漫威旗下超级反派，初次登场于《钢铁侠》（Iron Man）第55期（1973年1月）。本名萨诺斯（Thanos），是出生在土星卫星泰坦上的永恒一族，他实力强劲，也是漫威宇宙中最强大的人之一。对对对', '11', '1', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '20~30', '泰坦之月-永恒之族的殖民地', 'Ning', 'Q292912', 'Q2912', '1', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('19', '黄当', '18789126384', '/picture/433601543463023e00709e3b19dc517d8bffafddd3b73ad.jpeg', '我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员我是少先队员', '10', '1', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '20~30', '海南省澄迈老城', 'M大王叫我去巡山', 'E294501', 'E4501', '1', '0', 'Jhg56', '0', '0');
INSERT INTO `vote_join` VALUES ('13', '马马马', '18777777777', '/picture/701871543460449da4e4f822254faaa1fce3b6a4a63ae3d.jpeg', '1q d f g h t j s ji sje hdi k s jeh j sisn eju s jd je j d j f ke jd f', '2', '1', 'oqqot00tqJlvsKzaYFsn_YPxoG24', '0~20', '1', '灵之来兮如云', 'N290113', 'N0113', '1', '0', '12345', '0', '0');
INSERT INTO `vote_join` VALUES ('14', '李云婷', '18249990320', '/picture/3657215434602671118ba5928066ddcb00de53d465db7df.jpg', 'boy meet girl laaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '6', '1', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '20~30', '兵库县神户市', '走走_婷婷', 'Q290142', 'Q0142', '0', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('9', '赵科', '17671778545', '/picture/1768915432013692211968eeb49747e3f574aa5c99e2297.jpg', '噶事噶事嘎嘎嘎嘎发覅急哦i哈gig爱过iu高度分散开来尴尬的身份的事公司丢给好似欧冠和soighi上的广告萨嘎说过', '25', '1', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '0~20', '发几幅骄傲分', '十二楼五城', 'M26110313', 'YQM26110313', '1', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('15', '王当当', '18368890179', '/picture/4398015434603222d5eafe27b903518c5c144f97d22e2dd.jpeg', '南宁动物园位于南宁市大学东路73号，始建于1973年，1975年建成正式对外开放，总面积39.1公顷，每年接待国内外游客100多万人（次），是广西目前唯一一家以观赏野生动物为主，并对野生动物进行异地保护、饲养管理、科学研究、繁育的专业性大型动物园。南宁市动物园是国内又一家成为AAAA级旅游景区的城市动物园，是全国一流的城市动物园。\n2017年11月，南宁动物园获第五届全国文明单位荣誉。', '39', '1', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '20~30', '广西南宁动物园', '當當不脫鞋', 'J290232', 'J0232', '0', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('16', '老王', '13397775009', '/picture/183751543460476d47c78818270c631215143fac082fdea.jpg', '夕阳西下，断肠人在天涯。五十字太多。不要限制字数。字数太多，会阻止用户参与。放眼市场，除了布置作业，没有商家会要求用户上传字数。终于凑够50个字了', '9', '1', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '20~30', '广西省南宁市南湖公园', 'Leo', 'Y290428', 'Y0428', '1', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('17', '零海洲', '15680425021', '/picture/7368915434616802a7ff64d22fcf848ff7badb194d3c60d.jpeg', '贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉贝拉', '2', '1', 'oqqot06NkP479-h3hF5SoXMWSMYg', '20~30', '南宁市横县横州镇槎江路83号', 'Z、', 'Y292300', 'Y2300', '1', '0', 'Q0142', '0', '0');
INSERT INTO `vote_join` VALUES ('18', '谢谢', '13518037590', '/picture/19019154346191196a1ec3476fe2b643925e487d2cff37d.jpg', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0', '0', 'oqqot01QFUCRWLSNKw9e1B_YSrdE', '0~20', '海南海口', 'xw', 'Z292606', 'Z2606', '1', '0', '', '0', '0');
INSERT INTO `vote_join` VALUES ('20', '六爷', '18800990000', '/picture/8735915434952927081dfcd43a38527450faa7fa1d15adb.png', '阿弥陀佛诶弥陀佛诶弥陀佛阿弥陀佛', '0', '0', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', '100~120', '丰泽soho', '六哥', 'S29204207', 'S4207', '1', '0', 'Y0428', '0', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_record
-- ----------------------------
INSERT INTO `vote_record` VALUES ('1', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('2', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('3', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('4', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('5', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('6', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('7', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('8', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('9', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('10', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('11', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('12', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('13', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0_fxh7U33i24RQZRcWuGSqI', '2018-11-26', '1');
INSERT INTO `vote_record` VALUES ('14', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('15', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('16', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('17', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot0_fxh7U33i24RQZRcWuGSqI', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('18', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot0_fxh7U33i24RQZRcWuGSqI', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('19', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot0_fxh7U33i24RQZRcWuGSqI', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('20', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('21', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('22', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('23', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('24', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-26', '0');
INSERT INTO `vote_record` VALUES ('25', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '1');
INSERT INTO `vote_record` VALUES ('26', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('27', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('28', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot09tJGOU1HlDicIbSI3hIl1g', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('29', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('30', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('31', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('32', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('33', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('34', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('35', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('36', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('37', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('38', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('39', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('40', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('41', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('42', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('43', 'oqqot0xQT9nMWq3TfofJblWOIZu4', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-27', '0');
INSERT INTO `vote_record` VALUES ('44', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('45', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('46', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('47', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('48', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('49', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-28', '0');
INSERT INTO `vote_record` VALUES ('50', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('51', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('52', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('53', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('54', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('55', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('56', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('57', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('58', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('59', 'oqqot009Fc20Bl_H2AES1DL9vJvg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('60', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('61', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('62', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('63', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('64', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('65', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('66', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('67', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('68', 'oqqot05MQTfZXAKo8A-P3aTxXm4Q', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('69', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot00tqJlvsKzaYFsn_YPxoG24', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('70', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot00tqJlvsKzaYFsn_YPxoG24', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('71', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('72', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('73', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('74', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('75', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('76', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', 'oqqot02i-6jbaNtuZ4_jh9ecFfoo', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('77', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('78', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('79', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('80', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('81', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('82', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('83', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('84', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('85', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('86', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('87', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('88', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('89', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('90', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('91', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('92', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('93', 'oqqot0-l01dTZQDa_vabxqgbl2cg', 'oqqot0-l01dTZQDa_vabxqgbl2cg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('94', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('95', 'oqqot00tqJlvsKzaYFsn_YPxoG24', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('96', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('97', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('98', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('99', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('100', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('101', 'oqqot06NkP479-h3hF5SoXMWSMYg', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('102', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('103', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('104', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('105', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('106', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('107', 'oqqot06VbvWH6u6AbBDqwK-LcOZM', 'oqqot0zvoEK0VeEauOq0yEdKBQIg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('108', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('109', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('110', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('111', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('112', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('113', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('114', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('115', 'oqqot07_GINdma68ZUR-RkmlcziI', 'oqqot06NkP479-h3hF5SoXMWSMYg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('116', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('117', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('118', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('119', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('120', 'oqqot0zYJRxI6ASAmaGiqFjuo48o', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('121', 'oqqot0wcXZWApbx7QFIlavqf7RB4', 'oqqot06NkP479-h3hF5SoXMWSMYg', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('122', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('123', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('124', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('125', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('126', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('127', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('128', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('129', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('130', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('131', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('132', 'oqqot0zNR7dvuN2cZU3C7LLjIl4Q', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('133', 'oqqot0z1Q8ZIR99BPmKFRRDkc0dE', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('134', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('135', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('136', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('137', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('138', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('139', 'oqqot0-jTB-pec1kHkDxSDF_t5Sw', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('140', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('141', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('142', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('143', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('144', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('145', 'oqqot0y734kc-RrXZgn38kWZco_M', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('146', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('147', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot0xQT9nMWq3TfofJblWOIZu4', '2018-11-29', '0');
INSERT INTO `vote_record` VALUES ('148', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('149', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('150', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('151', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('152', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('153', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('154', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot0y11fMeYEEcyZsTAxRjt3hs', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('155', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('156', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('157', 'oqqot03pOh2CRJzwIImoI3ysmjOA', 'oqqot03pOh2CRJzwIImoI3ysmjOA', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('158', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-30', '0');
INSERT INTO `vote_record` VALUES ('159', 'oqqot0_fxh7U33i24RQZRcWuGSqI', 'oqqot009Fc20Bl_H2AES1DL9vJvg', '2018-11-30', '0');

-- ----------------------------
-- Table structure for `vote_user`
-- ----------------------------
DROP TABLE IF EXISTS `vote_user`;
CREATE TABLE `vote_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `password` varchar(255) NOT NULL COMMENT '密码md()',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_user
-- ----------------------------
INSERT INTO `vote_user` VALUES ('1', 'zk', '383eafdd5d7d6221612fe7e10cf703f0');
