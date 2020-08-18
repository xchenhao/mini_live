/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mql

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-08-18 10:17:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_ad
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_ads
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ads`;
CREATE TABLE `cmf_ads` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sid` int(12) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` varchar(255) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `orderno` int(3) DEFAULT '0',
  `addtime` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ads
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_ads_sort
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ads_sort`;
CREATE TABLE `cmf_ads_sort` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(20) DEFAULT '',
  `orderno` int(3) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ads_sort
-- ----------------------------
INSERT INTO `cmf_ads_sort` VALUES ('1', '专题策划', '0', '1466154123');

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cmf_attribute`;
CREATE TABLE `cmf_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0 是显示 1为隐藏 默认为0',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_attribute
-- ----------------------------
INSERT INTO `cmf_attribute` VALUES ('10', 'site_url', '接口域名', 'varchar(255) NOT NULL', 'string', '', '接口访问域名', '1', '', '0', '0', '1', '1461029887', '1460088157', '2', '0');
INSERT INTO `cmf_attribute` VALUES ('19', 'apk_ver', 'APK版本号', 'varchar(255) NOT NULL', 'string', '', '安卓APP最新的版本号，请勿随意修改', '1', '', '0', '0', '1', '1462430453', '1462430453', '5', '0');
INSERT INTO `cmf_attribute` VALUES ('20', 'apk_url', 'APK下载链接', 'varchar(255) NOT NULL', 'string', '', '安卓最新版APK下载链接', '1', '', '0', '0', '1', '1462430496', '1462430496', '5', '0');
INSERT INTO `cmf_attribute` VALUES ('23', 'sitename', '网站标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1463446944', '1463446944', '0', '0');
INSERT INTO `cmf_attribute` VALUES ('24', 'wx_siteurl', '微信推广域名', 'varchar(255) NOT NULL', 'string', '', 'http:// 开头 参数值为用户ID', '1', '', '0', '0', '1', '1485067156', '1463447524', '2', '0');
INSERT INTO `cmf_attribute` VALUES ('26', 'app_android', 'AndroidAPP下载链接', 'varchar(255) NOT NULL', 'string', '', '分享用Android APP 下载链接', '1', '', '0', '0', '1', '1469795340', '1463983679', '7', '0');
INSERT INTO `cmf_attribute` VALUES ('27', 'app_ios', 'IOSAPP下载链接', 'varchar(255) NOT NULL', 'string', '', '分享用IOS APP 下载链接', '1', '', '0', '0', '1', '1469795350', '1463983698', '7', '0');
INSERT INTO `cmf_attribute` VALUES ('28', 'qr_url', '二维码连接', 'varchar(255) NOT NULL', 'string', '', '生成网址：域名+/index.php?g=Portal&m=index&a=scanqr', '1', '', '0', '0', '1', '1464764442', '1464764442', '7', '0');
INSERT INTO `cmf_attribute` VALUES ('30', 'ipa_ver', 'IPA版本号', 'varchar(255) NOT NULL', 'string', '', 'IOS APP最新的版本号，请勿随意修改', '1', '', '0', '0', '1', '1482739031', '1469795739', '5', '0');
INSERT INTO `cmf_attribute` VALUES ('31', 'ipa_url', 'IPA下载链接', 'varchar(255) NOT NULL', 'string', '', 'IOS最新版IPA下载链接', '1', '', '0', '0', '1', '1470628054', '1469795784', '5', '0');
INSERT INTO `cmf_attribute` VALUES ('32', 'site', '网站域名', 'varchar(255) NOT NULL', 'string', '', '网站域名，http:// 开头  尾部不带 /', '1', '', '0', '0', '1', '1487748489', '1470474599', '1', '0');
INSERT INTO `cmf_attribute` VALUES ('34', 'live_width', '推流分辨率宽度', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1472443264', '1472443264', '10', '0');
INSERT INTO `cmf_attribute` VALUES ('35', 'live_height', '推流分辨率高度', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1472443294', '1472443294', '10', '0');
INSERT INTO `cmf_attribute` VALUES ('36', 'keyframe', '关键帧', 'int(10) UNSIGNED NOT NULL', 'num', '', '推荐15-30', '1', '', '0', '0', '1', '1472519112', '1472519112', '10', '0');
INSERT INTO `cmf_attribute` VALUES ('37', 'fps', 'fps帧数', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '0', '0', '1', '1472519501', '1472519501', '10', '0');
INSERT INTO `cmf_attribute` VALUES ('38', 'quality', '品质', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '0', '0', '1', '1472519579', '1472519579', '10', '0');
INSERT INTO `cmf_attribute` VALUES ('40', 'more_img', '话题更多图片', 'varchar(255) NOT NULL', 'picture', '', '话题更多图片', '1', '', '0', '0', '1', '1475829968', '1475829968', '99', '1');
INSERT INTO `cmf_attribute` VALUES ('41', 'pub_msg', '公众号提示信息', 'text NOT NULL', 'textarea', '', '公众号提示信息', '1', '', '0', '0', '1', '1475830030', '1475830030', '98', '0');
INSERT INTO `cmf_attribute` VALUES ('42', 'lotterybase', '中奖基数', 'int(10) UNSIGNED NOT NULL', 'num', '1000000000', '', '1', '', '0', '0', '1', '1475830062', '1475830062', '97', '0');
INSERT INTO `cmf_attribute` VALUES ('43', 'topic_num', '话题数量', 'int(10) UNSIGNED NOT NULL', 'num', '4', '话题数量', '1', '', '0', '0', '1', '1475830114', '1475830114', '96', '1');
INSERT INTO `cmf_attribute` VALUES ('44', 'ex_rate', '映票兑换钻石比例', 'int(10) UNSIGNED NOT NULL', 'num', '9', '多少映票可兑换1钻石', '1', '', '0', '0', '1', '1487749582', '1475830151', '95', '1');
INSERT INTO `cmf_attribute` VALUES ('47', 'share_title', '分享标题', 'varchar(255) NOT NULL', 'string', '', '分享标题', '1', '', '0', '0', '1', '1485067265', '1485067265', '2', '0');
INSERT INTO `cmf_attribute` VALUES ('48', 'share_des', '分享话术', 'varchar(255) NOT NULL', 'string', '', '分享话术', '1', '', '0', '0', '1', '1485067284', '1485067284', '2', '0');
INSERT INTO `cmf_attribute` VALUES ('49', 'ios_shelves', 'IOS上架控制', 'char(10) NOT NULL', 'radio', '1', '', '1', '0:隐藏\n1:显示', '0', '0', '1', '1486282186', '1486282186', '29', '0');
INSERT INTO `cmf_attribute` VALUES ('50', 'name_coin', '钻石名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1487571964', '1487571964', '8', '0');
INSERT INTO `cmf_attribute` VALUES ('51', 'name_votes', '映票名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1487571996', '1487571996', '8', '0');
INSERT INTO `cmf_attribute` VALUES ('52', 'enter_tip_level', '金光一闪提示', 'int(10) UNSIGNED NOT NULL', 'num', '1', '用户等级大于该值时，进入房间有金光一闪效果', '1', '', '0', '0', '1', '1487572939', '1487572939', '9', '0');

-- ----------------------------
-- Table structure for cmf_attributeprivate
-- ----------------------------
DROP TABLE IF EXISTS `cmf_attributeprivate`;
CREATE TABLE `cmf_attributeprivate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `orderno` int(10) DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0 是显示 1为隐藏 默认为0',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_attributeprivate
-- ----------------------------
INSERT INTO `cmf_attributeprivate` VALUES ('1', 'cache_switch', '缓存开关', 'char(10) NOT NULL', 'radio', '1', '', '1', '0:关闭\n1:开启', '0', '0', '1', '1484700153', '1484700153', '1', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('2', 'cache_time', '缓存时间', 'int(10) UNSIGNED NOT NULL', 'num', '60', '', '1', '', '0', '0', '1', '1484700176', '1484700176', '1', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('3', 'ihuyi_account', '互亿无线APIID', 'varchar(255) NOT NULL', 'string', '', '短信验证码   http://www.ihuyi.com/  互亿无线后台-》验证码、短信通知-》账号及签名->APIID', '1', '', '0', '0', '1', '1487915496', '1484700257', '2', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('4', 'ihuyi_ps', '互亿无线key', 'varchar(255) NOT NULL', 'string', '', '短信验证码 互亿无线后台-》验证码、短信通知-》账号及签名->APIKEY', '1', '', '0', '0', '1', '1484700311', '1484700311', '2', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('5', 'jpush_key', '极光推送APP_KEY', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484702736', '1484702736', '3', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('6', 'jpush_secret', '极光推送master_secret', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484702753', '1484702753', '3', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('7', 'userlist_time', '用户列表请求间隔', 'int(10) UNSIGNED NOT NULL', 'num', '60', '直播间用户列表刷新间隔时间', '1', '', '0', '0', '1', '1484704971', '1484704971', '4', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('8', 'barrage_fee', '弹幕费用', 'int(10) UNSIGNED NOT NULL', 'num', '1', '每条弹幕的价格（整数）', '1', '', '0', '0', '1', '1484705113', '1484705113', '5', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('9', 'auth_islimit', '认证限制', 'char(10) NOT NULL', 'radio', '0', '主播开播是否需要身份认证', '1', '0:关闭\n1:开启', '0', '0', '1', '1484707579', '1484707579', '6', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('10', 'level_islimit', '直播等级控制', 'char(10) NOT NULL', 'radio', '0', '直播等级控制是否开启', '1', '0:关闭\n1:开启', '0', '0', '1', '1484873682', '1484707622', '7', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('11', 'level_limit', '限制等级', 'int(10) UNSIGNED NOT NULL', 'num', '3', '直播等级限制开启时，最低开播等级', '1', '', '0', '0', '1', '1484707658', '1484707658', '7', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('12', 'cash_rate', '提现比例', 'int(10) UNSIGNED NOT NULL', 'num', '32', '提现一元人名币需要的票数', '1', '', '0', '0', '1', '1484730868', '1484730868', '8', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('13', 'push_url', '推流服务器地址', 'varchar(255) NOT NULL', 'string', '', '格式：域名(:端口) 或者 IP(:端口)', '1', '', '0', '0', '1', '1484897487', '1484897487', '9', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('14', 'pull_url', '播流服务器地址', 'varchar(255) NOT NULL', 'string', '', '格式：域名(:端口) 或者 IP(:端口)', '1', '', '0', '0', '1', '1484897516', '1484897516', '9', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('15', 'chatserver', '聊天服务器带端口', 'varchar(255) NOT NULL', 'string', '', '格式：http://域名(:端口) 或者 http://IP(:端口)', '1', '', '0', '0', '1', '1484901596', '1484898919', '10', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('16', 'aliapp_switch', '支付宝APP', 'char(10) NOT NULL', 'radio', '1', '支付宝APP支付是否开启', '1', '0:关闭\n1:开启', '0', '0', '1', '1484992012', '1484991759', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('17', 'aliapp_partner', '合作者身份ID', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484992005', '1484991952', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('18', 'aliapp_seller_id', '支付宝帐号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484991997', '1484991997', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('19', 'aliapp_key_android', '支付宝安卓密钥', 'text NOT NULL', 'textarea', '', '', '1', '', '0', '0', '1', '1485049826', '1484992102', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('20', 'aliapp_key_ios', '支付宝苹果密钥', 'text NOT NULL', 'textarea', '', '', '1', '', '0', '0', '1', '1485049882', '1484992155', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('21', 'wx_switch', '微信支付', 'char(10) NOT NULL', 'radio', '1', '微信支付开关', '1', '0:关闭\n1:开启', '0', '0', '1', '1484992225', '1484992225', '12', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('22', 'wx_appid', '开放平台账号AppID', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484992268', '1484992268', '12', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('23', 'wx_appsecret', '微信应用appsecret', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484992292', '1484992292', '12', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('24', 'wx_mchid', '微信商户号mchid', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484992326', '1484992326', '12', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('25', 'wx_key', '微信密钥key', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '0', '1', '1484992342', '1484992342', '12', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('26', 'login_qq', 'APP QQ登录', 'char(10) NOT NULL', 'radio', '1', 'APP QQ登录开关', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670026', '1485222448', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('27', 'login_wx', 'APP 微信登录', 'char(10) NOT NULL', 'radio', '1', 'APP 微信登录开关', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670041', '1485222481', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('28', 'login_sina', 'APP 新浪微博登陆', 'char(10) NOT NULL', 'radio', '1', 'APP 新浪微博登陆开关', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670052', '1485222511', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('29', 'aliapp_check', '支付宝校验码', 'varchar(255) NOT NULL', 'string', '', '支付宝校验码（扫码支付）', '1', '', '0', '0', '1', '1487657767', '1487657767', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('30', 'aliapp_pc', '支付宝PC', 'char(10) NOT NULL', 'radio', '', '支付宝PC扫码支付是否开启', '1', '0:关闭\n1:开启', '0', '0', '1', '1487658029', '1487657968', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('31', 'login_qq_pc', 'PC QQ登录', 'char(10) NOT NULL', 'radio', '', 'PC QQ登录', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670216', '1487670114', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('32', 'login_wx_pc', 'PC 微信登录', 'char(10) NOT NULL', 'radio', '', 'PC 微信登录', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670253', '1487670151', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('33', 'login_sina_pc', 'PC 新浪微博登录', 'char(10) NOT NULL', 'radio', '', 'PC 新浪微博登录', '1', '0:关闭\n1:开启', '0', '0', '1', '1487670225', '1487670197', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('34', 'login_wx_pc_appid', 'PC 微信登录appid', 'varchar(255) NOT NULL', 'string', '', 'PC 微信登录appid', '1', '', '0', '0', '1', '1487671405', '1487671405', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('35', 'login_wx_pc_appsecret', 'PC 微信登录appsecret', 'varchar(255) NOT NULL', 'string', '', 'PC 微信登录appsecret', '1', '', '0', '0', '1', '1487671454', '1487671454', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('36', 'login_sina_pc_akey', 'PC微博登陆akey', 'varchar(255) NOT NULL', 'string', '', 'PC微博登陆akey', '1', '', '0', '0', '1', '1487671618', '1487671618', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('37', 'login_sina_pc_skey', 'PC新浪微博skey', 'varchar(255) NOT NULL', 'string', '', 'PC新浪微博skey', '1', '', '0', '0', '1', '1487671664', '1487671664', '0', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('38', 'wx_switch_pc', '微信支付PC', 'char(10) NOT NULL', 'radio', '', '微信支付PC 是否开启', '1', '0:关闭\n1:开启', '0', '0', '1', '1487733171', '1487733158', '11', '0');
INSERT INTO `cmf_attributeprivate` VALUES ('39', 'cash_min', '提现最低额度（元）', 'int(10) UNSIGNED NOT NULL', 'num', '30', '可提现的最小额度，低于该额度无法体现', '1', '', '0', '0', '1', '1487839089', '1487838952', '8', '0');

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/users_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/users_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/users_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/users', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/profit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/enable', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/disable', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/cash', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/family/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/index2', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/video/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/agent/index2', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/agent/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/agent/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/car/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liang/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/user_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/do_user_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/user_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/do_user_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/user_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/user_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/vip/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liveing/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liveing/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liveing/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/liveing/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/system/send', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/system/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/report/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/report/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/monitor/stoproom', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/monitor/full', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/monitor/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/live/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/live/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/chargerules/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/chargerules/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/chargerules/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/chargerules/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/chargerules/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/manual/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/manual/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/coinrecord/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/cash/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/cash/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/charge/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/charge/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/finance/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levelanchor/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levelanchor/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levelanchor/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levelanchor/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levellimit/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levellimit/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levellimit/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levellimit/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/levellimit/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/level/experlevel_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/level/experlevel_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/level/experlevel_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/level/experlevel_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/level/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/sort_listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/sort_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/sort_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/gift/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/userauth/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/userauth/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelhot', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/hot', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelsuper', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/super', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/recordall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/zombieall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/zombiepbatch', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/record', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelrecord', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/zombiep', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelzombiep', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/zombie', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelzombie', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelrecommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/default1', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'user/indexadmin/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/loginbonus/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/loginbonus/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/loginbonus/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/configprivate/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/update', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/config/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/setting/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/sort_listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/sort_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/do_sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/do_sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/sort_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users_edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users_add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/users', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/profit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/enable', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/disable', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/cash', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/family/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/index2', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/video/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/agent/index2', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/agent/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/agent/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/car/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liang/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/user_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/do_user_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/user_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/do_user_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/user_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/user_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/vip/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/liveing/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/system/send', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/system/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/report/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/report/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/monitor/full', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/monitor/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/live/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/live/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/do_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/do_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/chargerules/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/manual/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/manual/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/manual/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/coinrecord/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/cash/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/cash/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/cash/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/charge/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/charge/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/finance/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levelanchor/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/do_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/do_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/levellimit/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/experlevel_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/level/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/sort_listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/sort_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/do_sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/do_sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/sort_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/gift/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/userauth/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/userauth/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/userauth/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelhot', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/hot', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelsuper', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/super', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/recordall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/zombieall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/zombiepbatch', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/record', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelrecord', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/zombiep', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelzombiep', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/zombie', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelzombie', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelrecommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/default1', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'user/indexadmin/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/loginbonus/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/loginbonus/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/loginbonus/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/loginbonus/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/update', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/set_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/configprivate/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/set_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/update', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/config/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/setting/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/sort_listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/sort_del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/do_sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/sort_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/do_sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/sort_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/sort_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/del', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/ads/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/storage/setting_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/storage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slidecat/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/slide/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/backup/del_backup', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/backup/download', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/backup/index_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/backup/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/backup/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/extension/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/feedback/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/feedback/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminterm/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/check', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/move', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/top', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'portal/adminpost/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('2', 'admin/content/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/ads/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/storage/setting_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/storage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slidecat/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slidecat/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slidecat/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slidecat/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/slide/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/backup/del_backup', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/backup/download', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/backup/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/backup/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/extension/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/feedback/setstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/feedback/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/add_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/edit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminterm/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/check', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/move', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/top', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/listorders', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'portal/adminpost/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('3', 'admin/content/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/agent_total_settle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_settle_lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_settle_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_settle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/agent_total_income', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_regist', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_charge', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_income', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/agent_total', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/user/channel_total_settle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/agent_total_charge', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/agent_total_regist', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channeledit_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/addchannel_post', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/user/channel_total_income', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/user/channel_total_regist', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/user/channel_total_charge', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/user/channel_total', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/add_channel', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/user/channel_index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'user/indexadmin/default3', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'user/indexadmin/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('6', 'admin/setting/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('5', 'admin/setting/default', 'admin_url');

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', '', '内容管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', '', '所有留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', '', '删除网站留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', '', '评论管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', '', '删除评论', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', '', '评论审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', '', '文章管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', '', '文章排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', '', '文章置顶', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', '', '文章推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', '', '批量移动', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', '', '文章审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', '', '删除文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', '', '编辑文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', '', '添加文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', '', '分类管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', '', '文章分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', '', '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', '', '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', '', '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', '', '页面管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', '', '页面排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', '', '删除页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', '', '编辑页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', '', '添加页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', '', '回收站', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', '', '文章回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', '', '文章还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', '', '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', '', '页面回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', '', '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', '', '页面还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', '', '扩展设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', '', '备份管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', '', '数据还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', '', '数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', '', '提交数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', '', '下载备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', '', '删除备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', '', '数据备份导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', '', '插件管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', '', '插件启用切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', '', '插件设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', '', '插件设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', '', '插件安装', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', '', '插件卸载', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', '', '轮播管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', '', '轮播替换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', '', '幻灯片排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', '', '幻灯片显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', '', '删除幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', '', '编辑幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', '', '添加幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', '', '轮播分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', '', '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', '', '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', '', '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', '', '网站广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', '', '广告显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', '', '删除广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', '', '编辑广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', '', '添加广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', '', '友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', '', '友情链接排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', '', '友链显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', '', '删除友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', '', '编辑友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', '', '添加友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', '', '第三方登陆', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', '', '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', '', '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', '', '前台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', '', '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', '', '前台导航排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', '', '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', '', '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', '', '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', '', '菜单分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', '', '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', '', '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', '', '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', '', '后台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', '', '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', '', '后台菜单排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', '', '菜单备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', '', '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', '', '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', '', '所有菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', '', '系统设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', '', '个人信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', '', '修改信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', '', '修改信息提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', '', '修改密码', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', '', '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', '', '网站信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', '', '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', '', '路由列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', '', '路由添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', '', '路由添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', '', '路由编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', '', '路由编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', '', '路由删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', '', '路由禁止', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', '', '路由启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', '', '路由排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', '', '邮箱配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', '', 'SMTP配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', '', '提交配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', '', '邮件模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', '', '提交模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', '', '清除缓存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', '', '用户管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', '', '用户组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', '', '本站用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', '', '拉黑会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', '', '启用会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', '', '第三方用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', '', '第三方用户解绑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', '', '管理组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', '', '角色管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', '', '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', '', '权限设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', '', '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', '', '编辑角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', '', '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', '', '删除角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', '', '添加角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', '', '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', '', '管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', '', '删除管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', '', '管理员编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', '', '管理员添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', '', '插件更新', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', '', '文件存储', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', '', '文件存储设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', '', '禁用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', '', '启用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', '', '禁用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', '', '启用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', 'Gift', 'admin_url', 'gift/indexadmin/default', '', '礼物管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', 'Gift', 'admin_url', 'gift/indexadmin/index', '', '礼物列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('164', 'Admin', 'admin_url', 'admin/gift/index', '', '礼物列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('165', 'Admin', 'admin_url', 'admin/gift/default', '', '礼物管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/gift/sort_index', '', '礼物分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/level/default', '', '等级管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/level/experlevel_index', '', '经验等级', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', 'Admin', 'admin_url', 'admin/finance/default', '', '财务管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/charge/index', '', '充值记录', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/cash/index', '', '提现记录', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/coinrecord/index', '', '消费记录', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/live/default', '', '直播管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('174', 'Admin', 'admin_url', 'admin/live/index', '', '直播记录', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('175', 'Admin', 'admin_url', 'admin/config/index', '', '公共设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('176', 'Admin', 'admin_url', 'admin/manual/index', '', '手动充值', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('177', 'Admin', 'admin_url', 'admin/traffic/index', '', '流量包激活', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('178', 'Admin', 'admin_url', 'admin/manual/add', '', '手动充值', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('179', 'Admin', 'admin_url', 'admin/config/lists', '', '管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('180', 'Admin', 'admin_url', 'admin/config/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('181', 'Admin', 'admin_url', 'admin/config/set_post', '', '设置修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('182', 'Admin', 'admin_url', 'admin/config/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('183', 'Admin', 'admin_url', 'admin/config/update', '', '添加保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('184', 'Admin', 'admin_url', 'admin/config/delete', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('185', 'Admin', 'admin_url', 'admin/traffic/add', '', '号码添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('186', 'Admin', 'admin_url', 'admin/traffic/add_post', '', '添加修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('187', 'Admin', 'admin_url', 'admin/traffic/excel_import', '', 'excel导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('188', 'Admin', 'admin_url', 'admin/traffic/active', '', '激活', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('189', 'Admin', 'admin_url', 'admin/traffic/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('190', 'user', 'admin_url', 'user/indexadmin/add', '', '新增会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('191', 'user', 'admin_url', 'user/indexadmin/add_post', '', '新增会员修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('192', 'User', 'admin_url', 'user/indexadmin/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('193', 'User', 'admin_url', 'user/indexadmin/edit_post', '', '编辑修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('194', 'user', 'admin_url', 'user/indexadmin/recommend', '', '推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('195', 'User', 'admin_url', 'user/indexadmin/cancelrecommend', '', '取消推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('196', 'Admin', 'admin_url', 'admin/level/experlevel_add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('197', 'Admin', 'admin_url', 'admin/level/experlevel_add_post', '', '添加修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('198', 'Admin', 'admin_url', 'admin/level/experlevel_edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('199', 'admin', 'admin_url', 'admin/level/experlevel_edit_post', '', '编辑修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('200', 'Admin', 'admin_url', 'admin/level/experlevel_del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('201', 'Admin', 'admin_url', 'admin/charge/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('202', 'Admin', 'admin_url', 'admin/cash/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('203', 'Admin', 'admin_url', 'admin/cash/edit_post', '', '编辑修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('204', 'Admin', 'admin_url', 'admin/manual/add_post', '', '添加修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('205', 'Admin', 'admin_url', 'admin/gift/add', '', '礼物添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('206', 'Admin', 'admin_url', 'admin/gift/add_post', '', '礼物添加修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('207', 'Admin', 'admin_url', 'admin/gift/edit', '', '礼物修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('208', 'Admin', 'admin_url', 'admin/gift/edit_post', '', '礼物编辑修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('209', 'Admin', 'admin_url', 'admin/gift/del', '', '礼物删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('210', 'Admin', 'admin_url', 'admin/gift/listorders', '', '礼物排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('211', 'Admin', 'admin_url', 'admin/gift/sort_add', '', '分类添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('212', 'Admin', 'admin_url', 'admin/gift/do_sort_add', '', '分类添加修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('213', 'Admin', 'admin_url', 'admin/gift/sort_edit', '', '分类编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('214', 'Admin', 'admin_url', 'admin/gift/do_sort_edit', '', '分类编辑修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('215', 'Admin', 'admin_url', 'admin/gift/sort_del', '', '分类删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('216', 'Admin', 'admin_url', 'admin/gift/sort_listorders', '', '分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('217', 'User', 'admin_url', 'user/indexadmin/del', '', '删除会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('218', 'Admin', 'admin_url', 'admin/monitor/index', '', '直播监控', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('219', 'Admin', 'admin_url', 'admin/userauth/index', '', '身份认证', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('220', 'Admin', 'admin_url', 'admin/userauth/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('221', 'Admin', 'admin_url', 'admin/userauth/edit_post', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('222', 'Admin', 'admin_url', 'admin/levellimit/index', '', '等级提现', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('223', 'Admin', 'admin_url', 'admin/levellimit/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('224', 'Admin', 'admin_url', 'admin/levellimit/do_add', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('225', 'Admin', 'admin_url', 'admin/levellimit/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('226', 'Admin', 'admin_url', 'admin/levellimit/do_edit', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('227', 'Admin', 'admin_url', 'admin/levellimit/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('228', 'Admin', 'admin_url', 'admin/levellimit/listorders', '', '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('229', 'Admin', 'admin_url', 'admin/feedback/index', '', '用户反馈', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('230', 'Admin', 'admin_url', 'admin/feedback/setstatus', '', '状态修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('231', 'Admin', 'admin_url', 'admin/ads/index', '', 'PC广告图片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('232', 'Admin', 'admin_url', 'admin/ads/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('233', 'Admin', 'admin_url', 'admin/ads/add_post', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('234', 'Admin', 'admin_url', 'admin/ads/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('235', 'Admin', 'admin_url', 'admin/ads/edit_post', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('236', 'Admin', 'admin_url', 'admin/ads/default', '', 'PC广告图片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('237', 'Admin', 'admin_url', 'admin/ads/sort_index', '', '广告分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('238', 'Admin', 'admin_url', 'admin/ads/sort_add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('239', 'Admin', 'admin_url', 'admin/ads/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('240', 'Admin', 'admin_url', 'admin/ads/listorders', '', '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('241', 'Admin', 'admin_url', 'admin/ads/do_sort_add', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('242', 'Admin', 'admin_url', 'admin/report/index', '', '用户举报', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('243', 'User', 'admin_url', 'user/indexadmin/cancelzombie', '', '关闭僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('244', 'User', 'admin_url', 'user/indexadmin/zombie', '', '开启僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('245', 'user', 'admin_url', 'user/indexadmin/cancelzombiep', '', '取消设置僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('246', 'User', 'admin_url', 'user/indexadmin/zombiep', '', '设置为僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('247', 'User', 'admin_url', 'user/indexadmin/cancelrecord', '', '关闭录播', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('248', 'User', 'admin_url', 'user/indexadmin/record', '', '开启录播', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('249', 'User', 'admin_url', 'user/indexadmin/zombiepbatch', '', '批量设置/取消僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('250', 'User', 'admin_url', 'user/indexadmin/zombieall', '', '一键开启/关闭僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('251', 'User', 'admin_url', 'user/indexadmin/recordall', '', '一键开启/关闭录播', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('252', 'Admin', 'admin_url', 'admin/ads/sort_edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('253', 'Admin', 'admin_url', 'admin/report/setstatus', '', '标记处理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('254', 'Admin', 'admin_url', 'admin/gift/mount', '', '坐骑列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('255', 'Admin', 'admin_url', 'admin/gift/mountadd', '', '坐骑添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('256', 'admin', 'admin_url', 'admin/topic/index', '', '话题管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('257', 'admin', 'admin_url', 'admin/lottery/index', '', '中奖管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('258', 'admin', 'admin_url', 'admin/vip/inde', '', 'vip管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('259', 'admin', 'admin_url', 'admin/vip/vip', '', 'vip配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('260', 'admin', 'admin_url', 'admin/vip/index', '', 'vip用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('261', 'User', 'admin_url', 'user/indexadmin/super', '', '设置超管', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('262', 'User', 'admin_url', 'user/indexadmin/cancelsuper', '', '取消超管', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('263', 'User', 'admin_url', 'user/indexadmin/hot', '', '设置热门', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('264', 'User', 'admin_url', 'user/indexadmin/cancelhot', '', '取消热门', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('265', 'Admin', 'admin_url', 'admin/system/index', '', '系统消息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('266', 'Admin', 'admin_url', 'admin/system/send', '', '信息发送', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('267', 'Admin', 'admin_url', 'admin/zombie/index', '', '僵尸粉', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('268', 'Admin', 'admin_url', 'admin/zombie/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('269', 'Admin', 'admin_url', 'admin/zombie/add_post', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('270', 'Admin', 'admin_url', 'admin/zombie/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('271', 'Admin', 'admin_url', 'admin/zombie/edit_post', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('272', 'Admin', 'admin_url', 'admin/zombie/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('273', 'Admin', 'admin_url', 'admin/liveing/index', '', '直播列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('274', 'Admin', 'admin_url', 'admin/configprivate/index', '', '私密设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('275', 'Admin', 'admin_url', 'admin/configprivate/set_post', '', '设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('276', 'Admin', 'admin_url', 'admin/configprivate/lists', '', '列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('277', 'Admin', 'admin_url', 'admin/configprivate/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('278', 'Admin', 'admin_url', 'admin/configprivate/update', '', '添加/编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('279', 'Admin', 'admin_url', 'admin/configprivate/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('280', 'Admin', 'admin_url', 'admin/configprivate/listorders', '', '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('281', 'Admin', 'admin_url', 'admin/configprivate/delete', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('282', 'Admin', 'admin_url', 'admin/chargerules/index', '', '充值规则', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('283', 'Admin', 'admin_url', 'admin/chargerules/add', '', '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('284', 'Admin', 'admin_url', 'admin/chargerules/do_add', '', '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('285', 'Admin', 'admin_url', 'admin/chargerules/edit', '', '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('286', 'Admin', 'admin_url', 'admin/chargerules/do_edit', '', '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('287', 'Admin', 'admin_url', 'admin/chargerules/listorders', '', '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('288', 'Admin', 'admin_url', 'admin/chargerules/del', '', '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('289', 'Admin', 'admin_url', 'admin/loginbonus/default', null, '登录奖励', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('290', 'Admin', 'admin_url', 'admin/loginbonus/index', null, '奖励管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('291', 'Admin', 'admin_url', 'admin/loginbonus/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('292', 'Admin', 'admin_url', 'admin/loginbonus/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('293', 'Admin', 'admin_url', 'admin/monitor/full', null, '监控大屏', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('294', 'Admin', 'admin_url', 'admin/liveing/add', null, '添加视频', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('295', 'Admin', 'admin_url', 'admin/liveing/add_post', null, '视频添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('296', 'Admin', 'admin_url', 'admin/liveing/edit', null, '视频编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('297', 'Admin', 'admin_url', 'admin/liveing/edit_post', null, '视频编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('298', 'Admin', 'admin_url', 'admin/liveing/del', null, '视频删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('299', 'Admin', 'admin_url', 'admin/video/default', null, '短视频管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('300', 'Admin', 'admin_url', 'admin/video/index', null, '视频列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('301', 'Admin', 'admin_url', 'admin/video/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('302', 'Admin', 'admin_url', 'admin/video/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('303', 'Admin', 'admin_url', 'admin/video/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('304', 'Admin', 'admin_url', 'admin/video/index2', null, '举报列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('305', 'Admin', 'admin_url', 'admin/video/setstatus', null, '标记处理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('306', 'Admin', 'admin_url', 'admin/vip/default', null, 'VIP管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('307', 'Admin', 'admin_url', 'admin/vip/user_index', null, 'VIP用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('308', 'Admin', 'admin_url', 'admin/vip/add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('309', 'Admin', 'admin_url', 'admin/vip/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('310', 'Admin', 'admin_url', 'admin/vip/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('311', 'Admin', 'admin_url', 'admin/vip/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('312', 'Admin', 'admin_url', 'admin/vip/listorders', null, '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('313', 'Admin', 'admin_url', 'admin/vip/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('314', 'Admin', 'admin_url', 'admin/vip/user_add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('315', 'Admin', 'admin_url', 'admin/vip/do_user_add', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('316', 'Admin', 'admin_url', 'admin/vip/user_edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('317', 'Admin', 'admin_url', 'admin/vip/do_user_edit', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('318', 'Admin', 'admin_url', 'admin/vip/user_del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('319', 'Admin', 'admin_url', 'admin/liang/default', null, '靓号管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('320', 'Admin', 'admin_url', 'admin/liang/index', null, '靓号列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('321', 'Admin', 'admin_url', 'admin/liang/add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('322', 'Admin', 'admin_url', 'admin/liang/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('323', 'Admin', 'admin_url', 'admin/liang/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('324', 'Admin', 'admin_url', 'admin/liang/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('325', 'Admin', 'admin_url', 'admin/liang/listorders', null, '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('326', 'Admin', 'admin_url', 'admin/liang/setstatus', null, '设置状态', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('327', 'Admin', 'admin_url', 'admin/liang/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('328', 'Admin', 'admin_url', 'admin/car/default', null, '坐骑管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('329', 'Admin', 'admin_url', 'admin/car/index', null, '坐骑列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('330', 'Admin', 'admin_url', 'admin/car/add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('331', 'Admin', 'admin_url', 'admin/car/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('332', 'Admin', 'admin_url', 'admin/car/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('333', 'Admin', 'admin_url', 'admin/car/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('334', 'Admin', 'admin_url', 'admin/car/listorders', null, '排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('335', 'Admin', 'admin_url', 'admin/car/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('336', 'Admin', 'admin_url', 'admin/agent/default', null, '分销管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('337', 'Admin', 'admin_url', 'admin/agent/index', null, '分销关系', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('338', 'Admin', 'admin_url', 'admin/agent/index2', null, '分销收益', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('339', 'Admin', 'admin_url', 'admin/levelanchor/index', null, '主播等级', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('340', 'Admin', 'admin_url', 'admin/levelanchor/add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('341', 'Admin', 'admin_url', 'admin/levelanchor/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('342', 'Admin', 'admin_url', 'admin/levelanchor/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('343', 'Admin', 'admin_url', 'admin/levelanchor/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('344', 'Admin', 'admin_url', 'admin/levelanchor/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('345', 'Admin', 'admin_url', 'admin/family/default', null, '家族管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('346', 'Admin', 'admin_url', 'admin/family/index', null, '家族列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('347', 'Admin', 'admin_url', 'admin/family/edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('348', 'Admin', 'admin_url', 'admin/family/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('349', 'Admin', 'admin_url', 'admin/family/disable', null, '禁用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('350', 'Admin', 'admin_url', 'admin/family/enable', null, '启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('351', 'Admin', 'admin_url', 'admin/family/profit', null, '收益', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('352', 'Admin', 'admin_url', 'admin/family/cash', null, '提现', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('353', 'Admin', 'admin_url', 'admin/family/del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('354', 'Admin', 'admin_url', 'admin/family/users', null, '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('355', 'Admin', 'admin_url', 'admin/family/users_add', null, '添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('356', 'Admin', 'admin_url', 'admin/family/users_add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('357', 'Admin', 'admin_url', 'admin/family/users_edit', null, '编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('358', 'Admin', 'admin_url', 'admin/family/users_edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('359', 'Admin', 'admin_url', 'admin/family/users_del', null, '删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('360', 'Admin', 'admin_url', 'admin/monitor/stoproom', null, '直播关闭', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('361', 'Admin', 'admin_url', 'admin/user/add_agent', null, '代理添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('362', 'Admin', 'admin_url', 'admin/user/agent_index', null, '代理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('363', 'Admin', 'admin_url', 'admin/user/channel_index', null, '渠道', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('364', 'Admin', 'admin_url', 'admin/user/add_channel', null, '渠道添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('365', 'admin', 'admin_url', 'admin/user/addagent_post', null, '代理添加保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('366', 'admin', 'admin_url', 'admin/user/addchannel_post', null, '渠道添加保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('367', 'admin', 'admin_url', 'admin/user/agent_edit', null, '代理修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('368', 'admin', 'admin_url', 'admin/user/agentedit_post', null, '代理修改保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('369', 'admin', 'admin_url', 'admin/user/agent_delete', null, '代理删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('370', 'admin', 'admin_url', 'admin/user/agent_ban', null, '代理拉黑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('371', 'admin', 'admin_url', 'admin/user/agent_cancelban', null, '代理启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('372', 'admin', 'admin_url', 'admin/user/channel_edit', null, '渠道修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('373', 'admin', 'admin_url', 'admin/user/channeledit_post', null, '渠道修改保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('374', 'admin', 'admin_url', 'admin/user/channel_ban', null, '拉黑渠道', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('375', 'admin', 'admin_url', 'admin/user/channel_cancelban', null, '启用渠道', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('376', 'admin', 'admin_url', 'admin/user/agent_regist', null, '代理下用户注册列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('377', 'admin', 'admin_url', 'admin/user/agent_charge', null, '代理下用户充值列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('378', 'admin', 'admin_url', 'admin/user/agent_income', null, '代理收益列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('379', 'admin', 'admin_url', 'admin/user/channel_regist', null, '渠道下用户注册列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('380', 'admin', 'admin_url', 'admin/user/channel_charge', null, '渠道下用户充值列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('381', 'admin', 'admin_url', 'admin/user/channel_income', null, '渠道收益列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('382', 'admin', 'admin_url', 'admin/user/agent_total', null, '代理统计', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('383', 'admin', 'admin_url', 'admin/user/agent_total_regist', null, '代理统计注册列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('384', 'admin', 'admin_url', 'admin/user/agent_total_charge', null, '代理统计充值列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('385', 'admin', 'admin_url', 'admin/user/agent_total_income', null, '代理统计收益列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('386', 'admin', 'admin_url', 'admin/user/channel_total', null, '渠道统计（仅给渠道用户用）', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('387', 'admin', 'admin_url', 'admin/user/channel_total_charge', null, '渠道统计充值列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('388', 'admin', 'admin_url', 'admin/user/channel_total_regist', null, '渠道统计注册列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('389', 'admin', 'admin_url', 'admin/user/channel_total_income', null, '渠道统计收益列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('390', 'admin', 'admin_url', 'admin/user/agent_settle', null, '渠道结算', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('391', 'admin', 'admin_url', 'admin/user/channel_settle', null, '渠道结算', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('392', 'admin', 'admin_url', 'admin/user/channel_settle_post', null, '渠道结算保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('393', 'admin', 'admin_url', 'admin/user/agent_settle_post', null, '代理结算保存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('394', 'admin', 'admin_url', 'admin/user/channel_settle_lists', null, '渠道收益结算列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('395', 'admin', 'admin_url', 'admin/user/agent_settle_lists', null, '代理收益结算列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('396', 'admin', 'admin_url', 'admin/users/channel_total_settle', null, '渠道统计结算列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('397', 'admin', 'admin_url', 'admin/users/agent_total_settle', null, '代理统计结算列表[仅为代理用]', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('398', 'admin', 'admin_url', 'admin/user/agent_total_settle', null, '代理统计结算列表[仅为代理用]', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('399', 'admin', 'admin_url', 'admin/user/channel_total_settle', null, '渠道统计结算列表', '1', '');

-- ----------------------------
-- Table structure for cmf_car
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car`;
CREATE TABLE `cmf_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `swf` varchar(255) DEFAULT '',
  `swftime` decimal(10,2) DEFAULT '0.00',
  `needcoin` int(20) DEFAULT '0',
  `orderno` int(10) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `words` varchar(255) DEFAULT '' COMMENT '进场话术',
  `uptime` int(11) DEFAULT '0',
  `type_keeper_month` tinyint(1) DEFAULT '0',
  `type_keeper_year` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_car
-- ----------------------------
INSERT INTO `cmf_car` VALUES ('1', '小乌龟', '/data/upload/20170513/20170719_596f21ba9a9cf.png', '/data/upload/20170513/20170719_596f21c36251c.gif', '4.00', '100', '0', '1500455416', '骑着小乌龟进场了', '0', '0', '0');
INSERT INTO `cmf_car` VALUES ('2', '小毛驴', '/data/upload/20170513/20170719_596f226a0eab1.png', '/data/upload/20170513/20170719_596f2270a0156.gif', '4.00', '200', '0', '1500455559', '骑着小毛驴进场了', '0', '0', '0');
INSERT INTO `cmf_car` VALUES ('5', '魔法扫把', '/data/upload/20170513/20170801_5980600a249de.png', '/data/upload/20170513/20170801_598060127a606.gif', '4.00', '3000', '0', '1501585432', '骑着魔法扫把进场了', '0', '0', '0');
INSERT INTO `cmf_car` VALUES ('7', '皮皮虾', '/data/upload/20170513/20170922_59c4c636b002b.gif', '/data/upload/20170513/20170922_59c4c63c4cf98.gif', '5.00', '300', '0', '1506068049', '皮皮虾，我们走', '0', '0', '0');

-- ----------------------------
-- Table structure for cmf_charge_rules
-- ----------------------------
DROP TABLE IF EXISTS `cmf_charge_rules`;
CREATE TABLE `cmf_charge_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `coin` int(11) DEFAULT '0',
  `money` decimal(11,2) DEFAULT '0.00',
  `money_ios` decimal(11,2) DEFAULT '0.00',
  `product_id` varchar(50) DEFAULT '',
  `give` int(11) DEFAULT '0',
  `orderno` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_charge_rules
-- ----------------------------
INSERT INTO `cmf_charge_rules` VALUES ('1', '60钻石', '60', '6.00', '6.00', 'coin__60', '0', '1', '1484984685');
INSERT INTO `cmf_charge_rules` VALUES ('9', '380钻石', '380', '38.00', '38.00', 'coin__380', '0', '3', '1509854727');
INSERT INTO `cmf_charge_rules` VALUES ('3', '180钻石', '180', '18.00', '18.00', 'coin__180', '0', '2', '1484985412');
INSERT INTO `cmf_charge_rules` VALUES ('10', '888钻石', '888', '88.00', '88.00', 'coin__888', '0', '4', '1509855195');
INSERT INTO `cmf_charge_rules` VALUES ('11', '3888钻石', '3888', '380.00', '380.00', 'coin__3888', '0', '5', '1509855656');
INSERT INTO `cmf_charge_rules` VALUES ('12', '5999钻石', '5999', '588.00', '588.00', 'coin__5888', '0', '6', '1509855942');

-- ----------------------------
-- Table structure for cmf_comments
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_config
-- ----------------------------
DROP TABLE IF EXISTS `cmf_config`;
CREATE TABLE `cmf_config` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `site_url` varchar(255) NOT NULL COMMENT '接口域名',
  `apk_ver` varchar(255) NOT NULL COMMENT 'APK版本号',
  `apk_url` varchar(255) NOT NULL COMMENT 'APK下载链接',
  `apk_des` varchar(255) DEFAULT '' COMMENT 'APK版本更新说明',
  `sitename` varchar(255) NOT NULL COMMENT '网站标题',
  `wx_siteurl` varchar(255) NOT NULL COMMENT '微信推广域名',
  `app_android` varchar(255) NOT NULL COMMENT 'AndroidAPP下载链接',
  `app_ios` varchar(255) NOT NULL COMMENT 'IOSAPP下载链接',
  `qr_url` varchar(255) NOT NULL COMMENT '二维码连接',
  `ipa_ver` varchar(255) NOT NULL COMMENT 'IPA版本号',
  `ipa_url` varchar(255) NOT NULL COMMENT 'IPA下载链接',
  `ipa_des` varchar(255) DEFAULT '' COMMENT 'IPA版本更新说明',
  `site` varchar(255) NOT NULL COMMENT '网站域名',
  `live_width` varchar(255) NOT NULL COMMENT '推流分辨率宽度',
  `live_height` varchar(255) NOT NULL COMMENT '推流分辨率高度',
  `keyframe` int(10) unsigned NOT NULL COMMENT '关键帧',
  `fps` int(10) unsigned NOT NULL COMMENT 'fps帧数',
  `quality` int(10) unsigned NOT NULL COMMENT '品质',
  `more_img` varchar(255) NOT NULL COMMENT '话题更多图片',
  `pub_msg` text NOT NULL COMMENT '公众号提示信息',
  `lotterybase` int(10) unsigned NOT NULL DEFAULT '1000000000' COMMENT '中奖基数',
  `topic_num` int(10) unsigned NOT NULL DEFAULT '4' COMMENT '话题数量',
  `ex_rate` int(10) unsigned NOT NULL DEFAULT '9' COMMENT '映票兑换钻石比例',
  `share_title` varchar(255) NOT NULL COMMENT '分享标题',
  `share_des` varchar(255) NOT NULL COMMENT '分享话术',
  `ios_shelves` varchar(10) NOT NULL DEFAULT '' COMMENT 'IOS上架控制',
  `name_coin` varchar(255) NOT NULL COMMENT '钻石名称',
  `name_votes` varchar(255) NOT NULL COMMENT '映票名称',
  `enter_tip_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '金光一闪提示',
  `maintain_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '网站维护开关',
  `maintain_tips` varchar(255) DEFAULT '' COMMENT '维护内容',
  `copyright` varchar(255) DEFAULT '' COMMENT '版权信息',
  `live_time_coin` varchar(255) DEFAULT '' COMMENT '计时收费梯价',
  `login_type` varchar(255) DEFAULT '' COMMENT '登录方式',
  `live_type` varchar(255) DEFAULT '' COMMENT '直播类型',
  `share_type` varchar(255) DEFAULT '' COMMENT '分享类型',
  `video_share_title` varchar(255) DEFAULT '' COMMENT '短视频分享标题',
  `video_share_des` varchar(255) DEFAULT '' COMMENT '短视频分享话术',
  `site_icp` varchar(255) NOT NULL COMMENT '备案信息',
  `site_addr` varchar(255) NOT NULL COMMENT '地址',
  `site_telephone` varchar(255) NOT NULL COMMENT '电话',
  `site_email` varchar(255) NOT NULL COMMENT '邮箱',
  `live_show` varchar(255) NOT NULL COMMENT '才艺直播',
  `live_show_time` varchar(255) NOT NULL COMMENT '才艺直播时间',
  `live_record` varchar(255) NOT NULL COMMENT '才艺回放',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_config
-- ----------------------------
INSERT INTO `cmf_config` VALUES ('1', '', '2.2.4', '', '1', '北京喵斯拉网络科技有限公司', 'http://www./wxshare/index.php/Share/show?roomnum=', '', '', '\\', '11.4', '', '2017.10.16\n1.假视频支持mp4格式；\n2.左侧按钮静音无影响处理；', '', '450', '800', '15', '20', '95', '', '', '1000000000', '5', '9', '我在这里直播，大家都来观看哦', '正在直播，快来一起看呀', '1.1', '钻石', '映票', '12', '0', '维护通知：为了更好的为您服务，本站正在升级维护中，因此带来不便深表歉意\n', '北京喵斯拉网络科技有限公司 版权所有', '3，60，80', 'wx', '0;普通房间,3;计时房间,6;私播房间', 'wx,wchat', '拍视频，有颜有料上热门', '发布了视频，快来一起看呀', '备案号：京ICP备14055174号-1', '地址：北京市朝阳区阜通东大街1号院5号楼2单元18层321801', '座机：010-64190806', '', '11893,11894,11895,11896', '开播时间：上午9:00-12:00，下午1:30-4:30', '11958,11959,11960,11955');

-- ----------------------------
-- Table structure for cmf_config_private
-- ----------------------------
DROP TABLE IF EXISTS `cmf_config_private`;
CREATE TABLE `cmf_config_private` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `cache_switch` int(10) NOT NULL DEFAULT '1' COMMENT '缓存开关',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '缓存时间',
  `ihuyi_account` varchar(255) NOT NULL COMMENT '互亿无线APIID',
  `ihuyi_ps` varchar(255) NOT NULL COMMENT '互亿无线key',
  `jpush_key` varchar(255) NOT NULL COMMENT '极光推送APP_KEY',
  `jpush_secret` varchar(255) NOT NULL COMMENT '极光推送master_secret',
  `userlist_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '用户列表请求间隔',
  `barrage_fee` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '弹幕费用',
  `auth_islimit` int(10) NOT NULL DEFAULT '0' COMMENT '认证限制',
  `level_islimit` int(10) NOT NULL DEFAULT '0' COMMENT '直播等级控制',
  `level_limit` int(10) unsigned NOT NULL DEFAULT '3' COMMENT '限制等级',
  `linkmic_limit` int(11) DEFAULT '0' COMMENT '连麦等级限制',
  `cash_rate` int(10) unsigned NOT NULL DEFAULT '32' COMMENT '提现比例',
  `push_url` varchar(255) NOT NULL COMMENT '推流服务器地址',
  `pull_url` varchar(255) NOT NULL COMMENT '播流服务器地址',
  `chatserver` varchar(255) NOT NULL COMMENT '聊天服务器带端口',
  `aliapp_switch` int(10) NOT NULL DEFAULT '1' COMMENT '支付宝APP',
  `aliapp_partner` varchar(255) NOT NULL COMMENT '合作者身份ID',
  `aliapp_seller_id` varchar(255) NOT NULL COMMENT '支付宝帐号',
  `aliapp_key_android` text NOT NULL COMMENT '支付宝安卓密钥',
  `aliapp_key_ios` text NOT NULL COMMENT '支付宝苹果密钥',
  `wx_switch` int(10) NOT NULL DEFAULT '1' COMMENT '微信支付',
  `wx_appid` varchar(255) NOT NULL COMMENT '开放平台账号AppID',
  `wx_appsecret` varchar(255) NOT NULL COMMENT '微信应用appsecret',
  `wx_mchid` varchar(255) NOT NULL COMMENT '微信商户号mchid',
  `wx_key` varchar(255) NOT NULL COMMENT '微信密钥key',
  `aliapp_check` varchar(255) NOT NULL COMMENT '支付宝校验码',
  `aliapp_pc` int(10) NOT NULL COMMENT '支付宝PC',
  `login_wx_pc_appid` varchar(255) NOT NULL COMMENT 'PC 微信登录appid',
  `login_wx_pc_appsecret` varchar(255) NOT NULL COMMENT 'PC 微信登录appsecret',
  `login_sina_pc_akey` varchar(255) NOT NULL COMMENT 'PC微博登陆akey',
  `login_sina_pc_skey` varchar(255) NOT NULL COMMENT 'PC新浪微博skey',
  `wx_switch_pc` int(10) NOT NULL COMMENT '微信支付PC',
  `cash_min` int(10) unsigned DEFAULT '30' COMMENT '提现最低额度（元）',
  `login_wx_appid` varchar(255) DEFAULT '' COMMENT '微信公众平台应用ID',
  `login_wx_appsecret` varchar(255) DEFAULT '' COMMENT '微信公众平台AppSecret',
  `ios_sandbox` int(10) DEFAULT '0' COMMENT '苹果支付沙盒模式',
  `jpush_sandbox` int(10) DEFAULT '0' COMMENT '极光推送模式',
  `auth_key` varchar(255) DEFAULT '' COMMENT '鉴权key',
  `auth_length` int(10) unsigned DEFAULT '0' COMMENT '播流鉴权有效时长',
  `cdn_switch` tinyint(1) DEFAULT '1' COMMENT 'cdn服务器选择 1表示阿里云 2表示腾讯云 3表示七牛云',
  `tx_appid` varchar(255) DEFAULT '' COMMENT '腾讯云直播appid',
  `tx_bizid` varchar(255) DEFAULT '' COMMENT '腾讯云直播bizid',
  `tx_push_key` varchar(255) DEFAULT '' COMMENT '腾讯云直播推流防盗链Key',
  `tx_api_key` varchar(255) DEFAULT '' COMMENT '腾讯API鉴权KEY',
  `qn_ak` varchar(255) DEFAULT '' COMMENT '七牛云AK',
  `qn_sk` varchar(255) DEFAULT '' COMMENT '七牛云SK',
  `qn_hname` varchar(255) DEFAULT '' COMMENT '七牛云直播空间名称',
  `qn_push` varchar(255) DEFAULT '' COMMENT '七牛云推流地址',
  `qn_pull` varchar(255) DEFAULT '' COMMENT '七牛云播流地址',
  `bonus_switch` tinyint(1) DEFAULT '0' COMMENT '登录奖励开关',
  `ws_push` varchar(255) DEFAULT '' COMMENT '网宿推流地址',
  `ws_pull` varchar(255) DEFAULT '' COMMENT '网宿播流地址',
  `ws_apn` varchar(255) DEFAULT '' COMMENT '网宿AppName',
  `wy_appkey` varchar(255) DEFAULT NULL COMMENT '网易appkey',
  `wy_appsecret` varchar(255) DEFAULT NULL COMMENT '网易appSecret',
  `ady_push` varchar(255) DEFAULT '' COMMENT '奥点云推流地址',
  `ady_pull` varchar(255) DEFAULT '' COMMENT '奥点云播流地址',
  `ady_hls_pull` varchar(255) DEFAULT '' COMMENT '奥点云HLS播流地址',
  `ady_apn` varchar(255) DEFAULT '' COMMENT '奥点云AppName',
  `iplimit_switch` tinyint(1) DEFAULT '0' COMMENT '短信验证码IP限制开关',
  `iplimit_times` int(11) DEFAULT '1' COMMENT '短信验证码IP限制次数',
  `shut_time` int(11) DEFAULT '0' COMMENT '禁言时长',
  `kick_time` int(11) DEFAULT '0' COMMENT '踢出时长',
  `agent_switch` tinyint(1) DEFAULT '0' COMMENT '分销开关',
  `distribut1` int(11) DEFAULT '0' COMMENT '分销一级分成',
  `distribut2` int(11) DEFAULT '0' COMMENT '分销二级分成',
  `distribut3` int(11) DEFAULT '0' COMMENT '分销三级分成',
  `reg_reward` int(11) DEFAULT '0' COMMENT '注册奖励',
  `family_switch` tinyint(1) DEFAULT '0' COMMENT '家族开关',
  `rtmp_push_url` varchar(255) NOT NULL COMMENT 'RTMP推流服务器',
  `rtmp_pull_url` varchar(255) NOT NULL COMMENT 'RTMP拉流服务器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_config_private
-- ----------------------------
INSERT INTO `cmf_config_private` VALUES ('1', '0', '60', '', '', '', '', '60', '4', '0', '0', '10', '5', '60', '', '', 'http://39.97.234.35:1025', '1', '', '', '', '', '1', '', '', '', '', '', '1', '', '', '', '', '0', '30', '', '', '0', '1', '', '0', '7', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '0', '1', '60', '20', '0', '20', '10', '0', '15', '0', '39.97.234.35', '39.97.234.35');

-- ----------------------------
-- Table structure for cmf_experlevel
-- ----------------------------
DROP TABLE IF EXISTS `cmf_experlevel`;
CREATE TABLE `cmf_experlevel` (
  `levelid` int(11) unsigned NOT NULL DEFAULT '0',
  `levelname` varchar(50) DEFAULT '',
  `level_up` int(20) unsigned DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`levelid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_experlevel
-- ----------------------------
INSERT INTO `cmf_experlevel` VALUES ('1', '一级', '49', '1457923458', '1');
INSERT INTO `cmf_experlevel` VALUES ('2', '二级', '149', '1459240543', '2');
INSERT INTO `cmf_experlevel` VALUES ('3', '三级', '299', '1459240560', '3');
INSERT INTO `cmf_experlevel` VALUES ('4', '四级', '499', '1459240618', '4');
INSERT INTO `cmf_experlevel` VALUES ('5', '五级', '899', '1459240659', '5');
INSERT INTO `cmf_experlevel` VALUES ('6', '六级', '20000', '1459240684', '6');
INSERT INTO `cmf_experlevel` VALUES ('7', '七级', '29999', '1463802287', '7');
INSERT INTO `cmf_experlevel` VALUES ('8', '八级', '39999', '1463980529', '8');
INSERT INTO `cmf_experlevel` VALUES ('9', '九级', '49999', '1463980683', '9');
INSERT INTO `cmf_experlevel` VALUES ('10', '十级', '59999', '1465371136', '10');
INSERT INTO `cmf_experlevel` VALUES ('11', '十一级', '69999', '1502504682', '15');

-- ----------------------------
-- Table structure for cmf_experlevel_anchor
-- ----------------------------
DROP TABLE IF EXISTS `cmf_experlevel_anchor`;
CREATE TABLE `cmf_experlevel_anchor` (
  `levelid` int(11) unsigned NOT NULL DEFAULT '0',
  `levelname` varchar(50) DEFAULT '',
  `level_up` int(20) unsigned DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`levelid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_experlevel_anchor
-- ----------------------------
INSERT INTO `cmf_experlevel_anchor` VALUES ('1', '一级', '59', '1457923458', '1');
INSERT INTO `cmf_experlevel_anchor` VALUES ('2', '二级', '149', '1459240543', '2');
INSERT INTO `cmf_experlevel_anchor` VALUES ('3', '三级', '299', '1459240560', '3');
INSERT INTO `cmf_experlevel_anchor` VALUES ('4', '四级', '499', '1459240618', '4');
INSERT INTO `cmf_experlevel_anchor` VALUES ('5', '五级', '899', '1459240659', '5');
INSERT INTO `cmf_experlevel_anchor` VALUES ('6', '六级', '20000', '1459240684', '6');
INSERT INTO `cmf_experlevel_anchor` VALUES ('7', '七级', '29999', '1463802287', '7');
INSERT INTO `cmf_experlevel_anchor` VALUES ('8', '八级', '39999', '1463980529', '8');
INSERT INTO `cmf_experlevel_anchor` VALUES ('9', '九级', '1000000', '1463980683', '9');
INSERT INTO `cmf_experlevel_anchor` VALUES ('10', '十级', '2147483647', '1465371136', '10');

-- ----------------------------
-- Table structure for cmf_experlevel_limit
-- ----------------------------
DROP TABLE IF EXISTS `cmf_experlevel_limit`;
CREATE TABLE `cmf_experlevel_limit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` int(11) DEFAULT '0',
  `withdraw` int(11) unsigned DEFAULT '0',
  `level_up` int(11) unsigned DEFAULT '0',
  `addtime` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level_up_index` (`level_up`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_experlevel_limit
-- ----------------------------
INSERT INTO `cmf_experlevel_limit` VALUES ('1', '1', '150', '9', '1457923458');
INSERT INTO `cmf_experlevel_limit` VALUES ('4', '2', '200', '19', '1459240543');
INSERT INTO `cmf_experlevel_limit` VALUES ('5', '3', '500', '49', '1459240560');
INSERT INTO `cmf_experlevel_limit` VALUES ('6', '4', '800', '99', '1459240618');
INSERT INTO `cmf_experlevel_limit` VALUES ('7', '5', '1500', '200', '1459240659');

-- ----------------------------
-- Table structure for cmf_family
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family`;
CREATE TABLE `cmf_family` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `badge` varchar(255) DEFAULT '',
  `apply_pos` varchar(255) DEFAULT '',
  `apply_side` varchar(255) DEFAULT '',
  `briefing` text,
  `carded` varchar(255) DEFAULT '',
  `fullname` varchar(50) DEFAULT '',
  `addtime` int(11) DEFAULT '0',
  `state` tinyint(1) DEFAULT '0',
  `reason` varchar(255) DEFAULT '',
  `disable` tinyint(1) DEFAULT '0',
  `divide_family` int(11) DEFAULT '0' COMMENT '分成比例',
  `istip` tinyint(1) DEFAULT '0' COMMENT '是否需要通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_family_profit
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family_profit`;
CREATE TABLE `cmf_family_profit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `familyid` int(11) DEFAULT '0',
  `time` varchar(50) DEFAULT '',
  `profit_anthor` decimal(20,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  `profit` decimal(20,2) DEFAULT '0.00',
  `addtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family_profit
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_feedback
-- ----------------------------
DROP TABLE IF EXISTS `cmf_feedback`;
CREATE TABLE `cmf_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `version` varchar(50) DEFAULT '',
  `model` varchar(50) DEFAULT '',
  `content` text,
  `addtime` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `uptime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_getcode_limit_ip
-- ----------------------------
DROP TABLE IF EXISTS `cmf_getcode_limit_ip`;
CREATE TABLE `cmf_getcode_limit_ip` (
  `ip` bigint(20) NOT NULL,
  `date` varchar(30) DEFAULT NULL,
  `times` tinyint(4) DEFAULT '3',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_getcode_limit_ip
-- ----------------------------
INSERT INTO `cmf_getcode_limit_ip` VALUES ('659893162', '20170926', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('659913734', '20171010', '2');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('660055267', '20170925', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('1027035339', '20171001', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('1033171557', '20171010', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('1901677361', '20171007', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('1901682780', '20170927', '1');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('1992699968', '20171009', '2');
INSERT INTO `cmf_getcode_limit_ip` VALUES ('2045028159', '20171002', '1');

-- ----------------------------
-- Table structure for cmf_gift
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift`;
CREATE TABLE `cmf_gift` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1',
  `sid` int(11) DEFAULT '0',
  `giftname` varchar(50) DEFAULT '',
  `needcoin` int(11) DEFAULT '0',
  `gifticon_mini` varchar(255) DEFAULT '',
  `gifticon` varchar(255) DEFAULT '',
  `orderno` int(3) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gift
-- ----------------------------
INSERT INTO `cmf_gift` VALUES ('46', '1', '0', '玫瑰花', '2', '', '/data/upload/20170513/20170902_59aa834fe9e1f.png', '0', '1504346963');
INSERT INTO `cmf_gift` VALUES ('45', '0', '0', '小乌龟', '28', '', '/data/upload/20170513/20170902_59aa83085075f.png', '0', '1504346893');
INSERT INTO `cmf_gift` VALUES ('9', '0', '0', '跑车', '888', '', '/data/upload/20170513/59166bdb70a33.png', '0', '1458986509');
INSERT INTO `cmf_gift` VALUES ('19', '0', '0', '私人飞机', '3000', '', '/data/upload/20170513/59166bcdd5765.png', '0', '1459210850');
INSERT INTO `cmf_gift` VALUES ('21', '0', '0', '游轮', '5200', '', '/data/upload/20170513/59166bbc64729.png', '0', '1461550830');
INSERT INTO `cmf_gift` VALUES ('22', '0', '0', '烟花', '666', '', '/data/upload/20170513/59166baf7d3e7.png', '0', '1461551137');
INSERT INTO `cmf_gift` VALUES ('23', '1', '0', '黄瓜', '20', '', '/data/upload/20170513/20170902_59aa832a497b8.png', '0', '1464137997');
INSERT INTO `cmf_gift` VALUES ('24', '1', '0', '茄子', '40', '', '/data/upload/20170513/20170902_59aa83d55546c.png', '0', '1464139982');
INSERT INTO `cmf_gift` VALUES ('25', '1', '0', '香蕉', '10', '', '/data/upload/20170513/20170902_59aa816bec077.png', '0', '1464142769');
INSERT INTO `cmf_gift` VALUES ('43', '0', '0', '666', '66', '', '/data/upload/20170513/20170902_59aa82a262201.png', '0', '1504346790');
INSERT INTO `cmf_gift` VALUES ('44', '0', '0', '雪茄', '58', '', '/data/upload/20170513/20170902_59aa82d8ee111.png', '0', '1504346844');
INSERT INTO `cmf_gift` VALUES ('30', '1', '0', '百合', '30', '', '/data/upload/20170513/20170902_59aa83b35ab02.png', '0', '1464143324');
INSERT INTO `cmf_gift` VALUES ('39', '1', '0', '棉花糖', '50', '', '/data/upload/20170513/20170902_59aa807e142c4.png', '0', '1464143742');
INSERT INTO `cmf_gift` VALUES ('42', '0', '0', '啪啪啪', '160', '', '/data/upload/20170513/20170902_59aa81cda0592.png', '0', '1504346580');

-- ----------------------------
-- Table structure for cmf_gift_sort
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift_sort`;
CREATE TABLE `cmf_gift_sort` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(20) DEFAULT '',
  `orderno` int(3) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gift_sort
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_keeper
-- ----------------------------
DROP TABLE IF EXISTS `cmf_keeper`;
CREATE TABLE `cmf_keeper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `touid` int(11) DEFAULT NULL,
  `buytime` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_keeper
-- ----------------------------
INSERT INTO `cmf_keeper` VALUES ('1', '13', '14', '1472202713', '0', '1');
INSERT INTO `cmf_keeper` VALUES ('2', '2', '3', '1473162256', '1486122256', '0');
INSERT INTO `cmf_keeper` VALUES ('3', '8', '3', '1473228267', '2147483647', '0');
INSERT INTO `cmf_keeper` VALUES ('4', '7', '3', '1473242714', '1602842714', '1');
INSERT INTO `cmf_keeper` VALUES ('5', '12', '11', '1473420673', '1504524673', '1');
INSERT INTO `cmf_keeper` VALUES ('6', '11', '9', '1473421733', '1893325733', '0');
INSERT INTO `cmf_keeper` VALUES ('7', '12', '7', '1473422488', '1476014488', '0');
INSERT INTO `cmf_keeper` VALUES ('8', '12', '2', '1473423560', '1481199560', '0');
INSERT INTO `cmf_keeper` VALUES ('9', '2', '9', '1473424211', '1636720211', '0');
INSERT INTO `cmf_keeper` VALUES ('10', '2', '0', '1473426020', '1473426030', '1');
INSERT INTO `cmf_keeper` VALUES ('11', '11', '7', '1473426477', '1558962477', '0');
INSERT INTO `cmf_keeper` VALUES ('12', '11', '11', '1473430273', '1481206273', '0');
INSERT INTO `cmf_keeper` VALUES ('13', '16', '17', '1473471416', '1481247416', '0');
INSERT INTO `cmf_keeper` VALUES ('14', '16', '19', '1473473983', '1491617983', '0');
INSERT INTO `cmf_keeper` VALUES ('15', '17', '19', '1473474396', '1509762396', '0');
INSERT INTO `cmf_keeper` VALUES ('16', '19', '19', '1473476396', '1517540396', '0');
INSERT INTO `cmf_keeper` VALUES ('17', '20', '19', '1473479318', '1481255318', '0');
INSERT INTO `cmf_keeper` VALUES ('18', '20', '7', '1473479536', '1481255536', '0');
INSERT INTO `cmf_keeper` VALUES ('19', '22', '22', '1473479552', '1489031552', '0');
INSERT INTO `cmf_keeper` VALUES ('20', '44', '7', '1473731868', '1476323868', '0');
INSERT INTO `cmf_keeper` VALUES ('21', '49', '7', '1473840792', '1481616792', '0');
INSERT INTO `cmf_keeper` VALUES ('22', '51', '9', '1474184518', '1513064518', '1');
INSERT INTO `cmf_keeper` VALUES ('23', '38', '39', '1474776424', '1477368424', '0');
INSERT INTO `cmf_keeper` VALUES ('24', '16', '42', '1474783237', '1485151237', '0');
INSERT INTO `cmf_keeper` VALUES ('25', '7', '42', '1474783748', '1477375748', '0');
INSERT INTO `cmf_keeper` VALUES ('26', '42', '36', '1474784196', '1482560196', '0');
INSERT INTO `cmf_keeper` VALUES ('27', '64', '42', '1474786216', '1482562216', '0');
INSERT INTO `cmf_keeper` VALUES ('28', '19', '42', '1474787091', '1485155091', '0');
INSERT INTO `cmf_keeper` VALUES ('29', '51', '23', '1474870166', '1482646166', '0');
INSERT INTO `cmf_keeper` VALUES ('30', '51', '7', '1474870746', '1482646746', '0');
INSERT INTO `cmf_keeper` VALUES ('31', '7', '38', '1475197822', '1482973822', '0');
INSERT INTO `cmf_keeper` VALUES ('32', '7', '24', '1475197827', '1482973827', '0');
INSERT INTO `cmf_keeper` VALUES ('33', '7', '25', '1475197832', '1482973832', '0');
INSERT INTO `cmf_keeper` VALUES ('34', '7', '28', '1475197837', '1482973837', '0');
INSERT INTO `cmf_keeper` VALUES ('35', '7', '29', '1475197844', '1482973844', '0');
INSERT INTO `cmf_keeper` VALUES ('36', '7', '27', '1475197849', '1482973849', '0');
INSERT INTO `cmf_keeper` VALUES ('37', '7', '31', '1475197905', '1482973905', '0');
INSERT INTO `cmf_keeper` VALUES ('38', '7', '32', '1475197909', '1482973909', '0');
INSERT INTO `cmf_keeper` VALUES ('39', '7', '34', '1475197913', '1482973913', '0');
INSERT INTO `cmf_keeper` VALUES ('40', '7', '36', '1475197917', '1482973917', '0');
INSERT INTO `cmf_keeper` VALUES ('41', '7', '9', '1475197928', '1482973928', '0');
INSERT INTO `cmf_keeper` VALUES ('42', '7', '23', '1475197936', '1482973936', '0');
INSERT INTO `cmf_keeper` VALUES ('43', '7', '26', '1475197948', '1482973948', '0');
INSERT INTO `cmf_keeper` VALUES ('44', '42', '38', '1475723359', '1483499359', '0');
INSERT INTO `cmf_keeper` VALUES ('45', '72', '6', '1476337157', '1478929157', '0');
INSERT INTO `cmf_keeper` VALUES ('46', '74', '38', '1476855556', '1479447556', '0');
INSERT INTO `cmf_keeper` VALUES ('47', '75', '74', '1476857518', '1500185518', '0');
INSERT INTO `cmf_keeper` VALUES ('48', '76', '74', '1476857922', '1515737922', '1');
INSERT INTO `cmf_keeper` VALUES ('49', '87', '42', '1477759046', '1539967046', '1');
INSERT INTO `cmf_keeper` VALUES ('50', '86', '42', '1477759225', '1485535225', '0');
INSERT INTO `cmf_keeper` VALUES ('51', '87', '24', '1477980562', '1540188562', '1');
INSERT INTO `cmf_keeper` VALUES ('52', '8', '36', '1480558434', '1488334434', '0');
INSERT INTO `cmf_keeper` VALUES ('53', '42', '3', '1481013973', '1488789973', '0');
INSERT INTO `cmf_keeper` VALUES ('54', '42', '39', '1481078775', '1488854775', '0');
INSERT INTO `cmf_keeper` VALUES ('55', '19', '39', '1482820372', '1495780372', '0');

-- ----------------------------
-- Table structure for cmf_liang
-- ----------------------------
DROP TABLE IF EXISTS `cmf_liang`;
CREATE TABLE `cmf_liang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `length` int(11) DEFAULT '0',
  `coin` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `buytime` int(11) DEFAULT '0',
  `orderno` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '靓号销售状态',
  `state` tinyint(4) DEFAULT '0' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_liang
-- ----------------------------
INSERT INTO `cmf_liang` VALUES ('1', '973661263', '9', '10', '1501745246', '8209', '1501745257', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('2', '1234567', '7', '1', '1502266644', '8573', '1502266676', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('3', '123', '3', '100', '1502445697', '8384', '1502450913', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('7', '124', '3', '100', '1502449799', '8209', '1503383410', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('8', '111', '3', '100', '1502449811', '8199', '1502851129', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('9', '222', '3', '100', '1502449816', '8241', '1502450306', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('10', '333', '3', '100', '1502449822', '11174', '1502509310', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('11', '444', '3', '100', '1502449834', '8199', '1502851123', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('12', '555', '3', '100', '1502449843', '8209', '1502850123', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('13', '666', '3', '100', '1502449848', '8384', '1502450917', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('14', '777', '3', '100', '1502449854', '8209', '1502850129', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('15', '888', '3', '100', '1502449859', '8241', '1502450301', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('16', '999', '3', '100', '1502449864', '8241', '1502846120', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('17', '1234', '4', '100', '1502449954', '11192', '1503734964', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('18', '12345', '5', '100', '1502449979', '11038', '1506068507', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('19', '2222', '4', '100', '1502450100', '11173', '1502450312', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('20', '3333', '4', '100', '1502450105', '11038', '1506068501', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('21', '4444', '4', '100', '1502450112', '11227', '1506161227', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('22', '5555', '4', '100', '1502450117', '11173', '1502450316', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('24', '5554', '4', '10', '1506067847', '11172', '1506068337', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('25', '010', '3', '10', '1506067918', '11172', '1506068331', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('26', '55555', '5', '10', '1506068273', '11172', '1506068344', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('27', '555555', '6', '10', '1506068284', '11172', '1506068354', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('29', '1010', '4', '10', '1507278981', '11266', '1507298309', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('30', '1212', '4', '20', '1507278986', '11402', '1509853132', '0', '1', '1');
INSERT INTO `cmf_liang` VALUES ('31', '1313', '4', '10', '1507278991', '11266', '1507279423', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('32', '131313', '6', '10', '1507278996', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('33', '141414', '6', '10', '1507279001', '11266', '1507298294', '0', '1', '0');
INSERT INTO `cmf_liang` VALUES ('34', '7887', '4', '50', '1507279012', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('35', '134', '3', '20', '1509853589', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('36', '156', '3', '20', '1509853598', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('37', '388', '3', '20', '1509853607', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('38', '678', '3', '20', '1509853614', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('39', '000', '3', '20', '1509853640', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('40', '3331', '4', '30', '1509853689', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('41', '1314', '4', '50', '1509853698', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('42', '1000', '4', '30', '1509853706', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('43', '2000', '4', '30', '1509853713', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('44', '3000', '4', '30', '1509853723', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('45', '4000', '4', '30', '1509853728', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('46', '6666', '4', '30', '1509853739', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('47', '7777', '4', '30', '1509853745', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('48', '8888', '4', '30', '1509853750', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('49', '9999', '4', '30', '1509853755', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('50', '13141', '5', '30', '1509853890', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('51', '66666', '5', '30', '1509853904', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('52', '77777', '5', '30', '1509853912', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('53', '88888', '5', '30', '1509853921', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('54', '99999', '5', '30', '1509853927', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('55', '10000', '5', '30', '1509853936', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('56', '20000', '5', '30', '1509853950', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('57', '40000', '5', '30', '1509853956', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('58', '60000', '5', '30', '1509853964', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('59', '111111', '6', '40', '1509853972', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('60', '222222', '6', '40', '1509853978', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('61', '333333', '6', '40', '1509853984', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('62', '444444', '6', '40', '1509853989', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('63', '666666', '6', '40', '1509854003', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('64', '777777', '6', '40', '1509854009', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('65', '888888', '6', '40', '1509854016', '0', '0', '0', '0', '0');
INSERT INTO `cmf_liang` VALUES ('66', '999999', '6', '40', '1509854022', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cmf_links
-- ----------------------------
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_links
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_loginbonus
-- ----------------------------
DROP TABLE IF EXISTS `cmf_loginbonus`;
CREATE TABLE `cmf_loginbonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` int(10) DEFAULT '0' COMMENT '登录天数',
  `coin` int(10) DEFAULT '0' COMMENT '登录奖励',
  `addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_loginbonus
-- ----------------------------
INSERT INTO `cmf_loginbonus` VALUES ('1', '1', '10', '0', '1491466801');
INSERT INTO `cmf_loginbonus` VALUES ('2', '2', '15', '0', '1509841028');
INSERT INTO `cmf_loginbonus` VALUES ('3', '3', '20', '0', '1509841050');
INSERT INTO `cmf_loginbonus` VALUES ('4', '4', '25', '0', '1509841065');
INSERT INTO `cmf_loginbonus` VALUES ('5', '5', '25', '0', '1509841117');
INSERT INTO `cmf_loginbonus` VALUES ('6', '6', '25', '0', '1509841128');
INSERT INTO `cmf_loginbonus` VALUES ('7', '7', '25', '0', '1509841140');

-- ----------------------------
-- Table structure for cmf_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_menu
-- ----------------------------
INSERT INTO `cmf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '3');
INSERT INTO `cmf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展设置', 'cloud', '', '8');
INSERT INTO `cmf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '轮播管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '轮播替换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '轮播分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('292', '290', 'Admin', 'Loginbonus', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('100', '39', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '4');
INSERT INTO `cmf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '系统设置', 'cogs', '', '7');
INSERT INTO `cmf_menu` VALUES ('290', '0', 'Admin', 'Loginbonus', 'default', '', '1', '0', '登录奖励', '', '', '6');
INSERT INTO `cmf_menu` VALUES ('291', '290', 'Admin', 'Loginbonus', 'index', '', '1', '1', '奖励管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '0');
INSERT INTO `cmf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('162', '0', 'Admin', 'Gift', 'default', '', '1', '1', '礼物管理', 'gift', '', '4');
INSERT INTO `cmf_menu` VALUES ('163', '162', 'Admin', 'Gift', 'index', '', '1', '1', '礼物列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('164', '162', 'Admin', 'Gift', 'sort_index', '', '1', '0', '礼物分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('165', '0', 'Admin', 'level', 'default', '', '1', '1', '等级管理', 'level-up', '', '5');
INSERT INTO `cmf_menu` VALUES ('166', '165', 'Admin', 'Level', 'experlevel_index', '', '1', '1', '经验等级', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('167', '0', 'Admin', 'Finance', 'default', '', '1', '1', '财务管理', 'rmb', '', '1');
INSERT INTO `cmf_menu` VALUES ('168', '167', 'Admin', 'Charge', 'index', '', '1', '1', '充值记录', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('169', '167', 'Admin', 'Cash', 'index', '', '1', '1', '提现记录', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('170', '167', 'Admin', 'Coinrecord', 'index', '', '1', '1', '消费记录', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('171', '0', 'Admin', 'Live', 'default', '', '1', '1', '直播管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('172', '171', 'Admin', 'Live', 'index', '', '1', '1', '直播记录', '', '', '5');
INSERT INTO `cmf_menu` VALUES ('173', '109', 'Admin', 'Config', 'index', '', '1', '1', '公共设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('174', '167', 'Admin', 'Manual', 'index', '', '1', '1', '手动充值', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('362', '0', 'Admin', 'Vip', 'default', '', '1', '1', 'VIP管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('176', '174', 'Admin', 'Manual', 'add', '', '1', '0', '手动充值', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('177', '173', 'Admin', 'Config', 'lists', '', '1', '0', '管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('178', '177', 'Admin', 'Config', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('179', '173', 'Admin', 'Config', 'set_post', '', '1', '0', '设置修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('180', '177', 'Admin', 'Config', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('181', '177', 'Admin', 'Config', 'update', '', '1', '0', '添加保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('182', '177', 'Admin', 'Config', 'delete', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('363', '362', 'Admin', 'Vip', 'index', '', '1', '1', 'VIP列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('364', '362', 'Admin', 'Vip', 'user_index', '', '1', '1', 'VIP用户', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('365', '363', 'Admin', 'Vip', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('366', '363', 'Admin', 'Vip', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('188', '134', 'user', 'Indexadmin', 'add', '', '1', '0', '新增会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('189', '134', 'user', 'Indexadmin', 'add_post', '', '1', '0', '新增会员修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('190', '134', 'User', 'Indexadmin', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('191', '134', 'User', 'Indexadmin', 'edit_post', '', '1', '0', '编辑修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('192', '134', 'user', 'Indexadmin', 'recommend', '', '1', '0', '推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('193', '134', 'User', 'Indexadmin', 'cancelrecommend', '', '1', '0', '取消推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('194', '166', 'Admin', 'Level', 'experlevel_add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('195', '166', 'Admin', 'Level', 'experlevel_add_post', '', '1', '0', '添加修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('196', '166', 'Admin', 'Level', 'experlevel_edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('197', '166', 'admin', 'Level', 'experlevel_edit_post', '', '1', '0', '编辑修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('198', '166', 'Admin', 'Level', 'experlevel_del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('199', '168', 'Admin', 'Charge', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('200', '169', 'Admin', 'Cash', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('201', '169', 'Admin', 'Cash', 'edit_post', '', '1', '0', '编辑修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('202', '174', 'Admin', 'Manual', 'add_post', '', '1', '0', '添加修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('203', '163', 'Admin', 'Gift', 'add', '', '1', '0', '礼物添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('204', '163', 'Admin', 'Gift', 'add_post', '', '1', '0', '礼物添加修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('205', '163', 'Admin', 'Gift', 'edit', '', '1', '0', '礼物修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('206', '163', 'Admin', 'Gift', 'edit_post', '', '1', '0', '礼物编辑修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('207', '163', 'Admin', 'Gift', 'del', '', '1', '0', '礼物删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('208', '163', 'Admin', 'Gift', 'listorders', '', '1', '0', '礼物排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('209', '164', 'Admin', 'Gift', 'sort_add', '', '1', '0', '分类添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('210', '164', 'Admin', 'Gift', 'do_sort_add', '', '1', '0', '分类添加修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('211', '164', 'Admin', 'Gift', 'sort_edit', '', '1', '0', '分类编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('212', '164', 'Admin', 'Gift', 'do_sort_edit', '', '1', '0', '分类编辑修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('213', '164', 'Admin', 'Gift', 'sort_del', '', '1', '0', '分类删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('214', '164', 'Admin', 'Gift', 'sort_listorders', '', '1', '0', '分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('215', '134', 'User', 'Indexadmin', 'del', '', '1', '0', '删除会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('216', '171', 'Admin', 'Monitor', 'index', '', '1', '1', '直播监控', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('217', '133', 'Admin', 'Userauth', 'index', '', '1', '1', '身份认证', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('218', '217', 'Admin', 'Userauth', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('219', '217', 'Admin', 'Userauth', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('220', '165', 'Admin', 'LevelLimit', 'index', '', '1', '1', '等级提现', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('221', '220', 'Admin', 'LevelLimit', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('222', '220', 'Admin', 'LevelLimit', 'do_add', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('223', '220', 'Admin', 'LevelLimit', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('224', '220', 'Admin', 'LevelLimit', 'do_edit', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('225', '220', 'Admin', 'LevelLimit', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('226', '220', 'Admin', 'LevelLimit', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('227', '1', 'Admin', 'Feedback', 'index', '', '1', '1', '用户反馈', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('228', '227', 'Admin', 'Feedback', 'setstatus', '', '1', '0', '状态修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('229', '39', 'Admin', 'Ads', 'default', '', '1', '1', 'PC广告图片', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('230', '234', 'Admin', 'Ads', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('231', '234', 'Admin', 'Ads', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('232', '234', 'Admin', 'Ads', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('233', '234', 'Admin', 'Ads', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('234', '229', 'Admin', 'Ads', 'index', '', '1', '1', '广告图片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('235', '229', 'Admin', 'Ads', 'sort_index', '', '1', '1', '广告分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('236', '235', 'Admin', 'Ads', 'sort_add', '', '1', '1', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('237', '234', 'Admin', 'Ads', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('238', '234', 'Admin', 'Ads', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('239', '235', 'Admin', 'Ads', 'do_sort_add', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('240', '235', 'Admin', 'Ads', 'sort_edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('241', '235', 'Admin', 'Ads', 'do_sort_edit', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('242', '235', 'Admin', 'Ads', 'sort_del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('243', '235', 'Admin', 'Ads', 'sort_listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('244', '171', 'Admin', 'Report', 'index', '', '1', '1', '用户举报', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('245', '134', 'User', 'indexadmin', 'cancelzombie', '', '1', '0', '关闭僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('246', '134', 'User', 'indexadmin', 'zombie', '', '1', '0', '开启僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('247', '134', 'user', 'indexadmin', 'cancelzombiep', '', '1', '0', '取消设置僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('248', '134', 'User', 'indexadmin', 'zombiep', '', '1', '0', '设置为僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('249', '134', 'User', 'indexadmin', 'cancelrecord', '', '1', '0', '关闭录播', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('250', '134', 'User', 'indexadmin', 'record', '', '1', '0', '开启录播', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('251', '134', 'User', 'indexadmin', 'zombiepbatch', '', '1', '0', '批量设置/取消僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('252', '134', 'User', 'indexadmin', 'zombieall', '', '1', '0', '一键开启/关闭僵尸粉', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('253', '134', 'User', 'indexadmin', 'recordall', '', '1', '0', '一键开启/关闭录播', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('254', '244', 'Admin', 'Report', 'setstatus', '', '1', '0', '标记处理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('409', '403', 'Admin', 'Family', 'cash', '', '1', '0', '提现', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('367', '363', 'Admin', 'Vip', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('368', '363', 'Admin', 'Vip', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('262', '134', 'User', 'Indexadmin', 'super', '', '1', '0', '设置超管', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('263', '134', 'User', 'Indexadmin', 'cancelsuper', '', '1', '0', '取消超管', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('264', '134', 'User', 'Indexadmin', 'hot', '', '1', '0', '设置热门', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('265', '134', 'User', 'Indexadmin', 'cancelhot', '', '1', '0', '取消热门', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('266', '171', 'Admin', 'System', 'index', '', '1', '1', '系统消息', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('267', '266', 'Admin', 'System', 'send', '', '1', '0', '信息发送', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('274', '171', 'Admin', 'Liveing', 'index', '', '1', '1', '直播列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('275', '109', 'Admin', 'Configprivate', 'index', '', '1', '1', '私密设置', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('276', '275', 'Admin', 'Configprivate', 'set_post', '', '1', '0', '设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('277', '275', 'Admin', 'Configprivate', 'lists', '', '1', '0', '列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('278', '275', 'Admin', 'Configprivate', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('279', '275', 'Admin', 'Configprivate', 'update', '', '1', '0', '添加/编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('280', '275', 'Admin', 'Configprivate', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('281', '275', 'Admin', 'Configprivate', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('282', '275', 'Admin', 'Configprivate', 'delete', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('283', '167', 'Admin', 'Chargerules', 'index', '', '1', '1', '充值规则', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('284', '283', 'Admin', 'Chargerules', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('285', '283', 'Admin', 'Chargerules', 'do_add', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('286', '283', 'Admin', 'Chargerules', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('287', '283', 'Admin', 'Chargerules', 'do_edit', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('288', '167', 'Admin', 'Chargerules', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('289', '283', 'Admin', 'Chargerules', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('293', '290', 'Admin', 'Loginbonus', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('294', '216', 'Admin', 'Monitor', 'full', '', '1', '0', '监控大屏', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('295', '274', 'Admin', 'Liveing', 'add', '', '1', '0', '添加视频', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('296', '274', 'Admin', 'Liveing', 'add_post', '', '1', '0', '视频添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('297', '274', 'Admin', 'Liveing', 'edit', '', '1', '0', '视频编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('298', '274', 'Admin', 'Liveing', 'edit_post', '', '1', '0', '视频编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('299', '274', 'Admin', 'Liveing', 'del', '', '1', '0', '视频删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('370', '363', 'Admin', 'Vip', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('371', '364', 'Admin', 'Vip', 'user_add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('372', '364', 'Admin', 'Vip', 'do_user_add', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('373', '364', 'Admin', 'Vip', 'user_edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('374', '364', 'Admin', 'Vip', 'do_user_edit', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('375', '364', 'Admin', 'Vip', 'user_del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('376', '0', 'Admin', 'Liang', 'default', '', '1', '0', '靓号管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('377', '376', 'Admin', 'Liang', 'index', '', '1', '1', '靓号列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('378', '377', 'Admin', 'Liang', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('379', '377', 'Admin', 'Liang', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('380', '377', 'Admin', 'Liang', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('381', '377', 'Admin', 'Liang', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('382', '377', 'Admin', 'Liang', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('383', '377', 'Admin', 'Liang', 'setStatus', '', '1', '0', '设置状态', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('384', '377', 'Admin', 'Liang', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('385', '0', 'Admin', 'Car', 'default', '', '1', '0', '坐骑管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('386', '385', 'Admin', 'Car', 'index', '', '1', '1', '坐骑列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('387', '386', 'Admin', 'Car', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('388', '386', 'Admin', 'Car', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('389', '386', 'Admin', 'Car', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('390', '386', 'Admin', 'Car', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('391', '386', 'Admin', 'Car', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('392', '386', 'Admin', 'Car', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('393', '0', 'Admin', 'Agent', 'default', '', '1', '0', '分销管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('394', '393', 'Admin', 'Agent', 'index', '', '1', '1', '分销关系', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('355', '0', 'Admin', 'Video', 'default', '', '1', '1', '短视频管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('356', '355', 'Admin', 'Video', 'index', '', '1', '1', '视频列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('395', '393', 'Admin', 'Agent', 'index2', '', '1', '1', '分销收益', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('396', '165', 'Admin', 'Levelanchor', 'index', '', '1', '1', '主播等级', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('397', '396', 'Admin', 'Levelanchor', 'add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('398', '396', 'Admin', 'Levelanchor', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('399', '396', 'Admin', 'Levelanchor', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('400', '396', 'Admin', 'Levelanchor', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('401', '396', 'Admin', 'Levelanchor', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('402', '0', 'Admin', 'Family', 'default', '', '1', '0', '家族管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('403', '402', 'Admin', 'Family', 'index', '', '1', '1', '家族列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('404', '403', 'Admin', 'Family', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('405', '403', 'Admin', 'Family', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('406', '403', 'Admin', 'Family', 'disable', '', '1', '0', '禁用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('407', '403', 'Admin', 'Family', 'enable', '', '1', '0', '启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('408', '403', 'Admin', 'Family', 'profit', '', '1', '0', '收益', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('357', '356', 'Admin', 'Video', 'edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('358', '356', 'Admin', 'Video', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('359', '356', 'Admin', 'Video', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('360', '355', 'Admin', 'Video', 'index2', '', '1', '1', '举报列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('361', '360', 'Admin', 'Video', 'setstatus', '', '1', '0', '标记处理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('369', '363', 'Admin', 'Vip', 'listorders', '', '1', '0', '排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('410', '403', 'Admin', 'Family', 'del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('411', '402', 'Admin', 'Family', 'users', '', '1', '1', '成员管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('412', '411', 'Admin', 'Family', 'users_add', '', '1', '0', '添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('413', '411', 'Admin', 'Family', 'users_add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('414', '411', 'Admin', 'Family', 'users_edit', '', '1', '0', '编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('415', '411', 'Admin', 'Family', 'users_edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('416', '411', 'Admin', 'Family', 'users_del', '', '1', '0', '删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('417', '216', 'Admin', 'Monitor', 'stopRoom', '', '1', '0', '直播关闭', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('418', '419', 'Admin', 'User', 'add_agent', '', '1', '0', '代理添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('419', '139', 'Admin', 'user', 'agent_index', '', '1', '1', '代理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('420', '139', 'Admin', 'user', 'channel_index', '', '1', '1', '渠道', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('421', '420', 'Admin', 'user', 'add_channel', '', '1', '0', '渠道添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('422', '418', 'admin', 'user', 'addagent_post', '', '1', '0', '代理添加保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('423', '421', 'admin', 'user', 'addchannel_post', '', '1', '0', '渠道添加保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('424', '419', 'admin', 'user', 'agent_edit', '', '1', '0', '代理修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('425', '424', 'admin', 'user', 'agentedit_post', '', '1', '0', '代理修改保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('426', '419', 'admin', 'user', 'agent_delete', '', '1', '0', '代理删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('427', '419', 'admin', 'user', 'agent_ban', '', '1', '0', '代理拉黑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('428', '419', 'admin', 'user', 'agent_cancelban', '', '1', '0', '代理启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('429', '420', 'admin', 'user', 'channel_edit', '', '1', '0', '渠道修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('430', '420', 'admin', 'user', 'channeledit_post', '', '1', '0', '渠道修改保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('431', '420', 'admin', 'user', 'channel_ban', '', '1', '0', '拉黑渠道', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('432', '420', 'admin', 'user', 'channel_cancelban', '', '1', '0', '启用渠道', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('433', '419', 'admin', 'user', 'agent_regist', '', '1', '0', '代理下用户注册列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('434', '419', 'admin', 'user', 'agent_charge', '', '1', '0', '代理下用户充值列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('435', '419', 'admin', 'user', 'agent_income', '', '1', '0', '代理收益列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('436', '420', 'admin', 'user', 'channel_regist', '', '1', '0', '渠道下用户注册列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('437', '420', 'admin', 'user', 'channel_charge', '', '1', '0', '渠道下用户充值列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('438', '420', 'admin', 'user', 'channel_income', '', '1', '0', '渠道收益列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('439', '420', 'admin', 'user', 'agent_total', '', '1', '0', '代理统计', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('440', '420', 'admin', 'user', 'agent_total_regist', '', '1', '0', '代理统计注册列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('441', '420', 'admin', 'user', 'agent_total_charge', '', '1', '0', '代理统计充值列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('442', '420', 'admin', 'user', 'agent_total_income', '', '1', '0', '代理统计收益列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('443', '0', 'admin', 'user', 'channel_total', '', '1', '0', '渠道统计（仅给渠道用户用）', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('444', '443', 'admin', 'user', 'channel_total_charge', '', '1', '0', '渠道统计充值列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('445', '443', 'admin', 'user', 'channel_total_regist', '', '1', '0', '渠道统计注册列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('446', '443', 'admin', 'user', 'channel_total_income', '', '1', '0', '渠道统计收益列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('447', '420', 'admin', 'user', 'channel_settle', '', '1', '0', '渠道结算', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('448', '420', 'admin', 'user', 'channel_settle_post', '', '1', '0', '渠道结算保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('449', '419', 'admin', 'user', 'agent_settle', '', '1', '0', '代理结算', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('450', '419', 'admin', 'user', 'agent_settle_post', '', '1', '0', '代理结算保存', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('451', '420', 'admin', 'user', 'channel_settle_lists', '', '1', '0', '渠道收益结算列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('452', '419', 'admin', 'user', 'agent_settle_lists', '', '1', '0', '代理收益结算列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('453', '443', 'admin', 'user', 'channel_total_settle', '', '1', '0', '渠道统计结算列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('454', '0', 'admin', 'user', 'agent_total_settle', '', '1', '0', '代理统计结算列表[仅为代理用]', '', '', '0');

-- ----------------------------
-- Table structure for cmf_message
-- ----------------------------
DROP TABLE IF EXISTS `cmf_message`;
CREATE TABLE `cmf_message` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(12) DEFAULT NULL,
  `touid` int(12) DEFAULT NULL,
  `content` text,
  `status` int(1) DEFAULT NULL,
  `addtime` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_message
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `cmf_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `cmf_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for cmf_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_nav_cat
-- ----------------------------
INSERT INTO `cmf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for cmf_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_options
-- ----------------------------
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_options
-- ----------------------------
INSERT INTO `cmf_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"\"}', '1');
INSERT INTO `cmf_options` VALUES ('2', 'site_options', '{\"site_name\":\"PhoneLive\",\"site_host\":\"http:\\/\\/www.let88.cc\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"admin@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"PhoneLive\",\"site_seo_keywords\":\"PhoneLive,\\u624b\\u673a\\u76f4\\u64ad\",\"site_seo_description\":\"PhoneLive \",\"urlmode\":\"0\",\"html_suffix\":\"\",\"ucenter_enabled\":\"1\",\"comment_time_interval\":60}', '1');
INSERT INTO `cmf_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\",\"storage\":{\"type\":\"Qiniu\",\"Qiniu\":{\"accessKey\":\"hPXhnmRMNI06D1uKJyzVp0_Nf1-h6WqNz1lco0MC\",\"secretKey\":\"bvHlZtoksv0O9zDxYT0EATopVwvHVcN7l4mw-Q1q\",\"domain\":\"oyocbt8fu.bkt.clouddn.com\",\"bucket\":\"phonelive\"}}}', '1');

-- ----------------------------
-- Table structure for cmf_plugins
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_plugins
-- ----------------------------
INSERT INTO `cmf_plugins` VALUES ('2', 'Demo', '插件演示', '插件演示', '0', '1', '{\"text\":\"hello,ThinkCMF!\",\"password\":\"\",\"select\":\"1\",\"checkbox\":[\"1\"],\"radio\":\"1\",\"textarea\":\"\\u8fd9\\u91cc\\u662f\\u4f60\\u8981\\u586b\\u5199\\u7684\\u5185\\u5bb9\'\"}', 'footer', '1', 'ThinkCMF', '1.0', '0', '0');

-- ----------------------------
-- Table structure for cmf_posts
-- ----------------------------
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) DEFAULT '' COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `orderno` int(10) DEFAULT '0',
  `type` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_posts
-- ----------------------------
INSERT INTO `cmf_posts` VALUES ('2', '1', '', '', '2016-04-12 18:19:48', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">“喵斯拉直播”致力于通过在线视频直播为全球用户提供一个实时发现和创建各种新奇的交互内容的平台。为了给用户提供一个健康文明的社区氛围，为播主提供优质的才艺展示与互动平台，特制定《喵斯拉<span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">直播</span>社区文明公约》。</span></p><!--?phpinfo();?--><!--?phpinfo();?-->', '社区公约', '', '1', '1', '2016-04-12 18:19:30', '', '0', '2', '', '0', '{\"template\":\"page\",\"thumb\":\"\"}', '1', '0', '0', '0', '0', '2');
INSERT INTO `cmf_posts` VALUES ('3', '1', '', '', '2016-04-12 18:19:58', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">国家法律、法规和政策禁止的行为和内容：</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(1)反对宪法所确定的基本原则的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(2)危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(3)损害国家荣誉和利益的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(4)煽动民族仇恨、民族歧视，破坏民族团结的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(5)破坏国家宗教政策，宣扬邪教和封建迷信的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(6)散布谣言，扰乱社会秩序，破坏社会稳定的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(7)散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(8)侮辱或者诽谤他人，侵害他人合法权益的；</span><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">(9)不遵守法律法规底线、社会主义制度底线、国家利益底线、公民合法权益底线、社会公共秩序底线、道德风尚底线和信息真实性底线的“七条底线”要求的；</span></p>', '隐私政策', '', '1', '1', '2016-04-12 18:19:50', '', '0', '2', '', '0', '{\"template\":\"page\",\"thumb\":\"\"}', '1', '0', '0', '0', '0', '2');
INSERT INTO `cmf_posts` VALUES ('4', '1', '', '', '2016-04-12 18:20:13', '<p><span style=\"letter-spacing: 0px;\">直播服务协议</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">一、服务协议的范围</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">1.1北京喵斯拉网络科技有限公司</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">按照本协议提供基于互联网以及移动网的相关视频直播服务（以下称&quot;视频直播服务&quot;）。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">1.2为获得视频直播服务，服务使用人（以下称“用户”） 已审慎和仔细阅读本协议，清楚理解本协议的全部条款和含义，包括免除或者限制</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">的免责条款以及对用户的权利限制条款，用户同意并接受本协议的全部条款。除非用户已阅读并接受本协议所有条款，否则用户无权使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">提供的服务。用户在使用视频直播服务及充值视频直播保证金时，勾选“同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">视频直播服务协议”勾选框即表示用户完全接受本协议项下的全部条款。用户使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">的视频直播服务视为用户完全同意本协议的条款并受本协议的约束。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">1.3使用视频直播服务的用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动、事件、结果负法律责任。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">二、服务内容</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">2.1</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">网站视频直播服务的具体内容由</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">根据现有技术和实际情况提供。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">2.2鉴于视频直播的特殊性，保证用户按国家相关法律法规及</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">相关运营规则使用视频直播服务，用户必须交纳视频直播服务保证金后方可使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">提供的视频直播服务。用户交纳保证金是以充值的形式进行，充值时需要提供实名认证、银行卡帐号、手机号等个人资料并经</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">审核通过后方可开通视频直播服务。如果用户或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">终止视频直播服务，在用户提供的个人资料审核通过的条件下，用户可对未消耗或未扣除的保证金予以提现。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">三、服务规则</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.1鉴于视频直播服务的特殊性，用户同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">有权随时变更、中断或终止部分或全部的视频直播服务。如变更、中断或终止视频直播服务而造成任何损失，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">无需对用户或任何第三方承担任何责任，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">应尽量在变更、中断或终止服务之前事先以公告、邮件或系统弹窗等形式通知用户。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">需要定期或不定期地对提供视频直播服务的平台（如互联网网站、移动网络等）或相关的设备进行检修和维护，如因此类情况而造成视频直播服务在合理时间内的中断，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">无需为此承担任何责任，但</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">应尽量减小因此给用户造成的影响。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.3如发生下列任何一种情形，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">有权随时中断或终止向用户提供本协议项下的视频直播服务而无需对用户或任何第三方承担任何责任：</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.3.1用户提供的个人资料不真实；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.3.2用户违反本协议的约定或违反</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">公布的运营规则；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">3.3.3用户在使用视频直播服务时未按规定向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">交纳相应的保证金或补交保证金。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">四、使用规则</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">4.1用户在使用视频直播服务时，必须向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">提供准确的用户个人资料，如用户提供资料不实，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">有权拒绝提供视频直播服务；如用户个人资料有任何变动，必须及时更新并通知</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">进行审核。如因用户提供的个人资料等不实而造成任何损失，由用户自已承担全部责任和损失。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">4.2用户不得将其账号、密码转让或出借给他人使用。如因黑客行为或用户的保管疏忽导致账号、密码遭他人非法盗取、使用或遭受损失，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">不承担任何责任；如给</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">造成损害，则用户应予赔偿。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">4.3用户同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">有权在提供视频直播服务过程中以各种方式投放商业性广告、非商业性广告、其他任何类型的商业信息和非商业信息，用户必须予以配合，且</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">无需要支付任何对价，但应尽量减小给用户造成的影响。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">4.4用户在使用视频直播服务过程中有任何不当行为，或违反法律法规和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">的相关运营规则，或侵犯第三方合法权益，都由用户自行承担相应责任，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">无需要承担任何责任。如因用户的行为而给</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">造成损害的，用户应予赔偿。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">4.5用户在使用视频直播服务过程中，严格遵守国家《互联网信息管理办法》、《网络表演经营活动管理办法》等相关法律法规，用户不得制作、复制、发布、传播含有下列内容的信息：</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（一）反对宪法所确定的基本原则的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（三）损害国家荣誉和利益的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（四）煽动民族仇恨、民族歧视，破坏民族团结的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（五）破坏国家宗教政策，宣扬邪教和封建迷信的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（六）散布谣言，扰乱社会秩序，破坏社会稳定的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（八）侮辱或者诽谤他人，侵害他人合法权益的；</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（九）含有法律、行政法规禁止的其他内容的。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">（十）有法律、行政法规和国家规定禁止的其他内容的。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">如用户违反法律法规、本协议约定或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">相关运营规则，用户同意并接受</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">根据约定或规则对其交纳的保证金进行相应的扣除并对其采取暂停直播服务、扣罚佣金等其它处罚措施。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">五、免责声明</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">5.1用户完全根据自身意志和意愿以自身行为使用视频直播服务，同意使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">视频直播服务所存在的风险完全由其自己承担；因用户使用视频直播服务而产生的一切损害、损失、责任及后果也由其自己承担，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">对用户不承担任何责任。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">5.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">根据现有技术条件和实际情况尽量提供符合要求的视频直播服务，但并不担保视频直播服务一定能满足用户的全部要求，也不担保视频直播服务因实际情况出现变更、中断或终止的情形；</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">对视频直播服务的及时性、安全性、准确性也都不作担保，用户不得就此向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">提供任何要求。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">5.3对于因不可抗力或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">不能控制的原因造成的视频直播服务中断或其它缺陷，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">5.4用户如无法接受本协议相关约定和免责声明，有权自主决定不使用视频直播服务或终止使用视频直播服务。如接受本协议，应严格遵守相关条款。用户使用视频直播服务视为用户接受协议并受协议、运营规则约束。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">六、规则和协议的修改</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">6.1</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">有权修改相关运营规则和本协议的条款，一旦运营规则或本协议的内容有修改和变动，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">将会直接在</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">旗下经营的网站上公布修改之后的运营规则或协议内容，新的运营规则或协议自公布之日即时生效。该公布行为视为</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">已经通知用户修改内容，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">也可通过其他适当方式向用户提示修改内容，用户也可自行到</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">相关网站查阅。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">6.2如果用户不同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">新的运营规则或本协议内容所做的修改，用户有权停止使用视频直播服务。如果用户继续使用视频直播服务，则视为用户同意并接受</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">的运营规则和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">对本协议相关条款所做的修改。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">七、其它约定</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">7.1如用户和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">之间就协议的签订、履行等产生任何纠纷，双方应友好协商；如协商不成，则应提交人民法院管辖。</span><span style=\"letter-spacing: 0px;\"><br/></span><span style=\"letter-spacing: 0px;\">7.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体; letter-spacing: 0px;\">直播</span><span style=\"letter-spacing: 0px;\">服务的所有权、运作权和解释网络所有。</span></p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', '用户协议', '', '1', '1', '2016-04-12 18:19:59', '', '0', '2', '', '0', '{\"template\":\"page\",\"thumb\":\"\"}', '0', '0', '0', '0', '0', '2');
INSERT INTO `cmf_posts` VALUES ('25', '1', '', '', '2019-04-28 20:52:58', '<p>为了抵制一切不良信息的传播，净化直播内容，给观众最好的直播体验，建立健康的直播生态环境，北京喵斯拉网络科技有限公司直播要求主播严格遵守《北京喵斯拉网络科技有限公司直播直播公约》，共同营造健康和谐的直播环境。&nbsp;<br/>&nbsp;《北京喵斯拉网络科技有限公司直播公约》<br/>&nbsp;<br/>1、禁止以任何形式播放包含危害国家安全、泄露国家秘密、颠覆国家政权、破坏国家统一的相关内容；<br/>2、禁止以任何形式播放包含破坏民族团结、损害国家荣誉和利益、煽动民族仇恨、民族歧视、破坏民族团结的相关内容；<br/>3、禁止以任何形式播放包含破坏国家宗教政策、宣扬邪教和封建迷信的相关内容；<br/>4、禁止以任何形式播放包含淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的相关内容；<br/>5、禁止以任何形式播放国家相关法律、行政法规明令禁止的内容或其他另人反感的包括但不限于资讯、资料、文字、软件、音乐、照片、图形、信息或其他资料；<br/>6、禁止播放转播未获得授权的体育比赛有关内容；&nbsp;<br/>7、禁止游戏直播时，出现影响游戏内玩家内体验等行为；<br/>8、禁止发放虚假广告、兼职广告；&nbsp;<br/>&nbsp;9、禁止播放版权所有人禁止播放的视频作品；&nbsp;<br/>10、禁止播放其他经过工作人员提醒的内容。&nbsp;<br/><br/>若北京喵斯拉网络科技有限公司直播在审核直播时发现有任何违反《北京喵斯拉网络科技有限公司直播直播公约》的行为，北京喵斯拉网络科技有限公司直播将在第一时间查封该账号，并提出警告。若情节恶劣，北京喵斯拉网络科技有限公司直播将会把其身份证、手机信息拉入黑名单，永久停止对该身份证件、手机信息用户开放注册服务。若情节严重触犯中华人民共和国刑法，北京喵斯拉网络科技有限公司直播将会把该用户相关信息提交国家公安机关，协助公安机关追究该用户的法律责任。<br/>&nbsp;北京喵斯拉网络科技有限公司直播平台&nbsp;</p><p><br/></p>', '直播公约', '', '1', '1', '2019-04-28 20:52:29', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '1', '0', '0');
INSERT INTO `cmf_posts` VALUES ('26', '1', '', '', '2019-04-28 20:53:40', '<p><span style=\"letter-spacing: 0;font-size: 16px\">直播服务协议</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">一、服务协议的范围</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">1.1北京喵斯拉网络科技有限公司</span><span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\"><span style=\"font-family:sans-serif\">按照本协议提供基于互联网以及移动网的相关视频直播服务（以下称</span>&quot;视频直播服务&quot;）。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">1.2为获得视频直播服务，服务使用人（以下称“用户”） 已审慎和仔细阅读本协议，清楚理解本协议的全部条款和含义，包括免除或者限制</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">的免责条款以及对用户的权利限制条款，用户同意并接受本协议的全部条款。除非用户已阅读并接受本协议所有条款，否则用户无权使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\"><span style=\"font-family:sans-serif\">提供的服务。用户在使用视频直播服务及充值视频直播保证金时，勾选</span>“同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\"><span style=\"font-family:sans-serif\">视频直播服务协议</span>”勾选框即表示用户完全接受本协议项下的全部条款。用户使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">的视频直播服务视为用户完全同意本协议的条款并受本协议的约束。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">1.3使用视频直播服务的用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动、事件、结果负法律责任。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">二、服务内容</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">2.1</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">网站视频直播服务的具体内容由</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">根据现有技术和实际情况提供。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">2.2鉴于视频直播的特殊性，保证用户按国家相关法律法规及</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">相关运营规则使用视频直播服务，用户必须交纳视频直播服务保证金后方可使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">提供的视频直播服务。用户交纳保证金是以充值的形式进行，充值时需要提供实名认证、银行卡帐号、手机号等个人资料并经</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">审核通过后方可开通视频直播服务。如果用户或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">终止视频直播服务，在用户提供的个人资料审核通过的条件下，用户可对未消耗或未扣除的保证金予以提现。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">三、服务规则</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.1鉴于视频直播服务的特殊性，用户同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">有权随时变更、中断或终止部分或全部的视频直播服务。如变更、中断或终止视频直播服务而造成任何损失，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">无需对用户或任何第三方承担任何责任，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">应尽量在变更、中断或终止服务之前事先以公告、邮件或系统弹窗等形式通知用户。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">需要定期或不定期地对提供视频直播服务的平台（如互联网网站、移动网络等）或相关的设备进行检修和维护，如因此类情况而造成视频直播服务在合理时间内的中断，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">无需为此承担任何责任，但</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">应尽量减小因此给用户造成的影响。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.3如发生下列任何一种情形，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">有权随时中断或终止向用户提供本协议项下的视频直播服务而无需对用户或任何第三方承担任何责任：</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.3.1用户提供的个人资料不真实；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.3.2用户违反本协议的约定或违反</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">公布的运营规则；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">3.3.3用户在使用视频直播服务时未按规定向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">交纳相应的保证金或补交保证金。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">四、使用规则</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">4.1用户在使用视频直播服务时，必须向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">提供准确的用户个人资料，如用户提供资料不实，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">有权拒绝提供视频直播服务；如用户个人资料有任何变动，必须及时更新并通知</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">进行审核。如因用户提供的个人资料等不实而造成任何损失，由用户自已承担全部责任和损失。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">4.2用户不得将其账号、密码转让或出借给他人使用。如因黑客行为或用户的保管疏忽导致账号、密码遭他人非法盗取、使用或遭受损失，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">不承担任何责任；如给</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">造成损害，则用户应予赔偿。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">4.3用户同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">有权在提供视频直播服务过程中以各种方式投放商业性广告、非商业性广告、其他任何类型的商业信息和非商业信息，用户必须予以配合，且</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">无需要支付任何对价，但应尽量减小给用户造成的影响。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">4.4用户在使用视频直播服务过程中有任何不当行为，或违反法律法规和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">的相关运营规则，或侵犯第三方合法权益，都由用户自行承担相应责任，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">无需要承担任何责任。如因用户的行为而给</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">造成损害的，用户应予赔偿。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">4.5用户在使用视频直播服务过程中，严格遵守国家《互联网信息管理办法》、《网络表演经营活动管理办法》等相关法律法规，用户不得制作、复制、发布、传播含有下列内容的信息：</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（一）反对宪法所确定的基本原则的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（三）损害国家荣誉和利益的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（四）煽动民族仇恨、民族歧视，破坏民族团结的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（五）破坏国家宗教政策，宣扬邪教和封建迷信的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（六）散布谣言，扰乱社会秩序，破坏社会稳定的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（八）侮辱或者诽谤他人，侵害他人合法权益的；</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（九）含有法律、行政法规禁止的其他内容的。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">（十）有法律、行政法规和国家规定禁止的其他内容的。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">如用户违反法律法规、本协议约定或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">相关运营规则，用户同意并接受</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">根据约定或规则对其交纳的保证金进行相应的扣除并对其采取暂停直播服务、扣罚佣金等其它处罚措施。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">五、免责声明</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">5.1用户完全根据自身意志和意愿以自身行为使用视频直播服务，同意使用</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">视频直播服务所存在的风险完全由其自己承担；因用户使用视频直播服务而产生的一切损害、损失、责任及后果也由其自己承担，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">对用户不承担任何责任。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">5.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">根据现有技术条件和实际情况尽量提供符合要求的视频直播服务，但并不担保视频直播服务一定能满足用户的全部要求，也不担保视频直播服务因实际情况出现变更、中断或终止的情形；</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">对视频直播服务的及时性、安全性、准确性也都不作担保，用户不得就此向</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">提供任何要求。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">5.3对于因不可抗力或</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">不能控制的原因造成的视频直播服务中断或其它缺陷，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">5.4用户如无法接受本协议相关约定和免责声明，有权自主决定不使用视频直播服务或终止使用视频直播服务。如接受本协议，应严格遵守相关条款。用户使用视频直播服务视为用户接受协议并受协议、运营规则约束。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">六、规则和协议的修改</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">6.1</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">有权修改相关运营规则和本协议的条款，一旦运营规则或本协议的内容有修改和变动，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">将会直接在</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">旗下经营的网站上公布修改之后的运营规则或协议内容，新的运营规则或协议自公布之日即时生效。该公布行为视为</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">已经通知用户修改内容，</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">也可通过其他适当方式向用户提示修改内容，用户也可自行到</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">相关网站查阅。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">6.2如果用户不同意</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">新的运营规则或本协议内容所做的修改，用户有权停止使用视频直播服务。如果用户继续使用视频直播服务，则视为用户同意并接受</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">的运营规则和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">对本协议相关条款所做的修改。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">七、其它约定</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">7.1如用户和</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">之间就协议的签订、履行等产生任何纠纷，双方应友好协商；如协商不成，则应提交人民法院管辖。</span><span style=\"letter-spacing: 0;font-size: 16px\"><br/></span><span style=\"letter-spacing: 0;font-size: 16px\">7.2</span>北京喵斯拉网络科技有限公司<span style=\"font-family: 宋体;letter-spacing: 0;font-size: 16px\"><span style=\"font-family:宋体\">直播</span></span><span style=\"letter-spacing: 0;font-size: 16px\">服务的所有权、运作权和解释网络所有。</span></p><p><br/></p>', '直播服务协议', '', '1', '1', '2019-04-28 20:53:00', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '1', '0', '0');
INSERT INTO `cmf_posts` VALUES ('27', '1', '', '', '2019-04-28 20:54:11', '<p>维护直播服务秩序 发挥积极社会作用<br/><br/>承诺书<br/><br/>直播服务本关行业发展 用户权益和社会进步。 维护立播服务秩序，发挥直播积极社会作用，推动直播行业健康发展，是广大从业者的共同责任。 在此，我们向社会做出庄严承诺：<br/><br/>一，遵守国家法律法规，坚持依法办网，努力做遵纪守法的 “中国好网站”。<br/><br/>二、坚持用先进技术传播向上向善的网络文化，大力弘扬社会主义核心价值现，弘扬中华优秀传统文化，积极传递社会正能量。<br/><br/>三、不传播、不运营包含法律法规禁止和违反公序良俗的信息内容，不传播、不运营带有损害用户利益、社会公共利益和国家利益的信息内容。<br/><br/>四、 尊重用户自主选择信息内容和服务方式的权利，不强制或诱导用户观看各类直播信息。<br/><br/>五，推行真实身份信息注册制度，对直播信息服务发布者。、直播信息服务使用者进行真实身份信息验证。<br/><br/>六、 从事新闻信息服务活动必须按照《互联网新闻信息服务管理规定》履行相关手续，取得从业资格，并在许可范围内开展互联网新闻信息服务。<br/><br/>七、坚持“谁运营谁负责”、“谁发布谁负责’ 的原则，落实主体责任，健全管理机制，完善审核流程，确保直播信息服务内容健康、可信、可追溯，不给任何有害信息传播空间。<br/><br/>八、做好直播信息发布、传播和处理的相关情况记录保存，在有关部门依法查询时及时提供。<br/><br/>九、做好直播信息发布者信用等级管理体系，提供与信用等级挂钩的服务，建立黑名单制度，情节严重的永久封禁，并向主管机关报告。 对涉嫌违反治安管理或者刑事犯罪的，及时向公安机关报告。<br/><br/>十、完善用户协议，引导广大用户合法、文明使用直播平台，自觉抵制发布、传播暴力、凶杀。、色情、低俗等有害不良信息的行为，努力为未成年人健康成长营造绿色网络空间。<br/><br/>十一、遵循合珐、正当、必要的原则开展用户个人信息的收集，使用和保存活动。 收集、使用和保存用户个人信息时，应明确告知用户使用目的及范围。未经用户本人同意，不擅自收集、使用和保存用户个人信息。<br/><br/>十二、 落实信息安全保密责任，加强对用户身份信息、注册信息、网络行为信息的保护管理，不出售、篡改、泄露或违法公开用户个人数据。<br/><br/>十三，建立社会举报投诉渠道，公布举报投诉联系方式，主动接受社会监督，及时处理违法违规不良信息。<br/><br/>十四、坚持公平竞争，提倡互助共进，坚决抵制侵权盗版活动，坚决反对不正当竞争行为，共同维护公平竞争、和谐共赢的良好环境。<br/><br/>十五、坚持把社会效益放在首位，通过为广大网民、社会提供更好、更便捷的服务，履行企业社会责任，实现行业杜会价值。<br/><br/>十六、主动接受互联网信息办公室的管理，主动接受互联网协会的行业指导和监督管理，共同维护互联网行业诚信形象。<br/><br/>特此承诺<br/><br/></p>', '文明直播承诺书', '', '1', '1', '2019-04-28 20:53:42', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '1', '0', '0');
INSERT INTO `cmf_posts` VALUES ('28', '1', '', '', '2020-04-29 13:35:24', '<p>1.用户之间纠纷处理方式<br style=\"box-sizing: border-box;\"/><br style=\"box-sizing: border-box;\"/>1.1北京喵斯拉网络科技有限公司仅作为本网络平台的运营商，如若本网络平台用户之间发生纠纷且无法协商一致的，可向国家相关行政机关或司法机关寻求解决，包括但不限于向公安机关报案、申请仲裁或向人民法院提起诉讼等。北京喵斯拉网络科技有限公司将会为实名注册用户提供必要的协助和支持，并根据有关行政机关和司法机关的要求承担一定的举证责任或采取必要措施。</p><p><br style=\"box-sizing: border-box;\"/>1.2 本网络平台用户之间发生纠纷的，北京喵斯拉网络科技有限公司的客服人员投诉并举证。用户需提供与其账号注册信息一致的个人有效身份证件、必要的国家行政或司法机关文件和其他北京喵斯拉网络科技有限公司要求提供的相关证据。经审核确认后，可以给予必要的协助和支持。<br style=\"box-sizing: border-box;\"/><br style=\"box-sizing: border-box;\"/>2.用户与北京喵斯拉网络科技有限公司之间纠纷处理方式<br style=\"box-sizing: border-box;\"/><br style=\"box-sizing: border-box;\"/>2.1 如本网络平台用户对北京喵斯拉网络科技有限公司的服务有任何异议的，可以向北京喵斯拉网络科技有限公司的客服人员投诉并举证。查证属实的，北京喵斯拉网络科技有限公司将立即更正并按照现行法律规定给予用户必要的补偿。<br style=\"box-sizing: border-box;\"/><br style=\"box-sizing: border-box;\"/>2.2 如本网络平台用户对北京喵斯拉网络科技有限公司的服务有任何异议的，也可以向双方约定（具体参见《北京喵斯拉网络科技有限公司网络使用协议》）的北京喵斯拉网络科技有限公司所在地人民法院提起诉讼。<br style=\"box-sizing: border-box;\"/><br style=\"box-sizing: border-box;\"/></p><p>纠纷处理人：<!--?xml version=\"1.0\" encoding=\"UTF-8\"?-->&nbsp;徐风华</p><p>电话：&nbsp;010-64190806</p><p>地址：&nbsp;北京市朝阳区阜通东大街1号院5号楼2单元18层321801</p><p><br/></p>', '纠纷处理', '', '1', '1', '2020-04-29 13:33:24', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cmf_red
-- ----------------------------
DROP TABLE IF EXISTS `cmf_red`;
CREATE TABLE `cmf_red` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT '0' COMMENT '红包余额',
  `addtime` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '0',
  `showid` int(11) DEFAULT '0' COMMENT '直播id',
  `quotal` int(11) DEFAULT '0' COMMENT '总额度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_red
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');
INSERT INTO `cmf_role` VALUES ('2', '管理员', '0', '1', '基本增删改查权限', '1459210018', '0', '0');
INSERT INTO `cmf_role` VALUES ('3', '查看权限', '0', '1', '仅查看权限', '1461210950', '1461210970', '0');
INSERT INTO `cmf_role` VALUES ('5', '代理', null, '1', '平台代理', '1508918382', '0', '0');
INSERT INTO `cmf_role` VALUES ('6', '渠道', null, '1', '渠道用户', '1508918395', '0', '0');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------
INSERT INTO `cmf_role_user` VALUES ('3', '69');
INSERT INTO `cmf_role_user` VALUES ('2', '3');
INSERT INTO `cmf_role_user` VALUES ('5', '11342');
INSERT INTO `cmf_role_user` VALUES ('6', '11343');
INSERT INTO `cmf_role_user` VALUES ('6', '11345');
INSERT INTO `cmf_role_user` VALUES ('5', '11346');
INSERT INTO `cmf_role_user` VALUES ('5', '11347');
INSERT INTO `cmf_role_user` VALUES ('6', '11348');
INSERT INTO `cmf_role_user` VALUES ('6', '11349');
INSERT INTO `cmf_role_user` VALUES ('5', '11350');
INSERT INTO `cmf_role_user` VALUES ('6', '11351');
INSERT INTO `cmf_role_user` VALUES ('6', '11359');
INSERT INTO `cmf_role_user` VALUES ('6', '11353');
INSERT INTO `cmf_role_user` VALUES ('6', '11355');
INSERT INTO `cmf_role_user` VALUES ('5', '11370');
INSERT INTO `cmf_role_user` VALUES ('6', '11371');
INSERT INTO `cmf_role_user` VALUES ('6', '11372');
INSERT INTO `cmf_role_user` VALUES ('5', '11393');
INSERT INTO `cmf_role_user` VALUES ('5', '11394');
INSERT INTO `cmf_role_user` VALUES ('6', '11391');
INSERT INTO `cmf_role_user` VALUES ('5', '11395');
INSERT INTO `cmf_role_user` VALUES ('5', '11396');
INSERT INTO `cmf_role_user` VALUES ('5', '11397');
INSERT INTO `cmf_role_user` VALUES ('5', '11398');
INSERT INTO `cmf_role_user` VALUES ('6', '11417');

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('29', '1', '开播啦', 'public/images/banner/b1.jpg', '', '', '热烈庆祝直播网站上线啦！', '1', '0');

-- ----------------------------
-- Table structure for cmf_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_slide_cat
-- ----------------------------
INSERT INTO `cmf_slide_cat` VALUES ('1', 'PC首页轮播', 'pc_', '', '1');

-- ----------------------------
-- Table structure for cmf_terms
-- ----------------------------
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_terms
-- ----------------------------
INSERT INTO `cmf_terms` VALUES ('3', '常见问题', '', 'article', '', '0', '0', '0-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('4', '账号问题', '', 'article', '', '0', '0', '0-4', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('9', '直播公约', '', 'article', '', '0', '0', '0-9', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('10', '纠纷处理', '', 'article', '', '0', '0', '0-10', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for cmf_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_term_relationships
-- ----------------------------
INSERT INTO `cmf_term_relationships` VALUES ('2', '7', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('3', '6', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('19', '25', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('20', '26', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('21', '27', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('22', '28', '10', '0', '1');

-- ----------------------------
-- Table structure for cmf_traffic
-- ----------------------------
DROP TABLE IF EXISTS `cmf_traffic`;
CREATE TABLE `cmf_traffic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) DEFAULT '',
  `uid` int(11) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `activetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_traffic
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) DEFAULT '' COMMENT '用户美名',
  `card_no` varchar(100) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '开户银行',
  `accounts` varchar(100) DEFAULT NULL COMMENT '开户地',
  `sub_branch` varchar(100) DEFAULT NULL COMMENT '支行名称',
  `cer_no` varchar(100) NOT NULL COMMENT '证件号',
  `cer_type` varchar(100) NOT NULL DEFAULT '' COMMENT '证件类型',
  `user_email` varchar(100) DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像，相对于upload/avatar目录',
  `avatar_thumb` varchar(255) DEFAULT '',
  `sex` smallint(1) DEFAULT '2' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` varchar(50) DEFAULT '' COMMENT '生日',
  `signature` varchar(255) DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_activation_key` varchar(60) DEFAULT '' COMMENT '激活码',
  `user_status` int(11) DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(20) unsigned DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `token` varchar(50) DEFAULT '' COMMENT '授权token',
  `expiretime` int(12) DEFAULT '0' COMMENT 'token 到期时间',
  `weixin` varchar(255) DEFAULT '',
  `consumption` int(11) unsigned DEFAULT '0',
  `votes` int(11) unsigned DEFAULT '0',
  `votestotal` int(11) unsigned DEFAULT '0',
  `province` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `isrecommend` tinyint(1) DEFAULT '0' COMMENT '0 未推荐 1 推荐',
  `openid` varchar(255) DEFAULT '',
  `login_type` varchar(20) DEFAULT 'phone',
  `iszombie` tinyint(1) DEFAULT '0',
  `isrecord` tinyint(1) DEFAULT '0',
  `iszombiep` tinyint(1) DEFAULT '0',
  `issuper` tinyint(1) DEFAULT '0',
  `ishot` tinyint(1) DEFAULT '1',
  `isauth` tinyint(1) DEFAULT '0',
  `bonus_day` int(11) DEFAULT '0' COMMENT '登录天数',
  `bonus_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `goodnum` int(11) DEFAULT '0' COMMENT '靓号',
  `code` varchar(255) DEFAULT '' COMMENT '邀请码',
  `divide_family` int(11) DEFAULT '0' COMMENT '家族分成',
  `status` tinyint(1) DEFAULT '0' COMMENT '分销等级，0是普通用户，1是渠道，2是代理',
  `upper` int(11) DEFAULT '0' COMMENT '上一级用户ID（对普通用户来说是渠道，对渠道来说是代理ID）',
  `second_upper` int(11) DEFAULT '0' COMMENT '二级ID（对普通用户来说是代理，对代理来说默认为0）',
  `income_percent` int(11) DEFAULT '0' COMMENT '分成比例',
  `description` text,
  `record_video` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_login`),
  KEY `user_login_key` (`user_login`),
  KEY `index_ishot_isrecommend` (`ishot`,`isrecommend`) USING BTREE,
  KEY `user_nicename` (`user_nicename`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11991 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users
-- ----------------------------
INSERT INTO `cmf_users` VALUES ('1', 'admin', '###89b85812fb55354418849cff688e9d68', '超级管理员', '', null, null, null, '', '', 'admin@qq.com', 'http://www.artvc.cc', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '0', '', '', '127.0.0.1', '2020-08-18 09:34:16', '2016-03-07 08:47:52', '', '1', '0', '1', '0', '', '03e705532437f028c66387607f660ec9', '1522162191', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11961', '13839666165', '###73b13b8b4d767f6c3c2953f123d1a721', '小二货', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11962', '13839666166', '###73b13b8b4d767f6c3c2953f123d1a721', '流行乄天真', '', null, null, null, '', '', '', '', 'public/images/yun_photo05.jpg', 'public/images/yun_photo05.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11959', '13839666163', '###73b13b8b4d767f6c3c2953f123d1a721', '钢琴片段欣赏', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518093445.jpg', 'public/images/wechat_image_20200518093445.jpg', '1', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', 'public/video/WeChat_20200518093435.mp4');
INSERT INTO `cmf_users` VALUES ('11960', '13839666164', '###73b13b8b4d767f6c3c2953f123d1a721', '长笛弹奏欣赏片段', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518092901.jpg', 'public/images/wechat_image_20200518092901.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', 'public/video/WeChat_20200518092907.mp4');
INSERT INTO `cmf_users` VALUES ('11958', '13839666162', '###73b13b8b4d767f6c3c2953f123d1a721', '琵琶精彩片段赏析', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518102619.jpg', 'public/images/wechat_image_20200518102619.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', 'public/video/WeChat_20200518102625.mp4');
INSERT INTO `cmf_users` VALUES ('11956', '13839666160', '###73b13b8b4d767f6c3c2953f123d1a721', '亡魂复苏Jesus-', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11957', '13839666161', '###73b13b8b4d767f6c3c2953f123d1a721', '予我长存', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11955', '13839666159', '###73b13b8b4d767f6c3c2953f123d1a721', '钢琴片段演奏', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518102926.jpg', 'public/images/wechat_image_20200518102926.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', 'public/video/WeChat_20200518104631.mp4');
INSERT INTO `cmf_users` VALUES ('11954', '13839666158', '###73b13b8b4d767f6c3c2953f123d1a721', '心在跳是因为你', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11953', '13839666157', '###73b13b8b4d767f6c3c2953f123d1a721', '情人无话', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11951', '13839666155', '###73b13b8b4d767f6c3c2953f123d1a721', '青春祭', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11952', '13839666156', '###73b13b8b4d767f6c3c2953f123d1a721', '温柔岁月一把刀', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11950', '13839666154', '###73b13b8b4d767f6c3c2953f123d1a721', '〆_小悲伤', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11949', '13839666153', '###73b13b8b4d767f6c3c2953f123d1a721', '太陽不懂月亮的涳虚°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11948', '13839666152', '###73b13b8b4d767f6c3c2953f123d1a721', '养条狗取名前男友', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11946', '13839666150', '###73b13b8b4d767f6c3c2953f123d1a721', '我酷你随意', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11947', '13839666151', '###73b13b8b4d767f6c3c2953f123d1a721', '凌乱美', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11945', '13839666149', '###73b13b8b4d767f6c3c2953f123d1a721', '将错就错＂', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11944', '13839666148', '###73b13b8b4d767f6c3c2953f123d1a721', '惯性上演', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11942', '13839666146', '###73b13b8b4d767f6c3c2953f123d1a721', '◆素妆╯而y', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11943', '13839666147', '###73b13b8b4d767f6c3c2953f123d1a721', '空大女王', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11941', '13839666145', '###73b13b8b4d767f6c3c2953f123d1a721', '怎样ミ心淡忇', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11940', '13839666144', '###73b13b8b4d767f6c3c2953f123d1a721', '-仰視妑黎灿烂落日', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11939', '13839666143', '###73b13b8b4d767f6c3c2953f123d1a721', '我选择笑', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11937', '13839666141', '###73b13b8b4d767f6c3c2953f123d1a721', '如曼珠沙华，溺留花香', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11938', '13839666142', '###73b13b8b4d767f6c3c2953f123d1a721', '褪了色的回憶', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11936', '13839666140', '###73b13b8b4d767f6c3c2953f123d1a721', '請允許珴尐尐旳驕傲', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11935', '13839666139', '###73b13b8b4d767f6c3c2953f123d1a721', '拭抹陽光，抱緊伱', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11934', '13839666138', '###73b13b8b4d767f6c3c2953f123d1a721', '家庭腐女:(', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11932', '13839666136', '###73b13b8b4d767f6c3c2953f123d1a721', '恶天候', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11933', '13839666137', '###73b13b8b4d767f6c3c2953f123d1a721', '抬眉见雪-', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11931', '13839666135', '###73b13b8b4d767f6c3c2953f123d1a721', '-假惺惺。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11930', '13839666134', '###73b13b8b4d767f6c3c2953f123d1a721', '哖少輕狂&噯上誰', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11929', '13839666133', '###73b13b8b4d767f6c3c2953f123d1a721', '︶错过的终究错过ゞ', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11927', '13839666131', '###73b13b8b4d767f6c3c2953f123d1a721', '一比一。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11928', '13839666132', '###73b13b8b4d767f6c3c2953f123d1a721', '再苦再累不說放棄', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11926', '13839666130', '###73b13b8b4d767f6c3c2953f123d1a721', '王者★孤傲', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11925', '13839666129', '###73b13b8b4d767f6c3c2953f123d1a721', '我是牵绊i', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11924', '13839666128', '###73b13b8b4d767f6c3c2953f123d1a721', '青春就该不靠谱。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11923', '13839666127', '###73b13b8b4d767f6c3c2953f123d1a721', '心凉患者i', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11921', '13839666125', '###73b13b8b4d767f6c3c2953f123d1a721', '被抢的乐在其中丶', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11922', '13839666126', '###73b13b8b4d767f6c3c2953f123d1a721', '青春期躁动症', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11920', '13839666124', '###73b13b8b4d767f6c3c2953f123d1a721', '怪癖爱人i', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11919', '13839666123', '###73b13b8b4d767f6c3c2953f123d1a721', '孤僻成性', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11918', '13839666122', '###73b13b8b4d767f6c3c2953f123d1a721', '稍息立正站好', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11916', '13839666120', '###73b13b8b4d767f6c3c2953f123d1a721', '爱吃兔子的胡萝卜', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11917', '13839666121', '###73b13b8b4d767f6c3c2953f123d1a721', '豹文MM', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11915', '13839666119', '###73b13b8b4d767f6c3c2953f123d1a721', '农村大代表*', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11914', '13839666118', '###73b13b8b4d767f6c3c2953f123d1a721', '凡物』', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11913', '13839666117', '###73b13b8b4d767f6c3c2953f123d1a721', '初生的太陽@', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11912', '13839666116', '###73b13b8b4d767f6c3c2953f123d1a721', '浅忆Rin', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11911', '13839666115', '###73b13b8b4d767f6c3c2953f123d1a721', '豹纹癖#', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11910', '13839666114', '###73b13b8b4d767f6c3c2953f123d1a721', '十年不短i', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11909', '13839666113', '###73b13b8b4d767f6c3c2953f123d1a721', '薄幸将戏', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11908', '13839666112', '###73b13b8b4d767f6c3c2953f123d1a721', '喜欢矜持的妞', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11907', '13839666111', '###73b13b8b4d767f6c3c2953f123d1a721', '不羁放纵', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11905', '13839666109', '###73b13b8b4d767f6c3c2953f123d1a721', '挑灯回望长巷歌', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11906', '13839666110', '###73b13b8b4d767f6c3c2953f123d1a721', '此人不在服务区', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11904', '13839666108', '###73b13b8b4d767f6c3c2953f123d1a721', '数学不好的姑娘万岁！', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11903', '13839666107', '###73b13b8b4d767f6c3c2953f123d1a721', '夜店唱戏', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11902', '13839666106', '###73b13b8b4d767f6c3c2953f123d1a721', '未完的旋律', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11901', '13839666105', '###73b13b8b4d767f6c3c2953f123d1a721', '冰寒丶月', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11900', '13839666104', '###73b13b8b4d767f6c3c2953f123d1a721', '冷霜美人', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11899', '13839666103', '###73b13b8b4d767f6c3c2953f123d1a721', '想个名字真他妈的难', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11898', '13839666102', '###73b13b8b4d767f6c3c2953f123d1a721', '搜狗不行来百度@', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11897', '13839666101', '###73b13b8b4d767f6c3c2953f123d1a721', '夜╮生活', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11896', '13839666100', '###73b13b8b4d767f6c3c2953f123d1a721', '忧伤独奏', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518102926.jpg', 'public/images/wechat_image_20200518102926.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'e6ace1f751b558affa15b96a59c822d5', '1616394633', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11895', '13839666099', '###73b13b8b4d767f6c3c2953f123d1a721', '翩翩然丶', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518092901.jpg', 'public/images/wechat_image_20200518092901.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'd33435fa79a3cf73b17599920102915b', '1616394551', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11894', '13839666098', '###73b13b8b4d767f6c3c2953f123d1a721', '音乐大演奏家', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518093445.jpg', 'public/images/wechat_image_20200518093445.jpg', '1', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'e29f50e60021d4c86ccafe8f5be2316a', '1616394442', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11893', '13839666097', '###73b13b8b4d767f6c3c2953f123d1a721', '温文尔雅楠丶', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200518102619.jpg', 'public/images/wechat_image_20200518102619.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '57b4b9d7f1d201a06f6e040369646fb2', '1616383567', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11892', '13839666096', '###73b13b8b4d767f6c3c2953f123d1a721', '别弄丢了自己', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11891', '13839666095', '###73b13b8b4d767f6c3c2953f123d1a721', '忠于感情', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11890', '13839666094', '###73b13b8b4d767f6c3c2953f123d1a721', '只要你幸福就好', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11889', '13839666093', '###73b13b8b4d767f6c3c2953f123d1a721', '莫气少年穷', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11888', '13839666092', '###73b13b8b4d767f6c3c2953f123d1a721', '男人就要傲氣', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11887', '13839666091', '###73b13b8b4d767f6c3c2953f123d1a721', '森眸暖光', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11886', '13839666090', '###73b13b8b4d767f6c3c2953f123d1a721', '¨D调的华丽〃', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11885', '13839666089', '###73b13b8b4d767f6c3c2953f123d1a721', '快乐丶在明天', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11884', '13839666088', '###73b13b8b4d767f6c3c2953f123d1a721', '一朵气质花°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11883', '13839666087', '###73b13b8b4d767f6c3c2953f123d1a721', '人醉梦未碎', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11882', '13839666086', '###73b13b8b4d767f6c3c2953f123d1a721', '台北的机场。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11881', '13839666085', '###73b13b8b4d767f6c3c2953f123d1a721', '『我是我的情人』°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11880', '13839666084', '###73b13b8b4d767f6c3c2953f123d1a721', '情意如海浪', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11879', '13839666083', '###73b13b8b4d767f6c3c2953f123d1a721', '心灵的代言人', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11878', '13839666082', '###73b13b8b4d767f6c3c2953f123d1a721', '不要见不要贱', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11877', '13839666081', '###73b13b8b4d767f6c3c2953f123d1a721', '短命女', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11876', '13839666080', '###73b13b8b4d767f6c3c2953f123d1a721', '北海追梦', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11875', '13839666079', '###73b13b8b4d767f6c3c2953f123d1a721', '伶仃', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11874', '13839666078', '###73b13b8b4d767f6c3c2953f123d1a721', '初音未来', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11873', '13839666077', '###73b13b8b4d767f6c3c2953f123d1a721', '冰落風嘯', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11872', '13839666076', '###73b13b8b4d767f6c3c2953f123d1a721', '三五七年', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11871', '13839666075', '###73b13b8b4d767f6c3c2953f123d1a721', '黑桃皇牌', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11870', '13839666074', '###73b13b8b4d767f6c3c2953f123d1a721', '不倾城不明媚°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11869', '13839666073', '###73b13b8b4d767f6c3c2953f123d1a721', '嚴禁傷害涐', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11868', '13839666072', '###73b13b8b4d767f6c3c2953f123d1a721', '背叛自己的心', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11867', '13839666071', '###73b13b8b4d767f6c3c2953f123d1a721', '霸海断长空', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11866', '13839666070', '###73b13b8b4d767f6c3c2953f123d1a721', '新事新人新心*', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11865', '13839666069', '###73b13b8b4d767f6c3c2953f123d1a721', '一舞驚鴻', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11864', '13839666068', '###73b13b8b4d767f6c3c2953f123d1a721', '奈河桥等你', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11863', '13839666067', '###73b13b8b4d767f6c3c2953f123d1a721', '嫩HEI炮@!', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11862', '13839666066', '###73b13b8b4d767f6c3c2953f123d1a721', '此生不离不弃', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11861', '13839666065', '###73b13b8b4d767f6c3c2953f123d1a721', '最后让自己属于我自己', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11860', '13839666064', '###73b13b8b4d767f6c3c2953f123d1a721', '不必谁懂我', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11859', '13839666063', '###73b13b8b4d767f6c3c2953f123d1a721', '暮色伊人', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11858', '13839666062', '###73b13b8b4d767f6c3c2953f123d1a721', '星光斑斓里遍寻', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11857', '13839666061', '###73b13b8b4d767f6c3c2953f123d1a721', '找个天使替我爱你。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11856', '13839666060', '###73b13b8b4d767f6c3c2953f123d1a721', '太坚强是软弱', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11855', '13839666059', '###73b13b8b4d767f6c3c2953f123d1a721', '褐色眼眸', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11854', '13839666058', '###73b13b8b4d767f6c3c2953f123d1a721', '-夲亼光锟', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11853', '13839666057', '###73b13b8b4d767f6c3c2953f123d1a721', '梦如南筏〞', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11852', '13839666056', '###73b13b8b4d767f6c3c2953f123d1a721', '凉纪之城', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11851', '13839666055', '###73b13b8b4d767f6c3c2953f123d1a721', '潜规则°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11850', '13839666054', '###73b13b8b4d767f6c3c2953f123d1a721', '没爱没恨-', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11849', '13839666053', '###73b13b8b4d767f6c3c2953f123d1a721', '完了丶然后', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11848', '13839666052', '###73b13b8b4d767f6c3c2953f123d1a721', '半夜成仙', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11847', '13839666051', '###73b13b8b4d767f6c3c2953f123d1a721', '物以类聚,‘', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11846', '13839666050', '###73b13b8b4d767f6c3c2953f123d1a721', '好多鱼好多鱼好剩余°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11845', '13839666049', '###73b13b8b4d767f6c3c2953f123d1a721', '无所谓的结局', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11844', '13839666048', '###73b13b8b4d767f6c3c2953f123d1a721', 'mo_虚冇', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11843', '13839666047', '###73b13b8b4d767f6c3c2953f123d1a721', '独立于世', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11842', '13839666046', '###73b13b8b4d767f6c3c2953f123d1a721', '心底青苔', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11841', '13839666045', '###73b13b8b4d767f6c3c2953f123d1a721', '白龙吟', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11840', '13839666044', '###73b13b8b4d767f6c3c2953f123d1a721', '笑话太过', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11839', '13839666043', '###73b13b8b4d767f6c3c2953f123d1a721', '余生梦断', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11838', '13839666042', '###73b13b8b4d767f6c3c2953f123d1a721', '路还长别猖狂', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11837', '13839666041', '###73b13b8b4d767f6c3c2953f123d1a721', '坚强的爱恋', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11836', '13839666040', '###73b13b8b4d767f6c3c2953f123d1a721', '半透明nocolor°', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11835', '13839666039', '###73b13b8b4d767f6c3c2953f123d1a721', '疾风魔影', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11834', '13839666038', '###73b13b8b4d767f6c3c2953f123d1a721', '感谢经历。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11833', '13839666037', '###73b13b8b4d767f6c3c2953f123d1a721', '清高不是傲■', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11832', '13839666036', '###73b13b8b4d767f6c3c2953f123d1a721', '陪伴是最长情的告白', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11831', '13839666035', '###73b13b8b4d767f6c3c2953f123d1a721', '萝莉女宝宝', '', null, null, null, '', '', '', '', 'public/images/wechat_image_20200108204246.jpg', 'public/images/wechat_image_20200108204246.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '19c6547592e2cb028d8b4e52b4d2a9d7', '1582963112', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11830', '13839666034', '###73b13b8b4d767f6c3c2953f123d1a721', '嘻嘻哈哈一生肉', '', null, null, null, '', '', '', '', 'public/images/WechatIMG241.jpeg', 'public/images/WechatIMG241.jpeg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '55740f715267e2e7c77765599d20c5b9', '1582963088', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11829', '13839666033', '###73b13b8b4d767f6c3c2953f123d1a721', '吉他大师付', '', null, null, null, '', '', '', '', 'public/images/WechatIMG2.jpeg', 'public/images/WechatIMG2.jpeg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '67898a21059ed944ad5124b08fbff193', '1582963055', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11828', '13839666032', '###73b13b8b4d767f6c3c2953f123d1a721', '萨克斯专业地主', '', null, null, null, '', '', '', '', 'public/images/WechatIMG1.jpeg', 'public/images/WechatIMG1.jpeg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '5c422dc70546f06562548105b9352ebd', '1582963007', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11827', '13839666031', '###73b13b8b4d767f6c3c2953f123d1a721', '懂我的没有，阴我的不少', '', null, null, null, '', '', '', '', 'public/images/yun_photo01.jpg', 'public/images/yun_photo01.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '310a93a22f848dd1af693978f5f577ed', '1582962119', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11826', '13839666030', '###73b13b8b4d767f6c3c2953f123d1a721', 'yυё鱫越吵架﹏', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11825', '13839666029', '###73b13b8b4d767f6c3c2953f123d1a721', '喓浭喓姒氺溫柔', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11824', '13839666028', '###73b13b8b4d767f6c3c2953f123d1a721', '女人本该霸气', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11823', '13839666027', '###73b13b8b4d767f6c3c2953f123d1a721', '椰茸兔包儿', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11822', '13839666026', '###73b13b8b4d767f6c3c2953f123d1a721', '▁仅存依靠', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11821', '13839666025', '###73b13b8b4d767f6c3c2953f123d1a721', '我在天涯你在海角', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11820', '13839666024', '###73b13b8b4d767f6c3c2953f123d1a721', '深度孤独患者', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11819', '13839666023', '###73b13b8b4d767f6c3c2953f123d1a721', '漃寞煙錇謌', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11818', '13839666022', '###73b13b8b4d767f6c3c2953f123d1a721', '别格式化', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11817', '13839666021', '###73b13b8b4d767f6c3c2953f123d1a721', '姐', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11816', '13839666020', '###73b13b8b4d767f6c3c2953f123d1a721', '大哥大@', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11815', '13839666019', '###73b13b8b4d767f6c3c2953f123d1a721', '多啦呮諟個夢', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11814', '13839666018', '###73b13b8b4d767f6c3c2953f123d1a721', '莫再执迷不悟。', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11813', '13839666017', '###73b13b8b4d767f6c3c2953f123d1a721', '名钻', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11812', '13839666016', '###73b13b8b4d767f6c3c2953f123d1a721', '主音King', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11811', '13839666015', '###73b13b8b4d767f6c3c2953f123d1a721', '第三种爱情', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11810', '13839666014', '###73b13b8b4d767f6c3c2953f123d1a721', '亲，我没跑', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11809', '13839666013', '###73b13b8b4d767f6c3c2953f123d1a721', '自然而然', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11807', '13839666011', '###73b13b8b4d767f6c3c2953f123d1a721', '柠檬味的鱼', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11808', '13839666012', '###73b13b8b4d767f6c3c2953f123d1a721', '没有范儿', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11806', '13839666010', '###73b13b8b4d767f6c3c2953f123d1a721', '曾有↘几人', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '192.168.88.101', '2019-07-30 15:34:10', '2016-03-07 08:47:52', '', '1', '0', '2', '10', '', '947c2cf7cba54735b3f4146caca935eb', '1590392050', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '1', '1564502400', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11805', '13839666009', '###73b13b8b4d767f6c3c2953f123d1a721', '同餐伴枕', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '192.168.88.101', '2019-07-30 15:34:04', '2016-03-07 08:47:52', '', '1', '0', '2', '43', '', 'a1415b79aa95d36437909611c5f5689e', '1590392044', '', '2', '2', '2', '', '郑州市', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '3', '1556985600', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11804', '13839666008', '###73b13b8b4d767f6c3c2953f123d1a721', '我爲什麽要愛你ξ', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'e22a0af996a22193aac11b0fa2f796a3', '1607570866', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11803', '13839666007', '###73b13b8b4d767f6c3c2953f123d1a721', '説减肥呮諟吓吓肉', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'e4c5077adab3f8dc1770572f31fc4b59', '1607570164', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11802', '13839666006', '###73b13b8b4d767f6c3c2953f123d1a721', '时光あ瘦了~', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', 'bf024acb63c20423bafbab75d25d2097', '1607571043', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11801', '13839666005', '###73b13b8b4d767f6c3c2953f123d1a721', '妖媚＠', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '05314d6e60d385748231aa615f35f2b6', '1607571220', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11800', '13839666004', '###73b13b8b4d767f6c3c2953f123d1a721', '等尽歌悲欢', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11798', '13839666002', '###73b13b8b4d767f6c3c2953f123d1a721', '褪了色旳回憶', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '192.168.88.101', '2019-08-01 11:37:44', '2016-03-07 08:47:52', '', '1', '0', '2', '45', '', '417256585330d7fd64b3442397a516e8', '1590550664', '', '0', '0', '0', '', '好像在火星', '0', '', 'phone', '0', '0', '0', '0', '0', '0', '3', '1564675200', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11799', '13839666003', '###73b13b8b4d767f6c3c2953f123d1a721', '为爱控', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '192.168.88.101', '2019-07-30 15:26:25', '2016-03-07 08:47:52', '', '1', '0', '2', '10', '', '96c8514cd08f2f7abede904d3b2baf94', '1590391585', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '0', '0', '1', '1564502400', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11797', '13839666001', '###73b13b8b4d767f6c3c2953f123d1a721', 'BBBBB', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '192.168.88.101', '2019-08-02 10:09:41', '2016-03-07 08:47:52', '', '1', '0', '2', '10', '', 'f8ffcf9b7599f82f1dc4b881d377b645', '1590631781', '', '0', '0', '0', '', '郑州市', '0', '', 'phone', '0', '0', '0', '0', '0', '0', '1', '1564761600', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11963', '13839666167', '###73b13b8b4d767f6c3c2953f123d1a721', '叛逆不是本能', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '', '0', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11964', '13839666168', '###73b13b8b4d767f6c3c2953f123d1a721', 'Minor昔年', '', null, null, null, '', '', '', '', '/public/images/default.jpg', '/public/images/default_thumb.jpg', '2', '', '', '', null, '2016-03-07 08:47:52', '', '1', '0', '2', '0', '', '9206367eceb6c382c49e40735e95e7f4', '1582380882', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11980', '13839666000', '###6c038ff1d5df721a56d42bdbf033baec', 'WEB用户6000', '', null, null, null, '', '', '', '', '/default.jpg', '/default.jpg', '2', '', '这家伙很懒，什么都没留下', '192.168.88.102', '2019-08-27 15:57:35', '2019-08-27 15:57:35', '', '1', '0', '2', '0', '13839666000', '6282e7f03eeec6deed9d6c7e0243a381', '1592812655', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '这家伙很懒，什么都没留下', '');
INSERT INTO `cmf_users` VALUES ('11981', 'chenjinyu', '###d5728a08367df53dff48757bd45cfa8a', 'WEB用户inyu', '', null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '111.198.244.61', '2019-12-06 19:54:07', '2019-12-06 19:54:07', '', '1', '0', '2', '0', 'chenjinyu', '51ee37f307bd2226c181f7d251d451df', '1601553247', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', 'e', 'e');
INSERT INTO `cmf_users` VALUES ('11982', '123', '###611d2bbe0bfdd3338700431bb633b4da', 'WEB用户123', '', null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '223.72.71.185', '2019-12-31 11:43:28', '2019-12-31 11:43:28', '', '1', '0', '2', '0', '123', '5d84e74f18050c809ce6becbba3ce258', '1603683808', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11983', '二牛是我哥', '###651fb0e39e00ebc15e2eda1c13a21656', 'WEB用户', '', null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '114.248.156.143', '2019-12-31 13:19:01', '2019-12-31 13:19:01', '', '1', '0', '2', '0', '二牛是我哥', '56ad45069a3c44085f5c209c85462c87', '1603689541', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11984', '18830455151', '###4106af86e5726dfcbe0fb1b2e32f7ae0', 'WEB用户5151', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '36.48.47.72', '2020-01-08 21:06:19', '2020-01-08 21:06:19', '', '1', '0', '2', '0', '18830455151', 'ef90c91803ad4e56f4830ab7953b85a7', '1604408779', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11985', 'ken', '###84ba645ad9494266a817e08547e44a46', 'WEB用户ken', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '222.173.28.150', '2020-05-27 11:28:46', '2020-05-27 11:28:46', '', '1', '0', '2', '0', 'ken', 'e1f42dabb2a81e398daf4dc86de06036', '1616470126', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11986', 'tjqatscu', '###8012c3a565a5711646be5d28da94c331', 'WEB用户tscu', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '101.71.253.106', '2020-05-28 11:37:59', '2020-05-28 11:37:59', '', '1', '0', '2', '0', 'tjqatscu', 'aec44cf6799ca7bb35d54d4064a606da', '1616557079', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11987', '李云飞', '###37d2da860a62d66c3a439e3dc115ac78', 'WEB用户', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '120.244.172.153', '2020-05-30 13:54:04', '2020-05-30 13:54:04', '', '1', '0', '2', '0', '李云飞', '6447ad723eeb3533f22c16014f6aaa93', '1616738044', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11988', 'czq7115', '###37697893f7f35097e632305a5565ab84', 'WEB用户7115', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '114.248.10.6', '2020-06-09 20:49:26', '2020-06-09 20:49:26', '', '1', '0', '2', '0', 'czq7115', 'b99376d5e4dfa7fe00da5524281adb84', '1617626966', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11989', 'xindong22', '###b755bd414be96142e467cc32e48f2b10', 'WEB用户ng22', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '221.13.219.175', '2020-06-10 14:05:12', '2020-06-10 14:05:12', '', '1', '0', '2', '0', 'xindong22', 'b56eedca35e8894efb61b3149cf8207f', '1617689112', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');
INSERT INTO `cmf_users` VALUES ('11990', 'ChillPeach ', '###0b907c2c2ba7cb6edc5edbccb4ae46ee', 'WEB用户ach ', null, null, null, null, '', '', '', '', '/default.jpg', '/default_thumb.jpg', '2', '', '这家伙很懒，什么都没留下', '112.0.182.95', '2020-06-19 16:36:12', '2020-06-19 16:36:12', '', '1', '0', '2', '0', 'ChillPeach ', '93d33d80f44532cfe1ddaff2845c638c', '1618475772', '', '0', '0', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '', '');

-- ----------------------------
-- Table structure for cmf_users_agent
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_agent`;
CREATE TABLE `cmf_users_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `one_uid` int(11) NOT NULL DEFAULT '0' COMMENT '上级用户id',
  `two_uid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级id',
  `three_uid` int(11) NOT NULL DEFAULT '0' COMMENT '上上上级id',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_agent
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_agent_profit
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_agent_profit`;
CREATE TABLE `cmf_users_agent_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `one_profit` decimal(65,2) DEFAULT '0.00' COMMENT '一级收益',
  `two_profit` decimal(65,2) DEFAULT '0.00' COMMENT '二级收益',
  `three_profit` decimal(65,2) DEFAULT '0.00' COMMENT '三级收益',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_agent_profit
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_agent_profit_recode
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_agent_profit_recode`;
CREATE TABLE `cmf_users_agent_profit_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `total` int(11) DEFAULT '0' COMMENT '消费总数',
  `one_uid` int(11) DEFAULT '0',
  `two_uid` int(11) DEFAULT '0',
  `three_uid` int(11) DEFAULT '0',
  `one_profit` decimal(65,2) DEFAULT '0.00' COMMENT '一级代理收益',
  `two_profit` decimal(65,2) DEFAULT '0.00' COMMENT '二级代理收益',
  `three_profit` decimal(65,2) DEFAULT '0.00' COMMENT '三级代理收益',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_agent_profit_recode
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_attention
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_attention`;
CREATE TABLE `cmf_users_attention` (
  `uid` int(12) NOT NULL,
  `touid` int(12) NOT NULL,
  KEY `uid_touid_index` (`uid`,`touid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_attention
-- ----------------------------
INSERT INTO `cmf_users_attention` VALUES ('11335', '11331');
INSERT INTO `cmf_users_attention` VALUES ('11335', '11363');
INSERT INTO `cmf_users_attention` VALUES ('11337', '11363');
INSERT INTO `cmf_users_attention` VALUES ('11339', '11326');
INSERT INTO `cmf_users_attention` VALUES ('11358', '11363');
INSERT INTO `cmf_users_attention` VALUES ('11361', '11337');
INSERT INTO `cmf_users_attention` VALUES ('11363', '11335');
INSERT INTO `cmf_users_attention` VALUES ('11363', '11361');
INSERT INTO `cmf_users_attention` VALUES ('11367', '11361');
INSERT INTO `cmf_users_attention` VALUES ('11367', '11364');
INSERT INTO `cmf_users_attention` VALUES ('11367', '11369');
INSERT INTO `cmf_users_attention` VALUES ('11367', '11374');
INSERT INTO `cmf_users_attention` VALUES ('11369', '11361');
INSERT INTO `cmf_users_attention` VALUES ('11369', '11364');
INSERT INTO `cmf_users_attention` VALUES ('11369', '11367');
INSERT INTO `cmf_users_attention` VALUES ('11369', '11374');
INSERT INTO `cmf_users_attention` VALUES ('11374', '11361');
INSERT INTO `cmf_users_attention` VALUES ('11374', '11369');
INSERT INTO `cmf_users_attention` VALUES ('11377', '11358');
INSERT INTO `cmf_users_attention` VALUES ('11385', '11408');
INSERT INTO `cmf_users_attention` VALUES ('11385', '11409');
INSERT INTO `cmf_users_attention` VALUES ('11385', '11412');
INSERT INTO `cmf_users_attention` VALUES ('11385', '11419');
INSERT INTO `cmf_users_attention` VALUES ('11403', '11405');
INSERT INTO `cmf_users_attention` VALUES ('11405', '11403');
INSERT INTO `cmf_users_attention` VALUES ('11406', '11407');
INSERT INTO `cmf_users_attention` VALUES ('11407', '11406');
INSERT INTO `cmf_users_attention` VALUES ('11457', '11456');
INSERT INTO `cmf_users_attention` VALUES ('11984', '11828');
INSERT INTO `cmf_users_attention` VALUES ('11990', '11893');

-- ----------------------------
-- Table structure for cmf_users_auth
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_auth`;
CREATE TABLE `cmf_users_auth` (
  `uid` int(11) unsigned NOT NULL,
  `real_name` varchar(50) DEFAULT '',
  `mobile` varchar(50) DEFAULT '',
  `accounttype` varchar(50) NOT NULL DEFAULT '',
  `alipay` varchar(255) DEFAULT '',
  `card_no` varchar(50) DEFAULT '',
  `bank_name` varchar(50) DEFAULT '',
  `accounts_province` varchar(20) DEFAULT '',
  `accounts_city` varchar(20) DEFAULT '',
  `sub_branch` varchar(100) DEFAULT '',
  `cer_type` varchar(50) DEFAULT '',
  `cer_no` varchar(50) DEFAULT '',
  `front_view` varchar(255) DEFAULT '',
  `back_view` varchar(255) DEFAULT '',
  `handset_view` varchar(255) DEFAULT '',
  `reason` text,
  `addtime` int(12) DEFAULT '0',
  `uptime` int(12) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11832 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_auth
-- ----------------------------
INSERT INTO `cmf_users_auth` VALUES ('11893', '何伟林', '13839666097', '', '', '5332256000032521452', '中国银行', '北京', '北京', '西城支行', '身份证', '130983199505235316', '', '', '', '', '1590463674', '1590463713', '1');
INSERT INTO `cmf_users_auth` VALUES ('11894', '邱春宇', '13839666098', '', '', '1254651265156423659', '中国银行', '广东', '云浮市', '蛸行支行', '身份证', '230103198610292818', '', '', '', '', '1590474522', '1590474530', '1');
INSERT INTO `cmf_users_auth` VALUES ('11895', '雪延松', '13839666099', '', '', '4569415621564126539', '中国银行', '甘肃', '陇南市', '北方支行', '身份证', '610327199903270054', '', '', '', '', '1590474602', '1590474618', '1');
INSERT INTO `cmf_users_auth` VALUES ('11896', ' 周家伟', '13564162169', '', '', '5985641562312356941', '北京银行', '北京', '北京', '菜户营', '身份证', '230106199212231212', '', '', '', '', '1590474688', '1590474701', '1');

-- ----------------------------
-- Table structure for cmf_users_black
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_black`;
CREATE TABLE `cmf_users_black` (
  `uid` int(12) DEFAULT '0',
  `touid` int(12) DEFAULT '0',
  KEY `uid_touid_index` (`uid`,`touid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_black
-- ----------------------------
INSERT INTO `cmf_users_black` VALUES ('11797', '11830');

-- ----------------------------
-- Table structure for cmf_users_car
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_car`;
CREATE TABLE `cmf_users_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `carid` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_car
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_cashrecord
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_cashrecord`;
CREATE TABLE `cmf_users_cashrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `money` int(20) DEFAULT '0',
  `votes` int(20) DEFAULT '0',
  `orderno` varchar(50) DEFAULT '',
  `trade_no` varchar(100) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  `uptime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_cashrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_charge
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_charge`;
CREATE TABLE `cmf_users_charge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `touid` int(11) DEFAULT NULL,
  `money` decimal(11,2) DEFAULT '0.00',
  `coin` int(11) DEFAULT '0',
  `coin_give` int(11) DEFAULT '0',
  `orderno` varchar(50) DEFAULT '',
  `trade_no` varchar(100) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_charge
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_charge_admin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_charge_admin`;
CREATE TABLE `cmf_users_charge_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `touid` int(11) DEFAULT '0',
  `coin` int(20) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `admin` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_charge_admin
-- ----------------------------
INSERT INTO `cmf_users_charge_admin` VALUES ('1', '11457', '9999999', '1556329871', 'admin', '192.168.88.220');
INSERT INTO `cmf_users_charge_admin` VALUES ('2', '11456', '999999', '1556330621', 'admin', '192.168.88.220');

-- ----------------------------
-- Table structure for cmf_users_coinrecord
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_coinrecord`;
CREATE TABLE `cmf_users_coinrecord` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT '',
  `action` varchar(20) DEFAULT '',
  `uid` int(20) DEFAULT '0',
  `touid` int(20) DEFAULT '0',
  `giftid` int(20) DEFAULT '0',
  `giftcount` int(20) DEFAULT '0',
  `totalcoin` int(20) DEFAULT '0',
  `showid` int(12) DEFAULT '0',
  `addtime` int(12) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_coinrecord
-- ----------------------------
INSERT INTO `cmf_users_coinrecord` VALUES ('1', 'expend', 'sendgift', '11457', '11456', '45', '1', '28', '1556329513', '1556329886');
INSERT INTO `cmf_users_coinrecord` VALUES ('2', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556329892');
INSERT INTO `cmf_users_coinrecord` VALUES ('3', 'expend', 'sendgift', '11457', '11456', '19', '1', '3000', '1556329513', '1556329910');
INSERT INTO `cmf_users_coinrecord` VALUES ('4', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556329916');
INSERT INTO `cmf_users_coinrecord` VALUES ('5', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556329922');
INSERT INTO `cmf_users_coinrecord` VALUES ('6', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556329941');
INSERT INTO `cmf_users_coinrecord` VALUES ('7', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556329962');
INSERT INTO `cmf_users_coinrecord` VALUES ('8', 'expend', 'sendgift', '11457', '11456', '45', '1', '28', '1556329513', '1556329965');
INSERT INTO `cmf_users_coinrecord` VALUES ('9', 'expend', 'sendgift', '11456', '11457', '45', '1', '28', '1556330353', '1556330641');
INSERT INTO `cmf_users_coinrecord` VALUES ('10', 'expend', 'sendgift', '11456', '11457', '45', '1', '28', '1556330353', '1556330648');
INSERT INTO `cmf_users_coinrecord` VALUES ('11', 'expend', 'sendgift', '11456', '11457', '45', '1', '28', '1556330673', '1556330700');
INSERT INTO `cmf_users_coinrecord` VALUES ('12', 'expend', 'sendgift', '11456', '11457', '46', '1', '2', '1556330673', '1556330706');
INSERT INTO `cmf_users_coinrecord` VALUES ('13', 'expend', 'sendgift', '11456', '11457', '46', '1', '2', '1556330673', '1556330706');
INSERT INTO `cmf_users_coinrecord` VALUES ('14', 'expend', 'sendgift', '11456', '11457', '46', '1', '2', '1556330673', '1556330707');
INSERT INTO `cmf_users_coinrecord` VALUES ('15', 'expend', 'sendgift', '11456', '11457', '46', '1', '2', '1556330673', '1556330707');
INSERT INTO `cmf_users_coinrecord` VALUES ('16', 'income', 'loginbonus', '11457', '11457', '1', '0', '10', '0', '1556347734');
INSERT INTO `cmf_users_coinrecord` VALUES ('17', 'expend', 'sendgift', '11457', '11456', '46', '1', '2', '1556329513', '1556348255');
INSERT INTO `cmf_users_coinrecord` VALUES ('18', 'income', 'loginbonus', '11456', '11456', '1', '0', '10', '0', '1556353517');
INSERT INTO `cmf_users_coinrecord` VALUES ('19', 'expend', 'sendgift', '11456', '11457', '46', '1', '2', '1556360617', '1556363445');
INSERT INTO `cmf_users_coinrecord` VALUES ('20', 'income', 'loginbonus', '11456', '11456', '2', '0', '15', '0', '1556421055');
INSERT INTO `cmf_users_coinrecord` VALUES ('21', 'income', 'loginbonus', '11805', '11805', '1', '0', '10', '0', '1556803389');
INSERT INTO `cmf_users_coinrecord` VALUES ('22', 'income', 'loginbonus', '11805', '11805', '2', '0', '15', '0', '1556841883');
INSERT INTO `cmf_users_coinrecord` VALUES ('23', 'expend', 'sendgift', '11805', '11805', '46', '1', '2', '1556843580', '1556843683');
INSERT INTO `cmf_users_coinrecord` VALUES ('24', 'income', 'loginbonus', '11805', '11805', '3', '0', '20', '0', '1556937427');
INSERT INTO `cmf_users_coinrecord` VALUES ('25', 'income', 'loginbonus', '11798', '11798', '1', '0', '10', '0', '1564467859');
INSERT INTO `cmf_users_coinrecord` VALUES ('26', 'income', 'loginbonus', '11799', '11799', '1', '0', '10', '0', '1564471586');
INSERT INTO `cmf_users_coinrecord` VALUES ('27', 'income', 'loginbonus', '11806', '11806', '1', '0', '10', '0', '1564472062');
INSERT INTO `cmf_users_coinrecord` VALUES ('28', 'income', 'loginbonus', '11798', '11798', '2', '0', '15', '0', '1564554644');
INSERT INTO `cmf_users_coinrecord` VALUES ('29', 'income', 'loginbonus', '11798', '11798', '3', '0', '20', '0', '1564627080');
INSERT INTO `cmf_users_coinrecord` VALUES ('30', 'income', 'loginbonus', '11797', '11797', '1', '0', '10', '0', '1564711409');

-- ----------------------------
-- Table structure for cmf_users_exchange
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_exchange`;
CREATE TABLE `cmf_users_exchange` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(12) DEFAULT NULL,
  `votes` int(20) DEFAULT '0',
  `coin` int(20) DEFAULT '0',
  `addtime` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_family
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_family`;
CREATE TABLE `cmf_users_family` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `familyid` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT '',
  `state` tinyint(1) DEFAULT '0',
  `signout` tinyint(1) DEFAULT '0',
  `istip` tinyint(1) DEFAULT '0' COMMENT '审核后是否需要通知',
  `signout_reason` varchar(255) DEFAULT '' COMMENT '踢出或拒绝理由',
  `signout_istip` tinyint(4) DEFAULT '0' COMMENT '踢出或拒绝是否需要通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_family
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_incomes
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_incomes`;
CREATE TABLE `cmf_users_incomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `total_income` decimal(12,2) DEFAULT '0.00' COMMENT '总收益',
  `settled` decimal(12,2) DEFAULT '0.00' COMMENT '已结算',
  `unsettled` decimal(12,2) DEFAULT '0.00' COMMENT '未结算',
  `last_settle_time` int(12) DEFAULT '0' COMMENT '最新结算时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_incomes
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_income_lists
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_income_lists`;
CREATE TABLE `cmf_users_income_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(12) DEFAULT '0' COMMENT '代理或渠道ID',
  `senduid` int(12) DEFAULT '0' COMMENT '普通用户ID',
  `senduser` varchar(200) DEFAULT NULL COMMENT '充值用户登录名',
  `percent` int(12) DEFAULT '0' COMMENT '分成比例',
  `type` tinyint(1) DEFAULT '0' COMMENT '收益方式 1表示充值',
  `charge_money` decimal(11,2) DEFAULT '0.00' COMMENT '充值金额',
  `money` decimal(11,2) DEFAULT '0.00' COMMENT '收益金额',
  `addtime` int(12) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_income_lists
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_live
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_live`;
CREATE TABLE `cmf_users_live` (
  `uid` int(20) unsigned NOT NULL DEFAULT '0',
  `user_nicename` varchar(50) DEFAULT '',
  `avatar` varchar(255) DEFAULT '',
  `avatar_thumb` varchar(255) DEFAULT '',
  `showid` int(12) NOT NULL DEFAULT '0',
  `islive` int(1) DEFAULT '0',
  `starttime` int(12) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `province` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `stream` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `pull` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '0',
  `lat` varchar(255) DEFAULT '0',
  `topicid` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '6为私播（计时收费）',
  `type_val` varchar(255) DEFAULT '',
  `isvideo` tinyint(1) DEFAULT '0',
  `wy_cid` varchar(255) DEFAULT NULL COMMENT '网易房间ID(当不使用网易是默认为空)',
  `goodnum` varchar(255) DEFAULT '0' COMMENT '靓号',
  `is_communicating` tinyint(4) DEFAULT '0' COMMENT '1为连麦中',
  PRIMARY KEY (`uid`),
  KEY `index_islive_starttime` (`islive`,`starttime`) USING BTREE,
  KEY `index_uid_stream` (`uid`,`stream`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_live
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_livemanager
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_livemanager`;
CREATE TABLE `cmf_users_livemanager` (
  `uid` int(12) DEFAULT '0',
  `liveuid` int(12) DEFAULT '0',
  KEY `uid_touid_index` (`liveuid`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_livemanager
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_liverecord
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_liverecord`;
CREATE TABLE `cmf_users_liverecord` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `showid` int(11) NOT NULL DEFAULT '0',
  `nums` int(11) DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `province` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `stream` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '0',
  `lat` varchar(255) DEFAULT '0',
  `topicid` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `type_val` varchar(255) DEFAULT '',
  `votes` varchar(255) DEFAULT '0' COMMENT '本次直播收益',
  `time` varchar(255) DEFAULT '' COMMENT '格式时间',
  PRIMARY KEY (`id`),
  KEY `index_uid_start` (`uid`,`starttime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_liverecord
-- ----------------------------
INSERT INTO `cmf_users_liverecord` VALUES ('1', '11805', '1556843580', '1', '1556843580', '1556843691', 'aaa', '河南省', '郑州市', '11805_1556843580', '', '113.894007', '34.737679', '0', '0', '', '2', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('2', '11805', '1556872193', '0', '1556872193', '1556872216', '123', '河南省', '郑州市', '11805_1556872193', '', '113.893945', '34.73776', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('3', '11805', '1556872230', '0', '1556872230', '1556872257', '123', '河南省', '郑州市', '11805_1556872230', '', '113.893945', '34.73776', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('4', '11805', '1556872374', '0', '1556872374', '1556872648', '', '河南省', '郑州市', '11805_1556872374', '', '113.893945', '34.73776', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('5', '11797', '1556763483', '0', '1556763483', '1556872798', '123', '', '好像在火星', '11797_1556763483', '', '', '', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('6', '11805', '1556872960', '0', '1556872960', '1556873042', 'abc', '河南省', '郑州市', '11805_1556872960', '', '113.893945', '34.73776', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('7', '11805', '1556884157', '0', '1556884157', '1556884181', '123', '河南省', '郑州市', '11805_1556884157', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('8', '11805', '1556886950', '1', '1556886950', '1556886978', 'aaa', '河南省', '郑州市', '11805_1556886950', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('9', '11805', '1556886989', '1', '1556886989', '1556887036', 'ccc', '河南省', '郑州市', '11805_1556886989', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('10', '11805', '1556887053', '1', '1556887053', '1556887079', 'ccc', '河南省', '郑州市', '11805_1556887053', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('11', '11805', '1556887113', '1', '1556887113', '1556887367', 'aaa', '河南省', '郑州市', '11805_1556887113', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('12', '11805', '1556887390', '1', '1556887390', '1556887413', 'aaaa', '河南省', '郑州市', '11805_1556887390', '', '113.894168', '34.737696', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('13', '11797', '1556887440', '0', '1556887440', '1556887475', 'lll', '', '好像在火星', '11797_1556887440', '', '', '', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('14', '11797', '1556887495', '0', '1556887495', '1556887631', '', '', '好像在火星', '11797_1556887495', '', '', '', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('15', '11805', '1556887655', '0', '1556887655', '1556887680', 'aaa', '河南省', '郑州市', '11805_1556887655', '', '113.893913', '34.737771', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('16', '11805', '1556887688', '0', '1556887688', '1556887719', 'aaa', '河南省', '郑州市', '11805_1556887688', '', '113.893913', '34.737771', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('17', '11805', '1556887738', '0', '1556887738', '1556887761', '123456', '河南省', '郑州市', '11805_1556887738', '', '113.893913', '34.737771', '0', '0', '', '0', '2019-05-03');
INSERT INTO `cmf_users_liverecord` VALUES ('18', '11805', '1556942322', '1', '1556942322', '1556942954', 'abc', '河南省', '郑州市', '11805_1556942322', '', '113.894195', '34.737593', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('19', '11805', '1556942974', '1', '1556942974', '1556943002', 'aaa', '河南省', '郑州市', '11805_1556942974', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('20', '11805', '1556945097', '0', '1556945097', '1556945110', 'ccc', '河南省', '郑州市', '11805_1556945097', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('21', '11805', '1556945310', '0', '1556945310', '1556945406', 'aaa', '河南省', '郑州市', '11805_1556945310', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('22', '11805', '1556945487', '0', '1556945487', '1556945499', 'xxx', '河南省', '郑州市', '11805_1556945487', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('23', '11805', '1556945633', '1', '1556945633', '1556945814', 'aaa', '河南省', '郑州市', '11805_1556945633', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('24', '11805', '1556945992', '1', '1556945992', '1556946042', '123', '河南省', '郑州市', '11805_1556945992', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('25', '11805', '1556946447', '0', '1556946447', '1556946464', '123', '河南省', '郑州市', '11805_1556946447', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('26', '11805', '1556946603', '1', '1556946603', '1556946693', 'aaa', '河南省', '郑州市', '11805_1556946603', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('27', '11805', '1556947023', '1', '1556947023', '1556947057', 'qwe', '河南省', '郑州市', '11805_1556947023', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('28', '11805', '1556947228', '0', '1556947228', '1556947239', 'aaa', '河南省', '郑州市', '11805_1556947228', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('29', '11805', '1556947384', '0', '1556947384', '1556947714', 'aaa', '河南省', '郑州市', '11805_1556947384', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('30', '11805', '1556947998', '1', '1556947998', '1556948033', 'aaa', '河南省', '郑州市', '11805_1556947998', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('31', '11805', '1556948198', '1', '1556948198', '1556948232', 'aaa', '河南省', '郑州市', '11805_1556948198', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('32', '11805', '1556949939', '1', '1556949939', '1556949967', 'aaa', '河南省', '郑州市', '11805_1556949939', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('33', '11805', '1556950168', '0', '1556950168', '1556950208', 'aaa', '河南省', '郑州市', '11805_1556950168', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('34', '11805', '1556950456', '0', '1556950456', '1556950664', '123', '河南省', '郑州市', '11805_1556950456', '', '113.894195', '34.737593', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('35', '11805', '1556950684', '0', '1556950684', '1556950729', 'aaa', '河南省', '郑州市', '11805_1556950684', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('36', '11805', '1556951136', '0', '1556951136', '1556951158', 'aaa', '', '好像在火星', '11805_1556951136', '', '1', '1', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('37', '11805', '1556951356', '1', '1556951356', '1556951447', 'ccc', '河南省', '郑州市', '11805_1556951356', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('38', '11805', '1556951565', '1', '1556951565', '1556951623', 'lll', '河南省', '郑州市', '11805_1556951565', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('39', '11805', '1556951876', '0', '1556951876', '1556952125', 'ccc', '河南省', '郑州市', '11805_1556951876', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('40', '11805', '1556952337', '0', '1556952337', '1556952351', '1111', '河南省', '郑州市', '11805_1556952337', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('41', '11805', '1556957323', '0', '1556957323', '1556957394', 'aaa', '河南省', '郑州市', '11805_1556957323', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('42', '11805', '1556958089', '0', '1556958089', '1556958379', '是是是', '河南省', '郑州市', '11805_1556958089', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('43', '11805', '1556958388', '0', '1556958388', '1556958443', '111', '河南省', '郑州市', '11805_1556958388', '', '113.894195', '34.737593', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('44', '11805', '1556958840', '0', '1556958840', '1556958860', 'zzz', '河南省', '郑州市', '11805_1556958840', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('45', '11805', '1556959421', '0', '1556959421', '1556959436', 'aaa', '河南省', '郑州市', '11805_1556959421', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('46', '11805', '1556960448', '0', '1556960448', '1556960744', 'aaa', '河南省', '郑州市', '11805_1556960448', '', '113.894195', '34.737593', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('47', '11805', '1556961146', '1', '1556961146', '1556961181', 'aaa', '河南省', '郑州市', '11805_1556961146', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('48', '11805', '1556961838', '0', '1556961838', '1556961853', 'aaaaaaaaa', '河南省', '郑州市', '11805_1556961838', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('49', '11805', '1556962282', '1', '1556962282', '1556962329', '啊啊啊啊', '河南省', '郑州市', '11805_1556962282', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('50', '11805', '1556962996', '1', '1556962996', '1556963018', 'ccc', '河南省', '郑州市', '11805_1556962996', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('51', '11805', '1556963737', '0', '1556963737', '1556963939', 'aaa', '河南省', '郑州市', '11805_1556963737', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('52', '11805', '1556964228', '0', '1556964228', '1556964390', '211', '河南省', '郑州市', '11805_1556964228', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('53', '11805', '1556964403', '0', '1556964403', '1556964558', 'aaa', '河南省', '郑州市', '11805_1556964403', '', '113.894195', '34.737593', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('54', '11805', '1556964588', '0', '1556964588', '1556964659', '123', '河南省', '郑州市', '11805_1556964588', '', '113.894195', '34.737593', '0', '0', '', '0', '2019-05-04');
INSERT INTO `cmf_users_liverecord` VALUES ('55', '11799', '1557027141', '0', '1557027141', '1557042044', '', '', '好像在火星', '11799_1557027141', '', '', '', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('56', '11798', '1557027112', '0', '1557027112', '1557042045', '', '', '好像在火星', '11798_1557027112', '', '', '', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('57', '11797', '1557027021', '0', '1557027021', '1557042047', '', '', '好像在火星', '11797_1557027021', '', '', '', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('58', '11831', '1557052674', '0', '1557052674', '1557055443', '', '', '好像在火星', '11831_1557052674', '', '', '', '0', '0', '', '0', '2019-05-05');
INSERT INTO `cmf_users_liverecord` VALUES ('59', '11831', '1557056772', '0', '1557056772', '1557057414', '', '', '好像在火星', '11831_1557056772', '', '', '', '0', '0', '', '0', '2019-05-05');
INSERT INTO `cmf_users_liverecord` VALUES ('60', '11831', '1557057654', '0', '1557057654', '1557058313', '', '', '好像在火星', '11831_1557057654', '', '', '', '0', '0', '', '0', '2019-05-05');
INSERT INTO `cmf_users_liverecord` VALUES ('61', '11831', '1557058734', '0', '1557058734', '1557058752', '', '', '好像在火星', '11831_1557058734', '', '', '', '0', '0', '', '0', '2019-05-05');
INSERT INTO `cmf_users_liverecord` VALUES ('62', '11827', '1557058850', '0', '1557058850', '1557058862', '', '', '好像在火星', '11827_1557058850', '', '', '', '0', '0', '', '0', '2019-05-05');
INSERT INTO `cmf_users_liverecord` VALUES ('63', '11830', '1564464318', '0', '1564464318', '1564464370', '123', '', '好像在火星', '11830_1564464318', '', '', '', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('64', '11848', '1557042086', '0', '1557042086', '1564464372', '', '', '好像在火星', '11848_1557042086', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('65', '11847', '1557042081', '0', '1557042081', '1564464373', '', '', '好像在火星', '11847_1557042081', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('66', '11846', '1557042076', '0', '1557042076', '1564464373', '', '', '好像在火星', '11846_1557042076', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('67', '11845', '1557042069', '0', '1557042069', '1564464374', '', '', '好像在火星', '11845_1557042069', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('68', '11830', '1564464613', '0', '1564464613', '1564464749', '123', '', '好像在火星', '11830_1564464613', '', '', '', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('69', '11830', '1564467598', '0', '1564467598', '1564467682', '123', '', '好像在火星', '11830_1564467598', '', '', '', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('70', '11798', '1564467910', '0', '1564467910', '1564467955', 'qwe', '河南省', '郑州市', '11798_1564467910', '', '113.753123', '34.728734', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('71', '11798', '1564469255', '1', '1564469255', '1564469457', '123456', '河南省', '郑州市', '11798_1564469255', '', '113.75314', '34.728759', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('72', '11798', '1564469554', '1', '1564469554', '1564469757', '123', '河南省', '郑州市', '11798_1564469554', '', '113.75314', '34.728759', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('73', '11798', '1564473009', '0', '1564473009', '1564473072', 'qqq', '河南省', '郑州市', '11798_1564473009', '', '113.753109', '34.728744', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('74', '11798', '1564473103', '0', '1564473103', '1564473111', 'aaa', '河南省', '郑州市', '11798_1564473103', '', '113.753109', '34.728744', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('75', '11798', '1564473612', '0', '1564473612', '1564473626', 'qqq', '河南省', '郑州市', '11798_1564473612', '', '113.753109', '34.728744', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('76', '11798', '1564476026', '0', '1564476026', '1564476729', '123', '河南省', '郑州市', '11798_1564476026', '', '113.753103', '34.728745', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('77', '11798', '1564476740', '0', '1564476740', '1564476775', 'zzz', '河南省', '郑州市', '11798_1564476740', '', '113.753162', '34.728774', '0', '0', '', '0', '2019-07-30');
INSERT INTO `cmf_users_liverecord` VALUES ('78', '11798', '1564554654', '0', '1564554654', '1564554664', '123', '河南省', '郑州市', '11798_1564554654', '', '113.753175', '34.728787', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('79', '11798', '1564560370', '0', '1564560370', '1564562512', '123', '河南省', '郑州市', '11798_1564560370', '', '113.753175', '34.728787', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('80', '11798', '1564572797', '0', '1564572797', '1564573137', '123456', '河南省', '郑州市', '11798_1564572797', '', '113.894125', '34.737739', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('81', '11798', '1564577384', '0', '1564577384', '1564577407', '123', '', '好像在火星', '11798_1564577384', '', '1', '1', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('82', '11798', '1564577528', '0', '1564577528', '1564577601', '球球', '河南省', '郑州市', '11798_1564577528', '', '113.894146', '34.737731', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('83', '11798', '1564578038', '0', '1564578038', '1564578079', '1', '河南省', '郑州市', '11798_1564578038', '', '113.894089', '34.73774', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('84', '11798', '1564578175', '0', '1564578175', '1564578200', '球球', '河南省', '郑州市', '11798_1564578175', '', '113.894089', '34.73774', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('85', '11798', '1564578276', '1', '1564578276', '1564578461', '111', '河南省', '郑州市', '11798_1564578276', '', '113.894089', '34.73774', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('86', '11798', '1564578579', '1', '1564578579', '1564578683', '111', '河南省', '郑州市', '11798_1564578579', '', '113.894089', '34.73774', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('87', '11798', '1564578817', '1', '1564578817', '1564578853', '123456', '河南省', '郑州市', '11798_1564578817', '', '113.894089', '34.73774', '0', '0', '', '0', '2019-07-31');
INSERT INTO `cmf_users_liverecord` VALUES ('88', '11798', '1564627347', '1', '1564627347', '1564627542', '111', '河南省', '郑州市', '11798_1564627347', '', '113.75317', '34.728781', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('89', '11798', '1564627715', '1', '1564627715', '1564627774', '123456', '河南省', '郑州市', '11798_1564627715', '', '113.75317', '34.728781', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('90', '11798', '1564627948', '1', '1564627948', '1564627989', '1', '河南省', '郑州市', '11798_1564627948', '', '113.75317', '34.728781', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('91', '11798', '1564629084', '1', '1564629084', '1564629148', '123', '河南省', '郑州市', '11798_1564629084', '', '113.75317', '34.728781', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('92', '11798', '1564629855', '1', '1564629855', '1564629910', '111', '河南省', '郑州市', '11798_1564629855', '', '113.753164', '34.728779', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('93', '11798', '1564630141', '1', '1564630141', '1564630163', '111', '河南省', '郑州市', '11798_1564630141', '', '113.753164', '34.728779', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('94', '11798', '1564630437', '1', '1564630437', '1564630468', '1', '河南省', '郑州市', '11798_1564630437', '', '113.753164', '34.728779', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('95', '11798', '1564630680', '1', '1564630680', '1564630704', 'qqq', '', '好像在火星', '11798_1564630680', '', '1', '1', '0', '0', '', '0', '2019-08-01');
INSERT INTO `cmf_users_liverecord` VALUES ('96', '11830', '1557043059', '0', '1557043059', '1564723326', '', '', '好像在火星', '11830', '', '', '', '2', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('97', '11830', '1564725367', '0', '0', '1564725679', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('98', '11830', '1564725687', '0', '0', '1564725824', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('99', '11830', '1564725934', '0', '0', '1564725938', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('100', '11830', '1564726722', '0', '0', '1564726927', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('101', '11830', '1564728834', '0', '0', '1564728864', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('102', '11830', '1564729330', '0', '0', '1564729411', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('103', '11830', '1564730050', '0', '0', '1564730526', '', '', '', '11830', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('104', '11832', '1564730510', '0', '1557043059', '1564730528', '', '', '好像在火星', '11832', '', '', '', '2', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('105', '11829', '1557043059', '0', '1557043059', '1564730535', '', '', '好像在火星', '11829', '', '', '', '2', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('106', '11797', '1564711809', '0', '1564711809', '1564730545', '111', '河南省', '郑州市', '11797_1564711809', '', '113.753148', '34.728766', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('107', '11797', '1564735514', '0', '1564735514', '1564735543', '', '', '好像在火星', '11797_1564735514', '', '', '', '0', '0', '', '0', '2019-08-02');
INSERT INTO `cmf_users_liverecord` VALUES ('108', '11797', '1564735768', '0', '1564735768', '1565573695', '123', '', '好像在火星', '11797_1564735768', '', '', '', '0', '0', '', '0', '2019-08-02');
INSERT INTO `cmf_users_liverecord` VALUES ('109', '11797', '1565866345', '0', '1565866345', '1565866386', '1234', '', '好像在火星', '11797_1565866345', '', '', '', '0', '0', '', '0', '2019-08-15');
INSERT INTO `cmf_users_liverecord` VALUES ('110', '11846', '1565821972', '0', '1565821972', '1572738086', '', '', '好像在火星', '11846_1565821972', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('111', '11845', '1565821967', '0', '1565821967', '1572738087', '', '', '好像在火星', '11845_1565821967', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('112', '11846', '1572739701', '0', '1572739701', '1572740021', '', '', '好像在火星', '11846_1572739701', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('113', '11845', '1572739691', '0', '1572739691', '1572754633', '', '', '好像在火星', '11845_1572739691', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('121', '11827', '1572757917', '0', '1572757917', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('122', '11827', '1572757972', '0', '1572757972', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('123', '11827', '1572757972', '0', '0', '1572757974', '', '', '', '11827', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('124', '11827', '1572757976', '0', '1572757976', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('127', '11827', '1572758192', '0', '1572758192', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('128', '11827', '1572758246', '0', '1572758246', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('129', '11827', '1572758246', '0', '1572758246', '1572758248', '', '', '', '11827', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('130', '11827', '1572758285', '0', '1572758285', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('131', '11827', '1572758285', '0', '1572758285', '1572758294', '', '', '', '11827', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('132', '11827', '1572758324', '0', '1572758324', '0', '', '', '', '', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('134', '11827', '1572758351', '0', '1572758351', '1572758362', '', '', '', '11827', '', '0', '0', '999', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('135', '11827', '1572758552', '0', '1572758552', '1572758556', '', '', '', '11827', '', '0', '0', '999', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('136', '11827', '1572829842', '0', '1572829842', '1572833108', '', '', '', '11827', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('137', '11828', '1572833138', '0', '1572833138', '1572833183', '', '', '', '11828', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('138', '11828', '1572848264', '1', '1572848264', '1572848334', '', '', '', '11828', '', '0', '0', '0', '0', '', '0', '');
INSERT INTO `cmf_users_liverecord` VALUES ('139', '11828', '1572849967', '1', '1572849967', '1572849977', '', '', '', '11828', '', '0', '0', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for cmf_users_report
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_report`;
CREATE TABLE `cmf_users_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `touid` int(11) DEFAULT '0',
  `content` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `uptime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_report
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_settle_lists
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_settle_lists`;
CREATE TABLE `cmf_users_settle_lists` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `settle_money` decimal(12,2) DEFAULT '0.00' COMMENT '结算金额',
  `settle_before_money` decimal(12,2) DEFAULT '0.00' COMMENT '结算前待结算金额',
  `settle_after_money` decimal(12,2) DEFAULT '0.00' COMMENT '结算后待结算金额',
  `uid` int(12) DEFAULT '0' COMMENT '被结算人ID',
  `adminid` int(12) DEFAULT '0' COMMENT '结算人ID',
  `addtime` int(12) DEFAULT '0' COMMENT '结算时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_settle_lists
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_super
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_super`;
CREATE TABLE `cmf_users_super` (
  `uid` int(11) unsigned NOT NULL,
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_super
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video`;
CREATE TABLE `cmf_users_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '封面图片',
  `thumb_s` varchar(255) DEFAULT '' COMMENT '封面小图',
  `href` varchar(255) DEFAULT '' COMMENT '视频地址',
  `likes` int(11) DEFAULT '0' COMMENT '点赞数',
  `views` int(11) DEFAULT '0' COMMENT '浏览数',
  `comments` int(11) DEFAULT '0' COMMENT '评论数',
  `steps` int(11) DEFAULT '0' COMMENT '踩总数',
  `shares` int(11) DEFAULT '0' COMMENT '分享数量',
  `addtime` int(11) DEFAULT '0' COMMENT '发布时间',
  `lat` varchar(255) DEFAULT '' COMMENT '维度',
  `lng` varchar(255) DEFAULT '' COMMENT '经度',
  `city` varchar(255) DEFAULT '' COMMENT '城市',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_users_video
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_black
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_black`;
CREATE TABLE `cmf_users_video_black` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `videoid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_black
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_comments
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_comments`;
CREATE TABLE `cmf_users_video_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `touid` int(10) DEFAULT '0',
  `videoid` int(10) DEFAULT '0',
  `commentid` int(10) DEFAULT '0',
  `parentid` int(10) DEFAULT '0',
  `content` text,
  `likes` int(11) DEFAULT '0' COMMENT '点赞数',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_comments_like
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_comments_like`;
CREATE TABLE `cmf_users_video_comments_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `commentid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_comments_like
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_like
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_like`;
CREATE TABLE `cmf_users_video_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `videoid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_like
-- ----------------------------
INSERT INTO `cmf_users_video_like` VALUES ('1', '11327', '176', '1508223580');
INSERT INTO `cmf_users_video_like` VALUES ('2', '11327', '175', '1508223588');
INSERT INTO `cmf_users_video_like` VALUES ('3', '11327', '125', '1508223676');
INSERT INTO `cmf_users_video_like` VALUES ('5', '11333', '1', '1508323208');
INSERT INTO `cmf_users_video_like` VALUES ('7', '11331', '1', '1508339479');
INSERT INTO `cmf_users_video_like` VALUES ('9', '11335', '2', '1508507775');
INSERT INTO `cmf_users_video_like` VALUES ('10', '11335', '1', '1508507780');
INSERT INTO `cmf_users_video_like` VALUES ('12', '11337', '3', '1508925928');
INSERT INTO `cmf_users_video_like` VALUES ('13', '11336', '5', '1509607258');
INSERT INTO `cmf_users_video_like` VALUES ('14', '11377', '5', '1509611933');
INSERT INTO `cmf_users_video_like` VALUES ('15', '11379', '4', '1509613611');
INSERT INTO `cmf_users_video_like` VALUES ('16', '11384', '5', '1509614333');
INSERT INTO `cmf_users_video_like` VALUES ('18', '11339', '5', '1509675033');
INSERT INTO `cmf_users_video_like` VALUES ('19', '11332', '4', '1509682033');
INSERT INTO `cmf_users_video_like` VALUES ('20', '11332', '5', '1509682038');
INSERT INTO `cmf_users_video_like` VALUES ('25', '11337', '7', '1509758834');
INSERT INTO `cmf_users_video_like` VALUES ('26', '11337', '6', '1509758843');
INSERT INTO `cmf_users_video_like` VALUES ('27', '11361', '8', '1509758915');
INSERT INTO `cmf_users_video_like` VALUES ('28', '11334', '8', '1509761453');
INSERT INTO `cmf_users_video_like` VALUES ('29', '11332', '8', '1509769711');
INSERT INTO `cmf_users_video_like` VALUES ('30', '11406', '8', '1509786285');
INSERT INTO `cmf_users_video_like` VALUES ('31', '11379', '8', '1509788929');
INSERT INTO `cmf_users_video_like` VALUES ('32', '11410', '8', '1509796740');
INSERT INTO `cmf_users_video_like` VALUES ('34', '11385', '8', '1509798062');
INSERT INTO `cmf_users_video_like` VALUES ('35', '11400', '8', '1509802993');
INSERT INTO `cmf_users_video_like` VALUES ('36', '11418', '8', '1509806069');
INSERT INTO `cmf_users_video_like` VALUES ('37', '11385', '9', '1509834441');
INSERT INTO `cmf_users_video_like` VALUES ('38', '11402', '8', '1509840961');
INSERT INTO `cmf_users_video_like` VALUES ('39', '11387', '9', '1509841249');
INSERT INTO `cmf_users_video_like` VALUES ('40', '11428', '8', '1509849423');
INSERT INTO `cmf_users_video_like` VALUES ('41', '11334', '9', '1509880594');
INSERT INTO `cmf_users_video_like` VALUES ('42', '11445', '9', '1509888650');
INSERT INTO `cmf_users_video_like` VALUES ('43', '11447', '8', '1509892895');
INSERT INTO `cmf_users_video_like` VALUES ('45', '11330', '8', '1509930824');
INSERT INTO `cmf_users_video_like` VALUES ('46', '11383', '9', '1509932869');

-- ----------------------------
-- Table structure for cmf_users_video_report
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_report`;
CREATE TABLE `cmf_users_video_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `touid` int(11) DEFAULT '0',
  `videoid` int(11) DEFAULT '0' COMMENT '视频ID',
  `content` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `uptime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_video_report
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_step
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_step`;
CREATE TABLE `cmf_users_video_step` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `videoid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_step
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_video_view
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_video_view`;
CREATE TABLE `cmf_users_video_view` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `videoid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_users_video_view
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_vip
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_vip`;
CREATE TABLE `cmf_users_vip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT 'VIP类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_vip
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users_zombie
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users_zombie`;
CREATE TABLE `cmf_users_zombie` (
  `uid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_users_zombie
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_vip
-- ----------------------------
DROP TABLE IF EXISTS `cmf_vip`;
CREATE TABLE `cmf_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) DEFAULT '',
  `coin` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '1' COMMENT '会员类型，1表示普通会员，2表示至尊VIP',
  `length` int(11) DEFAULT '1' COMMENT '时长（月）',
  `orderno` int(11) DEFAULT '0' COMMENT '序号',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_vip
-- ----------------------------
INSERT INTO `cmf_vip` VALUES ('1', '', '200', 'vip', '1', '1', '0', '1499925149');
INSERT INTO `cmf_vip` VALUES ('2', '', '500', '', '1', '3', '0', '1499925155');
INSERT INTO `cmf_vip` VALUES ('3', '', '900', '', '1', '6', '0', '1499925166');
INSERT INTO `cmf_vip` VALUES ('4', '', '1500', '', '1', '12', '0', '1499925200');
INSERT INTO `cmf_vip` VALUES ('5', '', '300', '', '2', '1', '0', '1499925207');
INSERT INTO `cmf_vip` VALUES ('6', '', '800', '', '2', '3', '0', '1499925215');
INSERT INTO `cmf_vip` VALUES ('7', '', '1500', '', '2', '6', '0', '1499925224');
INSERT INTO `cmf_vip` VALUES ('8', '', '199999888', '', '2', '12', '8', '1506067682');
