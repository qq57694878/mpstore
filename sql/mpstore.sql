/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mpstore

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-06-02 22:56:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mp_card
-- ----------------------------
DROP TABLE IF EXISTS `mp_card`;
CREATE TABLE `mp_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡券id',
  `card_no` int(12) DEFAULT NULL COMMENT '卡券消费码',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `sku_id` varchar(32) DEFAULT NULL COMMENT '商品id',
  `card_name` varchar(255) DEFAULT NULL COMMENT '卡券名称',
  `face_price` decimal(10,2) DEFAULT NULL COMMENT '面值',
  `balance_price` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `card_content` longtext COMMENT '卡片详情',
  `card_desc` varchar(255) DEFAULT NULL COMMENT '卡片简述',
  `valid_flag` char(1) DEFAULT '1' COMMENT '有效标记（1有效0无效）',
  `buss_type` char(2) DEFAULT '1' COMMENT '业务分类（1服务2充值卡3商品4套餐）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户卡券表';

-- ----------------------------
-- Records of mp_card
-- ----------------------------

-- ----------------------------
-- Table structure for mp_card_record
-- ----------------------------
DROP TABLE IF EXISTS `mp_card_record`;
CREATE TABLE `mp_card_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `card_id` int(11) DEFAULT NULL COMMENT '卡券id',
  `card_no` int(12) DEFAULT NULL COMMENT '卡券消费码',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `before_used_price` decimal(10,2) DEFAULT NULL COMMENT '消费前余额',
  `used_price` decimal(10,2) DEFAULT NULL COMMENT '消费金额',
  `agter_used_price` decimal(10,2) DEFAULT NULL COMMENT '消费后余额',
  `buss_type` char(2) DEFAULT '1' COMMENT '业务分类（1服务2充值卡3商品4套餐）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户卡券消费记录表';

-- ----------------------------
-- Records of mp_card_record
-- ----------------------------

-- ----------------------------
-- Table structure for mp_combo_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_combo_sku`;
CREATE TABLE `mp_combo_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `combo_sku_id` int(11) DEFAULT NULL COMMENT '套餐商品id',
  `sku_id` varchar(255) DEFAULT NULL COMMENT '商品id',
  `origin_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '商品画线价格',
  `sku_num` int(11) DEFAULT NULL COMMENT '数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套餐商品绑定表';

-- ----------------------------
-- Records of mp_combo_sku
-- ----------------------------

-- ----------------------------
-- Table structure for mp_order
-- ----------------------------
DROP TABLE IF EXISTS `mp_order`;
CREATE TABLE `mp_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总额',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_status` char(1) DEFAULT '0' COMMENT '支付状态(0:未支付;1:已支付)',
  `pay_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `order_status` varchar(2) DEFAULT '0' COMMENT '订单状态(0待付款;1已取消;8已完成)',
  `user_id` int(8) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of mp_order
-- ----------------------------

-- ----------------------------
-- Table structure for mp_order_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_order_sku`;
CREATE TABLE `mp_order_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品id',
  `buy_num` int(11) DEFAULT NULL COMMENT '购买数量',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sku_desc` varchar(255) DEFAULT NULL COMMENT '商品简述',
  `sku_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `face_price` decimal(10,2) DEFAULT NULL COMMENT '商品面值',
  `line_price` decimal(10,2) DEFAULT NULL COMMENT '商品画线价格',
  `sku_content` longtext COMMENT '商品详情',
  `main_url` varchar(255) DEFAULT NULL COMMENT '商品主图片url',
  `buss_type` char(2) DEFAULT '1' COMMENT '业务分类（1服务2充值卡3商品4套餐）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of mp_order_sku
-- ----------------------------

-- ----------------------------
-- Table structure for mp_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_sku`;
CREATE TABLE `mp_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sku_desc` varchar(255) DEFAULT NULL COMMENT '商品简述',
  `sku_price` decimal(10,2) DEFAULT NULL COMMENT '商品销售价格',
  `face_price` decimal(10,2) DEFAULT NULL COMMENT '商品面值',
  `line_price` decimal(10,2) DEFAULT NULL COMMENT '商品画线价格',
  `sku_content` longtext COMMENT '商品详情',
  `sales_init` int(11) DEFAULT '0' COMMENT '初始销售数',
  `sales_num` int(11) DEFAULT '0' COMMENT '销售数量=初始销售数量+实际销售数量',
  `sort` int(11) DEFAULT '100' COMMENT '排序(越小越靠前)',
  `main_url` varchar(255) DEFAULT NULL COMMENT '商品主图片url',
  `sku_status` char(1) DEFAULT '1' COMMENT '商品状态（1上架2下架）',
  `catagory_id` int(11) DEFAULT NULL COMMENT '商品分类id',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `buss_type` char(2) DEFAULT '1' COMMENT '业务分类（1服务2充值卡3商品4套餐）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of mp_sku
-- ----------------------------

-- ----------------------------
-- Table structure for mp_user
-- ----------------------------
DROP TABLE IF EXISTS `mp_user`;
CREATE TABLE `mp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL COMMENT '用户名称',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '用户密码',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `user_level` tinyint(3) DEFAULT '0' COMMENT '0 普通用户，1 VIP用户，2 高级VIP用户',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `weixin_openid` varchar(63) NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(100) NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 可用, 1 禁用, 2 注销',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of mp_user
-- ----------------------------
