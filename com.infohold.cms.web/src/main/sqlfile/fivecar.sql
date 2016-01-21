/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : fivecar

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-01-21 21:51:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
CREATE TABLE `auth_menu` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PID` varchar(32) DEFAULT NULL,
  `URL` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES ('001', '权限管理', '0', '#');
INSERT INTO `auth_menu` VALUES ('001001', '角色管理', '001', 'role_getList.do');
INSERT INTO `auth_menu` VALUES ('001002', '用户管理', '001', 'user_getList.do');
INSERT INTO `auth_menu` VALUES ('001003', '机构管理', '001', 'organization_getList.do');
INSERT INTO `auth_menu` VALUES ('010', 'APP管理', '0', '#');
INSERT INTO `auth_menu` VALUES ('010001', '版本管理', '010', 'version.do?type=ebank');
INSERT INTO `auth_menu` VALUES ('010002', '首页广告图片管理', '010', 'picture.do');
INSERT INTO `auth_menu` VALUES ('010003', '首页行业资讯', '010', 'entry.do?usefo=12');
INSERT INTO `auth_menu` VALUES ('010004', '首页优惠信息', '010', 'entry.do?usefo=22');
INSERT INTO `auth_menu` VALUES ('010005', '首页汽车生活', '010', 'entry.do?usefo=32');
INSERT INTO `auth_menu` VALUES ('010006', '图文资源管理', '010', 'resources.do');
INSERT INTO `auth_menu` VALUES ('011', '4S店管理', '0', '#');
INSERT INTO `auth_menu` VALUES ('011001', '品牌管理', '011', 'brand.do');
INSERT INTO `auth_menu` VALUES ('011002', '车辆信息管理', '011', 'vehicle.do');
INSERT INTO `auth_menu` VALUES ('011003', '4s店信息管理', '011', 'dealer.do');
INSERT INTO `auth_menu` VALUES ('011004', '4s店销售员管理', '011', 'sales.do');
INSERT INTO `auth_menu` VALUES ('011005', '4s店车型管理', '011', 'model.do');
INSERT INTO `auth_menu` VALUES ('012', '平行进口车管理', '0', '#');
INSERT INTO `auth_menu` VALUES ('012001', '品牌管理', '012', '123');
INSERT INTO `auth_menu` VALUES ('110', '公告与留言', '0', '#');
INSERT INTO `auth_menu` VALUES ('110001', '公告与新闻', '110', 'business_newsReportList.do?tradeCode=T10226');
INSERT INTO `auth_menu` VALUES ('110002', '留言和回复', '110', 'business_replyContentList.do?tradeCode=T10231');

-- ----------------------------
-- Table structure for auth_menu_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu_copy`;
CREATE TABLE `auth_menu_copy` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PID` varchar(32) DEFAULT NULL,
  `URL` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_menu_copy
-- ----------------------------
INSERT INTO `auth_menu_copy` VALUES ('001', '权限管理', '0', '#');
INSERT INTO `auth_menu_copy` VALUES ('001001', '角色管理', '001', 'role_getList.do');
INSERT INTO `auth_menu_copy` VALUES ('001002', '用户管理', '001', 'user_getList.do');
INSERT INTO `auth_menu_copy` VALUES ('001003', '机构管理', '001', 'organization_getList.do');
INSERT INTO `auth_menu_copy` VALUES ('010', '直销银行管理', '0', '#');
INSERT INTO `auth_menu_copy` VALUES ('010001', '版本管理', '010', 'version.do?type=ebank');
INSERT INTO `auth_menu_copy` VALUES ('010002', '首页广告图片管理', '010', '2222');
INSERT INTO `auth_menu_copy` VALUES ('010003', '首页公告管理', '010', '3333');
INSERT INTO `auth_menu_copy` VALUES ('011', '融资平台管理', '0', '#');
INSERT INTO `auth_menu_copy` VALUES ('011001', '版本管理', '011', 'version.do?type=tfsp');
INSERT INTO `auth_menu_copy` VALUES ('011002', '首页广告图片管理', '011', '2222');
INSERT INTO `auth_menu_copy` VALUES ('011003', '首页公告管理', '011', '3333');
INSERT INTO `auth_menu_copy` VALUES ('110', '公告与留言', '0', '#');
INSERT INTO `auth_menu_copy` VALUES ('110001', '公告与新闻', '110', 'business_newsReportList.do?tradeCode=T10226');
INSERT INTO `auth_menu_copy` VALUES ('110002', '留言和回复', '110', 'business_replyContentList.do?tradeCode=T10231');

-- ----------------------------
-- Table structure for auth_organization
-- ----------------------------
DROP TABLE IF EXISTS `auth_organization`;
CREATE TABLE `auth_organization` (
  `ID` varchar(32) NOT NULL COMMENT '机构ID',
  `PID` varchar(32) DEFAULT NULL COMMENT '父机构id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '机构名称',
  `orgid` varchar(32) DEFAULT NULL COMMENT '机构编号',
  `orgtype` varchar(2) DEFAULT NULL COMMENT '机构等级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_organization
-- ----------------------------
INSERT INTO `auth_organization` VALUES ('001', '#', '管理中心', '9999', '1');

-- ----------------------------
-- Table structure for auth_organization_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_organization_copy`;
CREATE TABLE `auth_organization_copy` (
  `ID` varchar(32) NOT NULL COMMENT '机构ID',
  `PID` varchar(32) DEFAULT NULL COMMENT '父机构id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '机构名称',
  `orgid` varchar(32) DEFAULT NULL COMMENT '机构编号',
  `orgtype` varchar(2) DEFAULT NULL COMMENT '机构等级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_organization_copy
-- ----------------------------
INSERT INTO `auth_organization_copy` VALUES ('001', '#', '管理中心', '9999', '1');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `role_type` varchar(16) DEFAULT NULL COMMENT '角色类型。1运营中心；2担保公司',
  `role_code` varchar(16) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', '管理员', '1', '9999');
INSERT INTO `auth_role` VALUES ('90000005', '平心进口车管理员', '1', '90000004');
INSERT INTO `auth_role` VALUES ('90000007', 'ssss管理员', '1', '90000006');

-- ----------------------------
-- Table structure for auth_role_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_copy`;
CREATE TABLE `auth_role_copy` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `role_type` varchar(16) DEFAULT NULL COMMENT '角色类型。1运营中心；2担保公司',
  `role_code` varchar(16) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_copy
-- ----------------------------
INSERT INTO `auth_role_copy` VALUES ('1', '管理员', '1', '9999');
INSERT INTO `auth_role_copy` VALUES ('90000005', '直销银行管理员', '1', '90000004');
INSERT INTO `auth_role_copy` VALUES ('90000007', '融资平台管理员', '1', '90000006');

-- ----------------------------
-- Table structure for auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu`;
CREATE TABLE `auth_role_menu` (
  `ROLEID` varchar(32) NOT NULL,
  `MENUID` varchar(32) NOT NULL,
  PRIMARY KEY (`ROLEID`,`MENUID`),
  KEY `FK4B980DB1B4B5992E` (`MENUID`),
  KEY `FK4B980DB12FBF185C` (`ROLEID`),
  CONSTRAINT `FK4B980DB12FBF185C` FOREIGN KEY (`ROLEID`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FK4B980DB1B4B5992E` FOREIGN KEY (`MENUID`) REFERENCES `auth_menu` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_menu
-- ----------------------------
INSERT INTO `auth_role_menu` VALUES ('1', '001');
INSERT INTO `auth_role_menu` VALUES ('1', '001001');
INSERT INTO `auth_role_menu` VALUES ('1', '001002');
INSERT INTO `auth_role_menu` VALUES ('1', '001003');
INSERT INTO `auth_role_menu` VALUES ('1', '010');
INSERT INTO `auth_role_menu` VALUES ('90000005', '010');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010');
INSERT INTO `auth_role_menu` VALUES ('1', '010001');
INSERT INTO `auth_role_menu` VALUES ('90000005', '010001');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010001');
INSERT INTO `auth_role_menu` VALUES ('1', '010002');
INSERT INTO `auth_role_menu` VALUES ('90000005', '010002');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010002');
INSERT INTO `auth_role_menu` VALUES ('1', '010003');
INSERT INTO `auth_role_menu` VALUES ('90000005', '010003');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010003');
INSERT INTO `auth_role_menu` VALUES ('1', '010004');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010004');
INSERT INTO `auth_role_menu` VALUES ('1', '010005');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010005');
INSERT INTO `auth_role_menu` VALUES ('90000007', '010006');
INSERT INTO `auth_role_menu` VALUES ('1', '011');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011');
INSERT INTO `auth_role_menu` VALUES ('1', '011001');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011001');
INSERT INTO `auth_role_menu` VALUES ('1', '011002');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011002');
INSERT INTO `auth_role_menu` VALUES ('1', '011003');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011003');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011004');
INSERT INTO `auth_role_menu` VALUES ('90000007', '011005');
INSERT INTO `auth_role_menu` VALUES ('90000007', '012');
INSERT INTO `auth_role_menu` VALUES ('90000007', '012001');
INSERT INTO `auth_role_menu` VALUES ('1', '110');
INSERT INTO `auth_role_menu` VALUES ('90000005', '110');
INSERT INTO `auth_role_menu` VALUES ('90000007', '110');
INSERT INTO `auth_role_menu` VALUES ('1', '110001');
INSERT INTO `auth_role_menu` VALUES ('90000005', '110001');
INSERT INTO `auth_role_menu` VALUES ('90000007', '110001');
INSERT INTO `auth_role_menu` VALUES ('1', '110002');
INSERT INTO `auth_role_menu` VALUES ('90000005', '110002');
INSERT INTO `auth_role_menu` VALUES ('90000007', '110002');

-- ----------------------------
-- Table structure for auth_role_menu_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_copy`;
CREATE TABLE `auth_role_menu_copy` (
  `ROLEID` varchar(32) NOT NULL,
  `MENUID` varchar(32) NOT NULL,
  PRIMARY KEY (`ROLEID`,`MENUID`),
  KEY `FK4B980DB1B4B5992E` (`MENUID`),
  KEY `FK4B980DB12FBF185C` (`ROLEID`),
  CONSTRAINT `auth_role_menu_copy_ibfk_1` FOREIGN KEY (`ROLEID`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `auth_role_menu_copy_ibfk_2` FOREIGN KEY (`MENUID`) REFERENCES `auth_menu` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_menu_copy
-- ----------------------------
INSERT INTO `auth_role_menu_copy` VALUES ('1', '001');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '001001');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '001002');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '001003');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '010');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '010');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '010001');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '010001');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '010002');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '010002');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '010003');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '010003');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '011');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '011001');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '011002');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '011003');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '110');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '110');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '110');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '110001');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '110001');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '110001');
INSERT INTO `auth_role_menu_copy` VALUES ('1', '110002');
INSERT INTO `auth_role_menu_copy` VALUES ('90000005', '110002');
INSERT INTO `auth_role_menu_copy` VALUES ('90000007', '110002');

-- ----------------------------
-- Table structure for auth_role_menu_privilege
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_privilege`;
CREATE TABLE `auth_role_menu_privilege` (
  `ROLEID` varchar(32) NOT NULL,
  `PRIVILEGEID` varchar(32) NOT NULL,
  `MENUID` varchar(32) NOT NULL,
  PRIMARY KEY (`ROLEID`,`PRIVILEGEID`,`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_menu_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `userId` varchar(32) NOT NULL,
  `loginId` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `organizationid` varchar(32) DEFAULT NULL,
  `type` char(1) DEFAULT '0' COMMENT '用户类型：0 运营中心  1贷款公司',
  `status` varchar(16) DEFAULT '0' COMMENT '状态  1：在线  0：离线  2：停用',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `auth_user_loginId_uni` (`loginId`),
  KEY `FK57141002402A02D6` (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', '管理员（勿删）', '670b14728ad9902aecba32e22fa4f6bd', '9999', '0', '0');
INSERT INTO `auth_user` VALUES ('90000002', '1001', '付文宇', 'e99a18c428cb38d5f260853678922e03', '9999', '0', '1');
INSERT INTO `auth_user` VALUES ('90000003', '1002', '张珂', '670b14728ad9902aecba32e22fa4f6bd', '9999', '0', '0');
INSERT INTO `auth_user` VALUES ('90000102', '1003', '王刚1', '68df9114bfecdf2eb8e0e0e4181fe281', '9999', '0', '2');
INSERT INTO `auth_user` VALUES ('90001202', '1005', 'sdf ', '68df9114bfecdf2eb8e0e0e4181fe281', '', '0', '2');
INSERT INTO `auth_user` VALUES ('90002603', '1006', 'lxg', '670b14728ad9902aecba32e22fa4f6bd', '9999', '0', '1');

-- ----------------------------
-- Table structure for auth_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_copy`;
CREATE TABLE `auth_user_copy` (
  `userId` varchar(32) NOT NULL,
  `loginId` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `organizationid` varchar(32) DEFAULT NULL,
  `type` char(1) DEFAULT '0' COMMENT '用户类型：0 运营中心  1贷款公司',
  `status` varchar(16) DEFAULT '0' COMMENT '状态  1：在线  0：离线  2：停用',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `auth_user_loginId_uni` (`loginId`),
  KEY `FK57141002402A02D6` (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_copy
-- ----------------------------
INSERT INTO `auth_user_copy` VALUES ('1', 'admin', '管理员（勿删）', '670b14728ad9902aecba32e22fa4f6bd', '9999', '0', '0');
INSERT INTO `auth_user_copy` VALUES ('90000002', '1001', '王刚', '68df9114bfecdf2eb8e0e0e4181fe281', '9999', '0', '1');
INSERT INTO `auth_user_copy` VALUES ('90000003', '1002', '张珂', '68df9114bfecdf2eb8e0e0e4181fe281', '9999', '0', '0');
INSERT INTO `auth_user_copy` VALUES ('90000102', '1003', '王刚1', '68df9114bfecdf2eb8e0e0e4181fe281', '9999', '0', '2');
INSERT INTO `auth_user_copy` VALUES ('90001202', '1005', 'sdf ', '68df9114bfecdf2eb8e0e0e4181fe281', '', '0', '2');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `USERID` varchar(32) NOT NULL,
  `ROLEID` varchar(32) NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`),
  KEY `FK4BCFDA932FBF185C` (`ROLEID`),
  KEY `FK4BCFDA933B89DA06` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('1', '1');
INSERT INTO `auth_user_role` VALUES ('90000002', '90000005');
INSERT INTO `auth_user_role` VALUES ('90000003', '90000005');
INSERT INTO `auth_user_role` VALUES ('90002603', '90000005');
INSERT INTO `auth_user_role` VALUES ('90000002', '90000007');
INSERT INTO `auth_user_role` VALUES ('90000003', '90000007');
INSERT INTO `auth_user_role` VALUES ('90002603', '90000007');

-- ----------------------------
-- Table structure for auth_user_role_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role_copy`;
CREATE TABLE `auth_user_role_copy` (
  `USERID` varchar(32) NOT NULL,
  `ROLEID` varchar(32) NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`),
  KEY `FK4BCFDA932FBF185C` (`ROLEID`),
  KEY `FK4BCFDA933B89DA06` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role_copy
-- ----------------------------
INSERT INTO `auth_user_role_copy` VALUES ('1', '1');
INSERT INTO `auth_user_role_copy` VALUES ('90000002', '1');
INSERT INTO `auth_user_role_copy` VALUES ('90000003', '1');
INSERT INTO `auth_user_role_copy` VALUES ('90000002', '90000005');
INSERT INTO `auth_user_role_copy` VALUES ('90000002', '90000007');

-- ----------------------------
-- Table structure for auth_version
-- ----------------------------
DROP TABLE IF EXISTS `auth_version`;
CREATE TABLE `auth_version` (
  `version_id` varchar(8) NOT NULL,
  `version_no` varchar(8) NOT NULL,
  `version_desc` varchar(256) NOT NULL,
  `version_addr` varchar(128) NOT NULL,
  `version_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version_flag` varchar(8) NOT NULL,
  `version_rsv1` varchar(64) DEFAULT NULL,
  `version_rsv2` varchar(64) DEFAULT NULL,
  `version_rsv3` varchar(64) DEFAULT NULL,
  `version_rsv4` varchar(64) DEFAULT NULL,
  `version_rsv5` varchar(64) DEFAULT NULL,
  `version_online` varchar(1) DEFAULT NULL,
  `version_url` longtext,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_version
-- ----------------------------
INSERT INTO `auth_version` VALUES ('90002512', '1.0.0', 'FirstBlood', '4地方', '2015-12-09 22:51:57', 'Android', null, null, null, null, null, 'Y', 'localhost');
INSERT INTO `auth_version` VALUES ('90002513', '1.0.1', 'FirstBlood', '1', '2015-12-24 21:25:56', 'IOS', null, null, null, null, null, 'Y', 'localhost');

-- ----------------------------
-- Table structure for auth_version_copy
-- ----------------------------
DROP TABLE IF EXISTS `auth_version_copy`;
CREATE TABLE `auth_version_copy` (
  `version_id` varchar(8) NOT NULL,
  `version_no` varchar(8) NOT NULL,
  `version_desc` varchar(256) NOT NULL,
  `version_addr` varchar(128) NOT NULL,
  `version_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version_flag` varchar(2) NOT NULL,
  `version_rsv1` varchar(64) DEFAULT NULL,
  `version_rsv2` varchar(64) DEFAULT NULL,
  `version_rsv3` varchar(64) DEFAULT NULL,
  `version_rsv4` varchar(64) DEFAULT NULL,
  `version_rsv5` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_version_copy
-- ----------------------------
INSERT INTO `auth_version_copy` VALUES ('00000001', '1.0.0', '直销银行Android基础版本', 'http://http://www.google.com/', '2015-08-15 11:07:00', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('00000002', '1.0.0', '直销银行iphone基础版本', 'com.infohold.cms.web/mvc/homePage.do', '2015-08-15 12:31:00', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('00000003', '1.0.0', '融资平台Android基础版本', 'http://10.178.25.123/web', '2015-08-25 11:00:00', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('00000004', '1.0.0', '融资凭他iphone基础版本', 'http://192.168.1.102/web', '2015-08-25 10:53:13', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90001302', '1.3.0', '修改照相机等缺陷版本', 'http://10.172.36.213/weg', '2015-08-24 16:43:48', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002202', '2', '2', '2', '2015-09-22 11:29:35', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002203', '2', '2', '2', '2015-09-22 11:29:39', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002204', '2', '2', '2', '2015-09-22 11:29:44', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002205', '2', '2', '2', '2015-09-22 11:29:57', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002402', '飞', '飞', '飞飞', '2015-09-22 14:40:40', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002403', '飞', '个', '个', '2015-09-22 14:40:54', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002502', '的', '的', '的', '2015-09-22 14:56:56', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002503', '的', '的', '大大大', '2015-09-22 14:57:05', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002504', '飞', '飞', '大大大大', '2015-09-22 15:00:03', '1', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002505', '大的的', '地对地导弹', '顶顶顶顶顶顶顶', '2015-09-22 15:07:11', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002510', '的', '的', '的', '2015-09-22 15:13:51', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002512', '4', '4', '4地方', '2015-09-22 15:17:15', '0', null, null, null, null, null);
INSERT INTO `auth_version_copy` VALUES ('90002513', '1', '1', '1', '2015-09-22 15:15:06', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for biz_attachment_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_attachment_info`;
CREATE TABLE `biz_attachment_info` (
  `att_id` varchar(255) NOT NULL,
  `att_blob` longblob,
  `att_name` varchar(255) DEFAULT NULL,
  `att_size` bigint(20) DEFAULT NULL,
  `att_suffix` varchar(255) DEFAULT NULL,
  `biz_id` int(11) DEFAULT NULL,
  `biz_type` int(11) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_attachment_info
-- ----------------------------

-- ----------------------------
-- Table structure for biz_exception
-- ----------------------------
DROP TABLE IF EXISTS `biz_exception`;
CREATE TABLE `biz_exception` (
  `exp_id` int(11) NOT NULL,
  `biz_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `exp_code` varchar(32) DEFAULT NULL,
  `exp_msg` longtext,
  `oper_id` int(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `trade_code` varchar(11) DEFAULT NULL,
  `trade_name` varchar(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_exception
-- ----------------------------

-- ----------------------------
-- Table structure for biz_send
-- ----------------------------
DROP TABLE IF EXISTS `biz_send`;
CREATE TABLE `biz_send` (
  `flow_no` varchar(128) NOT NULL,
  `biz_id` varchar(128) DEFAULT NULL,
  `branch_no` varchar(32) DEFAULT NULL,
  `cust_manager` varchar(64) DEFAULT NULL,
  `err_msg` longtext,
  `group_id` varchar(64) DEFAULT NULL,
  `ps` longtext,
  `sendTime` varchar(32) DEFAULT NULL,
  `send_status` varchar(8) DEFAULT NULL,
  `sq_no` varchar(4) DEFAULT NULL,
  `tradeCode` varchar(128) DEFAULT NULL,
  `tradeName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`flow_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_send
-- ----------------------------

-- ----------------------------
-- Table structure for fc_account
-- ----------------------------
DROP TABLE IF EXISTS `fc_account`;
CREATE TABLE `fc_account` (
  `account_id` varchar(255) NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_account
-- ----------------------------

-- ----------------------------
-- Table structure for fc_app_resources
-- ----------------------------
DROP TABLE IF EXISTS `fc_app_resources`;
CREATE TABLE `fc_app_resources` (
  `ID` varchar(36) NOT NULL,
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `resource` longtext,
  `resourceName` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_app_resources
-- ----------------------------
INSERT INTO `fc_app_resources` VALUES ('402881ec520cd8bf01520ceb1cb90000', '2016-01-06 21:45:47', '付文宇', '<p>123</p><p><img src=\"/com.fivecar.cms.web/upload/image/20160106/1452087945937088075.jpg\" title=\"1452087945937088075.jpg\" alt=\"11.jpg\"/></p>', '123', '321');
INSERT INTO `fc_app_resources` VALUES ('40289ea852160b4a0152160d4cc50000', '2016-01-06 16:28:36', '付文宇', '<p>这里写你的初始化内容<img src=\"/com.fivecar.cms.web/upload/image/20160106/1452068904203033069.jpg\" title=\"1452068904203033069.jpg\" alt=\"11.jpg\"/></p>', '123', '321');

-- ----------------------------
-- Table structure for fc_app_user
-- ----------------------------
DROP TABLE IF EXISTS `fc_app_user`;
CREATE TABLE `fc_app_user` (
  `ID` varchar(36) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `id_no` varchar(18) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_addr` varchar(64) DEFAULT NULL,
  `user_addradd` varchar(64) DEFAULT NULL,
  `user_answer1` varchar(64) DEFAULT NULL,
  `user_answer2` varchar(64) DEFAULT NULL,
  `user_answer3` varchar(64) DEFAULT NULL,
  `user_ask1` varchar(64) DEFAULT NULL,
  `user_ask2` varchar(64) DEFAULT NULL,
  `user_ask3` varchar(64) DEFAULT NULL,
  `user_desc` varchar(64) DEFAULT NULL,
  `user_no` int(11) DEFAULT NULL,
  `user_rsv1` varchar(64) DEFAULT NULL,
  `user_rsv2` varchar(64) DEFAULT NULL,
  `user_rsv3` varchar(64) DEFAULT NULL,
  `user_rsv4` varchar(64) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT NULL,
  `user_type` varchar(64) DEFAULT NULL,
  `profile_images` varchar(255) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_app_user
-- ----------------------------
INSERT INTO `fc_app_user` VALUES ('402881ed517c59f001517c5a49910000', '2015-12-07 20:11:11', null, null, 'e99a18c428cb38d5f260853678922e03', '13943498111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c5c8301517c5cbd600000', '2015-12-07 20:13:51', null, null, 'e99a18c428cb38d5f260853678922e03', '13943498111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c5e9d01517c5ed3ad0000', '2015-12-07 20:16:08', null, null, 'e99a18c428cb38d5f260853678922e03', '13943498111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c5e9d01517c6138a70001', '2015-12-07 20:18:45', null, null, 'e99a18c428cb38d5f260853678922e03', '13943498111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c757b01517c76124c0000', '2015-12-07 20:41:31', null, null, 'e99a18c428cb38d5f260853678922e03', '13943498111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c9bac01517c9c62d50000', '2015-12-07 21:23:22', null, null, '827ccb0eea8a706c4c34a16891f84e7b', '12345', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517c9bac01517c9d2d0a0002', '2015-12-07 21:24:14', null, null, '827ccb0eea8a706c4c34a16891f84e7b', '1132141551', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517ca26a01517ca3417f0000', '2015-12-07 21:30:21', null, null, '827ccb0eea8a706c4c34a16891f84e7b', '1132141552', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517ca26a01517ca393b60001', '2015-12-07 21:31:10', null, null, '827ccb0eea8a706c4c34a16891f84e7b', '2132141552', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fc_app_user` VALUES ('402881ed517ca26a01517ca483370002', '2015-12-07 21:32:15', null, null, '827ccb0eea8a706c4c34a16891f84e7b', '21345124', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for fc_cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `fc_cms_ad`;
CREATE TABLE `fc_cms_ad` (
  `ID` varchar(36) NOT NULL,
  `anchor` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `createName` varchar(64) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `imageHref` varchar(255) DEFAULT NULL,
  `imageHrefReal` varchar(255) DEFAULT NULL,
  `imageName` varchar(64) DEFAULT NULL,
  `imageid` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `usefo` varchar(8) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `urlreal` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_cms_ad
-- ----------------------------
INSERT INTO `fc_cms_ad` VALUES ('402881ec51ba93310151baa19a660000', '402881ed51adb5d40151adb7f0940000', '2015-12-19 22:25:32', null, ' 321', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004403.jpg', '90004403', '321', '11', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004403.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004403.jpg');
INSERT INTO `fc_cms_ad` VALUES ('402881ec51ba93310151baa92c820001', '402881ec51b101db0151b10306d70000', '2015-12-19 22:33:48', null, ' ', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004408.jpg', '90004408', '321', '11', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004408.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004408.jpg');
INSERT INTO `fc_cms_ad` VALUES ('402881ec51badf0f0151bae2e01d0001', '402881ed51adb5d40151adb7f0940000', '2015-12-19 23:36:49', null, ' 321', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004603.jpg', '90004603', '321', '12', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004603.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004603.jpg');
INSERT INTO `fc_cms_ad` VALUES ('402881ec51badf0f0151bae797c10004', '402881ed51adb5d40151adb7f0940000', '2015-12-19 23:41:59', null, ' 123', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004606.jpg', '90004606', '123', '22', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004606.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004606.jpg');
INSERT INTO `fc_cms_ad` VALUES ('402881ed51917508015191765a9b0000', '12', '2015-12-11 22:33:52', null, ' ', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90003902.jpg', '90003902', '21', '11', '', '');
INSERT INTO `fc_cms_ad` VALUES ('402881ed519179440151917a5e700000', '5', '2015-12-11 22:38:15', null, ' ', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004002.jpg', '90004002', '3', '4', '', '');
INSERT INTO `fc_cms_ad` VALUES ('402881ed5191a314015191a5042a0000', '4', '2015-12-11 23:24:50', null, ' ', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004202.jpg', '90004202', '3', '1', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004202.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004202.jpg');
INSERT INTO `fc_cms_ad` VALUES ('40289ea851d7c83c0151d7c92f470000', 'http://localhost:8888/com.fivecar.cms.web/app/Resources.do?anchor=402881ec51c50d980151c50f31dd0000', '2015-12-25 14:17:45', '付文宇', ' 123', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004802.jpg', '90004802', '321', '21', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004802.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004802.jpg');
INSERT INTO `fc_cms_ad` VALUES ('40289ea851d7c83c0151d7cfefbb0001', 'http://localhost:8888/com.fivecar.cms.web/app/Resources.do?anchor=402881ec51b101db0151b10306d70000', '2015-12-25 14:25:08', '付文宇', ' 123', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/image', '/C:/Program%20Files/work/workspace3/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/com.fivecar.cms.web/upload/imagereal', '90004803.jpg', '90004803', '321', '12', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90004803.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90004803.jpg');

-- ----------------------------
-- Table structure for fc_ssss_brand
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_brand`;
CREATE TABLE `fc_ssss_brand` (
  `ID` varchar(36) NOT NULL,
  `brandNamecn` varchar(64) NOT NULL DEFAULT '',
  `brandNameen` varchar(64) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `imageName` varchar(64) NOT NULL DEFAULT '',
  `initial` varchar(1) NOT NULL DEFAULT 'A',
  `url` varchar(255) NOT NULL DEFAULT '',
  `urlreal` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_brand
-- ----------------------------
INSERT INTO `fc_ssss_brand` VALUES ('402881eb5259f48801525a09e51e0000', 'asffdsa', 'ggfd', '2016-01-19 21:19:04', '付文宇', null, '90006602.jpg', 'B', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006602.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006602.jpg');
INSERT INTO `fc_ssss_brand` VALUES ('402881ec51ee6d810151ee6eab960000', '大众', 'dasauto', '2015-12-29 23:50:09', '付文宇', null, '90005102.jpg', 'D', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90005102.jpg', '');

-- ----------------------------
-- Table structure for fc_ssss_dealer
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_dealer`;
CREATE TABLE `fc_ssss_dealer` (
  `ID` varchar(36) NOT NULL,
  `addr` varchar(255) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `dealerName` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `position` varchar(255) DEFAULT '',
  `telephone` varchar(11) NOT NULL DEFAULT '',
  `carbrand` varchar(64) NOT NULL DEFAULT '',
  `carbrandid` varchar(64) NOT NULL DEFAULT '',
  `privileges` varchar(255) DEFAULT '',
  `privilegestile` varchar(255) DEFAULT '',
  `privilegesurl` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_dealer
-- ----------------------------
INSERT INTO `fc_ssss_dealer` VALUES ('402881eb5259f48801525a3fb0f10001', '312', '2016-01-19 22:17:50', '付文宇', '123', '123', '<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>', '312', '大众', '402881ec51ee6d810151ee6eab960000', '123', '', 'http://localhost:8080/com.fivecar.cms.web/app/Resources.do?anchor=402881ec520cd8bf01520ceb1cb90000');
INSERT INTO `fc_ssss_dealer` VALUES ('402881ec5207fc1d015207fcbd3e0000', '3212', '2016-01-17 21:32:00', '付文宇', '众诚', 'what fuck', '<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>', '3211', '大众', '402881ec51ee6d810151ee6eab960000', '', '', '');
INSERT INTO `fc_ssss_dealer` VALUES ('40289ea852145b670152145facd30000', '321', '2016-01-19 22:18:02', '付文宇', '二笔', '123', '<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>', '321', 'asffdsa', '402881eb5259f48801525a09e51e0000', '123', '', 'http://localhost:8080/com.fivecar.cms.web/app/Resources.do?anchor=402881ec520cd8bf01520ceb1cb90000');

-- ----------------------------
-- Table structure for fc_ssss_model
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_model`;
CREATE TABLE `fc_ssss_model` (
  `ID` varchar(36) NOT NULL,
  `carbrand` varchar(64) NOT NULL DEFAULT '',
  `carbrandid` varchar(36) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `discountprice` varchar(36) DEFAULT '',
  `imageName` varchar(64) DEFAULT '',
  `modelName` varchar(64) NOT NULL DEFAULT '',
  `originalprice` varchar(36) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `urlreal` varchar(255) DEFAULT '',
  `vehicle` varchar(64) DEFAULT '',
  `vehicleid` varchar(36) DEFAULT '',
  `Carabstract` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_model
-- ----------------------------
INSERT INTO `fc_ssss_model` VALUES ('402881eb525f21b701525f22ecab0000', '大众', '402881ec51ee6d810151ee6eab960000', '2016-01-20 21:04:30', '付文宇', null, '18.88万', '90006702.png', '自动舒适型', '23.88万', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006702.png', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006702.png', '高尔夫', '402881ec51f337320151f33911980000', '');
INSERT INTO `fc_ssss_model` VALUES ('402881eb525f21b701525f243e820001', '大众', '402881ec51ee6d810151ee6eab960000', '2016-01-20 21:05:57', '付文宇', null, '18.18万', '90006703.png', '手动蓝驱', '23.18万', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006703.png', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006703.png', '高尔夫', '402881ec51f337320151f33911980000', '');
INSERT INTO `fc_ssss_model` VALUES ('402881eb525f2bb401525f2cefed0000', '大众', '402881ec51ee6d810151ee6eab960000', '2016-01-20 21:15:27', '付文宇', null, '12.18万', '90006802.png', '手动尽享型', '13.18万', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006802.png', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006802.png', '高尔夫', '402881ec51f337320151f33911980000', null);

-- ----------------------------
-- Table structure for fc_ssss_modelcfg
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_modelcfg`;
CREATE TABLE `fc_ssss_modelcfg` (
  `ID` varchar(36) NOT NULL,
  `carbrand` varchar(11) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `dealers` varchar(36) DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `modelName` varchar(64) NOT NULL DEFAULT '',
  `price` varchar(36) NOT NULL DEFAULT '',
  `profile` varchar(255) NOT NULL DEFAULT '',
  `sales` varchar(36) DEFAULT '',
  `vehicleConfiguration` varchar(36) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_modelcfg
-- ----------------------------

-- ----------------------------
-- Table structure for fc_ssss_sales
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_sales`;
CREATE TABLE `fc_ssss_sales` (
  `ID` varchar(36) NOT NULL,
  `belong` varchar(36) NOT NULL DEFAULT '',
  `belongName` varchar(64) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `profile` varchar(255) NOT NULL DEFAULT '',
  `salesName` varchar(64) NOT NULL DEFAULT '',
  `wxQQ` varchar(24) NOT NULL DEFAULT '',
  `imageName` varchar(64) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `urlreal` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_sales
-- ----------------------------
INSERT INTO `fc_ssss_sales` VALUES ('402881eb5254c59b015254c8df2b0000', '402881ec5207fc1d015207fcbd3e0000', '众诚', '2016-01-18 20:49:57', '付文宇', null, '12345677', '', '小张', '13123', '90006402.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006402.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006402.jpg');
INSERT INTO `fc_ssss_sales` VALUES ('402881eb5254c59b015254c91a5f0001', '402881ec5207fc1d015207fcbd3e0000', '众诚', '2016-01-18 20:50:12', '付文宇', null, '123', '', '夏利', '312', '90006403.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006403.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006403.jpg');
INSERT INTO `fc_ssss_sales` VALUES ('402881eb5254c59b015254c9bc9d0002', '40289ea852145b670152145facd30000', '二笔', '2016-01-18 20:50:53', '付文宇', null, '321', '', '123', '321', '90006404.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006404.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006404.jpg');
INSERT INTO `fc_ssss_sales` VALUES ('402881eb5255010601525504ecbe0000', '402881ec5207fc1d015207fcbd3e0000', '众诚', '2016-01-18 21:55:32', '付文宇', null, '321', '', '123', '321', '90006502.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006502.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006502.jpg');

-- ----------------------------
-- Table structure for fc_ssss_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `fc_ssss_vehicle`;
CREATE TABLE `fc_ssss_vehicle` (
  `ID` varchar(36) NOT NULL,
  `carbrand` varchar(64) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  `createName` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) DEFAULT '',
  `imageName` varchar(64) NOT NULL DEFAULT '',
  `price` varchar(36) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `urlreal` varchar(255) NOT NULL DEFAULT '',
  `vehicleName` varchar(64) NOT NULL DEFAULT '',
  `carbrandid` varchar(36) NOT NULL DEFAULT '',
  `anchor` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_ssss_vehicle
-- ----------------------------
INSERT INTO `fc_ssss_vehicle` VALUES ('402881eb525fb32d01525fb38dec0000', '大众', '2016-01-20 23:42:29', '付文宇', null, '90006902.png', '321', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90006902.png', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90006902.png', '123', '402881ec51ee6d810151ee6eab960000', 'http://localhost:8080/com.fivecar.cms.web/vehicleWebview.do?vehicleid=null');
INSERT INTO `fc_ssss_vehicle` VALUES ('402881ec51f337320151f33911980000', '大众', '2015-12-30 22:09:42', '付文宇', null, '90005502.jpg', '12.18万-18.98万', 'http://182.92.5.130/com.fivecar.cms.web/upload/image/90005502.jpg', 'http://182.92.5.130/com.fivecar.cms.web/upload/imagereal/90005502.jpg', '高尔夫', '402881ec51ee6d810151ee6eab960000', '');

-- ----------------------------
-- Table structure for fc_test
-- ----------------------------
DROP TABLE IF EXISTS `fc_test`;
CREATE TABLE `fc_test` (
  `time` datetime NOT NULL,
  `name` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fc_test
-- ----------------------------

-- ----------------------------
-- Table structure for pub_product_def
-- ----------------------------
DROP TABLE IF EXISTS `pub_product_def`;
CREATE TABLE `pub_product_def` (
  `pro_code` varchar(32) NOT NULL,
  `cny` varchar(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `guarantee_type` varchar(32) DEFAULT NULL,
  `guaranteechange_flag` varchar(1) DEFAULT NULL,
  `loan_type` varchar(255) DEFAULT NULL,
  `postpone_flag` varchar(1) DEFAULT NULL,
  `pro_name` varchar(32) DEFAULT NULL,
  `pro_type` varchar(8) DEFAULT NULL,
  `ps` varchar(32) DEFAULT NULL,
  `rep_way` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pro_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_product_def
-- ----------------------------

-- ----------------------------
-- Table structure for pub_static_def
-- ----------------------------
DROP TABLE IF EXISTS `pub_static_def`;
CREATE TABLE `pub_static_def` (
  `key_` varchar(96) DEFAULT NULL,
  `value_` varchar(192) DEFAULT NULL,
  `name_` varchar(96) DEFAULT NULL,
  `ps` varchar(384) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_static_def
-- ----------------------------
INSERT INTO `pub_static_def` VALUES ('SEX_', '1', '男', '性别');
INSERT INTO `pub_static_def` VALUES ('SEX_', '2', '女', '性别');
INSERT INTO `pub_static_def` VALUES ('YESORNO', '1', '是', '是');
INSERT INTO `pub_static_def` VALUES ('YESORNO', '2', '否', '否');
INSERT INTO `pub_static_def` VALUES ('CHA', 'P', '百分比', '变动系数');
INSERT INTO `pub_static_def` VALUES ('CHA', 'A', '百分点', '变动系数');
INSERT INTO `pub_static_def` VALUES ('pay_type', '1', '自主支付', '支付类型');
INSERT INTO `pub_static_def` VALUES ('pay_type', '2', '受托支付', '支付类型');
INSERT INTO `pub_static_def` VALUES ('repay_type', '1', '对月对日', '还款日类型');
INSERT INTO `pub_static_def` VALUES ('repay_type', '2', '指定还款日', '还款日类型');
INSERT INTO `pub_static_def` VALUES ('repay_type', '3', '固定日扣款', '还款日类型');
INSERT INTO `pub_static_def` VALUES ('house_type', '1', '自住型', '房屋类型');
INSERT INTO `pub_static_def` VALUES ('house_type', '2', '商用型', '房屋类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '01', '身份证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '02', '军官证\r\n', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '03', '户口簿\r\n', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '04', '护照\r\n', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '0', '已取消', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '1', '待审批', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '2', '审批中', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '3', '审批通过', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '4', '审批未通过', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '5', '已生效', '业务状态');
INSERT INTO `pub_static_def` VALUES ('rat_adj_eff_time', '1', '不生效', '利率调整生效方式');
INSERT INTO `pub_static_def` VALUES ('rat_adj_eff_time', '2', '立即生效', '利率调整生效方式');
INSERT INTO `pub_static_def` VALUES ('rat_adj_eff_time', '3', '下一结息周期生效', '利率调整生效方式');
INSERT INTO `pub_static_def` VALUES ('rat_adj_eff_time', '4', '次年1月1日生效', '利率调整生效方式');
INSERT INTO `pub_static_def` VALUES ('gua_type', '1', '信用', '担保方式');
INSERT INTO `pub_static_def` VALUES ('gua_type', '2', '保证', '担保方式');
INSERT INTO `pub_static_def` VALUES ('gua_type', '3', '抵押', '担保方式');
INSERT INTO `pub_static_def` VALUES ('gua_type', '4', '质押', '担保方式');
INSERT INTO `pub_static_def` VALUES ('rep_way', '2', '等额本金', '还款方式');
INSERT INTO `pub_static_def` VALUES ('rep_way', '1', '等额本息', '还款方式');
INSERT INTO `pub_static_def` VALUES ('rep_way', '3', '按月付息一次还本', '还款方式');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '1', '待审批', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '2', '审批中', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '3', '审批通过', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '4', '待放款', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '6', '处理中', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '7', '已放款', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '8', '已结清', '借据状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '0', '已取消', '借据状态');
INSERT INTO `pub_static_def` VALUES ('assessment_type', '1', '收益现值方式', '评估方式');
INSERT INTO `pub_static_def` VALUES ('assessment_type', '2', '重置成本方式', '评估方式');
INSERT INTO `pub_static_def` VALUES ('assessment_type', '3', '现行市价方式', '评估方式');
INSERT INTO `pub_static_def` VALUES ('assessment_type', '4', '清算价格方式', '评估方式');
INSERT INTO `pub_static_def` VALUES ('assessment_type', '5', '其他方式', '评估方式');
INSERT INTO `pub_static_def` VALUES ('collateral_status', '1', '待入库', '押品状态');
INSERT INTO `pub_static_def` VALUES ('collateral_status', '2', '已入库', '押品状态');
INSERT INTO `pub_static_def` VALUES ('collateral_status', '4', '已注销', '押品状态');
INSERT INTO `pub_static_def` VALUES ('gua_form', '1', '单人担保', '保证形式');
INSERT INTO `pub_static_def` VALUES ('gua_form', '2', '多人联保', '变更类型');
INSERT INTO `pub_static_def` VALUES ('gua_form', '3', '多人分保', '变更类型');
INSERT INTO `pub_static_def` VALUES ('dispute_sol', '1', '双方协商', '争议解决方式');
INSERT INTO `pub_static_def` VALUES ('REPAYMENT_TYPE', '1', '欠款归还', '还款类型');
INSERT INTO `pub_static_def` VALUES ('REPAYMENT_TYPE', '2', '提前部分还本', '还款类型');
INSERT INTO `pub_static_def` VALUES ('REPAYMENT_TYPE', '3', '贷款结清', '还款类型');
INSERT INTO `pub_static_def` VALUES ('repayment_way', '1', '变额不变期', '还款计划变更方式');
INSERT INTO `pub_static_def` VALUES ('repayment_way', '2', '变期不变额', '还款计划变更方式');
INSERT INTO `pub_static_def` VALUES ('repayment_choose', '1', '现金还款', '还款选择');
INSERT INTO `pub_static_def` VALUES ('repayment_choose', '2', '约定账户还款', '还款选择');
INSERT INTO `pub_static_def` VALUES ('draft_type', '1', '银承', '汇票种类');
INSERT INTO `pub_static_def` VALUES ('draft_type', '2', '商承', '汇票种类');
INSERT INTO `pub_static_def` VALUES ('land_type', '1', '商业', '土地类型');
INSERT INTO `pub_static_def` VALUES ('land_type', '2', '住宅', '土地类型');
INSERT INTO `pub_static_def` VALUES ('land_type', '3', '工业', '土地类型');
INSERT INTO `pub_static_def` VALUES ('land_type', '4', '其他', '土地类型');
INSERT INTO `pub_static_def` VALUES ('landPower_type', '1', '划拨', '土地使用权');
INSERT INTO `pub_static_def` VALUES ('landPower_type', '2', '出让', '土地使用权');
INSERT INTO `pub_static_def` VALUES ('landPower_type', '4', '租赁', '土地使用权');
INSERT INTO `pub_static_def` VALUES ('landPower_type', '3', '集体', '土地使用权');
INSERT INTO `pub_static_def` VALUES ('bill_type', '1', '银行承兑汇票', '票据类型');
INSERT INTO `pub_static_def` VALUES ('bill_type', '2', '商业承兑汇票', '票据类型');
INSERT INTO `pub_static_def` VALUES ('toll_type', '10001', '票据结算手续费收入', '收费类型');
INSERT INTO `pub_static_def` VALUES ('toll_type', '10002', '国内贸易融资手续费收入', '收费类型');
INSERT INTO `pub_static_def` VALUES ('trade_type', '1', '现金', '交易类别');
INSERT INTO `pub_static_def` VALUES ('trade_type', '2', '转账', '交易类别');
INSERT INTO `pub_static_def` VALUES ('product_type', '2101', '公司类贷款', '产品类型');
INSERT INTO `pub_static_def` VALUES ('product_type', '2201', '个贷类贷款', '产品类型');
INSERT INTO `pub_static_def` VALUES ('repayment_cancle_type', '1', '提前还款冲账', '贷款还款冲账');
INSERT INTO `pub_static_def` VALUES ('repayment_cancle_type', '2', '欠款归还冲账', '贷款还款冲账');
INSERT INTO `pub_static_def` VALUES ('repayment_cancle_type', '3', '贴现还款冲账', '贷款还款冲账');
INSERT INTO `pub_static_def` VALUES ('repayment_cancle_type', '4', '核销收回冲账', '贷款还款冲账');
INSERT INTO `pub_static_def` VALUES ('rep_way', '6', '利随本清', '还款方式');
INSERT INTO `pub_static_def` VALUES ('risk_level', '3', '次级', '五级分类');
INSERT INTO `pub_static_def` VALUES ('risk_level', '4', '可疑', '五级分类');
INSERT INTO `pub_static_def` VALUES ('risk_level', '5', '损失', '五级分类');
INSERT INTO `pub_static_def` VALUES ('corporate_grade', '1', '大型', '企业规模等级');
INSERT INTO `pub_static_def` VALUES ('corporate_grade', '2', '中型', '企业规模等级');
INSERT INTO `pub_static_def` VALUES ('corporate_grade', '3', '小型', '企业规模等级');
INSERT INTO `pub_static_def` VALUES ('corporate_grade', '4', '微型', '企业规模等级');
INSERT INTO `pub_static_def` VALUES ('corporate_grade', '5', '其他', '企业规模等级');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '10', '审批未通过', '借据状态');
INSERT INTO `pub_static_def` VALUES ('dis_status', '1', '待出账', '贴现出账状态');
INSERT INTO `pub_static_def` VALUES ('dis_status', '2', '已出账', '贴现出账状态');
INSERT INTO `pub_static_def` VALUES ('dis_status', '3', '处理中', '贴现出账状态');
INSERT INTO `pub_static_def` VALUES ('dis_status', '4', '已放款', '贴现出账状态');
INSERT INTO `pub_static_def` VALUES ('dis_status', '5', '已作废', '贴现出账状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '6', '退回修改', '业务状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '9', '退回修改', '借据状态');
INSERT INTO `pub_static_def` VALUES ('gua_change_type', '1', '追加担保合同', '担保变更类型');
INSERT INTO `pub_static_def` VALUES ('gua_change_type', '2', '担保方式变更', '担保变更类型');
INSERT INTO `pub_static_def` VALUES ('gua_change_type', '3', '担保合同终止', '担保变更类型');
INSERT INTO `pub_static_def` VALUES ('valid_status', '1', '有效', '有效无效');
INSERT INTO `pub_static_def` VALUES ('valid_status', '2', '无效', '有效无效');
INSERT INTO `pub_static_def` VALUES ('demand_way', '1', '信函催收', '催收方式');
INSERT INTO `pub_static_def` VALUES ('demand_way', '2', '电话催收', '催收方式');
INSERT INTO `pub_static_def` VALUES ('demand_way', '3', '短信催收', '催收方式');
INSERT INTO `pub_static_def` VALUES ('demand_way', '4', '上门催收', '催收方式');
INSERT INTO `pub_static_def` VALUES ('marital_status', '10', '未婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '20', '已婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '40', '离婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '22', '再婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '30', '丧偶', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('income_status', '01', '1000元以下', '薪水');
INSERT INTO `pub_static_def` VALUES ('income_status', '02', '1000-3000元', '薪水');
INSERT INTO `pub_static_def` VALUES ('income_status', '03', '3000元以上\r\n', '薪水');
INSERT INTO `pub_static_def` VALUES ('income_status', '99', '其他\r\n', '薪水');
INSERT INTO `pub_static_def` VALUES ('job_title', '0', '无', '个人职称');
INSERT INTO `pub_static_def` VALUES ('job_title', '1', '初级', '个人职称');
INSERT INTO `pub_static_def` VALUES ('job_title', '2', '中级', '个人职称');
INSERT INTO `pub_static_def` VALUES ('job_title', '3', '高级', '个人职称');
INSERT INTO `pub_static_def` VALUES ('job_title', '99', '其他', '个人职称');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '05', '港澳台居民通行证\r\n', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '06', '外国人永久居留证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '07', '临时身份证\r\n', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '08', '批文（个人)', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '09', '学生证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '49', '其他 （个人）', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '52', '营业执照\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '53', '社会团体证\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '54', '工会法人登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '55', '企业名称核准通知书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '56', '编委会批文或登记证\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '57', '办学许可证\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '58', '民办非企业登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '59', '办事处备案证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '60', '主管部门批文或证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '61', '事业法人登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '62', '组织机构代码证\r\n', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '99', '其他', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('bill_status', '1', '库存', '票据状态');
INSERT INTO `pub_static_def` VALUES ('bill_status', '2', '已划回', '票据状态');
INSERT INTO `pub_static_def` VALUES ('comp_type', '01', '中资企业', '单位性质');
INSERT INTO `pub_static_def` VALUES ('comp_type', '02', '外商投资', '单位性质');
INSERT INTO `pub_static_def` VALUES ('comp_type', '03', '驻华机构', '单位性质');
INSERT INTO `pub_static_def` VALUES ('corporate_type', '1', '支持类', '客户管理分类');
INSERT INTO `pub_static_def` VALUES ('corporate_type', '2', '维护类', '客户管理分类');
INSERT INTO `pub_static_def` VALUES ('corporate_type', '3', '压缩类', '客户管理分类');
INSERT INTO `pub_static_def` VALUES ('corporate_type', '4', '退出类', '客户管理分类');
INSERT INTO `pub_static_def` VALUES ('economy_type', '01', '国有独资企业', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '02', '非上市公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '03', '上市公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '04', '中资公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '05', '中外合资\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '06', '联营公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '07', '乡镇企业\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '08', '外商独资\r\n', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('economy_type', '99', '其他', '经济组织形式');
INSERT INTO `pub_static_def` VALUES ('cust_state', '00', '正常', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '01', '注销', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '02', '已合并\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '03', '死亡\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '04', '神经\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '05', '黑名单\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '06', '睡眠户\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '07', '往来不佳\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '08', '不宜往来\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '09', '呆滞往来\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '10', '法律催收\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('cust_state', '11', '失踪\r\n', '客户状态');
INSERT INTO `pub_static_def` VALUES ('DUEBILL_STATUS', '5', '出账作废', '借据状态');
INSERT INTO `pub_static_def` VALUES ('dispute_sol', '2', '法律途径', '争议解决方式');
INSERT INTO `pub_static_def` VALUES ('toll_status', '1', '未入账', '收费状态');
INSERT INTO `pub_static_def` VALUES ('toll_status', '2', '收费成功', '收费状态');
INSERT INTO `pub_static_def` VALUES ('cust_type', '2', '个人客户', '客户类型');
INSERT INTO `pub_static_def` VALUES ('cust_type', '1', '企业客户', '客户类型');
INSERT INTO `pub_static_def` VALUES ('sign_status', '1', '已签约', '签约客户状态');
INSERT INTO `pub_static_def` VALUES ('sign_status', '0', '已解约', '签约客户状态');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '01', '吉林银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '02', '工商银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '03', '农业银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '04', '建设银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '05', '中国银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '06', '招商银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '07', '交通银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '08', '民生银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '09', '光大银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('tru_bank', '10', '中国邮政储蓄银行', '托管账户开户行');
INSERT INTO `pub_static_def` VALUES ('acc_back_type', '1', '贷款放款冲账', '冲账种类');
INSERT INTO `pub_static_def` VALUES ('acc_back_type', '2', '贷款还款冲账', '冲账种类');
INSERT INTO `pub_static_def` VALUES ('acc_back_type', '3', '贴现放款冲账', '冲账种类');
INSERT INTO `pub_static_def` VALUES ('demand_type', '1', '借款人催收', '催收类型');
INSERT INTO `pub_static_def` VALUES ('demand_type', '2', '担保人催收', '催收类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '01', '银行', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '02', '信托公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '03', '资产管理公司（金融类）', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '04', '资产管理公司（非金融类）', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '05', '金融租赁公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '06', '融资租赁公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '07', '财务公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '08', '货币经济公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '09', '三类新型农村金融机构', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '10', '消费金融公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '11', '汽车金融公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '12', '证券公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '13', '基金管理公司或子公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '14', '期货公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '15', '保险集团控股公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '16', '保险公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '17', '再保险公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '18', '保险资产管理公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '19', '外资保险公司代理处', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '20', '商业保理公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '21', '融资担保公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '22', '小额贷款公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '23', '政府融资平台', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '24', '房地产公司', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '25', '中介及服务机构', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '26', '其他一般工商企业', '机构类型');
INSERT INTO `pub_static_def` VALUES ('reg_org_type', '99', '其他', '机构类型');
INSERT INTO `pub_static_def` VALUES ('pro_type', '1', '企业', '产品类型');
INSERT INTO `pub_static_def` VALUES ('pro_type', '2', '个人', '产品类型');
INSERT INTO `pub_static_def` VALUES ('loan_limit_unit', 'Y', '年', '贷款期限单位');
INSERT INTO `pub_static_def` VALUES ('loan_limit_unit', 'M', '月', '贷款期限单位');
INSERT INTO `pub_static_def` VALUES ('loan_limit_unit', 'D', '日', '贷款期限单位');
INSERT INTO `pub_static_def` VALUES ('conApprove_status', '0', '未审批', '合同审批状态');
INSERT INTO `pub_static_def` VALUES ('conApprove_status', '1', '审批中', '合同审批状态');
INSERT INTO `pub_static_def` VALUES ('conApprove_status', '2', '审批完成', '合同审批状态');
INSERT INTO `pub_static_def` VALUES ('conApprove_status', '3', '审批未通过', '合同审批状态');
INSERT INTO `pub_static_def` VALUES ('cost_transfer', '111', '平台服务费划转', '费用划转类型');
INSERT INTO `pub_static_def` VALUES ('cost_transfer', '222', '平台投资管理费划转', '费用划转类型');
INSERT INTO `pub_static_def` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def` VALUES ('project_status', '2', '已满标', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '3', '流标处理中', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '4', '已流标', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '5', '放款中', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '6', '已放款', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '1', '未满标', '项目状态');
INSERT INTO `pub_static_def` VALUES ('project_status', '7', '结清', '项目状态');
INSERT INTO `pub_static_def` VALUES ('guarant_fee_type', '1', '分期收取', '担保公司保费收取方式');
INSERT INTO `pub_static_def` VALUES ('guarant_fee_type', '2', '放款即收', '担保公司保费收取方式');
INSERT INTO `pub_static_def` VALUES ('app_status', '0', '未审批', '费用入账审批状态');
INSERT INTO `pub_static_def` VALUES ('app_status', '1', '审批中', '费用入账审批状态');
INSERT INTO `pub_static_def` VALUES ('app_status', '2', '审批完成', '费用入账审批状态');
INSERT INTO `pub_static_def` VALUES ('app_status', '3', '审批未通过', '费用入账审批状态');
INSERT INTO `pub_static_def` VALUES ('app_status', '4', '已入账', '费用入账审批状态');
INSERT INTO `pub_static_def` VALUES ('conApprove_status', '4', '退回修改', '合同审批状态');
INSERT INTO `pub_static_def` VALUES ('collateral_type', '1', '抵押', '押品类型');
INSERT INTO `pub_static_def` VALUES ('collateral_type', '2', '质押', '押品类型');
INSERT INTO `pub_static_def` VALUES ('pub_col_status', '1', '启用', '押品参数状态');
INSERT INTO `pub_static_def` VALUES ('pub_col_status', '0', '停用', '押品参数状态');
INSERT INTO `pub_static_def` VALUES ('land_level', '1', '一级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '2', '二级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '3', '三级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '4', '四级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '5', '五级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '6', '六级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('land_level', '7', '七级', '土地等级');
INSERT INTO `pub_static_def` VALUES ('gua_cont_status', '0', '未生效', '担保合同状态');
INSERT INTO `pub_static_def` VALUES ('gua_cont_status', '1', '已生效', '担保合同状态');
INSERT INTO `pub_static_def` VALUES ('collateral_status', '3', '已出库', '押品状态');
INSERT INTO `pub_static_def` VALUES ('demand_status', '2', '已回执', '贷后催收状态');
INSERT INTO `pub_static_def` VALUES ('news_type', '2', '新闻', '信息类型');
INSERT INTO `pub_static_def` VALUES ('demand_status', '1', '已催收', '贷后催收状态');
INSERT INTO `pub_static_def` VALUES ('news_type', '3', '通知', '信息类型');
INSERT INTO `pub_static_def` VALUES ('news_type', '1', '公告', '信息类型');
INSERT INTO `pub_static_def` VALUES ('compoundingInterest_flag', '0', '不收取', '是否收取复利标志');
INSERT INTO `pub_static_def` VALUES ('compoundingInterest_flag', '1', '收取', '是否收取复利标志');
INSERT INTO `pub_static_def` VALUES ('marginDeposit_status', '0', '未审批', '保证金存入状态');
INSERT INTO `pub_static_def` VALUES ('marginDeposit_status', '1', '审批中', '保证金存入状态');
INSERT INTO `pub_static_def` VALUES ('marginDeposit_status', '3', '审批不通过', '保证金存入状态');
INSERT INTO `pub_static_def` VALUES ('marginDeposit_status', '2', '审批通过', '保证金存入状态');
INSERT INTO `pub_static_def` VALUES ('dest_sys_flag', '1', '门户', '公告新闻发布系统');
INSERT INTO `pub_static_def` VALUES ('dest_sys_flag', '2', '担保公司', '公告新闻发布系统');
INSERT INTO `pub_static_def` VALUES ('dest_sys_flag', '3', '运营管理端', '公告新闻发布系统');
INSERT INTO `pub_static_def` VALUES ('cust_replystatus', '1', '未回复', '客户留言回复');
INSERT INTO `pub_static_def` VALUES ('cust_replystatus', '2', '已回复', '客户留言回复');
INSERT INTO `pub_static_def` VALUES ('message_type', '1', '咨询', '留言类型');
INSERT INTO `pub_static_def` VALUES ('message_type', '2', '建议', '留言类型');
INSERT INTO `pub_static_def` VALUES ('message_replytype', '2', '电话', '留言回复方式');
INSERT INTO `pub_static_def` VALUES ('message_replytype', '0', '无需回复', '留言回复方式');
INSERT INTO `pub_static_def` VALUES ('message_replytype', '1', '邮件', '留言回复方式');
INSERT INTO `pub_static_def` VALUES ('message_replytype', '3', '站内', '留言回复方式');
INSERT INTO `pub_static_def` VALUES ('contract_usable_flag', '0', '未生效', '合同生效标志');
INSERT INTO `pub_static_def` VALUES ('contract_usable_flag', '1', '已生效', '合同生效标志');
INSERT INTO `pub_static_def` VALUES ('contract_usable_flag', '2', '结清注销', '合同生效标志');
INSERT INTO `pub_static_def` VALUES ('orgtype', '2', '二级', '机构等级');
INSERT INTO `pub_static_def` VALUES ('orgtype', '1', '一级', '机构等级');
INSERT INTO `pub_static_def` VALUES ('orgtype', '3', '三级', '机构等级');
INSERT INTO `pub_static_def` VALUES ('cust_worth', '1', '核心客户', '客户价值分类');
INSERT INTO `pub_static_def` VALUES ('cust_worth', '2', '价值客户', '客户价值分类');
INSERT INTO `pub_static_def` VALUES ('cust_worth', '3', '基本客户', '客户价值分类');
INSERT INTO `pub_static_def` VALUES ('cust_worth', '4', '潜在客户', '客户价值分类');
INSERT INTO `pub_static_def` VALUES ('fdc_sx_flag', '1', '房地产开发项目融资客户', '房地产授信业务属性');
INSERT INTO `pub_static_def` VALUES ('fdc_sx_flag', '2', '房地产开发企业客户', '房地产授信业务属性');
INSERT INTO `pub_static_def` VALUES ('fdc_sx_flag', '3', '其他房地产客户', '房地产授信业务属性');
INSERT INTO `pub_static_def` VALUES ('fdc_sx_flag', '4', '非房地产客户', '房地产授信业务属性');
INSERT INTO `pub_static_def` VALUES ('cust_link', '0', '生效', '客户引入');
INSERT INTO `pub_static_def` VALUES ('cust_link', '1', '注销', '客户引入');
INSERT INTO `pub_static_def` VALUES ('is_zblmyrz', '1', '否', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def` VALUES ('is_zblmyrz', '2', '是，低风险', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def` VALUES ('is_zblmyrz', '3', '是，风险来源国内', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def` VALUES ('is_zblmyrz', '4', '是，风险来源国外', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def` VALUES ('FL_SQLB', '0', '归入', '申请类别');
INSERT INTO `pub_static_def` VALUES ('FL_SQLB', '1', '解除', '申请类别');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '1', '待审批', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '2', '审批中', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '5', '审批通过', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '4', '否决', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '6', '已生效', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '7', '已注销', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '8', '待补录', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '9', '取消', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '3', '修改资料', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '1', '母公司', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '2', '子公司', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '3', '总公司', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '4', '分公司', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '5', '关联企业', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_custtype', '6', '其他成员单位', '集团成员客户类型');
INSERT INTO `pub_static_def` VALUES ('group_relationship', '1', '同法人', '集团关联关系类型');
INSERT INTO `pub_static_def` VALUES ('group_relationship', '4', '其他', '集团关联关系类型');
INSERT INTO `pub_static_def` VALUES ('group_relationship', '3', '同股权投资', '集团关联关系类型');
INSERT INTO `pub_static_def` VALUES ('group_relationship', '2', '同股东', '集团关联关系类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '10', '警官证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '11', '台湾居民来往大陆通行证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('is_xh', '2', '是', '循环标志');
INSERT INTO `pub_static_def` VALUES ('is_xh', '1', '否', '循环标志');
INSERT INTO `pub_static_def` VALUES ('is_jtkh', 'y', '是', '集团客户标志');
INSERT INTO `pub_static_def` VALUES ('is_jtkh', 'n', '否', '集团客户标志');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '1', '季节性原材料采购', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '2', '扩大生产规模', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '3', '淡季储备存货', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '4', '其他存货采购', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '5', '商品贸易性采购', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '6', '小型办公生产工具购置', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '7', '新项目铺底流动资金', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '8', '还旧借新', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '9', '借新还旧', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '10', '归还他行贷款', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '11', '支付管理费（包括支付工资、租金等）', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_DKYT', '12', '其他', '贷款用途');
INSERT INTO `pub_static_def` VALUES ('FL_JZLLHQFS', '1', '按合同期限获取', '基准利率获取方式');
INSERT INTO `pub_static_def` VALUES ('FL_JZLLHQFS', '2', '自定义', '基准利率获取方式');
INSERT INTO `pub_static_def` VALUES ('FL_ZXLLJSFS', '1', '按基准利率计算', '执行利率计算方式');
INSERT INTO `pub_static_def` VALUES ('FL_ZXLLJSFS', '2', '自定义', '执行利率计算方式');
INSERT INTO `pub_static_def` VALUES ('FL_LLBDLX', 'P', '百分比', '利率变动类型');
INSERT INTO `pub_static_def` VALUES ('FL_LLBDLX', 'A', '百分点', '利率变动类型');
INSERT INTO `pub_static_def` VALUES ('FL_FLBZ', 'y', '是', '复利标志');
INSERT INTO `pub_static_def` VALUES ('FL_FLBZ', 'n', '否', '复利标志');
INSERT INTO `pub_static_def` VALUES ('demand_way', '99', '其他', '催收方式');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1001', '房产', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1002', '土地使用权(包含土地附着物)', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1003', '在建工程', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1004', '交通工具', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1005', '机器设备', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_DYW', '1006', '其他类', '抵押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2001', '存单', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2002', '票据', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2003', '保单', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2004', '国债', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2005', '股权/股票', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('FL_ZYW', '2006', '其他权利', '质押物类型');
INSERT INTO `pub_static_def` VALUES ('risk_level', '1', '正常', '五级分类');
INSERT INTO `pub_static_def` VALUES ('risk_level', '2', '关注', '五级分类');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '7', '待补录', '业务状态');
INSERT INTO `pub_static_def` VALUES ('BIZ_STATUS', '8', '补录中', '业务状态');
INSERT INTO `pub_static_def` VALUES ('toll_type', '20001', '代收手续费分润', '收费类型');
INSERT INTO `pub_static_def` VALUES ('toll_type', '10003', '银行承兑汇票手续费收入', '收费类型');
INSERT INTO `pub_static_def` VALUES ('toll_type', '10004', '人民币担保业务手续费收入', '收费类型');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ABW', '阿鲁巴', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AFG', '阿富汗', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AGO', '安哥拉共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AIA', '安圭拉', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ALB', '阿尔巴尼亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AND', '安道尔公国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ANT', '荷属安的列斯', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ARE', '阿拉伯联合酋长国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ARG', '阿根廷共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ARM', '亚美尼亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ASM', '美属萨摩亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ATA', '南极洲', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ATF', '法属南部领土', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ATG', '安提瓜和巴布达', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AUS', '澳大利亚联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AUT', '奥地利共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'AZE', '阿塞拜疆共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BDI', '布隆迪共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BEL', '比利时王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BEN', '贝宁共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BFA', '布基纳法索', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BGD', '孟加拉人民共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BGR', '保加利亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BHR', '巴林国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BHS', '巴哈马联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BIH', '波斯尼亚和黑塞哥维那', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BLR', '白俄罗斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BLZ', '伯利兹', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BMU', '百慕大', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BOL', '玻利维亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BRA', '巴西联邦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BRB', '巴巴多斯', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BRN', '文莱达鲁萨兰国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BTN', '不丹王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BVT', '布维岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'BWA', '博茨瓦纳共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CAF', '中非共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CAN', '加拿大', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CCK', '科科斯(基林)群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CHE', '瑞士联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CHL', '智利共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CHN', '中华人民共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CIV', '科特迪瓦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CMR', '喀麦隆共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'COD', '刚果民主共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'COG', '刚果共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'COK', '库克群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'COL', '哥伦比亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'COM', '科摩罗伊斯兰联邦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CPV', '佛得角共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CRI', '哥斯达黎加共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CUB', '古巴共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CXR', '圣诞岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CYM', '开曼群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CYP', '塞浦路斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'CZE', '捷克共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DEU', '德意志联邦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DJI', '吉布提共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DMA', '多米尼克国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DNK', '丹麦王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DOM', '多米尼加共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'DZA', '阿尔及利亚民主人民共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ECU', '厄瓜多尔共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'EGY', '阿拉伯埃及共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ERI', '厄立特里亚国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ESH', '西撒哈拉', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ESP', '西班牙王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'EST', '爱沙尼亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ETH', '埃塞俄比亚联邦民主共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FIN', '芬兰共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FJI', '斐济群岛共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FLK', '福克兰群岛（马尔维纳斯）', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FRA', '法兰西共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FRO', '法罗群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'FSM', '密克罗尼西亚联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GAB', '加蓬共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GBR', '大不列颠及北爱尔兰联合王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GEO', '格鲁吉亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GHA', '加纳共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GIB', '直布罗陀', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GIN', '几内亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GLP', '瓜德罗普', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GMB', '冈比亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GNB', '几内亚比绍共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GNQ', '赤道几内亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GRC', '希腊共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GRD', '格林纳达', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GRL', '格陵兰', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GTM', '危地马拉共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GUF', '法属圭亚那', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GUM', '关岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'GUY', '圭亚那合作共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HKG', '中国香港特别行政区', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HMD', '赫德岛和麦克唐纳岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HND', '洪都拉斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HRV', '克罗地亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HTI', '海地共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'HUN', '匈牙利共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IDN', '印度尼西亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IND', '印度共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IOT', '英属印度洋领地', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IRL', '爱尔兰', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IRN', '伊朗伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'IRQ', '伊拉克共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ISL', '冰岛共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ISR', '以色列国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ITA', '意大利共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'JAM', '牙买加', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'JOR', '约旦哈希姆王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'JPN', '日本国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KAZ', '哈萨克斯坦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KEN', '肯尼亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KGZ', '吉尔吉斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KHM', '柬埔寨王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KIR', '基里巴斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KNA', '圣基茨和尼维斯联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KOR', '大韩民国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'KWT', '科威特国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LAO', '老挝人民民主共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LBN', '黎巴嫩共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LBR', '利比里亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LBY', '大阿拉伯利比亚人民社会主义民众国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LCA', '圣卢西亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LIE', '列支敦士登公国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LKA', '斯里兰卡民主社会主义共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LSO', '莱索托王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LTU', '立陶宛共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LUX', '卢森堡大公国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'LVA', '拉脱维亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MAC', '中国澳门特别行政区', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MAR', '摩洛哥王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MCO', '摩纳哥公国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MDA', '摩尔多瓦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MDG', '马达加斯加共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MDV', '马尔代夫共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MEX', '墨西哥合众国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MHL', '马绍尔群岛共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MKD', '前南斯拉夫马其顿共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MLI', '马里共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MLT', '马耳他共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MMR', '缅甸联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MNG', '蒙古国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MNP', '北马里亚纳自由联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MOZ', '莫桑比克共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MRT', '毛里塔尼亚伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MSR', '蒙特赛拉特', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MTQ', '马提尼克', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MUS', '毛里求斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MWI', '马拉维共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MYS', '马来西亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'MYT', '马约特', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NAM', '纳米比亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NCL', '新喀里多尼亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NER', '尼日尔共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NFK', '诺福克岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NGA', '尼日利亚联邦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NIC', '尼加拉瓜共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NIU', '纽埃', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NLD', '荷兰王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NOR', '挪威王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NPL', '尼泊尔王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NRU', '瑙鲁共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'NZL', '新西兰', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'OMN', '阿曼苏丹国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'OTH', '其他地区', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PAK', '巴基斯坦伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PAN', '巴拿马共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PCN', '皮特凯恩', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PER', '秘鲁共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PHL', '菲律宾共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PLW', '帕劳共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PNG', '巴布亚新几内亚独立国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'POL', '波兰共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PRI', '波多黎各', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PRK', '朝鲜民主主义人民共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PRT', '葡萄牙共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PRY', '巴拉圭共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PSE', '巴勒斯坦国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'PYF', '法属波利尼西亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'QAT', '卡塔尔国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'REU', '留尼汪', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ROM', '罗马尼亚', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'RUS', '俄罗斯联邦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'RWA', '卢旺达共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SAU', '沙特阿拉伯王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SDN', '苏丹共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SEN', '塞内加尔共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SGP', '新加坡共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SGS', '南乔治亚岛和南桑德韦奇岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SHN', '圣赫勒拿', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SJM', '斯瓦尔巴岛和扬马延岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SLB', '所罗门群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SLE', '塞拉里昂共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SLV', '萨尔瓦多共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SMR', '圣马力诺共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SOM', '索马里共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SPM', '圣皮埃尔和密克隆', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'STP', '圣多美和普林西比民主共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SUR', '苏里南共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SVK', '斯洛伐克共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SVN', '斯洛文尼亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SWE', '瑞典王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SWZ', '斯威士兰王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SYC', '塞舌尔共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'SYR', '阿拉伯叙利亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TCA', '特克斯和凯科斯群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TCD', '乍得共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TGO', '多哥共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'THA', '泰王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TJK', '塔吉克斯坦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TKL', '托克劳', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TKM', '土库曼斯坦', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TMP', '东帝汶', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TON', '汤加王国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TTO', '特立尼达和多巴哥共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TUN', '突尼斯共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TUR', '土耳其共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TUV', '图瓦卢', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TWN', '中国台湾', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'TZA', '坦桑尼亚联合共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'UGA', '乌干达共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'UKR', '乌克兰', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'UMI', '美国本土外小岛屿', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'URY', '乌拉圭东岸共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'USA', '美利坚合众国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'UZB', '乌兹别克斯坦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VAT', '梵蒂冈城国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VCT', '圣文森特和格林纳丁斯', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VEN', '委内瑞拉共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VGB', '英属维尔京群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VIR', '美属维尔京群岛', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VNM', '越南社会主义共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'VUT', '瓦努阿图共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'WLF', '瓦利斯和富图纳', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'WSM', '萨摩亚独立国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'YEM', '也门共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'YUG', '南斯拉夫联盟共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ZAF', '南非共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ZMB', '赞比亚共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nationality', 'ZWE', '津巴布韦共和国', '国籍');
INSERT INTO `pub_static_def` VALUES ('nation_type', '01', '汉族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '02', '蒙古族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '03', '回族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '04', '藏族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '05', '维吾尔族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '06', '苗族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '07', '彝族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '08', '壮族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '09', '布依族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '10', '朝鲜族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '11', '满族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '12', '侗族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '13', '瑶族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '14', '白族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '15', '土家族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '16', '哈尼族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '17', '哈萨克族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '18', '傣族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '19', '黎族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '20', '僳傈族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '21', '佤族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '22', '畲族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '23', '高山族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '24', '拉祜族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '25', '水族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '26', '东乡族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '27', '纳西族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '28', '景颇族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '29', '柯尔克孜族', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '30', '土族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '31', '达斡尔族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '32', '仫佬族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '33', '羌族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '34', '布朗族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '35', '撒拉族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '36', '毛难族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '37', '仡佬族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '38', '锡伯族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '39', '阿昌族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '40', '普米族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '41', '塔吉克族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '42', '怒族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '43', '乌孜别克族', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '44', '俄罗斯族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '45', '鄂温克族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '46', '崩龙族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '47', '保安族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '48', '裕固族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '49', '京族      ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '50', '塔塔尔族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '51', '独龙族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '52', '鄂伦春族  ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '53', '赫哲族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '54', '门巴族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '55', '珞巴族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('nation_type', '56', '基诺族    ', '民族');
INSERT INTO `pub_static_def` VALUES ('marital_status', '23', '复婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '21', '初婚', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('marital_status', '99', '未说明的婚姻状况', '婚姻状况');
INSERT INTO `pub_static_def` VALUES ('education_grade', '10', '研究生', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '20', '大学本科（简称“大学”）', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '30', '大学专科和专科学校（简称“大专”）', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '40', '中等专业学校或中等技术学校', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '50', '技术学校', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '60', '高中', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '70', '初中', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '80', '小学', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '90', '文盲或半文盲', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_grade', '99', '未知', '最高学历');
INSERT INTO `pub_static_def` VALUES ('education_xw', '99', '其他    ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('education_xw', '1', '名誉博士 ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('education_xw', '2', '博士     ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('education_xw', '3', '硕士     ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('education_xw', '4', '学士     ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('education_xw', '5', '未知     ', '最高学位');
INSERT INTO `pub_static_def` VALUES ('job_type', '0', '国家机关、党群组织、企业、事业单位负责人  ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '1', '专业技术人员                              ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '3', '办事人员和有关人员                        ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '4', '商业、服务业人员                          ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '5', '农、林、牧、渔、水利业生产人员            ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '6', '生产、运输设备操作人员及有关人员          ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '7', '军人                                      ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '8', '不便分类的其他从业人员                    ', '职业');
INSERT INTO `pub_static_def` VALUES ('job_type', '99', '未知                                     ', '职业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '1', '农、林、牧、渔业                      ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '2', '采掘业                                ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '3', '制造业                                ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '4', '电力、燃气及水的生产和供应业          ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '5', '建筑业                                ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '6', '交通运输、仓储和邮政业                ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '7', '信息传输、计算机服务和软件业          ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '8', '批发和零售业                          ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '9', '住宿和餐饮业                          ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '10', '金融业                               ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '11', '房地产业                             ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '12', '租赁和商务服务业                     ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '13', '科学研究、技术服务业和地质勘察业     ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '14', '水利、环境和公共设施管理业           ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '15', '居民服务和其他服务业                 ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '16', '教育                                 ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '17', '卫生、社会保障和社会福利业           ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '18', '文化、体育和娱乐业                   ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '19', '公共管理和社会组织                   ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '20', '国际组织                             ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('profession_type', '99', '未知                                  ', '单位所属行业');
INSERT INTO `pub_static_def` VALUES ('company_duties', '1', '高级领导（行政级别局级及局级以上领导或大公司高级管理人员）     ', '担任职务');
INSERT INTO `pub_static_def` VALUES ('company_duties', '2', '中级领导（行政级别局级以下领导或大公司中级管理人员）           ', '担任职务');
INSERT INTO `pub_static_def` VALUES ('company_duties', '3', '一般员工                                                       ', '担任职务');
INSERT INTO `pub_static_def` VALUES ('company_duties', '4', '其他                                                           ', '担任职务');
INSERT INTO `pub_static_def` VALUES ('company_duties', '99', '未知                                                           ', '担任职务');
INSERT INTO `pub_static_def` VALUES ('living_type', '1', '自置            ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '2', '按揭            ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '3', '亲属楼宇        ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '4', '集体宿舍        ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '5', '租房            ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '6', '共有住宅        ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '7', '其他            ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('living_type', '99', '未知            ', '居住状况');
INSERT INTO `pub_static_def` VALUES ('cert_validitytype', '1', '无有效期', '证件有效类型');
INSERT INTO `pub_static_def` VALUES ('cert_validitytype', '2', '有有效期 ', '证件有效类型');
INSERT INTO `pub_static_def` VALUES ('cert_validitytype', '3', '永久有效', '证件有效类型');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CNY', '人民币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'GBP', '英镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'EUR', '欧元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CAD', '加拿大元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'AED', '阿联酋迪拉姆', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ALL', '阿尔尼亚列克', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ATS', '奥地利先令', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'AUD', '澳大利亚元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BDT', '孟加拉国塔卡', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BEF', '比利时法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BGL', '保加利亚列瓦', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BHD', '巴林第纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BIF', '布隆迪法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BRL', '巴西里亚尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BUK', '缅甸币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'BWP', '博茨瓦纳普拉', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CFC', '记帐法国法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CHF', '瑞士法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CPS', '记帐英镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CSF', '记帐瑞士法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CSK', '捷克克朗', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CUR', '清算卢布', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CUS', '记帐美元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'CYP', '塞浦路斯镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'DEM', '德国马克', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'DKK', '丹麦克朗', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'DZD', '阿尔及利亚第纳', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'EGP', '埃及镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ESP', '西班牙比塞塔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ETB', '埃塞俄比亚比尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'FIM', '芬兰马克', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'FRF', '法国法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'GHC', '加纳塞地', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'GNS', '几内亚西里', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'GRD', '希腊德拉马克', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'HKD', '港币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'HUF', '匈牙利福林', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'IDR', '印度尼西亚卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'INR', '印度罗比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'IQD', '伊拉克地纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'IRR', '伊朗里亚尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ITL', '意大利里拉', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'JOD', '约旦第纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'JPY', '日元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'KES', '肯尼亚先令', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'KPW', '朝鲜币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'KRW', '韩元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'KWD', '科威特第纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'LKR', '斯里兰卡卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'LYD', '利比亚第纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MAD', '摩洛哥地拉姆', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MGF', '马达加斯加法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MLF', '马里法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MNT', '蒙古图格里克', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MOP', '澳门币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MUR', '毛里求斯卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MXP', '墨西哥比索', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'MYR', '马币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'NGN', '尼日利亚奈拉', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'NLG', '荷兰盾', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'NOK', '挪威克朗', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'NPR', '尼泊尔卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'NZD', '新西兰元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'PGK', '巴布亚新基那', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'PHP', '菲律宾比索', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'PKR', '巴基斯坦卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'PLZ', '波兰兹罗提', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ROL', '罗马尼亚列依', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'RUB', '俄国卢布', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'RWF', '卢旺达法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SCR', '塞舌尔卢比', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SDP', '苏丹镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SEK', '瑞典克朗', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SGD', '新加坡元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SLL', '塞拉利昂', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SUR', '苏联卢布', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'SYP', '叙利亚镑', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'THB', '泰币', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'TND', '突尼斯第纳尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'TRL', '土耳其里拉', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'TWD', '台湾元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'TZS', '坦桑尼亚先令', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'UDM', '蒙古美元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'USD', '美元', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'VND', '越南盾', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'XAG', '白银', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'XAU', '黄金', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'XDR', '特别提款权', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'XEU', '欧洲货币单位', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'XOF', '西非共同体法郎', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'YER', '也门里亚尔', '币种');
INSERT INTO `pub_static_def` VALUES ('currency_type', 'ZMK', '赞比亚克瓦查', '币种');
INSERT INTO `pub_static_def` VALUES ('cust_property', '1', '企业法人', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '2', '非法人企业 ', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '3', '机关、事业单位', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '4', '团级(含)以上军队、武警部队及分散执勤的支（分）队 ', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '5', '社会团体', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '6', '民办非企业组织', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '7', '异地常设机构', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '8', '外国驻华机构', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '9', '个体工商户', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '10', '居民委员会、村民委员会、社区委员会', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '11', '单位设立的独立核算的附属机构', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('cust_property', '12', '其他组织', '借款人性质');
INSERT INTO `pub_static_def` VALUES ('registration_type', '100', '内资企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '110', '国有企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '120', '集体企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '130', '股份合作企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '140', '联营企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '150', '有限责任公司', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '160', '股份有限公司', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '170', '私营企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '200', '三资企业（港、澳、台投资企业）', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '300', '外商投资企业', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '400', '个体经营', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('registration_type', '500', '其它', '登记注册类型');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A', '农、林、牧、渔业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A01', '农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A011', '谷物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0111', '稻谷种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0112', '小麦种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0113', '玉米种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0119', '其他谷物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A012', '豆类、油料和薯类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0121', '豆类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0122', '油料种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0123', '薯类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A013', '棉、麻、糖、烟草种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0131', '棉花种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0132', '麻类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0133', '糖料种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0134', '烟草种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A014', '蔬菜、食用菌及园艺作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0141', '蔬菜种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0142', '食用菌种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0143', '花卉种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0149', '其他园艺作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A015', '水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0151', '仁果类和核果类水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0152', '葡萄种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0153', '柑橘类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0154', '香蕉等亚热带水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0159', '其他水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A016', '坚果、含油果、香料和饮料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0161', '坚果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0162', '含油果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0163', '香料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0169', '茶及其他饮料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A017', '中药材种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0170', '中药材种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A019', '其他农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0190', '其他农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A02', '林业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A021', '林木育种和育苗', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0211', '林木育种', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0212', '林木育苗', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A022', '造林和更新', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0220', '造林和更新', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A023', '森林经营和管护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0230', '森林经营和管护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A024', '木材和竹材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0241', '木材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0242', '竹材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A025', '林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0251', '木竹材林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0252', '非木竹材林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A03', '畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A031', '牲畜饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0311', '牛的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0312', '马的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0313', '猪的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0314', '羊的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0315', '骆驼饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0319', '其他牲畜饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A032', '家禽饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0321', '鸡的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0322', '鸭的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0323', '鹅的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0329', '其他家禽饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A033', '狩猎和捕捉动物', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0330', '狩猎和捕捉动物', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A039', '其他畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0390', '其他畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A04', '渔业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A041', '水产养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0411', '海水养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0412', '内陆养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A042', '水产捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0421', '海水捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0422', '内陆捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A05', '农、林、牧、渔服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A051', '农业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0511', '农业机械服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0512', '灌溉服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0513', '农产品初加工服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0519', '其他农业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A052', '林业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0521', '林业有害生物防治服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0522', '森林防火服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0523', '林产品初级加工服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0529', '其他林业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A053', '畜牧服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0530', '畜牧服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A054', '渔业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'A0540', '渔业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B', '采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B06', '煤炭开采和洗选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B061', '烟煤和无烟煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0610', '烟煤和无烟煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B062', '褐煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0620', '褐煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B069', '其他煤炭采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0690', '其他煤炭采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B07', '石油和天然气开采业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B071', '石油开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0710', '石油开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B072', '天然气开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0720', '天然气开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B08', '黑色金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B081', '铁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0810', '铁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B082', '锰矿、铬矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0820', '锰矿、铬矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B089', '其他黑色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0890', '其他黑色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B09', '有色金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B091', '常用有色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0911', '铜矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0912', '铅锌矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0913', '镍钴矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0914', '锡矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0915', '锑矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0916', '铝矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0917', '镁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0919', '其他常用有色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B092', '贵金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0921', '金矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0922', '银矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0929', '其他贵金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B093', '稀有稀土金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0931', '钨钼矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0932', '稀土金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0933', '放射性金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B0939', '其他稀有金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B10', '非金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B101', '土砂石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1011', '石灰石、石膏开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1012', '建筑装饰用石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1013', '耐火土石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1019', '粘土及其他土砂石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B102', '化学矿开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1020', '化学矿开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B103', '采盐', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1030', '采盐', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B109', '石棉及其他非金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1091', '石棉、云母矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1092', '石墨、滑石采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1093', '宝石、玉石采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1099', '其他未列明非金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B11', '开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B111', '煤炭开采和洗选辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1110', '煤炭开采和洗选辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B112', '石油和天然气开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1120', '石油和天然气开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B119', '其他开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1190', '其他开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B12', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B120', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'B1200', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C', '制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C13', '农副食品加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C131', '谷物磨制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1310', '谷物磨制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C132', '饲料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1320', '饲料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C133', '植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1331', '食用植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1332', '非食用植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C134', '制糖业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1340', '制糖业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C135', '屠宰及肉类加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1351', '牲畜屠宰', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1352', '禽类屠宰', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1353', '肉制品及副产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C136', '水产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1361', '水产品冷冻加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1362', '鱼糜制品及水产品干腌制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1363', '水产饲料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1364', '鱼油提取及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1369', '其他水产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C137', '蔬菜、水果和坚果加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1371', '蔬菜加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1372', '水果和坚果加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C139', '其他农副食品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1391', '淀粉及淀粉制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1392', '豆制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1393', '蛋品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1399', '其他未列明农副食品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C14', '食品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C141', '焙烤食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1411', '糕点、面包制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1419', '饼干及其他焙烤食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C142', '糖果、巧克力及蜜饯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1421', '糖果、巧克力制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1422', '蜜饯制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C143', '方便食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1431', '米、面制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1432', '速冻食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1439', '方便面及其他方便食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C144', '乳制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1440', '乳制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C145', '罐头食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1451', '肉、禽类罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1452', '水产品罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1453', '蔬菜、水果罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1459', '其他罐头食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C146', '调味品、发酵制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1461', '味精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1462', '酱油、食醋及类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1469', '其他调味品、发酵制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C149', '其他食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1491', '营养食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1492', '保健食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1493', '冷冻饮品及食用冰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1494', '盐加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1495', '食品及饲料添加剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1499', '其他未列明食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C15', '酒、饮料和精制茶制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C151', '酒的制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1511', '酒精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1512', '白酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1513', '啤酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1514', '黄酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1515', '葡萄酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1519', '其他酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C152', '饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1521', '碳酸饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1522', '瓶（罐）装饮用水制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1523', '果菜汁及果菜汁饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1524', '含乳饮料和植物蛋白饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1525', '固体饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1529', '茶饮料及其他饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C153', '精制茶加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1530', '精制茶加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C16', '烟草制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C161', '烟叶复烤', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1610', '烟叶复烤', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C162', '卷烟制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1620', '卷烟制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C169', '其他烟草制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1690', '其他烟草制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C17', '纺织业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C171', '棉纺织及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1711', '棉纺纱加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1712', '棉织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1713', '棉印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C172', '毛纺织及染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1721', '毛条和毛纱线加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1722', '毛织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1723', '毛染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C173', '麻纺织及染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1731', '麻纤维纺前加工和纺纱', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1732', '麻织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1733', '麻染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C174', '丝绢纺织及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1741', '缫丝加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1742', '绢纺和丝织加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1743', '丝印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C175', '化纤织造及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1751', '化纤织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1752', '化纤织物染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C176', '针织或钩针编织物及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1761', '针织或钩针编织物织造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1762', '针织或钩针编织物印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1763', '针织或钩针编织品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C177', '家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1771', '床上用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1772', '毛巾类制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1773', '窗帘、布艺类产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1779', '其他家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C178', '非家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1781', '非织造布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1782', '绳、索、缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1783', '纺织带和帘子布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1784', '篷、帆布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1789', '其他非家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C18', '纺织服装、服饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C181', '机织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1810', '机织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C182', '针织或钩针编织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1820', '针织或钩针编织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C183', '服饰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1830', '服饰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C19', '皮革、毛皮、羽毛及其制品和制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C191', '皮革鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1910', '皮革鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C192', '皮革制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1921', '皮革服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1922', '皮箱、包（袋）制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1923', '皮手套及皮装饰制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1929', '其他皮革制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C193', '毛皮鞣制及制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1931', '毛皮鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1932', '毛皮服装加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1939', '其他毛皮制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C194', '羽毛(绒)加工及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1941', '羽毛（绒）加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1942', '羽毛（绒）制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C195', '制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1951', '纺织面料鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1952', '皮鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1953', '塑料鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1954', '橡胶鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C1959', '其他制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C20', '木材加工和木、竹、藤、棕、草制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C201', '木材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2011', '锯材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2012', '木片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2013', '单板加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2019', '其他木材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C202', '人造板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2021', '胶合板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2022', '纤维板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2023', '刨花板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2029', '其他人造板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C203', '木制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2031', '建筑用木料及木材组件加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2032', '木门窗、楼梯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2033', '地板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2034', '木制容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2039', '软木制品及其他木制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C204', '竹、藤、棕、草等制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2041', '竹制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2042', '藤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2043', '棕制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2049', '草及其他制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C21', '家具制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C211', '木质家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2110', '木质家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C212', '竹、藤家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2120', '竹、藤家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C213', '金属家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2130', '金属家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C214', '塑料家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2140', '塑料家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C219', '其他家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2190', '其他家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C22', '造纸和纸制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C221', '纸浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2211', '木竹浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2212', '非木竹浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C222', '造纸', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2221', '机制纸及纸板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2222', '手工纸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2223', '加工纸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C223', '纸制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2231', '纸和纸板容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2239', '其他纸制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C23', '印刷和记录媒介复制业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C231', '印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2311', '书、报刊印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2312', '本册印制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2319', '包装装潢及其他印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C232', '装订及印刷相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2320', '装订及印刷相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C233', '记录媒介复制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2330', '记录媒介复制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C24', '文教、工美、体育和娱乐用品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C241', '文教办公用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2411', '文具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2412', '笔的制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2413', '教学用模型及教具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2414', '墨水、墨汁制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2419', '其他文教办公用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C242', '乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2421', '中乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2422', '西乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2423', '电子乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2429', '其他乐器及零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C243', '工艺美术品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2431', '雕塑工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2432', '金属工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2433', '漆器工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2434', '花画工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2435', '天然植物纤维编织工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2436', '抽纱刺绣工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2437', '地毯、挂毯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2438', '珠宝首饰及有关物品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2439', '其他工艺美术品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C244', '体育用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2441', '球类制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2442', '体育器材及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2443', '训练健身器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2444', '运动防护用具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2449', '其他体育用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C245', '玩具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2450', '玩具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C246', '游艺器材及娱乐用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2461', '露天游乐场所游乐设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2462', '游艺用品及室内游艺器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2469', '其他娱乐用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C25', '石油加工、炼焦和核燃料加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C251', '精炼石油产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2511', '原油加工及石油制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2512', '人造原油制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C252', '炼焦', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2520', '炼焦', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C253', '核燃料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2530', '核燃料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C26', '化学原料和化学制品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C261', '基础化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2611', '无机酸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2612', '无机碱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2613', '无机盐制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2614', '有机化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2619', '其他基础化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C262', '肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2621', '氮肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2622', '磷肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2623', '钾肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2624', '复混肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2625', '有机肥料及微生物肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2629', '其他肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C263', '农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2631', '化学农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2632', '生物化学农药及微生物农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C264', '涂料、油墨、颜料及类似产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2641', '涂料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2642', '油墨及类似产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2643', '颜料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2644', '染料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2645', '密封用填料及类似品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C265', '合成材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2651', '初级形态塑料及合成树脂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2652', '合成橡胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2653', '合成纤维单（聚合）体制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2659', '其他合成材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C266', '专用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2661', '化学试剂和助剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2662', '专项化学用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2663', '林产化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2664', '信息化学品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2665', '环境污染处理专用药剂材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2666', '动物胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2669', '其他专用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C267', '炸药、火工及焰火产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2671', '炸药及火工产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2672', '焰火、鞭炮产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C268', '日用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2681', '肥皂及合成洗涤剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2682', '化妆品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2683', '口腔清洁用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2684', '香料、香精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2689', '其他日用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C27', '医药制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C271', '化学药品原料药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2710', '化学药品原料药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C272', '化学药品制剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2720', '化学药品制剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C273', '中药饮片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2730', '中药饮片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C274', '中成药生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2740', '中成药生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C275', '兽用药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2750', '兽用药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C276', '生物药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2760', '生物药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C277', '卫生材料及医药用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2770', '卫生材料及医药用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C28', '化学纤维制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C281', '纤维素纤维原料及纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2811', '化纤浆粕制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2812', '人造纤维（纤维素纤维）制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C282', '合成纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2821', '锦纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2822', '涤纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2823', '腈纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2824', '维纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2825', '丙纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2826', '氨纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2829', '其他合成纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C29', '橡胶和塑料制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C291', '橡胶制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2911', '轮胎制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2912', '橡胶板、管、带制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2913', '橡胶零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2914', '再生橡胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2915', '日用及医用橡胶制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2919', '其他橡胶制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C292', '塑料制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2921', '塑料薄膜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2922', '塑料板、管、型材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2923', '塑料丝、绳及编织品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2924', '泡沫塑料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2925', '塑料人造革、合成革制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2926', '塑料包装箱及容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2927', '日用塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2928', '塑料零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C2929', '其他塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C30', '非金属矿物制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C301', '水泥、石灰和石膏制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3011', '水泥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3012', '石灰和石膏制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C302', '石膏、水泥制品及类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3021', '水泥制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3022', '砼结构构件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3023', '石棉水泥制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3024', '轻质建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3029', '其他水泥类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C303', '砖瓦、石材等建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3031', '粘土砖瓦及建筑砌块制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3032', '建筑陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3033', '建筑用石加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3034', '防水建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3035', '隔热和隔音材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3039', '其他建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C304', '玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3041', '平板玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3049', '其他玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C305', '玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3051', '技术玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3052', '光学玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3053', '玻璃仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3054', '日用玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3055', '玻璃包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3056', '玻璃保温容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3057', '制镜及类似品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3059', '其他玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C306', '玻璃纤维和玻璃纤维增强塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3061', '玻璃纤维及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3062', '玻璃纤维增强塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C307', '陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3071', '卫生陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3072', '特种陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3073', '日用陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3079', '园林、陈设艺术及其他陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C308', '耐火材料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3081', '石棉制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3082', '云母制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3089', '耐火陶瓷制品及其他耐火材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C309', '石墨及其他非金属矿物制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3091', '石墨及碳素制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3099', '其他非金属矿物制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C31', '黑色金属冶炼和压延加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C311', '炼铁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3110', '炼铁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C312', '炼钢', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3120', '炼钢', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C313', '黑色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3130', '黑色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C314', '钢压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3140', '钢压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C315', '铁合金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3150', '铁合金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C32', '有色金属冶炼和压延加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C321', '常用有色金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3211', '铜冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3212', '铅锌冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3213', '镍钴冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3214', '锡冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3215', '锑冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3216', '铝冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3217', '镁冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3219', '其他常用有色金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C322', '贵金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3221', '金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3222', '银冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3229', '其他贵金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C323', '稀有稀土金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3231', '钨钼冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3232', '稀土金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3239', '其他稀有金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C324', '有色金属合金制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3240', '有色金属合金制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C325', '有色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3250', '有色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C326', '有色金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3261', '铜压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3262', '铝压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3263', '贵金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3264', '稀有稀土金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3269', '其他有色金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C33', '金属制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C331', '结构性金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3311', '金属结构制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3312', '金属门窗制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C332', '金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3321', '切削工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3322', '手工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3323', '农用及园林用金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3324', '刀剪及类似日用金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3329', '其他金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C333', '集装箱及金属包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3331', '集装箱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3332', '金属压力容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3333', '金属包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C334', '金属丝绳及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3340', '金属丝绳及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C335', '建筑、安全用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3351', '建筑、家具用金属配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3352', '建筑装饰及水暖管道零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3353', '安全、消防用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3359', '其他建筑、安全用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C336', '金属表面处理及热处理加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3360', '金属表面处理及热处理加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C337', '搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3371', '生产专用搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3372', '建筑装饰搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3373', '搪瓷卫生洁具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3379', '搪瓷日用品及其他搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C338', '金属制日用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3381', '金属制厨房用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3382', '金属制餐具和器皿制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3383', '金属制卫生器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3389', '其他金属制日用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C339', '其他金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3391', '锻件及粉末冶金制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3392', '交通及公共管理用金属标牌制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3399', '其他未列明金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C34', '通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C341', '锅炉及原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3411', '锅炉及辅助设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3412', '内燃机及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3413', '汽轮机及辅机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3414', '水轮机及辅机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3415', '风能原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3419', '其他原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C342', '金属加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3421', '金属切削机床制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3422', '金属成形机床制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3423', '铸造机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3424', '金属切割及焊接设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3425', '机床附件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3429', '其他金属加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C343', '物料搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3431', '轻小型起重设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3432', '起重机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3433', '生产专用车辆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3434', '连续搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3435', '电梯、自动扶梯及升降机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3439', '其他物料搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C344', '泵、阀门、压缩机及类似机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3441', '泵及真空设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3442', '气体压缩机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3443', '阀门和旋塞制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3444', '液压和气压动力机械及元件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C345', '轴承、齿轮和传动部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3451', '轴承制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3452', '齿轮及齿轮减、变速箱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3459', '其他传动部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C346', '烘炉、风机、衡器、包装等设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3461', '烘炉、熔炉及电炉制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3462', '风机、风扇制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3463', '气体、液体分离及纯净设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3464', '制冷、空调设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3465', '风动和电动工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3466', '喷枪及类似器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3467', '衡器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3468', '包装专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C347', '文化、办公用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3471', '电影机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3472', '幻灯及投影设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3473', '照相机及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3474', '复印和胶印设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3475', '计算器及货币专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3479', '其他文化、办公用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C348', '通用零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3481', '金属密封件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3482', '紧固件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3483', '弹簧制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3484', '机械零部件加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3489', '其他通用零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C349', '其他通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3490', '其他通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C35', '专用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C351', '采矿、冶金、建筑专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3511', '矿山机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3512', '石油钻采专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3513', '建筑工程用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3514', '海洋工程专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3515', '建筑材料生产专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3516', '冶金专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C352', '化工、木材、非金属加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3521', '炼油、化工生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3522', '橡胶加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3523', '塑料加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3524', '木材加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3525', '模具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3529', '其他非金属加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C353', '食品、饮料、烟草及饲料生产专用设备制造　　　', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3531', '食品、酒、饮料及茶生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3532', '农副食品加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3533', '烟草生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3534', '饲料生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C354', '印刷、制药、日化及日用品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3541', '制浆和造纸专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3542', '印刷专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3543', '日用化工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3544', '制药专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3545', '照明器具生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3546', '玻璃、陶瓷和搪瓷制品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3549', '其他日用品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C355', '纺织、服装和皮革加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3551', '纺织专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3552', '皮革、毛皮及其制品加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3553', '缝制机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3554', '洗涤机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C356', '电子和电工机械专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3561', '电工机械专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3562', '电子工业专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C357', '农、林、牧、渔专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3571', '拖拉机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3572', '机械化农业及园艺机具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3573', '营林及木竹采伐机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3574', '畜牧机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3575', '渔业机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3576', '农林牧渔机械配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3577', '棉花加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3579', '其他农、林、牧、渔业机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C358', '医疗仪器设备及器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3581', '医疗诊断、监护及治疗设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3582', '口腔科用设备及器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3583', '医疗实验室及医用消毒设备和器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3584', '医疗、外科及兽医用器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3585', '机械治疗及病房护理设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3586', '假肢、人工器官及植（介）入器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3589', '其他医疗设备及器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C359', '环保、社会公共服务及其他专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3591', '环境保护专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3592', '地质勘查专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3593', '邮政专用机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3594', '商业、饮食、服务专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3595', '社会公共安全设备及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3596', '交通安全、管制及类似专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3597', '水资源专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3599', '其他专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C36', '汽车制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C361', '汽车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3610', '汽车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C362', '改装汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3620', '改装汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C363', '低速载货汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3630', '低速载货汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C364', '电车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3640', '电车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C365', '汽车车身、挂车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3650', '汽车车身、挂车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C366', '汽车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3660', '汽车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C37', '铁路、船舶、航空航天和其他运输设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C371', '铁路运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3711', '铁路机车车辆及动车组制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3712', '窄轨机车车辆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3713', '铁路机车车辆配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3714', '铁路专用设备及器材、配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3719', '其他铁路运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C372', '城市轨道交通设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3720', '城市轨道交通设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C373', '船舶及相关装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3731', '金属船舶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3732', '非金属船舶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3733', '娱乐船和运动船制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3734', '船用配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3735', '船舶改装与拆除', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3739', '航标器材及其他相关装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C374', '航空、航天器及设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3741', '飞机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3742', '航天器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3743', '航空、航天相关设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3749', '其他航空航天器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C375', '摩托车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3751', '摩托车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3752', '摩托车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C376', '自行车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3761', '脚踏自行车及残疾人座车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3762', '助动自行车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C377', '非公路休闲车及零配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3770', '非公路休闲车及零配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C379', '潜水救捞及其他未列明运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3791', '潜水及水下救捞装备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3799', '其他未列明运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C38', '电气机械和器材制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C381', '电机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3811', '发电机及发电机组制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3812', '电动机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3819', '微电机及其他电机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C382', '输配电及控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3821', '变压器、整流器和电感器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3822', '电容器及其配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3823', '配电开关控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3824', '电力电子元器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3825', '光伏设备及元器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3829', '其他输配电及控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C383', '电线、电缆、光缆及电工器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3831', '电线、电缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3832', '光纤、光缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3833', '绝缘制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3839', '其他电工器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C384', '电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3841', '锂离子电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3842', '镍氢电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3849', '其他电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C385', '家用电力器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3851', '家用制冷电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3852', '家用空气调节器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3853', '家用通风电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3854', '家用厨房电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3855', '家用清洁卫生电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3856', '家用美容、保健电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3857', '家用电力器具专用配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3859', '其他家用电力器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C386', '非电力家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3861', '燃气、太阳能及类似能源家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3869', '其他非电力家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C387', '照明器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3871', '电光源制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3872', '照明灯具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3879', '灯用电器附件及其他照明器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C389', '其他电气机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3891', '电气信号设备装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3899', '其他未列明电气机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C39', '计算机、通信和其他电子设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C391', '计算机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3911', '计算机整机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3912', '计算机零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3913', '计算机外围设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3919', '其他计算机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C392', '通信设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3921', '通信系统设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3922', '通信终端设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C393', '广播电视设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3931', '广播电视节目制作及发射设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3932', '广播电视接收设备及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3939', '应用电视设备及其他广播电视设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C394', '雷达及配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3940', '雷达及配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C395', '视听设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3951', '电视机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3952', '音响设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3953', '影视录放设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C396', '电子器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3961', '电子真空器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3962', '半导体分立器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3963', '集成电路制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3969', '光电子器件及其他电子器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C397', '电子元件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3971', '电子元件及组件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3972', '印制电路板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C399', '其他电子设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C3990', '其他电子设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C40', '仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C401', '通用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4011', '工业自动控制系统装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4012', '电工仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4013', '绘图、计算及测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4014', '实验分析仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4015', '试验机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4019', '供应用仪表及其他通用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C402', '专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4021', '环境监测专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4022', '运输设备及生产用计数仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4023', '导航、气象及海洋专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4024', '农林牧渔专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4025', '地质勘探和地震专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4026', '教学专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4027', '核子及核辐射测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4028', '电子测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4029', '其他专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C403', '钟表与计时仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4030', '钟表与计时仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C404', '光学仪器及眼镜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4041', '光学仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4042', '眼镜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C409', '其他仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4090', '其他仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C41', '其他制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C411', '日用杂品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4111', '鬃毛加工、制刷及清扫工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4119', '其他日用杂品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C412', '煤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4120', '煤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C413', '核辐射加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4130', '核辐射加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C419', '其他未列明制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4190', '其他未列明制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C42', '废弃资源综合利用业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C421', '金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4210', '金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C422', '非金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4220', '非金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C43', '金属制品、机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C431', '金属制品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4310', '金属制品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C432', '通用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4320', '通用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C433', '专用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4330', '专用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C434', '铁路、船舶、航空航天等运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4341', '铁路运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4342', '船舶修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4343', '航空航天器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4349', '其他运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C435', '电气设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4350', '电气设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C436', '仪器仪表修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4360', '仪器仪表修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C439', '其他机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'C4390', '其他机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D', '电力、热力、燃气及水生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D44', '电力、热力生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D441', '电力生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4411', '火力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4412', '水力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4413', '核力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4414', '风力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4415', '太阳能发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4419', '其他电力生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D442', '电力供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4420', '电力供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D443', '热力生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4430', '热力生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D45', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D450', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4500', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D46', '水的生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D461', '自来水生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4610', '自来水生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D462', '污水处理及其再生利用', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4620', '污水处理及其再生利用', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D469', '其他水的处理、利用与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'D4690', '其他水的处理、利用与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E', '建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E47', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E470', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4700', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E48', '土木工程建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E481', '铁路、道路、隧道和桥梁工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4811', '铁路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4812', '公路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4813', '市政道路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4819', '其他道路、隧道和桥梁工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E482', '水利和内河港口工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4821', '水源及供水设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4822', '河湖治理及防洪设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4823', '港口及航运设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E483', '海洋工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4830', '海洋工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E484', '工矿工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4840', '工矿工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E485', '架线和管道工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4851', '架线及设备工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4852', '管道工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E489', '其他土木工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4890', '其他土木工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E49', '建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E491', '电气安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4910', '电气安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E492', '管道和设备安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4920', '管道和设备安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E499', '其他建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E4990', '其他建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E50', '建筑装饰和其他建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E501', '建筑装饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E5010', '建筑装饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E502', '工程准备活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E5021', '建筑物拆除活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E5029', '其他工程准备活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E503', '提供施工设备服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E5030', '提供施工设备服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E509', '其他未列明建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'E5090', '其他未列明建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F', '批发和零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F51', '批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F511', '农、林、牧产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5111', '谷物、豆及薯类批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5112', '种子批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5113', '饲料批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5114', '棉、麻批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5115', '林业产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5116', '牲畜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5119', '其他农牧产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F512', '食品、饮料及烟草制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5121', '米、面制品及食用油批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5122', '糕点、糖果及糖批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5123', '果品、蔬菜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5124', '肉、禽、蛋、奶及水产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5125', '盐及调味品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5126', '营养和保健品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5127', '酒、饮料及茶叶批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5128', '烟草制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5129', '其他食品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F513', '纺织、服装及家庭用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5131', '纺织品、针织品及原料批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5132', '服装批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5133', '鞋帽批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5134', '化妆品及卫生用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5135', '厨房、卫生间用具及日用杂货批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5136', '灯具、装饰物品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5137', '家用电器批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5139', '其他家庭用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F514', '文化、体育用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5141', '文具用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5142', '体育用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5143', '图书批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5144', '报刊批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5145', '音像制品及电子出版物批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5146', '首饰、工艺品及收藏品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5149', '其他文化用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F515', '医药及医疗器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5151', '西药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5152', '中药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5153', '医疗用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F516', '矿产品、建材及化工产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5161', '煤炭及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5162', '石油及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5163', '非金属矿及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5164', '金属及金属矿批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5165', '建材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5166', '化肥批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5167', '农药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5168', '农用薄膜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5169', '其他化工产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F517', '机械设备、五金产品及电子产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5171', '农业机械批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5172', '汽车批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5173', '汽车零配件批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5174', '摩托车及零配件批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5175', '五金产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5176', '电气设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5177', '计算机、软件及辅助设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5178', '通讯及广播电视设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5179', '其他机械设备及电子产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F518', '贸易经纪与代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5181', '贸易代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5182', '拍卖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5189', '其他贸易经纪与代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F519', '其他批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5191', '再生物资回收与批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5199', '其他未列明批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F52', '零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F521', '综合零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5211', '百货零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5212', '超级市场零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5219', '其他综合零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F522', '食品、饮料及烟草制品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5221', '粮油零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5222', '糕点、面包零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5223', '果品、蔬菜零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5224', '肉、禽、蛋、奶及水产品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5225', '营养和保健品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5226', '酒、饮料及茶叶零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5227', '烟草制品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5229', '其他食品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F523', '纺织、服装及日用品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5231', '纺织品及针织品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5232', '服装零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5233', '鞋帽零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5234', '化妆品及卫生用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5235', '钟表、眼镜零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5236', '箱、包零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5237', '厨房用具及日用杂品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5238', '自行车零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5239', '其他日用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F524', '文化、体育用品及器材专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5241', '文具用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5242', '体育用品及器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5243', '图书、报刊零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5244', '音像制品及电子出版物零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5245', '珠宝首饰零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5246', '工艺美术品及收藏品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5247', '乐器零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5248', '照相器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5249', '其他文化用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F525', '医药及医疗器材专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5251', '药品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5252', '医疗用品及器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F526', '汽车、摩托车、燃料及零配件专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5261', '汽车零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5262', '汽车零配件零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5263', '摩托车及零配件零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5264', '机动车燃料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F527', '家用电器及电子产品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5271', '家用视听设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5272', '日用家电设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5273', '计算机、软件及辅助设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5274', '通信设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5279', '其他电子产品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F528', '五金、家具及室内装饰材料专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5281', '五金零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5282', '灯具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5283', '家具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5284', '涂料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5285', '卫生洁具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5286', '木质装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5287', '陶瓷、石材装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5289', '其他室内装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F529', '货摊、无店铺及其他零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5291', '货摊食品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5292', '货摊纺织、服装及鞋零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5293', '货摊日用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5294', '互联网零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5295', '邮购及电视、电话零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5296', '旧货零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5297', '生活用燃料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'F5299', '其他未列明零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G', '交通运输、仓储和邮政业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G53', '铁路运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G531', '铁路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5310', '铁路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G532', '铁路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5320', '铁路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G533', '铁路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5331', '客运火车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5332', '货运火车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5339', '其他铁路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G54', '道路运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G541', '城市公共交通运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5411', '公共电汽车客运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5412', '城市轨道交通', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5413', '出租车客运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5419', '其他城市公共交通运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G542', '公路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5420', '公路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G543', '道路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5430', '道路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G544', '道路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5441', '客运汽车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5442', '公路管理与养护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5449', '其他道路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G55', '水上运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G551', '水上旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5511', '海洋旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5512', '内河旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5513', '客运轮渡运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G552', '水上货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5521', '远洋货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5522', '沿海货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5523', '内河货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G553', '水上运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5531', '客运港口', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5532', '货运港口', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5539', '其他水上运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G56', '航空运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G561', '航空客货运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5611', '航空旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5612', '航空货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G562', '通用航空服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5620', '通用航空服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G563', '航空运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5631', '机场', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5632', '空中交通管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5639', '其他航空运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G57', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G570', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5700', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G58', '装卸搬运和运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G581', '装卸搬运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5810', '装卸搬运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G582', '运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5821', '货物运输代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5822', '旅客票务代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5829', '其他运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G59', '仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G591', '谷物、棉花等农产品仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5911', '谷物仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5912', '棉花仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5919', '其他农产品仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G599', '其他仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G5990', '其他仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G60', '邮政业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G601', '邮政基本服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G6010', '邮政基本服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G602', '快递服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'G6020', '快递服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H', '住宿和餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H61', '住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H611', '旅游饭店', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6110', '旅游饭店', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H612', '一般旅馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6120', '一般旅馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H619', '其他住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6190', '其他住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H62', '餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H621', '正餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6210', '正餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H622', '快餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6220', '快餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H623', '饮料及冷饮服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6231', '茶馆服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6232', '咖啡馆服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6233', '酒吧服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6239', '其他饮料及冷饮服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H629', '其他餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6291', '小吃服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6292', '餐饮配送服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'H6299', '其他未列明餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I', '信息传输、软件和信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I63', '电信、广播电视和卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I631', '电信', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6311', '固定电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6312', '移动电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6319', '其他电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I632', '广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6321', '有线广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6322', '无线广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I633', '卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6330', '卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I64', '互联网和相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I641', '互联网接入及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6410', '互联网接入及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I642', '互联网信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6420', '互联网信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I649', '其他互联网服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6490', '其他互联网服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I65', '软件和信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I651', '软件开发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6510', '软件开发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I652', '信息系统集成服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6520', '信息系统集成服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I653', '信息技术咨询服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6530', '信息技术咨询服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I654', '数据处理和存储服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6540', '数据处理和存储服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I655', '集成电路设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6550', '集成电路设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I659', '其他信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6591', '数字内容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6592', '呼叫中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'I6599', '其他未列明信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J', '金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J66', '货币金融服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J661', '中央银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6610', '中央银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J662', '货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6620', '货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J663', '非货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6631', '金融租赁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6632', '财务公司', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6633', '典当', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6639', '其他非货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J664', '银行监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6640', '银行监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J67', '资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J671', '证券市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6711', '证券市场管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6712', '证券经纪交易服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6713', '基金管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J672', '期货市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6721', '期货市场管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6729', '其他期货市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J673', '证券期货监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6730', '证券期货监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J674', '资本投资服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6740', '资本投资服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J679', '其他资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6790', '其他资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J68', '保险业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J681', '人身保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6811', '人寿保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6812', '健康和意外保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J682', '财产保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6820', '财产保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J683', '再保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6830', '再保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J684', '养老金', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6840', '养老金', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J685', '保险经纪与代理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6850', '保险经纪与代理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J686', '保险监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6860', '保险监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J689', '其他保险活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6891', '风险和损失评估', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6899', '其他未列明保险活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J69', '其他金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J691', '金融信托与管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6910', '金融信托与管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J692', '控股公司服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6920', '控股公司服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J693', '非金融机构支付服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6930', '非金融机构支付服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J694', '金融信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6940', '金融信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J699', '其他未列明金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'J6990', '其他未列明金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K', '房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K70', '房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K701', '房地产开发经营', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K7010', '房地产开发经营', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K702', '物业管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K7020', '物业管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K703', '房地产中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K7030', '房地产中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K704', '自有房地产经营活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K7040', '自有房地产经营活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K709', '其他房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'K7090', '其他房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L', '租赁和商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L71', '租赁业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L711', '机械设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7111', '汽车租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7112', '农业机械租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7113', '建筑工程机械与设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7114', '计算机及通讯设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7119', '其他机械与设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L712', '文化及日用品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7121', '娱乐及体育设备出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7122', '图书出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7123', '音像制品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7129', '其他文化及日用品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L72', '商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L721', '企业管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7211', '企业总部管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7212', '投资与资产管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7213', '单位后勤管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7219', '其他企业管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L722', '法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7221', '律师及相关法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7222', '公证服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7229', '其他法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L723', '咨询与调查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7231', '会计、审计及税务服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7232', '市场调查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7233', '社会经济咨询', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7239', '其他专业咨询', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L724', '广告业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7240', '广告业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L725', '知识产权服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7250', '知识产权服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L726', '人力资源服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7261', '公共就业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7262', '职业中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7263', '劳务派遣服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7269', '其他人力资源服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L727', '旅行社及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7271', '旅行社服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7272', '旅游管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7279', '其他旅行社相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L728', '安全保护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7281', '安全服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7282', '安全系统监控服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7289', '其他安全保护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L729', '其他商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7291', '市场管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7292', '会议及展览服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7293', '包装服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7294', '办公服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7295', '信用服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7296', '担保服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'L7299', '其他未列明商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M', '科学研究和技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M73', '研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M731', '自然科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7310', '自然科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M732', '工程和技术研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7320', '工程和技术研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M733', '农业科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7330', '农业科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M734', '医学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7340', '医学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M735', '社会人文科学研究', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7350', '社会人文科学研究', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M74', '专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M741', '气象服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7410', '气象服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M742', '地震服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7420', '地震服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M743', '海洋服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7430', '海洋服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M744', '测绘服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7440', '测绘服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M745', '质检技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7450', '质检技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M746', '环境与生态监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7461', '环境保护监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7462', '生态监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M747', '地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7471', '能源矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7472', '固体矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7473', '水、二氧化碳等矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7474', '基础地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7475', '地质勘查技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M748', '工程技术', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7481', '工程管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7482', '工程勘察设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7483', '规划管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M749', '其他专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7491', '专业化设计服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7492', '摄影扩印服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7493', '兽医服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7499', '其他未列明专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M75', '科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M751', '技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7511', '农业技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7512', '生物技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7513', '新材料技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7514', '节能技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7519', '其他技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M752', '科技中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7520', '科技中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M759', '其他科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'M7590', '其他科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N', '水利、环境和公共设施管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N76', '水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N761', '防洪除涝设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7610', '防洪除涝设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N762', '水资源管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7620', '水资源管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N763', '天然水收集与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7630', '天然水收集与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N764', '水文服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7640', '水文服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N769', '其他水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7690', '其他水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N77', '生态保护和环境治理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N771', '生态保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7711', '自然保护区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7712', '野生动物保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7713', '野生植物保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7719', '其他自然保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N772', '环境治理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7721', '水污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7722', '大气污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7723', '固体废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7724', '危险废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7725', '放射性废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7729', '其他污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N78', '公共设施管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N781', '市政设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7810', '市政设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N782', '环境卫生管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7820', '环境卫生管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N783', '城乡市容管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7830', '城乡市容管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N784', '绿化管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7840', '绿化管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N785', '公园和游览景区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7851', '公园管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'N7852', '游览景区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O', '居民服务、修理和其他服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O79', '居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O791', '家庭服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7910', '家庭服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O792', '托儿所服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7920', '托儿所服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O793', '洗染服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7930', '洗染服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O794', '理发及美容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7940', '理发及美容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O795', '洗浴服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7950', '洗浴服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O796', '保健服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7960', '保健服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O797', '婚姻服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7970', '婚姻服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O798', '殡葬服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7980', '殡葬服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O799', '其他居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O7990', '其他居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O80', '机动车、电子产品和日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O801', '汽车、摩托车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8011', '汽车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8012', '摩托车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O802', '计算机和办公设备维修', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8021', '计算机和辅助设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8022', '通讯设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8029', '其他办公设备维修', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O803', '家用电器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8031', '家用电子产品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8032', '日用电器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O809', '其他日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8091', '自行车修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8092', '鞋和皮革修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8093', '家具和相关物品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8099', '其他未列明日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O81', '其他服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O811', '清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8111', '建筑物清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8119', '其他清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O819', '其他未列明服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'O8190', '其他未列明服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P', '教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P82', '教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P821', '学前教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8210', '学前教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P822', '初等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8221', '普通小学教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8222', '成人小学教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P823', '中等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8231', '普通初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8232', '职业初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8233', '成人初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8234', '普通高中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8235', '成人高中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8236', '中等职业学校教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P824', '高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8241', '普通高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8242', '成人高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P825', '特殊教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8250', '特殊教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P829', '技能培训、教育辅助及其他教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8291', '职业技能培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8292', '体校及体育培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8293', '文化艺术培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8294', '教育辅助服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'P8299', '其他未列明教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q', '卫生和社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q83', '卫生', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q831', '医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8311', '综合医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8312', '中医医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8313', '中西医结合医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8314', '民族医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8315', '专科医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8316', '疗养院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q832', '社区医疗与卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8321', '社区卫生服务中心（站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8322', '街道卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8323', '乡镇卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q833', '门诊部（所）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8330', '门诊部（所）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q834', '计划生育技术服务活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8340', '计划生育技术服务活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q835', '妇幼保健院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8350', '妇幼保健院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q836', '专科疾病防治院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8360', '专科疾病防治院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q837', '疾病预防控制中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8370', '疾病预防控制中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q839', '其他卫生活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8390', '其他卫生活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q84', '社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q841', '提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8411', '干部休养所', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8412', '护理机构服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8413', '精神康复服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8414', '老年人、残疾人养护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8415', '孤残儿童收养和庇护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8419', '其他提供住宿社会救助', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q842', '不提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8421', '社会看护与帮助服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'Q8429', '其他不提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R', '文化、体育和娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R85', '新闻和出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R851', '新闻业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8510', '新闻业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R852', '出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8521', '图书出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8522', '报纸出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8523', '期刊出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8524', '音像制品出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8525', '电子出版物出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8529', '其他出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R86', '广播、电视、电影和影视录音制作业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R861', '广播', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8610', '广播', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R862', '电视', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8620', '电视', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R863', '电影和影视节目制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8630', '电影和影视节目制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R864', '电影和影视节目发行', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8640', '电影和影视节目发行', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R865', '电影放映', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8650', '电影放映', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R866', '录音制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8660', '录音制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R87', '文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R871', '文艺创作与表演', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8710', '文艺创作与表演', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R872', '艺术表演场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8720', '艺术表演场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R873', '图书馆与档案馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8731', '图书馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8732', '档案馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R874', '文物及非物质文化遗产保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8740', '文物及非物质文化遗产保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R875', '博物馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8750', '博物馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R876', '烈士陵园、纪念馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8760', '烈士陵园、纪念馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R877', '群众文化活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8770', '群众文化活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R879', '其他文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8790', '其他文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R88', '体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R881', '体育组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8810', '体育组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R882', '体育场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8820', '体育场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R883', '休闲健身活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8830', '休闲健身活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R889', '其他体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8890', '其他体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R89', '娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R891', '室内娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8911', '歌舞厅娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8912', '电子游艺厅娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8913', '网吧活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8919', '其他室内娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R892', '游乐园', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8920', '游乐园', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R893', '彩票活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8930', '彩票活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R894', '文化、娱乐、体育经纪代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8941', '文化娱乐经纪人', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8942', '体育经纪人', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8949', '其他文化艺术经纪代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R899', '其他娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'R8990', '其他娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S', '公共管理、社会保障和社会组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S90', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S900', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9000', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S91', '国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S911', '国家权力机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9110', '国家权力机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S912', '国家行政机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9121', '综合事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9122', '对外事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9123', '公共安全管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9124', '社会事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9125', '经济事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9126', '行政监督检查机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S913', '人民法院和人民检察院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9131', '人民法院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9132', '人民检察院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S919', '其他国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9190', '其他国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S92', '人民政协、民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S921', '人民政协', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9210', '人民政协', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S922', '民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9220', '民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S93', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S930', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9300', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S94', '群众团体、社会团体和其他成员组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S941', '群众团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9411', '工会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9412', '妇联', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9413', '共青团', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9419', '其他群众团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S942', '社会团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9421', '专业性团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9422', '行业性团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9429', '其他社会团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S943', '基金会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9430', '基金会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S944', '宗教组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9440', '宗教组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S95', '基层群众自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S951', '社区自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9510', '社区自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S952', '村民自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'S9520', '村民自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'T', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'T96', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'T960', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('profession_type_flag', 'T9600', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A', '公有控股经济', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A01', '国有控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A0101', '国有相对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A0102', '国有绝对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A02', '集体控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A0201', '集体相对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'A0202', '集体绝对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B', '非公有控股经济', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B01', '私人控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0101', '私人相对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0102', '私人绝对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B02', '港澳台控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0201', '港澳台相对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0202', '港澳台绝对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B03', '外商控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0301', '外商相对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_qykglx', 'B0302', '外商绝对控股', '企业控股类型');
INSERT INTO `pub_static_def` VALUES ('cust_cyzctd', '1', '鼓励', '产业政策特点');
INSERT INTO `pub_static_def` VALUES ('cust_cyzctd', '2', '限制', '产业政策特点');
INSERT INTO `pub_static_def` VALUES ('cust_cyzctd', '3', '其他', '产业政策特点');
INSERT INTO `pub_static_def` VALUES ('loan_type', '1', '定期贷款', '贷款类型');
INSERT INTO `pub_static_def` VALUES ('loan_type', '2', '循环贷款', '贷款类型');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '0', '补录中', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('bzrlx', '0', '自然人', '保证人类型');
INSERT INTO `pub_static_def` VALUES ('bzrlx', '1', '担保公司', '保证人类型');
INSERT INTO `pub_static_def` VALUES ('cust_status', '1', '已建立', '客户的状态');
INSERT INTO `pub_static_def` VALUES ('cust_status', '2', '待补录', '客户的状态');
INSERT INTO `pub_static_def` VALUES ('cust_status', '3', '已补录', '客户的状态');
INSERT INTO `pub_static_def` VALUES ('cust_status', '4', '补录退回', '客户的状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '10', '已补录', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('FL_SPZT', '11', '补录退回', '标准审批状态');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '12', '士兵证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('per_id_type', '13', '澳门居民来往内地通行证', '个人证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '63', '工商核准号', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '64', '金融许可证', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('cor_id_type', '65', '审批件', '企业证件类型');
INSERT INTO `pub_static_def` VALUES ('SEX_', '3', '未说明性别', '性别');
INSERT INTO `pub_static_def` VALUES ('SEX_', '4', '未知性别', '性别');
INSERT INTO `pub_static_def` VALUES ('bill_mode', '1', '纸票', '承兑汇票开票方式');
INSERT INTO `pub_static_def` VALUES ('bill_mode', '2', '电票', '承兑汇票开票方式');

-- ----------------------------
-- Table structure for pub_static_def_copy
-- ----------------------------
DROP TABLE IF EXISTS `pub_static_def_copy`;
CREATE TABLE `pub_static_def_copy` (
  `key_` varchar(96) DEFAULT NULL,
  `value_` varchar(192) DEFAULT NULL,
  `name_` varchar(96) DEFAULT NULL,
  `ps` varchar(384) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_static_def_copy
-- ----------------------------
INSERT INTO `pub_static_def_copy` VALUES ('SEX_', '1', '男', '性别');
INSERT INTO `pub_static_def_copy` VALUES ('SEX_', '2', '女', '性别');
INSERT INTO `pub_static_def_copy` VALUES ('YESORNO', '1', '是', '是');
INSERT INTO `pub_static_def_copy` VALUES ('YESORNO', '2', '否', '否');
INSERT INTO `pub_static_def_copy` VALUES ('CHA', 'P', '百分比', '变动系数');
INSERT INTO `pub_static_def_copy` VALUES ('CHA', 'A', '百分点', '变动系数');
INSERT INTO `pub_static_def_copy` VALUES ('pay_type', '1', '自主支付', '支付类型');
INSERT INTO `pub_static_def_copy` VALUES ('pay_type', '2', '受托支付', '支付类型');
INSERT INTO `pub_static_def_copy` VALUES ('repay_type', '1', '对月对日', '还款日类型');
INSERT INTO `pub_static_def_copy` VALUES ('repay_type', '2', '指定还款日', '还款日类型');
INSERT INTO `pub_static_def_copy` VALUES ('repay_type', '3', '固定日扣款', '还款日类型');
INSERT INTO `pub_static_def_copy` VALUES ('house_type', '1', '自住型', '房屋类型');
INSERT INTO `pub_static_def_copy` VALUES ('house_type', '2', '商用型', '房屋类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '01', '身份证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '02', '军官证\r\n', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '03', '户口簿\r\n', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '04', '护照\r\n', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '0', '已取消', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '1', '待审批', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '2', '审批中', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '3', '审批通过', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '4', '审批未通过', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '5', '已生效', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('rat_adj_eff_time', '1', '不生效', '利率调整生效方式');
INSERT INTO `pub_static_def_copy` VALUES ('rat_adj_eff_time', '2', '立即生效', '利率调整生效方式');
INSERT INTO `pub_static_def_copy` VALUES ('rat_adj_eff_time', '3', '下一结息周期生效', '利率调整生效方式');
INSERT INTO `pub_static_def_copy` VALUES ('rat_adj_eff_time', '4', '次年1月1日生效', '利率调整生效方式');
INSERT INTO `pub_static_def_copy` VALUES ('gua_type', '1', '信用', '担保方式');
INSERT INTO `pub_static_def_copy` VALUES ('gua_type', '2', '保证', '担保方式');
INSERT INTO `pub_static_def_copy` VALUES ('gua_type', '3', '抵押', '担保方式');
INSERT INTO `pub_static_def_copy` VALUES ('gua_type', '4', '质押', '担保方式');
INSERT INTO `pub_static_def_copy` VALUES ('rep_way', '2', '等额本金', '还款方式');
INSERT INTO `pub_static_def_copy` VALUES ('rep_way', '1', '等额本息', '还款方式');
INSERT INTO `pub_static_def_copy` VALUES ('rep_way', '3', '按月付息一次还本', '还款方式');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '1', '待审批', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '2', '审批中', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '3', '审批通过', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '4', '待放款', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '6', '处理中', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '7', '已放款', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '8', '已结清', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '0', '已取消', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('assessment_type', '1', '收益现值方式', '评估方式');
INSERT INTO `pub_static_def_copy` VALUES ('assessment_type', '2', '重置成本方式', '评估方式');
INSERT INTO `pub_static_def_copy` VALUES ('assessment_type', '3', '现行市价方式', '评估方式');
INSERT INTO `pub_static_def_copy` VALUES ('assessment_type', '4', '清算价格方式', '评估方式');
INSERT INTO `pub_static_def_copy` VALUES ('assessment_type', '5', '其他方式', '评估方式');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_status', '1', '待入库', '押品状态');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_status', '2', '已入库', '押品状态');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_status', '4', '已注销', '押品状态');
INSERT INTO `pub_static_def_copy` VALUES ('gua_form', '1', '单人担保', '保证形式');
INSERT INTO `pub_static_def_copy` VALUES ('gua_form', '2', '多人联保', '变更类型');
INSERT INTO `pub_static_def_copy` VALUES ('gua_form', '3', '多人分保', '变更类型');
INSERT INTO `pub_static_def_copy` VALUES ('dispute_sol', '1', '双方协商', '争议解决方式');
INSERT INTO `pub_static_def_copy` VALUES ('REPAYMENT_TYPE', '1', '欠款归还', '还款类型');
INSERT INTO `pub_static_def_copy` VALUES ('REPAYMENT_TYPE', '2', '提前部分还本', '还款类型');
INSERT INTO `pub_static_def_copy` VALUES ('REPAYMENT_TYPE', '3', '贷款结清', '还款类型');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_way', '1', '变额不变期', '还款计划变更方式');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_way', '2', '变期不变额', '还款计划变更方式');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_choose', '1', '现金还款', '还款选择');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_choose', '2', '约定账户还款', '还款选择');
INSERT INTO `pub_static_def_copy` VALUES ('draft_type', '1', '银承', '汇票种类');
INSERT INTO `pub_static_def_copy` VALUES ('draft_type', '2', '商承', '汇票种类');
INSERT INTO `pub_static_def_copy` VALUES ('land_type', '1', '商业', '土地类型');
INSERT INTO `pub_static_def_copy` VALUES ('land_type', '2', '住宅', '土地类型');
INSERT INTO `pub_static_def_copy` VALUES ('land_type', '3', '工业', '土地类型');
INSERT INTO `pub_static_def_copy` VALUES ('land_type', '4', '其他', '土地类型');
INSERT INTO `pub_static_def_copy` VALUES ('landPower_type', '1', '划拨', '土地使用权');
INSERT INTO `pub_static_def_copy` VALUES ('landPower_type', '2', '出让', '土地使用权');
INSERT INTO `pub_static_def_copy` VALUES ('landPower_type', '4', '租赁', '土地使用权');
INSERT INTO `pub_static_def_copy` VALUES ('landPower_type', '3', '集体', '土地使用权');
INSERT INTO `pub_static_def_copy` VALUES ('bill_type', '1', '银行承兑汇票', '票据类型');
INSERT INTO `pub_static_def_copy` VALUES ('bill_type', '2', '商业承兑汇票', '票据类型');
INSERT INTO `pub_static_def_copy` VALUES ('toll_type', '10001', '票据结算手续费收入', '收费类型');
INSERT INTO `pub_static_def_copy` VALUES ('toll_type', '10002', '国内贸易融资手续费收入', '收费类型');
INSERT INTO `pub_static_def_copy` VALUES ('trade_type', '1', '现金', '交易类别');
INSERT INTO `pub_static_def_copy` VALUES ('trade_type', '2', '转账', '交易类别');
INSERT INTO `pub_static_def_copy` VALUES ('product_type', '2101', '公司类贷款', '产品类型');
INSERT INTO `pub_static_def_copy` VALUES ('product_type', '2201', '个贷类贷款', '产品类型');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_cancle_type', '1', '提前还款冲账', '贷款还款冲账');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_cancle_type', '2', '欠款归还冲账', '贷款还款冲账');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_cancle_type', '3', '贴现还款冲账', '贷款还款冲账');
INSERT INTO `pub_static_def_copy` VALUES ('repayment_cancle_type', '4', '核销收回冲账', '贷款还款冲账');
INSERT INTO `pub_static_def_copy` VALUES ('rep_way', '6', '利随本清', '还款方式');
INSERT INTO `pub_static_def_copy` VALUES ('risk_level', '3', '次级', '五级分类');
INSERT INTO `pub_static_def_copy` VALUES ('risk_level', '4', '可疑', '五级分类');
INSERT INTO `pub_static_def_copy` VALUES ('risk_level', '5', '损失', '五级分类');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_grade', '1', '大型', '企业规模等级');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_grade', '2', '中型', '企业规模等级');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_grade', '3', '小型', '企业规模等级');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_grade', '4', '微型', '企业规模等级');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_grade', '5', '其他', '企业规模等级');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '10', '审批未通过', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('dis_status', '1', '待出账', '贴现出账状态');
INSERT INTO `pub_static_def_copy` VALUES ('dis_status', '2', '已出账', '贴现出账状态');
INSERT INTO `pub_static_def_copy` VALUES ('dis_status', '3', '处理中', '贴现出账状态');
INSERT INTO `pub_static_def_copy` VALUES ('dis_status', '4', '已放款', '贴现出账状态');
INSERT INTO `pub_static_def_copy` VALUES ('dis_status', '5', '已作废', '贴现出账状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '6', '退回修改', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '9', '退回修改', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('gua_change_type', '1', '追加担保合同', '担保变更类型');
INSERT INTO `pub_static_def_copy` VALUES ('gua_change_type', '2', '担保方式变更', '担保变更类型');
INSERT INTO `pub_static_def_copy` VALUES ('gua_change_type', '3', '担保合同终止', '担保变更类型');
INSERT INTO `pub_static_def_copy` VALUES ('valid_status', '1', '有效', '有效无效');
INSERT INTO `pub_static_def_copy` VALUES ('valid_status', '2', '无效', '有效无效');
INSERT INTO `pub_static_def_copy` VALUES ('demand_way', '1', '信函催收', '催收方式');
INSERT INTO `pub_static_def_copy` VALUES ('demand_way', '2', '电话催收', '催收方式');
INSERT INTO `pub_static_def_copy` VALUES ('demand_way', '3', '短信催收', '催收方式');
INSERT INTO `pub_static_def_copy` VALUES ('demand_way', '4', '上门催收', '催收方式');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '10', '未婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '20', '已婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '40', '离婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '22', '再婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '30', '丧偶', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('income_status', '01', '1000元以下', '薪水');
INSERT INTO `pub_static_def_copy` VALUES ('income_status', '02', '1000-3000元', '薪水');
INSERT INTO `pub_static_def_copy` VALUES ('income_status', '03', '3000元以上\r\n', '薪水');
INSERT INTO `pub_static_def_copy` VALUES ('income_status', '99', '其他\r\n', '薪水');
INSERT INTO `pub_static_def_copy` VALUES ('job_title', '0', '无', '个人职称');
INSERT INTO `pub_static_def_copy` VALUES ('job_title', '1', '初级', '个人职称');
INSERT INTO `pub_static_def_copy` VALUES ('job_title', '2', '中级', '个人职称');
INSERT INTO `pub_static_def_copy` VALUES ('job_title', '3', '高级', '个人职称');
INSERT INTO `pub_static_def_copy` VALUES ('job_title', '99', '其他', '个人职称');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '05', '港澳台居民通行证\r\n', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '06', '外国人永久居留证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '07', '临时身份证\r\n', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '08', '批文（个人)', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '09', '学生证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '49', '其他 （个人）', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '52', '营业执照\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '53', '社会团体证\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '54', '工会法人登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '55', '企业名称核准通知书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '56', '编委会批文或登记证\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '57', '办学许可证\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '58', '民办非企业登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '59', '办事处备案证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '60', '主管部门批文或证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '61', '事业法人登记证书\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '62', '组织机构代码证\r\n', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '99', '其他', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('bill_status', '1', '库存', '票据状态');
INSERT INTO `pub_static_def_copy` VALUES ('bill_status', '2', '已划回', '票据状态');
INSERT INTO `pub_static_def_copy` VALUES ('comp_type', '01', '中资企业', '单位性质');
INSERT INTO `pub_static_def_copy` VALUES ('comp_type', '02', '外商投资', '单位性质');
INSERT INTO `pub_static_def_copy` VALUES ('comp_type', '03', '驻华机构', '单位性质');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_type', '1', '支持类', '客户管理分类');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_type', '2', '维护类', '客户管理分类');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_type', '3', '压缩类', '客户管理分类');
INSERT INTO `pub_static_def_copy` VALUES ('corporate_type', '4', '退出类', '客户管理分类');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '01', '国有独资企业', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '02', '非上市公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '03', '上市公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '04', '中资公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '05', '中外合资\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '06', '联营公司\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '07', '乡镇企业\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '08', '外商独资\r\n', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('economy_type', '99', '其他', '经济组织形式');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '00', '正常', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '01', '注销', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '02', '已合并\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '03', '死亡\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '04', '神经\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '05', '黑名单\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '06', '睡眠户\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '07', '往来不佳\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '08', '不宜往来\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '09', '呆滞往来\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '10', '法律催收\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_state', '11', '失踪\r\n', '客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('DUEBILL_STATUS', '5', '出账作废', '借据状态');
INSERT INTO `pub_static_def_copy` VALUES ('dispute_sol', '2', '法律途径', '争议解决方式');
INSERT INTO `pub_static_def_copy` VALUES ('toll_status', '1', '未入账', '收费状态');
INSERT INTO `pub_static_def_copy` VALUES ('toll_status', '2', '收费成功', '收费状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_type', '2', '个人客户', '客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_type', '1', '企业客户', '客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('sign_status', '1', '已签约', '签约客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('sign_status', '0', '已解约', '签约客户状态');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '01', '吉林银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '02', '工商银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '03', '农业银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '04', '建设银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '05', '中国银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '06', '招商银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '07', '交通银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '08', '民生银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '09', '光大银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('tru_bank', '10', '中国邮政储蓄银行', '托管账户开户行');
INSERT INTO `pub_static_def_copy` VALUES ('acc_back_type', '1', '贷款放款冲账', '冲账种类');
INSERT INTO `pub_static_def_copy` VALUES ('acc_back_type', '2', '贷款还款冲账', '冲账种类');
INSERT INTO `pub_static_def_copy` VALUES ('acc_back_type', '3', '贴现放款冲账', '冲账种类');
INSERT INTO `pub_static_def_copy` VALUES ('demand_type', '1', '借款人催收', '催收类型');
INSERT INTO `pub_static_def_copy` VALUES ('demand_type', '2', '担保人催收', '催收类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '01', '银行', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '02', '信托公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '03', '资产管理公司（金融类）', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '04', '资产管理公司（非金融类）', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '05', '金融租赁公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '06', '融资租赁公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '07', '财务公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '08', '货币经济公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '09', '三类新型农村金融机构', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '10', '消费金融公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '11', '汽车金融公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '12', '证券公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '13', '基金管理公司或子公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '14', '期货公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '15', '保险集团控股公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '16', '保险公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '17', '再保险公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '18', '保险资产管理公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '19', '外资保险公司代理处', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '20', '商业保理公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '21', '融资担保公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '22', '小额贷款公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '23', '政府融资平台', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '24', '房地产公司', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '25', '中介及服务机构', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '26', '其他一般工商企业', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('reg_org_type', '99', '其他', '机构类型');
INSERT INTO `pub_static_def_copy` VALUES ('pro_type', '1', '企业', '产品类型');
INSERT INTO `pub_static_def_copy` VALUES ('pro_type', '2', '个人', '产品类型');
INSERT INTO `pub_static_def_copy` VALUES ('loan_limit_unit', 'Y', '年', '贷款期限单位');
INSERT INTO `pub_static_def_copy` VALUES ('loan_limit_unit', 'M', '月', '贷款期限单位');
INSERT INTO `pub_static_def_copy` VALUES ('loan_limit_unit', 'D', '日', '贷款期限单位');
INSERT INTO `pub_static_def_copy` VALUES ('conApprove_status', '0', '未审批', '合同审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('conApprove_status', '1', '审批中', '合同审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('conApprove_status', '2', '审批完成', '合同审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('conApprove_status', '3', '审批未通过', '合同审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('cost_transfer', '111', '平台服务费划转', '费用划转类型');
INSERT INTO `pub_static_def_copy` VALUES ('cost_transfer', '222', '平台投资管理费划转', '费用划转类型');
INSERT INTO `pub_static_def_copy` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def_copy` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def_copy` VALUES ('cost_transfer', '333', '平台转让手续费划转', '费用划转类型');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '2', '已满标', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '3', '流标处理中', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '4', '已流标', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '5', '放款中', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '6', '已放款', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '1', '未满标', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('project_status', '7', '结清', '项目状态');
INSERT INTO `pub_static_def_copy` VALUES ('guarant_fee_type', '1', '分期收取', '担保公司保费收取方式');
INSERT INTO `pub_static_def_copy` VALUES ('guarant_fee_type', '2', '放款即收', '担保公司保费收取方式');
INSERT INTO `pub_static_def_copy` VALUES ('app_status', '0', '未审批', '费用入账审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('app_status', '1', '审批中', '费用入账审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('app_status', '2', '审批完成', '费用入账审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('app_status', '3', '审批未通过', '费用入账审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('app_status', '4', '已入账', '费用入账审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('conApprove_status', '4', '退回修改', '合同审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_type', '1', '抵押', '押品类型');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_type', '2', '质押', '押品类型');
INSERT INTO `pub_static_def_copy` VALUES ('pub_col_status', '1', '启用', '押品参数状态');
INSERT INTO `pub_static_def_copy` VALUES ('pub_col_status', '0', '停用', '押品参数状态');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '1', '一级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '2', '二级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '3', '三级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '4', '四级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '5', '五级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '6', '六级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('land_level', '7', '七级', '土地等级');
INSERT INTO `pub_static_def_copy` VALUES ('gua_cont_status', '0', '未生效', '担保合同状态');
INSERT INTO `pub_static_def_copy` VALUES ('gua_cont_status', '1', '已生效', '担保合同状态');
INSERT INTO `pub_static_def_copy` VALUES ('collateral_status', '3', '已出库', '押品状态');
INSERT INTO `pub_static_def_copy` VALUES ('demand_status', '2', '已回执', '贷后催收状态');
INSERT INTO `pub_static_def_copy` VALUES ('news_type', '2', '新闻', '信息类型');
INSERT INTO `pub_static_def_copy` VALUES ('demand_status', '1', '已催收', '贷后催收状态');
INSERT INTO `pub_static_def_copy` VALUES ('news_type', '3', '通知', '信息类型');
INSERT INTO `pub_static_def_copy` VALUES ('news_type', '1', '公告', '信息类型');
INSERT INTO `pub_static_def_copy` VALUES ('compoundingInterest_flag', '0', '不收取', '是否收取复利标志');
INSERT INTO `pub_static_def_copy` VALUES ('compoundingInterest_flag', '1', '收取', '是否收取复利标志');
INSERT INTO `pub_static_def_copy` VALUES ('marginDeposit_status', '0', '未审批', '保证金存入状态');
INSERT INTO `pub_static_def_copy` VALUES ('marginDeposit_status', '1', '审批中', '保证金存入状态');
INSERT INTO `pub_static_def_copy` VALUES ('marginDeposit_status', '3', '审批不通过', '保证金存入状态');
INSERT INTO `pub_static_def_copy` VALUES ('marginDeposit_status', '2', '审批通过', '保证金存入状态');
INSERT INTO `pub_static_def_copy` VALUES ('dest_sys_flag', '1', '门户', '公告新闻发布系统');
INSERT INTO `pub_static_def_copy` VALUES ('dest_sys_flag', '2', '担保公司', '公告新闻发布系统');
INSERT INTO `pub_static_def_copy` VALUES ('dest_sys_flag', '3', '运营管理端', '公告新闻发布系统');
INSERT INTO `pub_static_def_copy` VALUES ('cust_replystatus', '1', '未回复', '客户留言回复');
INSERT INTO `pub_static_def_copy` VALUES ('cust_replystatus', '2', '已回复', '客户留言回复');
INSERT INTO `pub_static_def_copy` VALUES ('message_type', '1', '咨询', '留言类型');
INSERT INTO `pub_static_def_copy` VALUES ('message_type', '2', '建议', '留言类型');
INSERT INTO `pub_static_def_copy` VALUES ('message_replytype', '2', '电话', '留言回复方式');
INSERT INTO `pub_static_def_copy` VALUES ('message_replytype', '0', '无需回复', '留言回复方式');
INSERT INTO `pub_static_def_copy` VALUES ('message_replytype', '1', '邮件', '留言回复方式');
INSERT INTO `pub_static_def_copy` VALUES ('message_replytype', '3', '站内', '留言回复方式');
INSERT INTO `pub_static_def_copy` VALUES ('contract_usable_flag', '0', '未生效', '合同生效标志');
INSERT INTO `pub_static_def_copy` VALUES ('contract_usable_flag', '1', '已生效', '合同生效标志');
INSERT INTO `pub_static_def_copy` VALUES ('contract_usable_flag', '2', '结清注销', '合同生效标志');
INSERT INTO `pub_static_def_copy` VALUES ('orgtype', '2', '二级', '机构等级');
INSERT INTO `pub_static_def_copy` VALUES ('orgtype', '1', '一级', '机构等级');
INSERT INTO `pub_static_def_copy` VALUES ('orgtype', '3', '三级', '机构等级');
INSERT INTO `pub_static_def_copy` VALUES ('cust_worth', '1', '核心客户', '客户价值分类');
INSERT INTO `pub_static_def_copy` VALUES ('cust_worth', '2', '价值客户', '客户价值分类');
INSERT INTO `pub_static_def_copy` VALUES ('cust_worth', '3', '基本客户', '客户价值分类');
INSERT INTO `pub_static_def_copy` VALUES ('cust_worth', '4', '潜在客户', '客户价值分类');
INSERT INTO `pub_static_def_copy` VALUES ('fdc_sx_flag', '1', '房地产开发项目融资客户', '房地产授信业务属性');
INSERT INTO `pub_static_def_copy` VALUES ('fdc_sx_flag', '2', '房地产开发企业客户', '房地产授信业务属性');
INSERT INTO `pub_static_def_copy` VALUES ('fdc_sx_flag', '3', '其他房地产客户', '房地产授信业务属性');
INSERT INTO `pub_static_def_copy` VALUES ('fdc_sx_flag', '4', '非房地产客户', '房地产授信业务属性');
INSERT INTO `pub_static_def_copy` VALUES ('cust_link', '0', '生效', '客户引入');
INSERT INTO `pub_static_def_copy` VALUES ('cust_link', '1', '注销', '客户引入');
INSERT INTO `pub_static_def_copy` VALUES ('is_zblmyrz', '1', '否', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def_copy` VALUES ('is_zblmyrz', '2', '是，低风险', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def_copy` VALUES ('is_zblmyrz', '3', '是，风险来源国内', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def_copy` VALUES ('is_zblmyrz', '4', '是，风险来源国外', '是否只办理贸易融资业务');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SQLB', '0', '归入', '申请类别');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SQLB', '1', '解除', '申请类别');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '1', '待审批', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '2', '审批中', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '5', '审批通过', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '4', '否决', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '6', '已生效', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '7', '已注销', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '8', '待补录', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '9', '取消', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '3', '修改资料', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '1', '母公司', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '2', '子公司', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '3', '总公司', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '4', '分公司', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '5', '关联企业', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_custtype', '6', '其他成员单位', '集团成员客户类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_relationship', '1', '同法人', '集团关联关系类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_relationship', '4', '其他', '集团关联关系类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_relationship', '3', '同股权投资', '集团关联关系类型');
INSERT INTO `pub_static_def_copy` VALUES ('group_relationship', '2', '同股东', '集团关联关系类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '10', '警官证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '11', '台湾居民来往大陆通行证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('is_xh', '2', '是', '循环标志');
INSERT INTO `pub_static_def_copy` VALUES ('is_xh', '1', '否', '循环标志');
INSERT INTO `pub_static_def_copy` VALUES ('is_jtkh', 'y', '是', '集团客户标志');
INSERT INTO `pub_static_def_copy` VALUES ('is_jtkh', 'n', '否', '集团客户标志');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '1', '季节性原材料采购', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '2', '扩大生产规模', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '3', '淡季储备存货', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '4', '其他存货采购', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '5', '商品贸易性采购', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '6', '小型办公生产工具购置', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '7', '新项目铺底流动资金', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '8', '还旧借新', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '9', '借新还旧', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '10', '归还他行贷款', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '11', '支付管理费（包括支付工资、租金等）', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DKYT', '12', '其他', '贷款用途');
INSERT INTO `pub_static_def_copy` VALUES ('FL_JZLLHQFS', '1', '按合同期限获取', '基准利率获取方式');
INSERT INTO `pub_static_def_copy` VALUES ('FL_JZLLHQFS', '2', '自定义', '基准利率获取方式');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZXLLJSFS', '1', '按基准利率计算', '执行利率计算方式');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZXLLJSFS', '2', '自定义', '执行利率计算方式');
INSERT INTO `pub_static_def_copy` VALUES ('FL_LLBDLX', 'P', '百分比', '利率变动类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_LLBDLX', 'A', '百分点', '利率变动类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_FLBZ', 'y', '是', '复利标志');
INSERT INTO `pub_static_def_copy` VALUES ('FL_FLBZ', 'n', '否', '复利标志');
INSERT INTO `pub_static_def_copy` VALUES ('demand_way', '99', '其他', '催收方式');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1001', '房产', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1002', '土地使用权(包含土地附着物)', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1003', '在建工程', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1004', '交通工具', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1005', '机器设备', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_DYW', '1006', '其他类', '抵押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2001', '存单', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2002', '票据', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2003', '保单', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2004', '国债', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2005', '股权/股票', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_ZYW', '2006', '其他权利', '质押物类型');
INSERT INTO `pub_static_def_copy` VALUES ('risk_level', '1', '正常', '五级分类');
INSERT INTO `pub_static_def_copy` VALUES ('risk_level', '2', '关注', '五级分类');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '7', '待补录', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('BIZ_STATUS', '8', '补录中', '业务状态');
INSERT INTO `pub_static_def_copy` VALUES ('toll_type', '20001', '代收手续费分润', '收费类型');
INSERT INTO `pub_static_def_copy` VALUES ('toll_type', '10003', '银行承兑汇票手续费收入', '收费类型');
INSERT INTO `pub_static_def_copy` VALUES ('toll_type', '10004', '人民币担保业务手续费收入', '收费类型');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ABW', '阿鲁巴', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AFG', '阿富汗', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AGO', '安哥拉共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AIA', '安圭拉', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ALB', '阿尔巴尼亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AND', '安道尔公国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ANT', '荷属安的列斯', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ARE', '阿拉伯联合酋长国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ARG', '阿根廷共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ARM', '亚美尼亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ASM', '美属萨摩亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ATA', '南极洲', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ATF', '法属南部领土', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ATG', '安提瓜和巴布达', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AUS', '澳大利亚联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AUT', '奥地利共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'AZE', '阿塞拜疆共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BDI', '布隆迪共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BEL', '比利时王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BEN', '贝宁共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BFA', '布基纳法索', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BGD', '孟加拉人民共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BGR', '保加利亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BHR', '巴林国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BHS', '巴哈马联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BIH', '波斯尼亚和黑塞哥维那', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BLR', '白俄罗斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BLZ', '伯利兹', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BMU', '百慕大', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BOL', '玻利维亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BRA', '巴西联邦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BRB', '巴巴多斯', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BRN', '文莱达鲁萨兰国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BTN', '不丹王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BVT', '布维岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'BWA', '博茨瓦纳共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CAF', '中非共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CAN', '加拿大', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CCK', '科科斯(基林)群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CHE', '瑞士联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CHL', '智利共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CHN', '中华人民共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CIV', '科特迪瓦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CMR', '喀麦隆共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'COD', '刚果民主共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'COG', '刚果共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'COK', '库克群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'COL', '哥伦比亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'COM', '科摩罗伊斯兰联邦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CPV', '佛得角共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CRI', '哥斯达黎加共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CUB', '古巴共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CXR', '圣诞岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CYM', '开曼群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CYP', '塞浦路斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'CZE', '捷克共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DEU', '德意志联邦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DJI', '吉布提共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DMA', '多米尼克国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DNK', '丹麦王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DOM', '多米尼加共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'DZA', '阿尔及利亚民主人民共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ECU', '厄瓜多尔共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'EGY', '阿拉伯埃及共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ERI', '厄立特里亚国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ESH', '西撒哈拉', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ESP', '西班牙王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'EST', '爱沙尼亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ETH', '埃塞俄比亚联邦民主共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FIN', '芬兰共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FJI', '斐济群岛共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FLK', '福克兰群岛（马尔维纳斯）', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FRA', '法兰西共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FRO', '法罗群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'FSM', '密克罗尼西亚联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GAB', '加蓬共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GBR', '大不列颠及北爱尔兰联合王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GEO', '格鲁吉亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GHA', '加纳共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GIB', '直布罗陀', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GIN', '几内亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GLP', '瓜德罗普', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GMB', '冈比亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GNB', '几内亚比绍共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GNQ', '赤道几内亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GRC', '希腊共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GRD', '格林纳达', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GRL', '格陵兰', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GTM', '危地马拉共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GUF', '法属圭亚那', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GUM', '关岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'GUY', '圭亚那合作共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HKG', '中国香港特别行政区', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HMD', '赫德岛和麦克唐纳岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HND', '洪都拉斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HRV', '克罗地亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HTI', '海地共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'HUN', '匈牙利共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IDN', '印度尼西亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IND', '印度共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IOT', '英属印度洋领地', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IRL', '爱尔兰', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IRN', '伊朗伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'IRQ', '伊拉克共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ISL', '冰岛共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ISR', '以色列国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ITA', '意大利共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'JAM', '牙买加', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'JOR', '约旦哈希姆王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'JPN', '日本国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KAZ', '哈萨克斯坦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KEN', '肯尼亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KGZ', '吉尔吉斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KHM', '柬埔寨王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KIR', '基里巴斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KNA', '圣基茨和尼维斯联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KOR', '大韩民国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'KWT', '科威特国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LAO', '老挝人民民主共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LBN', '黎巴嫩共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LBR', '利比里亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LBY', '大阿拉伯利比亚人民社会主义民众国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LCA', '圣卢西亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LIE', '列支敦士登公国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LKA', '斯里兰卡民主社会主义共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LSO', '莱索托王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LTU', '立陶宛共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LUX', '卢森堡大公国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'LVA', '拉脱维亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MAC', '中国澳门特别行政区', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MAR', '摩洛哥王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MCO', '摩纳哥公国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MDA', '摩尔多瓦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MDG', '马达加斯加共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MDV', '马尔代夫共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MEX', '墨西哥合众国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MHL', '马绍尔群岛共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MKD', '前南斯拉夫马其顿共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MLI', '马里共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MLT', '马耳他共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MMR', '缅甸联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MNG', '蒙古国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MNP', '北马里亚纳自由联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MOZ', '莫桑比克共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MRT', '毛里塔尼亚伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MSR', '蒙特赛拉特', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MTQ', '马提尼克', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MUS', '毛里求斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MWI', '马拉维共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MYS', '马来西亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'MYT', '马约特', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NAM', '纳米比亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NCL', '新喀里多尼亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NER', '尼日尔共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NFK', '诺福克岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NGA', '尼日利亚联邦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NIC', '尼加拉瓜共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NIU', '纽埃', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NLD', '荷兰王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NOR', '挪威王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NPL', '尼泊尔王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NRU', '瑙鲁共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'NZL', '新西兰', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'OMN', '阿曼苏丹国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'OTH', '其他地区', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PAK', '巴基斯坦伊斯兰共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PAN', '巴拿马共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PCN', '皮特凯恩', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PER', '秘鲁共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PHL', '菲律宾共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PLW', '帕劳共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PNG', '巴布亚新几内亚独立国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'POL', '波兰共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PRI', '波多黎各', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PRK', '朝鲜民主主义人民共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PRT', '葡萄牙共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PRY', '巴拉圭共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PSE', '巴勒斯坦国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'PYF', '法属波利尼西亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'QAT', '卡塔尔国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'REU', '留尼汪', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ROM', '罗马尼亚', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'RUS', '俄罗斯联邦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'RWA', '卢旺达共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SAU', '沙特阿拉伯王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SDN', '苏丹共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SEN', '塞内加尔共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SGP', '新加坡共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SGS', '南乔治亚岛和南桑德韦奇岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SHN', '圣赫勒拿', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SJM', '斯瓦尔巴岛和扬马延岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SLB', '所罗门群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SLE', '塞拉里昂共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SLV', '萨尔瓦多共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SMR', '圣马力诺共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SOM', '索马里共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SPM', '圣皮埃尔和密克隆', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'STP', '圣多美和普林西比民主共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SUR', '苏里南共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SVK', '斯洛伐克共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SVN', '斯洛文尼亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SWE', '瑞典王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SWZ', '斯威士兰王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SYC', '塞舌尔共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'SYR', '阿拉伯叙利亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TCA', '特克斯和凯科斯群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TCD', '乍得共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TGO', '多哥共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'THA', '泰王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TJK', '塔吉克斯坦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TKL', '托克劳', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TKM', '土库曼斯坦', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TMP', '东帝汶', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TON', '汤加王国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TTO', '特立尼达和多巴哥共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TUN', '突尼斯共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TUR', '土耳其共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TUV', '图瓦卢', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TWN', '中国台湾', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'TZA', '坦桑尼亚联合共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'UGA', '乌干达共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'UKR', '乌克兰', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'UMI', '美国本土外小岛屿', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'URY', '乌拉圭东岸共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'USA', '美利坚合众国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'UZB', '乌兹别克斯坦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VAT', '梵蒂冈城国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VCT', '圣文森特和格林纳丁斯', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VEN', '委内瑞拉共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VGB', '英属维尔京群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VIR', '美属维尔京群岛', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VNM', '越南社会主义共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'VUT', '瓦努阿图共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'WLF', '瓦利斯和富图纳', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'WSM', '萨摩亚独立国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'YEM', '也门共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'YUG', '南斯拉夫联盟共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ZAF', '南非共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ZMB', '赞比亚共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nationality', 'ZWE', '津巴布韦共和国', '国籍');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '01', '汉族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '02', '蒙古族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '03', '回族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '04', '藏族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '05', '维吾尔族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '06', '苗族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '07', '彝族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '08', '壮族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '09', '布依族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '10', '朝鲜族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '11', '满族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '12', '侗族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '13', '瑶族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '14', '白族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '15', '土家族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '16', '哈尼族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '17', '哈萨克族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '18', '傣族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '19', '黎族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '20', '僳傈族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '21', '佤族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '22', '畲族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '23', '高山族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '24', '拉祜族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '25', '水族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '26', '东乡族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '27', '纳西族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '28', '景颇族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '29', '柯尔克孜族', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '30', '土族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '31', '达斡尔族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '32', '仫佬族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '33', '羌族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '34', '布朗族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '35', '撒拉族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '36', '毛难族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '37', '仡佬族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '38', '锡伯族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '39', '阿昌族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '40', '普米族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '41', '塔吉克族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '42', '怒族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '43', '乌孜别克族', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '44', '俄罗斯族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '45', '鄂温克族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '46', '崩龙族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '47', '保安族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '48', '裕固族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '49', '京族      ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '50', '塔塔尔族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '51', '独龙族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '52', '鄂伦春族  ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '53', '赫哲族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '54', '门巴族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '55', '珞巴族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('nation_type', '56', '基诺族    ', '民族');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '23', '复婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '21', '初婚', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('marital_status', '99', '未说明的婚姻状况', '婚姻状况');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '10', '研究生', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '20', '大学本科（简称“大学”）', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '30', '大学专科和专科学校（简称“大专”）', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '40', '中等专业学校或中等技术学校', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '50', '技术学校', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '60', '高中', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '70', '初中', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '80', '小学', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '90', '文盲或半文盲', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_grade', '99', '未知', '最高学历');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '99', '其他    ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '1', '名誉博士 ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '2', '博士     ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '3', '硕士     ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '4', '学士     ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('education_xw', '5', '未知     ', '最高学位');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '0', '国家机关、党群组织、企业、事业单位负责人  ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '1', '专业技术人员                              ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '3', '办事人员和有关人员                        ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '4', '商业、服务业人员                          ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '5', '农、林、牧、渔、水利业生产人员            ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '6', '生产、运输设备操作人员及有关人员          ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '7', '军人                                      ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '8', '不便分类的其他从业人员                    ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('job_type', '99', '未知                                     ', '职业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '1', '农、林、牧、渔业                      ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '2', '采掘业                                ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '3', '制造业                                ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '4', '电力、燃气及水的生产和供应业          ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '5', '建筑业                                ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '6', '交通运输、仓储和邮政业                ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '7', '信息传输、计算机服务和软件业          ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '8', '批发和零售业                          ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '9', '住宿和餐饮业                          ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '10', '金融业                               ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '11', '房地产业                             ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '12', '租赁和商务服务业                     ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '13', '科学研究、技术服务业和地质勘察业     ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '14', '水利、环境和公共设施管理业           ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '15', '居民服务和其他服务业                 ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '16', '教育                                 ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '17', '卫生、社会保障和社会福利业           ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '18', '文化、体育和娱乐业                   ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '19', '公共管理和社会组织                   ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '20', '国际组织                             ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type', '99', '未知                                  ', '单位所属行业');
INSERT INTO `pub_static_def_copy` VALUES ('company_duties', '1', '高级领导（行政级别局级及局级以上领导或大公司高级管理人员）     ', '担任职务');
INSERT INTO `pub_static_def_copy` VALUES ('company_duties', '2', '中级领导（行政级别局级以下领导或大公司中级管理人员）           ', '担任职务');
INSERT INTO `pub_static_def_copy` VALUES ('company_duties', '3', '一般员工                                                       ', '担任职务');
INSERT INTO `pub_static_def_copy` VALUES ('company_duties', '4', '其他                                                           ', '担任职务');
INSERT INTO `pub_static_def_copy` VALUES ('company_duties', '99', '未知                                                           ', '担任职务');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '1', '自置            ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '2', '按揭            ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '3', '亲属楼宇        ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '4', '集体宿舍        ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '5', '租房            ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '6', '共有住宅        ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '7', '其他            ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('living_type', '99', '未知            ', '居住状况');
INSERT INTO `pub_static_def_copy` VALUES ('cert_validitytype', '1', '无有效期', '证件有效类型');
INSERT INTO `pub_static_def_copy` VALUES ('cert_validitytype', '2', '有有效期 ', '证件有效类型');
INSERT INTO `pub_static_def_copy` VALUES ('cert_validitytype', '3', '永久有效', '证件有效类型');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CNY', '人民币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'GBP', '英镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'EUR', '欧元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CAD', '加拿大元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'AED', '阿联酋迪拉姆', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ALL', '阿尔尼亚列克', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ATS', '奥地利先令', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'AUD', '澳大利亚元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BDT', '孟加拉国塔卡', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BEF', '比利时法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BGL', '保加利亚列瓦', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BHD', '巴林第纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BIF', '布隆迪法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BRL', '巴西里亚尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BUK', '缅甸币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'BWP', '博茨瓦纳普拉', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CFC', '记帐法国法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CHF', '瑞士法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CPS', '记帐英镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CSF', '记帐瑞士法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CSK', '捷克克朗', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CUR', '清算卢布', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CUS', '记帐美元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'CYP', '塞浦路斯镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'DEM', '德国马克', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'DKK', '丹麦克朗', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'DZD', '阿尔及利亚第纳', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'EGP', '埃及镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ESP', '西班牙比塞塔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ETB', '埃塞俄比亚比尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'FIM', '芬兰马克', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'FRF', '法国法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'GHC', '加纳塞地', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'GNS', '几内亚西里', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'GRD', '希腊德拉马克', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'HKD', '港币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'HUF', '匈牙利福林', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'IDR', '印度尼西亚卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'INR', '印度罗比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'IQD', '伊拉克地纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'IRR', '伊朗里亚尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ITL', '意大利里拉', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'JOD', '约旦第纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'JPY', '日元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'KES', '肯尼亚先令', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'KPW', '朝鲜币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'KRW', '韩元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'KWD', '科威特第纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'LKR', '斯里兰卡卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'LYD', '利比亚第纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MAD', '摩洛哥地拉姆', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MGF', '马达加斯加法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MLF', '马里法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MNT', '蒙古图格里克', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MOP', '澳门币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MUR', '毛里求斯卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MXP', '墨西哥比索', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'MYR', '马币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'NGN', '尼日利亚奈拉', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'NLG', '荷兰盾', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'NOK', '挪威克朗', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'NPR', '尼泊尔卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'NZD', '新西兰元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'PGK', '巴布亚新基那', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'PHP', '菲律宾比索', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'PKR', '巴基斯坦卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'PLZ', '波兰兹罗提', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ROL', '罗马尼亚列依', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'RUB', '俄国卢布', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'RWF', '卢旺达法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SCR', '塞舌尔卢比', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SDP', '苏丹镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SEK', '瑞典克朗', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SGD', '新加坡元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SLL', '塞拉利昂', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SUR', '苏联卢布', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'SYP', '叙利亚镑', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'THB', '泰币', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'TND', '突尼斯第纳尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'TRL', '土耳其里拉', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'TWD', '台湾元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'TZS', '坦桑尼亚先令', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'UDM', '蒙古美元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'USD', '美元', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'VND', '越南盾', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'XAG', '白银', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'XAU', '黄金', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'XDR', '特别提款权', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'XEU', '欧洲货币单位', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'XOF', '西非共同体法郎', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'YER', '也门里亚尔', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('currency_type', 'ZMK', '赞比亚克瓦查', '币种');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '1', '企业法人', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '2', '非法人企业 ', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '3', '机关、事业单位', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '4', '团级(含)以上军队、武警部队及分散执勤的支（分）队 ', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '5', '社会团体', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '6', '民办非企业组织', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '7', '异地常设机构', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '8', '外国驻华机构', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '9', '个体工商户', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '10', '居民委员会、村民委员会、社区委员会', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '11', '单位设立的独立核算的附属机构', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('cust_property', '12', '其他组织', '借款人性质');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '100', '内资企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '110', '国有企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '120', '集体企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '130', '股份合作企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '140', '联营企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '150', '有限责任公司', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '160', '股份有限公司', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '170', '私营企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '200', '三资企业（港、澳、台投资企业）', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '300', '外商投资企业', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '400', '个体经营', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('registration_type', '500', '其它', '登记注册类型');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A', '农、林、牧、渔业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A01', '农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A011', '谷物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0111', '稻谷种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0112', '小麦种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0113', '玉米种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0119', '其他谷物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A012', '豆类、油料和薯类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0121', '豆类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0122', '油料种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0123', '薯类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A013', '棉、麻、糖、烟草种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0131', '棉花种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0132', '麻类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0133', '糖料种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0134', '烟草种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A014', '蔬菜、食用菌及园艺作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0141', '蔬菜种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0142', '食用菌种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0143', '花卉种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0149', '其他园艺作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A015', '水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0151', '仁果类和核果类水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0152', '葡萄种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0153', '柑橘类种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0154', '香蕉等亚热带水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0159', '其他水果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A016', '坚果、含油果、香料和饮料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0161', '坚果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0162', '含油果种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0163', '香料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0169', '茶及其他饮料作物种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A017', '中药材种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0170', '中药材种植', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A019', '其他农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0190', '其他农业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A02', '林业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A021', '林木育种和育苗', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0211', '林木育种', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0212', '林木育苗', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A022', '造林和更新', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0220', '造林和更新', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A023', '森林经营和管护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0230', '森林经营和管护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A024', '木材和竹材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0241', '木材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0242', '竹材采运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A025', '林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0251', '木竹材林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0252', '非木竹材林产品采集', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A03', '畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A031', '牲畜饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0311', '牛的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0312', '马的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0313', '猪的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0314', '羊的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0315', '骆驼饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0319', '其他牲畜饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A032', '家禽饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0321', '鸡的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0322', '鸭的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0323', '鹅的饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0329', '其他家禽饲养', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A033', '狩猎和捕捉动物', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0330', '狩猎和捕捉动物', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A039', '其他畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0390', '其他畜牧业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A04', '渔业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A041', '水产养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0411', '海水养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0412', '内陆养殖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A042', '水产捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0421', '海水捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0422', '内陆捕捞', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A05', '农、林、牧、渔服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A051', '农业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0511', '农业机械服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0512', '灌溉服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0513', '农产品初加工服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0519', '其他农业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A052', '林业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0521', '林业有害生物防治服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0522', '森林防火服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0523', '林产品初级加工服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0529', '其他林业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A053', '畜牧服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0530', '畜牧服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A054', '渔业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'A0540', '渔业服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B', '采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B06', '煤炭开采和洗选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B061', '烟煤和无烟煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0610', '烟煤和无烟煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B062', '褐煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0620', '褐煤开采洗选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B069', '其他煤炭采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0690', '其他煤炭采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B07', '石油和天然气开采业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B071', '石油开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0710', '石油开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B072', '天然气开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0720', '天然气开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B08', '黑色金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B081', '铁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0810', '铁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B082', '锰矿、铬矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0820', '锰矿、铬矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B089', '其他黑色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0890', '其他黑色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B09', '有色金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B091', '常用有色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0911', '铜矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0912', '铅锌矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0913', '镍钴矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0914', '锡矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0915', '锑矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0916', '铝矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0917', '镁矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0919', '其他常用有色金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B092', '贵金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0921', '金矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0922', '银矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0929', '其他贵金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B093', '稀有稀土金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0931', '钨钼矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0932', '稀土金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0933', '放射性金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B0939', '其他稀有金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B10', '非金属矿采选业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B101', '土砂石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1011', '石灰石、石膏开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1012', '建筑装饰用石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1013', '耐火土石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1019', '粘土及其他土砂石开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B102', '化学矿开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1020', '化学矿开采', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B103', '采盐', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1030', '采盐', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B109', '石棉及其他非金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1091', '石棉、云母矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1092', '石墨、滑石采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1093', '宝石、玉石采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1099', '其他未列明非金属矿采选', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B11', '开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B111', '煤炭开采和洗选辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1110', '煤炭开采和洗选辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B112', '石油和天然气开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1120', '石油和天然气开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B119', '其他开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1190', '其他开采辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B12', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B120', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'B1200', '其他采矿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C', '制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C13', '农副食品加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C131', '谷物磨制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1310', '谷物磨制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C132', '饲料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1320', '饲料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C133', '植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1331', '食用植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1332', '非食用植物油加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C134', '制糖业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1340', '制糖业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C135', '屠宰及肉类加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1351', '牲畜屠宰', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1352', '禽类屠宰', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1353', '肉制品及副产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C136', '水产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1361', '水产品冷冻加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1362', '鱼糜制品及水产品干腌制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1363', '水产饲料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1364', '鱼油提取及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1369', '其他水产品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C137', '蔬菜、水果和坚果加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1371', '蔬菜加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1372', '水果和坚果加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C139', '其他农副食品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1391', '淀粉及淀粉制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1392', '豆制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1393', '蛋品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1399', '其他未列明农副食品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C14', '食品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C141', '焙烤食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1411', '糕点、面包制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1419', '饼干及其他焙烤食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C142', '糖果、巧克力及蜜饯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1421', '糖果、巧克力制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1422', '蜜饯制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C143', '方便食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1431', '米、面制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1432', '速冻食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1439', '方便面及其他方便食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C144', '乳制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1440', '乳制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C145', '罐头食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1451', '肉、禽类罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1452', '水产品罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1453', '蔬菜、水果罐头制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1459', '其他罐头食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C146', '调味品、发酵制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1461', '味精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1462', '酱油、食醋及类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1469', '其他调味品、发酵制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C149', '其他食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1491', '营养食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1492', '保健食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1493', '冷冻饮品及食用冰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1494', '盐加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1495', '食品及饲料添加剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1499', '其他未列明食品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C15', '酒、饮料和精制茶制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C151', '酒的制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1511', '酒精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1512', '白酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1513', '啤酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1514', '黄酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1515', '葡萄酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1519', '其他酒制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C152', '饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1521', '碳酸饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1522', '瓶（罐）装饮用水制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1523', '果菜汁及果菜汁饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1524', '含乳饮料和植物蛋白饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1525', '固体饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1529', '茶饮料及其他饮料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C153', '精制茶加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1530', '精制茶加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C16', '烟草制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C161', '烟叶复烤', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1610', '烟叶复烤', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C162', '卷烟制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1620', '卷烟制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C169', '其他烟草制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1690', '其他烟草制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C17', '纺织业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C171', '棉纺织及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1711', '棉纺纱加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1712', '棉织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1713', '棉印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C172', '毛纺织及染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1721', '毛条和毛纱线加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1722', '毛织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1723', '毛染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C173', '麻纺织及染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1731', '麻纤维纺前加工和纺纱', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1732', '麻织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1733', '麻染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C174', '丝绢纺织及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1741', '缫丝加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1742', '绢纺和丝织加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1743', '丝印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C175', '化纤织造及印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1751', '化纤织造加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1752', '化纤织物染整精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C176', '针织或钩针编织物及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1761', '针织或钩针编织物织造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1762', '针织或钩针编织物印染精加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1763', '针织或钩针编织品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C177', '家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1771', '床上用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1772', '毛巾类制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1773', '窗帘、布艺类产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1779', '其他家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C178', '非家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1781', '非织造布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1782', '绳、索、缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1783', '纺织带和帘子布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1784', '篷、帆布制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1789', '其他非家用纺织制成品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C18', '纺织服装、服饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C181', '机织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1810', '机织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C182', '针织或钩针编织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1820', '针织或钩针编织服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C183', '服饰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1830', '服饰制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C19', '皮革、毛皮、羽毛及其制品和制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C191', '皮革鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1910', '皮革鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C192', '皮革制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1921', '皮革服装制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1922', '皮箱、包（袋）制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1923', '皮手套及皮装饰制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1929', '其他皮革制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C193', '毛皮鞣制及制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1931', '毛皮鞣制加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1932', '毛皮服装加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1939', '其他毛皮制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C194', '羽毛(绒)加工及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1941', '羽毛（绒）加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1942', '羽毛（绒）制品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C195', '制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1951', '纺织面料鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1952', '皮鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1953', '塑料鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1954', '橡胶鞋制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C1959', '其他制鞋业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C20', '木材加工和木、竹、藤、棕、草制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C201', '木材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2011', '锯材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2012', '木片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2013', '单板加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2019', '其他木材加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C202', '人造板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2021', '胶合板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2022', '纤维板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2023', '刨花板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2029', '其他人造板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C203', '木制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2031', '建筑用木料及木材组件加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2032', '木门窗、楼梯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2033', '地板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2034', '木制容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2039', '软木制品及其他木制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C204', '竹、藤、棕、草等制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2041', '竹制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2042', '藤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2043', '棕制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2049', '草及其他制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C21', '家具制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C211', '木质家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2110', '木质家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C212', '竹、藤家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2120', '竹、藤家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C213', '金属家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2130', '金属家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C214', '塑料家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2140', '塑料家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C219', '其他家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2190', '其他家具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C22', '造纸和纸制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C221', '纸浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2211', '木竹浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2212', '非木竹浆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C222', '造纸', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2221', '机制纸及纸板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2222', '手工纸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2223', '加工纸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C223', '纸制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2231', '纸和纸板容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2239', '其他纸制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C23', '印刷和记录媒介复制业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C231', '印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2311', '书、报刊印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2312', '本册印制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2319', '包装装潢及其他印刷', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C232', '装订及印刷相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2320', '装订及印刷相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C233', '记录媒介复制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2330', '记录媒介复制', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C24', '文教、工美、体育和娱乐用品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C241', '文教办公用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2411', '文具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2412', '笔的制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2413', '教学用模型及教具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2414', '墨水、墨汁制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2419', '其他文教办公用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C242', '乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2421', '中乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2422', '西乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2423', '电子乐器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2429', '其他乐器及零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C243', '工艺美术品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2431', '雕塑工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2432', '金属工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2433', '漆器工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2434', '花画工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2435', '天然植物纤维编织工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2436', '抽纱刺绣工艺品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2437', '地毯、挂毯制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2438', '珠宝首饰及有关物品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2439', '其他工艺美术品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C244', '体育用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2441', '球类制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2442', '体育器材及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2443', '训练健身器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2444', '运动防护用具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2449', '其他体育用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C245', '玩具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2450', '玩具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C246', '游艺器材及娱乐用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2461', '露天游乐场所游乐设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2462', '游艺用品及室内游艺器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2469', '其他娱乐用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C25', '石油加工、炼焦和核燃料加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C251', '精炼石油产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2511', '原油加工及石油制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2512', '人造原油制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C252', '炼焦', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2520', '炼焦', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C253', '核燃料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2530', '核燃料加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C26', '化学原料和化学制品制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C261', '基础化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2611', '无机酸制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2612', '无机碱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2613', '无机盐制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2614', '有机化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2619', '其他基础化学原料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C262', '肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2621', '氮肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2622', '磷肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2623', '钾肥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2624', '复混肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2625', '有机肥料及微生物肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2629', '其他肥料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C263', '农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2631', '化学农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2632', '生物化学农药及微生物农药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C264', '涂料、油墨、颜料及类似产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2641', '涂料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2642', '油墨及类似产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2643', '颜料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2644', '染料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2645', '密封用填料及类似品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C265', '合成材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2651', '初级形态塑料及合成树脂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2652', '合成橡胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2653', '合成纤维单（聚合）体制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2659', '其他合成材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C266', '专用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2661', '化学试剂和助剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2662', '专项化学用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2663', '林产化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2664', '信息化学品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2665', '环境污染处理专用药剂材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2666', '动物胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2669', '其他专用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C267', '炸药、火工及焰火产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2671', '炸药及火工产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2672', '焰火、鞭炮产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C268', '日用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2681', '肥皂及合成洗涤剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2682', '化妆品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2683', '口腔清洁用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2684', '香料、香精制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2689', '其他日用化学产品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C27', '医药制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C271', '化学药品原料药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2710', '化学药品原料药制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C272', '化学药品制剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2720', '化学药品制剂制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C273', '中药饮片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2730', '中药饮片加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C274', '中成药生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2740', '中成药生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C275', '兽用药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2750', '兽用药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C276', '生物药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2760', '生物药品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C277', '卫生材料及医药用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2770', '卫生材料及医药用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C28', '化学纤维制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C281', '纤维素纤维原料及纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2811', '化纤浆粕制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2812', '人造纤维（纤维素纤维）制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C282', '合成纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2821', '锦纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2822', '涤纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2823', '腈纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2824', '维纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2825', '丙纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2826', '氨纶纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2829', '其他合成纤维制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C29', '橡胶和塑料制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C291', '橡胶制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2911', '轮胎制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2912', '橡胶板、管、带制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2913', '橡胶零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2914', '再生橡胶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2915', '日用及医用橡胶制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2919', '其他橡胶制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C292', '塑料制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2921', '塑料薄膜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2922', '塑料板、管、型材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2923', '塑料丝、绳及编织品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2924', '泡沫塑料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2925', '塑料人造革、合成革制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2926', '塑料包装箱及容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2927', '日用塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2928', '塑料零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C2929', '其他塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C30', '非金属矿物制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C301', '水泥、石灰和石膏制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3011', '水泥制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3012', '石灰和石膏制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C302', '石膏、水泥制品及类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3021', '水泥制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3022', '砼结构构件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3023', '石棉水泥制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3024', '轻质建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3029', '其他水泥类似制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C303', '砖瓦、石材等建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3031', '粘土砖瓦及建筑砌块制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3032', '建筑陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3033', '建筑用石加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3034', '防水建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3035', '隔热和隔音材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3039', '其他建筑材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C304', '玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3041', '平板玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3049', '其他玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C305', '玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3051', '技术玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3052', '光学玻璃制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3053', '玻璃仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3054', '日用玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3055', '玻璃包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3056', '玻璃保温容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3057', '制镜及类似品加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3059', '其他玻璃制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C306', '玻璃纤维和玻璃纤维增强塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3061', '玻璃纤维及制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3062', '玻璃纤维增强塑料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C307', '陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3071', '卫生陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3072', '特种陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3073', '日用陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3079', '园林、陈设艺术及其他陶瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C308', '耐火材料制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3081', '石棉制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3082', '云母制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3089', '耐火陶瓷制品及其他耐火材料制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C309', '石墨及其他非金属矿物制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3091', '石墨及碳素制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3099', '其他非金属矿物制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C31', '黑色金属冶炼和压延加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C311', '炼铁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3110', '炼铁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C312', '炼钢', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3120', '炼钢', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C313', '黑色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3130', '黑色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C314', '钢压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3140', '钢压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C315', '铁合金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3150', '铁合金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C32', '有色金属冶炼和压延加工业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C321', '常用有色金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3211', '铜冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3212', '铅锌冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3213', '镍钴冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3214', '锡冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3215', '锑冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3216', '铝冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3217', '镁冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3219', '其他常用有色金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C322', '贵金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3221', '金冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3222', '银冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3229', '其他贵金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C323', '稀有稀土金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3231', '钨钼冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3232', '稀土金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3239', '其他稀有金属冶炼', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C324', '有色金属合金制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3240', '有色金属合金制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C325', '有色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3250', '有色金属铸造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C326', '有色金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3261', '铜压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3262', '铝压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3263', '贵金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3264', '稀有稀土金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3269', '其他有色金属压延加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C33', '金属制品业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C331', '结构性金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3311', '金属结构制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3312', '金属门窗制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C332', '金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3321', '切削工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3322', '手工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3323', '农用及园林用金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3324', '刀剪及类似日用金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3329', '其他金属工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C333', '集装箱及金属包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3331', '集装箱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3332', '金属压力容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3333', '金属包装容器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C334', '金属丝绳及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3340', '金属丝绳及其制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C335', '建筑、安全用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3351', '建筑、家具用金属配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3352', '建筑装饰及水暖管道零件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3353', '安全、消防用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3359', '其他建筑、安全用金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C336', '金属表面处理及热处理加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3360', '金属表面处理及热处理加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C337', '搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3371', '生产专用搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3372', '建筑装饰搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3373', '搪瓷卫生洁具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3379', '搪瓷日用品及其他搪瓷制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C338', '金属制日用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3381', '金属制厨房用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3382', '金属制餐具和器皿制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3383', '金属制卫生器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3389', '其他金属制日用品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C339', '其他金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3391', '锻件及粉末冶金制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3392', '交通及公共管理用金属标牌制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3399', '其他未列明金属制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C34', '通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C341', '锅炉及原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3411', '锅炉及辅助设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3412', '内燃机及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3413', '汽轮机及辅机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3414', '水轮机及辅机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3415', '风能原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3419', '其他原动设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C342', '金属加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3421', '金属切削机床制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3422', '金属成形机床制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3423', '铸造机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3424', '金属切割及焊接设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3425', '机床附件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3429', '其他金属加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C343', '物料搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3431', '轻小型起重设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3432', '起重机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3433', '生产专用车辆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3434', '连续搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3435', '电梯、自动扶梯及升降机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3439', '其他物料搬运设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C344', '泵、阀门、压缩机及类似机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3441', '泵及真空设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3442', '气体压缩机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3443', '阀门和旋塞制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3444', '液压和气压动力机械及元件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C345', '轴承、齿轮和传动部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3451', '轴承制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3452', '齿轮及齿轮减、变速箱制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3459', '其他传动部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C346', '烘炉、风机、衡器、包装等设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3461', '烘炉、熔炉及电炉制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3462', '风机、风扇制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3463', '气体、液体分离及纯净设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3464', '制冷、空调设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3465', '风动和电动工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3466', '喷枪及类似器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3467', '衡器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3468', '包装专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C347', '文化、办公用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3471', '电影机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3472', '幻灯及投影设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3473', '照相机及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3474', '复印和胶印设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3475', '计算器及货币专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3479', '其他文化、办公用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C348', '通用零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3481', '金属密封件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3482', '紧固件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3483', '弹簧制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3484', '机械零部件加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3489', '其他通用零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C349', '其他通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3490', '其他通用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C35', '专用设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C351', '采矿、冶金、建筑专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3511', '矿山机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3512', '石油钻采专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3513', '建筑工程用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3514', '海洋工程专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3515', '建筑材料生产专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3516', '冶金专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C352', '化工、木材、非金属加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3521', '炼油、化工生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3522', '橡胶加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3523', '塑料加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3524', '木材加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3525', '模具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3529', '其他非金属加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C353', '食品、饮料、烟草及饲料生产专用设备制造　　　', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3531', '食品、酒、饮料及茶生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3532', '农副食品加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3533', '烟草生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3534', '饲料生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C354', '印刷、制药、日化及日用品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3541', '制浆和造纸专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3542', '印刷专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3543', '日用化工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3544', '制药专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3545', '照明器具生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3546', '玻璃、陶瓷和搪瓷制品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3549', '其他日用品生产专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C355', '纺织、服装和皮革加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3551', '纺织专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3552', '皮革、毛皮及其制品加工专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3553', '缝制机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3554', '洗涤机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C356', '电子和电工机械专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3561', '电工机械专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3562', '电子工业专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C357', '农、林、牧、渔专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3571', '拖拉机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3572', '机械化农业及园艺机具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3573', '营林及木竹采伐机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3574', '畜牧机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3575', '渔业机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3576', '农林牧渔机械配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3577', '棉花加工机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3579', '其他农、林、牧、渔业机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C358', '医疗仪器设备及器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3581', '医疗诊断、监护及治疗设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3582', '口腔科用设备及器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3583', '医疗实验室及医用消毒设备和器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3584', '医疗、外科及兽医用器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3585', '机械治疗及病房护理设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3586', '假肢、人工器官及植（介）入器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3589', '其他医疗设备及器械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C359', '环保、社会公共服务及其他专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3591', '环境保护专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3592', '地质勘查专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3593', '邮政专用机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3594', '商业、饮食、服务专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3595', '社会公共安全设备及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3596', '交通安全、管制及类似专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3597', '水资源专用机械制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3599', '其他专用设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C36', '汽车制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C361', '汽车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3610', '汽车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C362', '改装汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3620', '改装汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C363', '低速载货汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3630', '低速载货汽车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C364', '电车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3640', '电车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C365', '汽车车身、挂车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3650', '汽车车身、挂车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C366', '汽车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3660', '汽车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C37', '铁路、船舶、航空航天和其他运输设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C371', '铁路运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3711', '铁路机车车辆及动车组制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3712', '窄轨机车车辆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3713', '铁路机车车辆配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3714', '铁路专用设备及器材、配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3719', '其他铁路运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C372', '城市轨道交通设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3720', '城市轨道交通设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C373', '船舶及相关装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3731', '金属船舶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3732', '非金属船舶制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3733', '娱乐船和运动船制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3734', '船用配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3735', '船舶改装与拆除', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3739', '航标器材及其他相关装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C374', '航空、航天器及设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3741', '飞机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3742', '航天器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3743', '航空、航天相关设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3749', '其他航空航天器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C375', '摩托车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3751', '摩托车整车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3752', '摩托车零部件及配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C376', '自行车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3761', '脚踏自行车及残疾人座车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3762', '助动自行车制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C377', '非公路休闲车及零配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3770', '非公路休闲车及零配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C379', '潜水救捞及其他未列明运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3791', '潜水及水下救捞装备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3799', '其他未列明运输设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C38', '电气机械和器材制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C381', '电机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3811', '发电机及发电机组制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3812', '电动机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3819', '微电机及其他电机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C382', '输配电及控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3821', '变压器、整流器和电感器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3822', '电容器及其配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3823', '配电开关控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3824', '电力电子元器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3825', '光伏设备及元器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3829', '其他输配电及控制设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C383', '电线、电缆、光缆及电工器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3831', '电线、电缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3832', '光纤、光缆制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3833', '绝缘制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3839', '其他电工器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C384', '电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3841', '锂离子电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3842', '镍氢电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3849', '其他电池制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C385', '家用电力器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3851', '家用制冷电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3852', '家用空气调节器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3853', '家用通风电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3854', '家用厨房电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3855', '家用清洁卫生电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3856', '家用美容、保健电器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3857', '家用电力器具专用配件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3859', '其他家用电力器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C386', '非电力家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3861', '燃气、太阳能及类似能源家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3869', '其他非电力家用器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C387', '照明器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3871', '电光源制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3872', '照明灯具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3879', '灯用电器附件及其他照明器具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C389', '其他电气机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3891', '电气信号设备装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3899', '其他未列明电气机械及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C39', '计算机、通信和其他电子设备制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C391', '计算机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3911', '计算机整机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3912', '计算机零部件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3913', '计算机外围设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3919', '其他计算机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C392', '通信设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3921', '通信系统设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3922', '通信终端设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C393', '广播电视设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3931', '广播电视节目制作及发射设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3932', '广播电视接收设备及器材制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3939', '应用电视设备及其他广播电视设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C394', '雷达及配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3940', '雷达及配套设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C395', '视听设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3951', '电视机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3952', '音响设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3953', '影视录放设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C396', '电子器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3961', '电子真空器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3962', '半导体分立器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3963', '集成电路制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3969', '光电子器件及其他电子器件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C397', '电子元件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3971', '电子元件及组件制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3972', '印制电路板制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C399', '其他电子设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C3990', '其他电子设备制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C40', '仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C401', '通用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4011', '工业自动控制系统装置制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4012', '电工仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4013', '绘图、计算及测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4014', '实验分析仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4015', '试验机制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4019', '供应用仪表及其他通用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C402', '专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4021', '环境监测专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4022', '运输设备及生产用计数仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4023', '导航、气象及海洋专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4024', '农林牧渔专用仪器仪表制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4025', '地质勘探和地震专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4026', '教学专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4027', '核子及核辐射测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4028', '电子测量仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4029', '其他专用仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C403', '钟表与计时仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4030', '钟表与计时仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C404', '光学仪器及眼镜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4041', '光学仪器制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4042', '眼镜制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C409', '其他仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4090', '其他仪器仪表制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C41', '其他制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C411', '日用杂品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4111', '鬃毛加工、制刷及清扫工具制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4119', '其他日用杂品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C412', '煤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4120', '煤制品制造', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C413', '核辐射加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4130', '核辐射加工', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C419', '其他未列明制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4190', '其他未列明制造业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C42', '废弃资源综合利用业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C421', '金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4210', '金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C422', '非金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4220', '非金属废料和碎屑加工处理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C43', '金属制品、机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C431', '金属制品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4310', '金属制品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C432', '通用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4320', '通用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C433', '专用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4330', '专用设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C434', '铁路、船舶、航空航天等运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4341', '铁路运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4342', '船舶修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4343', '航空航天器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4349', '其他运输设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C435', '电气设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4350', '电气设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C436', '仪器仪表修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4360', '仪器仪表修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C439', '其他机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'C4390', '其他机械和设备修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D', '电力、热力、燃气及水生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D44', '电力、热力生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D441', '电力生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4411', '火力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4412', '水力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4413', '核力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4414', '风力发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4415', '太阳能发电', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4419', '其他电力生产', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D442', '电力供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4420', '电力供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D443', '热力生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4430', '热力生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D45', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D450', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4500', '燃气生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D46', '水的生产和供应业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D461', '自来水生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4610', '自来水生产和供应', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D462', '污水处理及其再生利用', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4620', '污水处理及其再生利用', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D469', '其他水的处理、利用与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'D4690', '其他水的处理、利用与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E', '建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E47', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E470', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4700', '房屋建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E48', '土木工程建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E481', '铁路、道路、隧道和桥梁工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4811', '铁路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4812', '公路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4813', '市政道路工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4819', '其他道路、隧道和桥梁工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E482', '水利和内河港口工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4821', '水源及供水设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4822', '河湖治理及防洪设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4823', '港口及航运设施工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E483', '海洋工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4830', '海洋工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E484', '工矿工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4840', '工矿工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E485', '架线和管道工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4851', '架线及设备工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4852', '管道工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E489', '其他土木工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4890', '其他土木工程建筑', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E49', '建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E491', '电气安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4910', '电气安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E492', '管道和设备安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4920', '管道和设备安装', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E499', '其他建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E4990', '其他建筑安装业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E50', '建筑装饰和其他建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E501', '建筑装饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E5010', '建筑装饰业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E502', '工程准备活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E5021', '建筑物拆除活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E5029', '其他工程准备活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E503', '提供施工设备服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E5030', '提供施工设备服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E509', '其他未列明建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'E5090', '其他未列明建筑业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F', '批发和零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F51', '批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F511', '农、林、牧产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5111', '谷物、豆及薯类批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5112', '种子批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5113', '饲料批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5114', '棉、麻批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5115', '林业产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5116', '牲畜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5119', '其他农牧产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F512', '食品、饮料及烟草制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5121', '米、面制品及食用油批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5122', '糕点、糖果及糖批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5123', '果品、蔬菜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5124', '肉、禽、蛋、奶及水产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5125', '盐及调味品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5126', '营养和保健品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5127', '酒、饮料及茶叶批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5128', '烟草制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5129', '其他食品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F513', '纺织、服装及家庭用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5131', '纺织品、针织品及原料批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5132', '服装批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5133', '鞋帽批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5134', '化妆品及卫生用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5135', '厨房、卫生间用具及日用杂货批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5136', '灯具、装饰物品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5137', '家用电器批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5139', '其他家庭用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F514', '文化、体育用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5141', '文具用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5142', '体育用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5143', '图书批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5144', '报刊批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5145', '音像制品及电子出版物批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5146', '首饰、工艺品及收藏品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5149', '其他文化用品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F515', '医药及医疗器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5151', '西药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5152', '中药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5153', '医疗用品及器材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F516', '矿产品、建材及化工产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5161', '煤炭及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5162', '石油及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5163', '非金属矿及制品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5164', '金属及金属矿批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5165', '建材批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5166', '化肥批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5167', '农药批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5168', '农用薄膜批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5169', '其他化工产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F517', '机械设备、五金产品及电子产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5171', '农业机械批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5172', '汽车批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5173', '汽车零配件批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5174', '摩托车及零配件批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5175', '五金产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5176', '电气设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5177', '计算机、软件及辅助设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5178', '通讯及广播电视设备批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5179', '其他机械设备及电子产品批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F518', '贸易经纪与代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5181', '贸易代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5182', '拍卖', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5189', '其他贸易经纪与代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F519', '其他批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5191', '再生物资回收与批发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5199', '其他未列明批发业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F52', '零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F521', '综合零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5211', '百货零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5212', '超级市场零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5219', '其他综合零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F522', '食品、饮料及烟草制品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5221', '粮油零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5222', '糕点、面包零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5223', '果品、蔬菜零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5224', '肉、禽、蛋、奶及水产品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5225', '营养和保健品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5226', '酒、饮料及茶叶零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5227', '烟草制品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5229', '其他食品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F523', '纺织、服装及日用品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5231', '纺织品及针织品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5232', '服装零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5233', '鞋帽零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5234', '化妆品及卫生用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5235', '钟表、眼镜零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5236', '箱、包零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5237', '厨房用具及日用杂品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5238', '自行车零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5239', '其他日用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F524', '文化、体育用品及器材专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5241', '文具用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5242', '体育用品及器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5243', '图书、报刊零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5244', '音像制品及电子出版物零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5245', '珠宝首饰零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5246', '工艺美术品及收藏品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5247', '乐器零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5248', '照相器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5249', '其他文化用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F525', '医药及医疗器材专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5251', '药品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5252', '医疗用品及器材零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F526', '汽车、摩托车、燃料及零配件专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5261', '汽车零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5262', '汽车零配件零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5263', '摩托车及零配件零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5264', '机动车燃料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F527', '家用电器及电子产品专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5271', '家用视听设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5272', '日用家电设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5273', '计算机、软件及辅助设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5274', '通信设备零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5279', '其他电子产品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F528', '五金、家具及室内装饰材料专门零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5281', '五金零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5282', '灯具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5283', '家具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5284', '涂料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5285', '卫生洁具零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5286', '木质装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5287', '陶瓷、石材装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5289', '其他室内装饰材料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F529', '货摊、无店铺及其他零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5291', '货摊食品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5292', '货摊纺织、服装及鞋零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5293', '货摊日用品零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5294', '互联网零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5295', '邮购及电视、电话零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5296', '旧货零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5297', '生活用燃料零售', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'F5299', '其他未列明零售业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G', '交通运输、仓储和邮政业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G53', '铁路运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G531', '铁路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5310', '铁路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G532', '铁路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5320', '铁路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G533', '铁路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5331', '客运火车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5332', '货运火车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5339', '其他铁路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G54', '道路运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G541', '城市公共交通运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5411', '公共电汽车客运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5412', '城市轨道交通', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5413', '出租车客运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5419', '其他城市公共交通运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G542', '公路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5420', '公路旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G543', '道路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5430', '道路货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G544', '道路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5441', '客运汽车站', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5442', '公路管理与养护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5449', '其他道路运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G55', '水上运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G551', '水上旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5511', '海洋旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5512', '内河旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5513', '客运轮渡运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G552', '水上货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5521', '远洋货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5522', '沿海货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5523', '内河货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G553', '水上运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5531', '客运港口', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5532', '货运港口', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5539', '其他水上运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G56', '航空运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G561', '航空客货运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5611', '航空旅客运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5612', '航空货物运输', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G562', '通用航空服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5620', '通用航空服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G563', '航空运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5631', '机场', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5632', '空中交通管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5639', '其他航空运输辅助活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G57', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G570', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5700', '管道运输业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G58', '装卸搬运和运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G581', '装卸搬运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5810', '装卸搬运', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G582', '运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5821', '货物运输代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5822', '旅客票务代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5829', '其他运输代理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G59', '仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G591', '谷物、棉花等农产品仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5911', '谷物仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5912', '棉花仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5919', '其他农产品仓储', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G599', '其他仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G5990', '其他仓储业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G60', '邮政业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G601', '邮政基本服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G6010', '邮政基本服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G602', '快递服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'G6020', '快递服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H', '住宿和餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H61', '住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H611', '旅游饭店', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6110', '旅游饭店', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H612', '一般旅馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6120', '一般旅馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H619', '其他住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6190', '其他住宿业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H62', '餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H621', '正餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6210', '正餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H622', '快餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6220', '快餐服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H623', '饮料及冷饮服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6231', '茶馆服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6232', '咖啡馆服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6233', '酒吧服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6239', '其他饮料及冷饮服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H629', '其他餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6291', '小吃服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6292', '餐饮配送服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'H6299', '其他未列明餐饮业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I', '信息传输、软件和信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I63', '电信、广播电视和卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I631', '电信', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6311', '固定电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6312', '移动电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6319', '其他电信服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I632', '广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6321', '有线广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6322', '无线广播电视传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I633', '卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6330', '卫星传输服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I64', '互联网和相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I641', '互联网接入及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6410', '互联网接入及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I642', '互联网信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6420', '互联网信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I649', '其他互联网服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6490', '其他互联网服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I65', '软件和信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I651', '软件开发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6510', '软件开发', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I652', '信息系统集成服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6520', '信息系统集成服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I653', '信息技术咨询服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6530', '信息技术咨询服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I654', '数据处理和存储服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6540', '数据处理和存储服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I655', '集成电路设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6550', '集成电路设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I659', '其他信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6591', '数字内容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6592', '呼叫中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'I6599', '其他未列明信息技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J', '金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J66', '货币金融服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J661', '中央银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6610', '中央银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J662', '货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6620', '货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J663', '非货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6631', '金融租赁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6632', '财务公司', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6633', '典当', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6639', '其他非货币银行服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J664', '银行监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6640', '银行监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J67', '资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J671', '证券市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6711', '证券市场管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6712', '证券经纪交易服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6713', '基金管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J672', '期货市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6721', '期货市场管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6729', '其他期货市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J673', '证券期货监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6730', '证券期货监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J674', '资本投资服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6740', '资本投资服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J679', '其他资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6790', '其他资本市场服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J68', '保险业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J681', '人身保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6811', '人寿保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6812', '健康和意外保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J682', '财产保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6820', '财产保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J683', '再保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6830', '再保险', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J684', '养老金', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6840', '养老金', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J685', '保险经纪与代理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6850', '保险经纪与代理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J686', '保险监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6860', '保险监管服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J689', '其他保险活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6891', '风险和损失评估', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6899', '其他未列明保险活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J69', '其他金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J691', '金融信托与管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6910', '金融信托与管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J692', '控股公司服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6920', '控股公司服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J693', '非金融机构支付服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6930', '非金融机构支付服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J694', '金融信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6940', '金融信息服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J699', '其他未列明金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'J6990', '其他未列明金融业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K', '房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K70', '房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K701', '房地产开发经营', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K7010', '房地产开发经营', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K702', '物业管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K7020', '物业管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K703', '房地产中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K7030', '房地产中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K704', '自有房地产经营活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K7040', '自有房地产经营活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K709', '其他房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'K7090', '其他房地产业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L', '租赁和商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L71', '租赁业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L711', '机械设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7111', '汽车租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7112', '农业机械租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7113', '建筑工程机械与设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7114', '计算机及通讯设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7119', '其他机械与设备租赁', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L712', '文化及日用品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7121', '娱乐及体育设备出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7122', '图书出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7123', '音像制品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7129', '其他文化及日用品出租', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L72', '商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L721', '企业管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7211', '企业总部管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7212', '投资与资产管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7213', '单位后勤管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7219', '其他企业管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L722', '法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7221', '律师及相关法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7222', '公证服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7229', '其他法律服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L723', '咨询与调查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7231', '会计、审计及税务服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7232', '市场调查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7233', '社会经济咨询', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7239', '其他专业咨询', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L724', '广告业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7240', '广告业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L725', '知识产权服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7250', '知识产权服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L726', '人力资源服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7261', '公共就业服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7262', '职业中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7263', '劳务派遣服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7269', '其他人力资源服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L727', '旅行社及相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7271', '旅行社服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7272', '旅游管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7279', '其他旅行社相关服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L728', '安全保护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7281', '安全服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7282', '安全系统监控服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7289', '其他安全保护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L729', '其他商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7291', '市场管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7292', '会议及展览服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7293', '包装服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7294', '办公服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7295', '信用服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7296', '担保服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'L7299', '其他未列明商务服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M', '科学研究和技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M73', '研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M731', '自然科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7310', '自然科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M732', '工程和技术研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7320', '工程和技术研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M733', '农业科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7330', '农业科学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M734', '医学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7340', '医学研究和试验发展', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M735', '社会人文科学研究', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7350', '社会人文科学研究', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M74', '专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M741', '气象服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7410', '气象服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M742', '地震服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7420', '地震服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M743', '海洋服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7430', '海洋服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M744', '测绘服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7440', '测绘服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M745', '质检技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7450', '质检技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M746', '环境与生态监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7461', '环境保护监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7462', '生态监测', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M747', '地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7471', '能源矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7472', '固体矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7473', '水、二氧化碳等矿产地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7474', '基础地质勘查', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7475', '地质勘查技术服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M748', '工程技术', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7481', '工程管理服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7482', '工程勘察设计', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7483', '规划管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M749', '其他专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7491', '专业化设计服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7492', '摄影扩印服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7493', '兽医服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7499', '其他未列明专业技术服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M75', '科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M751', '技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7511', '农业技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7512', '生物技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7513', '新材料技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7514', '节能技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7519', '其他技术推广服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M752', '科技中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7520', '科技中介服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M759', '其他科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'M7590', '其他科技推广和应用服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N', '水利、环境和公共设施管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N76', '水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N761', '防洪除涝设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7610', '防洪除涝设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N762', '水资源管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7620', '水资源管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N763', '天然水收集与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7630', '天然水收集与分配', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N764', '水文服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7640', '水文服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N769', '其他水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7690', '其他水利管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N77', '生态保护和环境治理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N771', '生态保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7711', '自然保护区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7712', '野生动物保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7713', '野生植物保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7719', '其他自然保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N772', '环境治理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7721', '水污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7722', '大气污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7723', '固体废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7724', '危险废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7725', '放射性废物治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7729', '其他污染治理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N78', '公共设施管理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N781', '市政设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7810', '市政设施管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N782', '环境卫生管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7820', '环境卫生管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N783', '城乡市容管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7830', '城乡市容管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N784', '绿化管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7840', '绿化管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N785', '公园和游览景区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7851', '公园管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'N7852', '游览景区管理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O', '居民服务、修理和其他服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O79', '居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O791', '家庭服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7910', '家庭服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O792', '托儿所服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7920', '托儿所服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O793', '洗染服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7930', '洗染服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O794', '理发及美容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7940', '理发及美容服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O795', '洗浴服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7950', '洗浴服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O796', '保健服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7960', '保健服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O797', '婚姻服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7970', '婚姻服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O798', '殡葬服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7980', '殡葬服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O799', '其他居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O7990', '其他居民服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O80', '机动车、电子产品和日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O801', '汽车、摩托车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8011', '汽车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8012', '摩托车修理与维护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O802', '计算机和办公设备维修', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8021', '计算机和辅助设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8022', '通讯设备修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8029', '其他办公设备维修', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O803', '家用电器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8031', '家用电子产品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8032', '日用电器修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O809', '其他日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8091', '自行车修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8092', '鞋和皮革修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8093', '家具和相关物品修理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8099', '其他未列明日用产品修理业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O81', '其他服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O811', '清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8111', '建筑物清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8119', '其他清洁服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O819', '其他未列明服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'O8190', '其他未列明服务业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P', '教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P82', '教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P821', '学前教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8210', '学前教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P822', '初等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8221', '普通小学教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8222', '成人小学教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P823', '中等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8231', '普通初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8232', '职业初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8233', '成人初中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8234', '普通高中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8235', '成人高中教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8236', '中等职业学校教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P824', '高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8241', '普通高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8242', '成人高等教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P825', '特殊教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8250', '特殊教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P829', '技能培训、教育辅助及其他教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8291', '职业技能培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8292', '体校及体育培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8293', '文化艺术培训', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8294', '教育辅助服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'P8299', '其他未列明教育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q', '卫生和社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q83', '卫生', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q831', '医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8311', '综合医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8312', '中医医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8313', '中西医结合医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8314', '民族医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8315', '专科医院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8316', '疗养院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q832', '社区医疗与卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8321', '社区卫生服务中心（站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8322', '街道卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8323', '乡镇卫生院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q833', '门诊部（所）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8330', '门诊部（所）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q834', '计划生育技术服务活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8340', '计划生育技术服务活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q835', '妇幼保健院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8350', '妇幼保健院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q836', '专科疾病防治院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8360', '专科疾病防治院（所、站）', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q837', '疾病预防控制中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8370', '疾病预防控制中心', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q839', '其他卫生活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8390', '其他卫生活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q84', '社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q841', '提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8411', '干部休养所', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8412', '护理机构服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8413', '精神康复服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8414', '老年人、残疾人养护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8415', '孤残儿童收养和庇护服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8419', '其他提供住宿社会救助', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q842', '不提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8421', '社会看护与帮助服务', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'Q8429', '其他不提供住宿社会工作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R', '文化、体育和娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R85', '新闻和出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R851', '新闻业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8510', '新闻业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R852', '出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8521', '图书出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8522', '报纸出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8523', '期刊出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8524', '音像制品出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8525', '电子出版物出版', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8529', '其他出版业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R86', '广播、电视、电影和影视录音制作业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R861', '广播', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8610', '广播', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R862', '电视', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8620', '电视', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R863', '电影和影视节目制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8630', '电影和影视节目制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R864', '电影和影视节目发行', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8640', '电影和影视节目发行', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R865', '电影放映', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8650', '电影放映', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R866', '录音制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8660', '录音制作', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R87', '文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R871', '文艺创作与表演', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8710', '文艺创作与表演', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R872', '艺术表演场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8720', '艺术表演场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R873', '图书馆与档案馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8731', '图书馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8732', '档案馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R874', '文物及非物质文化遗产保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8740', '文物及非物质文化遗产保护', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R875', '博物馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8750', '博物馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R876', '烈士陵园、纪念馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8760', '烈士陵园、纪念馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R877', '群众文化活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8770', '群众文化活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R879', '其他文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8790', '其他文化艺术业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R88', '体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R881', '体育组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8810', '体育组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R882', '体育场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8820', '体育场馆', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R883', '休闲健身活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8830', '休闲健身活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R889', '其他体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8890', '其他体育', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R89', '娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R891', '室内娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8911', '歌舞厅娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8912', '电子游艺厅娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8913', '网吧活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8919', '其他室内娱乐活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R892', '游乐园', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8920', '游乐园', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R893', '彩票活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8930', '彩票活动', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R894', '文化、娱乐、体育经纪代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8941', '文化娱乐经纪人', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8942', '体育经纪人', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8949', '其他文化艺术经纪代理', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R899', '其他娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'R8990', '其他娱乐业', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S', '公共管理、社会保障和社会组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S90', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S900', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9000', '中国共产党机关', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S91', '国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S911', '国家权力机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9110', '国家权力机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S912', '国家行政机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9121', '综合事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9122', '对外事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9123', '公共安全管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9124', '社会事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9125', '经济事务管理机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9126', '行政监督检查机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S913', '人民法院和人民检察院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9131', '人民法院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9132', '人民检察院', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S919', '其他国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9190', '其他国家机构', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S92', '人民政协、民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S921', '人民政协', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9210', '人民政协', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S922', '民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9220', '民主党派', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S93', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S930', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9300', '社会保障', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S94', '群众团体、社会团体和其他成员组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S941', '群众团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9411', '工会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9412', '妇联', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9413', '共青团', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9419', '其他群众团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S942', '社会团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9421', '专业性团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9422', '行业性团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9429', '其他社会团体', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S943', '基金会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9430', '基金会', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S944', '宗教组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9440', '宗教组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S95', '基层群众自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S951', '社区自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9510', '社区自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S952', '村民自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'S9520', '村民自治组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'T', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'T96', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'T960', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('profession_type_flag', 'T9600', '国际组织', '企业行业分类（企业客户）');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A', '公有控股经济', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A01', '国有控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A0101', '国有相对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A0102', '国有绝对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A02', '集体控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A0201', '集体相对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'A0202', '集体绝对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B', '非公有控股经济', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B01', '私人控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0101', '私人相对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0102', '私人绝对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B02', '港澳台控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0201', '港澳台相对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0202', '港澳台绝对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B03', '外商控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0301', '外商相对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_qykglx', 'B0302', '外商绝对控股', '企业控股类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_cyzctd', '1', '鼓励', '产业政策特点');
INSERT INTO `pub_static_def_copy` VALUES ('cust_cyzctd', '2', '限制', '产业政策特点');
INSERT INTO `pub_static_def_copy` VALUES ('cust_cyzctd', '3', '其他', '产业政策特点');
INSERT INTO `pub_static_def_copy` VALUES ('loan_type', '1', '定期贷款', '贷款类型');
INSERT INTO `pub_static_def_copy` VALUES ('loan_type', '2', '循环贷款', '贷款类型');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '0', '补录中', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('bzrlx', '0', '自然人', '保证人类型');
INSERT INTO `pub_static_def_copy` VALUES ('bzrlx', '1', '担保公司', '保证人类型');
INSERT INTO `pub_static_def_copy` VALUES ('cust_status', '1', '已建立', '客户的状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_status', '2', '待补录', '客户的状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_status', '3', '已补录', '客户的状态');
INSERT INTO `pub_static_def_copy` VALUES ('cust_status', '4', '补录退回', '客户的状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '10', '已补录', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('FL_SPZT', '11', '补录退回', '标准审批状态');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '12', '士兵证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('per_id_type', '13', '澳门居民来往内地通行证', '个人证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '63', '工商核准号', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '64', '金融许可证', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('cor_id_type', '65', '审批件', '企业证件类型');
INSERT INTO `pub_static_def_copy` VALUES ('SEX_', '3', '未说明性别', '性别');
INSERT INTO `pub_static_def_copy` VALUES ('SEX_', '4', '未知性别', '性别');
INSERT INTO `pub_static_def_copy` VALUES ('bill_mode', '1', '纸票', '承兑汇票开票方式');
INSERT INTO `pub_static_def_copy` VALUES ('bill_mode', '2', '电票', '承兑汇票开票方式');

-- ----------------------------
-- Table structure for sys_parameter_cfg
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter_cfg`;
CREATE TABLE `sys_parameter_cfg` (
  `key_` varchar(64) NOT NULL,
  `name_` varchar(64) DEFAULT NULL,
  `value_` varchar(128) DEFAULT NULL,
  `ps` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_parameter_cfg
-- ----------------------------
INSERT INTO `sys_parameter_cfg` VALUES ('activiti_explorer_url', '工作流流程图地址', 'http://192.168.20.5:8080/activiti-explorer/diagram-viewer/index.html', null);
INSERT INTO `sys_parameter_cfg` VALUES ('auth_flag', '统一身份认证开启状态', '1', '1开启；0未开启');
INSERT INTO `sys_parameter_cfg` VALUES ('auth_login_address', '统一身份认证服务登录地址', 'http://10.172.81.132:4280/emp/auth/authorization?appkey=610132&edirectUrl=http://10.172.81.132:4280/emp/#home&status=1', null);
INSERT INTO `sys_parameter_cfg` VALUES ('auth_service_address', '统一身份认证服务地址', 'http://10.172.81.132:10000/platform/api?', null);
INSERT INTO `sys_parameter_cfg` VALUES ('baseRate_2', '央行基准利率（一年以上五年以下）', '6', null);
INSERT INTO `sys_parameter_cfg` VALUES ('baseRate_3', '央行基准利率（五年以上）', '6.15', null);
INSERT INTO `sys_parameter_cfg` VALUES ('cmsPath_batch', '批量文件路径', '/home/cms_/batchFile', null);
INSERT INTO `sys_parameter_cfg` VALUES ('CollWebService', '额度平台：客户额度列表查询', 'http://172.18.10.72:8088/IQUMS/ws/LimitWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg` VALUES ('ifap_destPath', '核算平台FTP目标路径', '/ifapfile/input/', null);
INSERT INTO `sys_parameter_cfg` VALUES ('ifap_ftpIp', '核算平台FTP地址', '10.172.91.106', null);
INSERT INTO `sys_parameter_cfg` VALUES ('ifap_password', '核算平台FTP密码', 'ftpuser', null);
INSERT INTO `sys_parameter_cfg` VALUES ('ifap_username', '核算平台FTP用户名', 'ftpuser', null);
INSERT INTO `sys_parameter_cfg` VALUES ('LimitWebService', '额度平台：客户额度列表查询', 'http://172.18.10.72:8088/IQUMS/ws/LimitWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg` VALUES ('mail_host', '邮件服务器ID地址', '10.172.70.243', null);
INSERT INTO `sys_parameter_cfg` VALUES ('mail_pass', '邮件服务器系统用户密码', '111111', null);
INSERT INTO `sys_parameter_cfg` VALUES ('mail_postfix', '邮件服务器后缀标志', '@infohold.cc', null);
INSERT INTO `sys_parameter_cfg` VALUES ('mail_user', '邮件服务器系统用户', 'yishenghe', null);
INSERT INTO `sys_parameter_cfg` VALUES ('PMC_WebService', 'PMC服务地址', 'http://10.172.73.35:8080/portal-service/openapi', null);
INSERT INTO `sys_parameter_cfg` VALUES ('p_downPath', '大门户文件所在路径', '/home/ncms/spFile/downFile/', null);
INSERT INTO `sys_parameter_cfg` VALUES ('p_ftpIp', '大门户FTP', '10.172.91.119', null);
INSERT INTO `sys_parameter_cfg` VALUES ('p_password', '大门户FTP密码', 'ncms', null);
INSERT INTO `sys_parameter_cfg` VALUES ('p_username', '大门户FTP用户名', 'ncms', null);
INSERT INTO `sys_parameter_cfg` VALUES ('resource_request', '图文信息请求url', 'http://localhost:8080/com.fivecar.cms.web/app/Resources.do?anchor=', null);
INSERT INTO `sys_parameter_cfg` VALUES ('service_ip', '服务ip', '182.92.5.130', null);
INSERT INTO `sys_parameter_cfg` VALUES ('service_name', '服务名称', 'com.fivecar.cms.web', null);
INSERT INTO `sys_parameter_cfg` VALUES ('sp_destPath', '子门户FTP目标路径', '', null);
INSERT INTO `sys_parameter_cfg` VALUES ('sp_downPath', '子门户文件地址', '/home/ncms/spFile/uploadFile/', null);
INSERT INTO `sys_parameter_cfg` VALUES ('sp_ftpIp', '子门户FTP地址', '10.172.91.119', null);
INSERT INTO `sys_parameter_cfg` VALUES ('sp_password', '子门户FTP密码', 'ncms', null);
INSERT INTO `sys_parameter_cfg` VALUES ('sp_username', '子门户FTP用户名', 'ncms', null);
INSERT INTO `sys_parameter_cfg` VALUES ('system_date', '记账日期', '2016-02-24', null);
INSERT INTO `sys_parameter_cfg` VALUES ('system_webview', '系统请求地址', 'http://localhost:8080/com.fivecar.cms.web/vehicleWebview.do?', null);
INSERT INTO `sys_parameter_cfg` VALUES ('task_address', '子门户系统任务模块地址', 'http://10.172.66.98:8080/', null);
INSERT INTO `sys_parameter_cfg` VALUES ('tfspPath_batch', '批量文件路径', 'D:\\cmsFile\\batch\\upLoad\\', null);
INSERT INTO `sys_parameter_cfg` VALUES ('vehicle_request', '找车页地址', 'http://localhost:8080/com.fivecar.cms.web/vehicleWebview.do?vehicleid=', null);
INSERT INTO `sys_parameter_cfg` VALUES ('WS_DoRegisterCustomerWebService', 'ecif注册', 'http://192.168.20.15:8080/com.infohold.ecif.service/ws/DoRegisterCustomerWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg` VALUES ('WS_XfaceLoanMaturityDateExtension', '核算系统-展期记账接口', 'http://192.168.10.110:8080/ifap/xface/XfaceLoanMaturityDateExtension?wsdl', null);
INSERT INTO `sys_parameter_cfg` VALUES ('yingxiang_port', '影像系统端口', '8002', null);
INSERT INTO `sys_parameter_cfg` VALUES ('Z', '子门户系统地址', 'http://10.172.73.35:8080/com.infohold.sp.web/loginForward.jsp', null);

-- ----------------------------
-- Table structure for sys_parameter_cfg_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter_cfg_copy`;
CREATE TABLE `sys_parameter_cfg_copy` (
  `key_` varchar(64) NOT NULL,
  `name_` varchar(64) DEFAULT NULL,
  `value_` varchar(128) DEFAULT NULL,
  `ps` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_parameter_cfg_copy
-- ----------------------------
INSERT INTO `sys_parameter_cfg_copy` VALUES ('activiti_explorer_url', '工作流流程图地址', 'http://192.168.20.5:8080/activiti-explorer/diagram-viewer/index.html', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('auth_flag', '统一身份认证开启状态', '1', '1开启；0未开启');
INSERT INTO `sys_parameter_cfg_copy` VALUES ('auth_login_address', '统一身份认证服务登录地址', 'http://10.172.81.132:4280/emp/auth/authorization?appkey=610132&edirectUrl=http://10.172.81.132:4280/emp/#home&status=1', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('auth_service_address', '统一身份认证服务地址', 'http://10.172.81.132:10000/platform/api?', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('baseRate_2', '央行基准利率（一年以上五年以下）', '6', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('baseRate_3', '央行基准利率（五年以上）', '6.15', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('cmsPath_batch', '批量文件路径', '/home/cms_/batchFile', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('CollWebService', '额度平台：客户额度列表查询', 'http://172.18.10.72:8088/IQUMS/ws/LimitWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('ifap_destPath', '核算平台FTP目标路径', '/ifapfile/input/', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('ifap_ftpIp', '核算平台FTP地址', '10.172.91.106', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('ifap_password', '核算平台FTP密码', 'ftpuser', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('ifap_username', '核算平台FTP用户名', 'ftpuser', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('LimitWebService', '额度平台：客户额度列表查询', 'http://172.18.10.72:8088/IQUMS/ws/LimitWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('mail_host', '邮件服务器ID地址', '10.172.70.243', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('mail_pass', '邮件服务器系统用户密码', '111111', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('mail_postfix', '邮件服务器后缀标志', '@infohold.cc', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('mail_user', '邮件服务器系统用户', 'yishenghe', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('PMC_WebService', 'PMC服务地址', 'http://10.172.73.35:8080/portal-service/openapi', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('p_downPath', '大门户文件所在路径', '/home/ncms/spFile/downFile/', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('p_ftpIp', '大门户FTP', '10.172.91.119', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('p_password', '大门户FTP密码', 'ncms', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('p_username', '大门户FTP用户名', 'ncms', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('sp_destPath', '子门户FTP目标路径', '', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('sp_downPath', '子门户文件地址', '/home/ncms/spFile/uploadFile/', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('sp_ftpIp', '子门户FTP地址', '10.172.91.119', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('sp_password', '子门户FTP密码', 'ncms', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('sp_username', '子门户FTP用户名', 'ncms', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('system_date', '记账日期', '2016-02-24', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('task_address', '子门户系统任务模块地址', 'http://10.172.66.98:8080/', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('tfspPath_batch', '批量文件路径', 'D:\\cmsFile\\batch\\upLoad\\', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('WS_DoRegisterCustomerWebService', 'ecif注册', 'http://192.168.20.15:8080/com.infohold.ecif.service/ws/DoRegisterCustomerWebService?wsdl', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('WS_XfaceLoanMaturityDateExtension', '核算系统-展期记账接口', 'http://192.168.10.110:8080/ifap/xface/XfaceLoanMaturityDateExtension?wsdl', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('yingxiang_ip', '影像系统IP', '192.168.10.112', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('yingxiang_port', '影像系统端口', '8002', null);
INSERT INTO `sys_parameter_cfg_copy` VALUES ('Z', '子门户系统地址', 'http://10.172.73.35:8080/com.infohold.sp.web/loginForward.jsp', null);

-- ----------------------------
-- Table structure for sys_sequence_cfg
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence_cfg`;
CREATE TABLE `sys_sequence_cfg` (
  `key_` varchar(64) NOT NULL,
  `name_` varchar(64) DEFAULT NULL,
  `value_` varchar(64) DEFAULT NULL,
  `ps` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序列配置';

-- ----------------------------
-- Records of sys_sequence_cfg
-- ----------------------------
INSERT INTO `sys_sequence_cfg` VALUES ('primary_id', '系统主键', '90007001', null);
INSERT INTO `sys_sequence_cfg` VALUES ('termSeq', '系统流水号', '80105001', null);
INSERT INTO `sys_sequence_cfg` VALUES ('user_id', '用户主键', '70000001', null);

-- ----------------------------
-- Table structure for sys_sequence_cfg_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence_cfg_copy`;
CREATE TABLE `sys_sequence_cfg_copy` (
  `key_` varchar(64) NOT NULL,
  `name_` varchar(64) DEFAULT NULL,
  `value_` varchar(64) DEFAULT NULL,
  `ps` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序列配置';

-- ----------------------------
-- Records of sys_sequence_cfg_copy
-- ----------------------------
INSERT INTO `sys_sequence_cfg_copy` VALUES ('primary_id', '系统主键', '90002601', null);
INSERT INTO `sys_sequence_cfg_copy` VALUES ('termSeq', '系统流水号', '80105001', null);

-- ----------------------------
-- Table structure for tmp_organization
-- ----------------------------
DROP TABLE IF EXISTS `tmp_organization`;
CREATE TABLE `tmp_organization` (
  `id` varchar(128) NOT NULL,
  `banch_name` longtext,
  `banch_no` varchar(32) DEFAULT NULL,
  `banch_p_no` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_organization
-- ----------------------------

-- ----------------------------
-- Table structure for tmp_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tmp_role_menu`;
CREATE TABLE `tmp_role_menu` (
  `role_code` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `id` varchar(128) NOT NULL,
  `bsid` varchar(32) DEFAULT NULL,
  `menu_name` longtext,
  `menu_pid` varchar(32) DEFAULT NULL,
  `menu_url` longtext,
  `role_name` longtext,
  PRIMARY KEY (`role_code`,`menu_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for tmp_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tmp_role_user`;
CREATE TABLE `tmp_role_user` (
  `user_id` varchar(32) NOT NULL,
  `role_code` varchar(32) NOT NULL,
  `id` varchar(32) NOT NULL,
  `banch_no` varchar(32) DEFAULT NULL,
  `bsid` varchar(32) DEFAULT NULL,
  `role_name` longtext,
  `user_name` longtext,
  PRIMARY KEY (`user_id`,`role_code`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_role_user
-- ----------------------------
