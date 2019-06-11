/*
 Navicat Premium Data Transfer

 Source Server         : localhost1
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : mpstore

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 11/06/2019 17:21:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mp_about
-- ----------------------------
DROP TABLE IF EXISTS `mp_about`;
CREATE TABLE `mp_about`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_card
-- ----------------------------
DROP TABLE IF EXISTS `mp_card`;
CREATE TABLE `mp_card`  (
  `card_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡券id',
  `card_no` int(12) NULL DEFAULT NULL COMMENT '卡券消费码',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `card_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡券名称',
  `face_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '面值',
  `balance_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `card_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '卡片详情',
  `rest_frequency` int(11) NULL DEFAULT NULL COMMENT '剩余次数',
  `total_frequency` int(11) NULL DEFAULT NULL COMMENT '总次数',
  `card_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡片简述',
  `valid_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '有效标记（1有效0无效）',
  `buss_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '业务分类（1次数卡2E卡）',
  `order_sku_id` int(11) NULL DEFAULT NULL COMMENT '订单商品id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`card_id`) USING BTREE,
  INDEX `INDEX_MP_CARD_CARD_NO`(`card_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户卡券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_card_record
-- ----------------------------
DROP TABLE IF EXISTS `mp_card_record`;
CREATE TABLE `mp_card_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `card_id` int(11) NULL DEFAULT NULL COMMENT '卡券id',
  `card_no` int(12) NULL DEFAULT NULL COMMENT '卡券消费码',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `before_used_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费前余额',
  `used_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `after_used_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费后余额',
  `buss_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '业务分类（1次数卡2E卡）',
  `used_frequency` int(11) NULL DEFAULT NULL COMMENT '本次消费次数',
  `after_used_frequency` int(11) NULL DEFAULT NULL COMMENT '消费后剩余次数',
  `before_used_frequency` int(11) NULL DEFAULT NULL COMMENT '消费前次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户卡券消费记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_combo_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_combo_sku`;
CREATE TABLE `mp_combo_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `combo_sku_id` int(11) NULL DEFAULT NULL COMMENT '套餐商品id',
  `sku_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `origin_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `discount_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品画线价格',
  `sku_num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐商品绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_config
-- ----------------------------
DROP TABLE IF EXISTS `mp_config`;
CREATE TABLE `mp_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_notice
-- ----------------------------
DROP TABLE IF EXISTS `mp_notice`;
CREATE TABLE `mp_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `start_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_order
-- ----------------------------
DROP TABLE IF EXISTS `mp_order`;
CREATE TABLE `mp_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总额',
  `pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `pay_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付状态(0:未支付;1:已支付)',
  `pay_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `order_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单状态(0待付款;1已取消;8已完成)',
  `user_id` int(8) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `index_order_no`(`order_no`) USING BTREE,
  INDEX `INDEX_MP_ORDER_ORDER_NO`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mp_order
-- ----------------------------
INSERT INTO `mp_order` VALUES (1, '1', 100.00, 100.00, '0', '2019-06-08 22:42:04', '1', 1, '2019-06-08 22:42:04', '2019-06-09 12:51:29');
INSERT INTO `mp_order` VALUES (2, '2', 100.00, 100.00, '1', '2019-06-08 22:42:04', '8', 1, '2019-06-08 22:42:04', '2019-06-09 12:51:24');

-- ----------------------------
-- Table structure for mp_order_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_order_sku`;
CREATE TABLE `mp_order_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `sku_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `buy_num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简述',
  `sku_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `face_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品面值',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品画线价格',
  `sku_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `main_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图片url',
  `buss_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '业务分类（1次数卡2E卡4套餐）',
  `frequency` int(11) NULL DEFAULT 1 COMMENT '次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mp_order_sku
-- ----------------------------
INSERT INTO `mp_order_sku` VALUES (1, 1, 1, 1, '保养', '给你爱车一侧撒点附近拉速度', 100.00, 100.00, 120.00, '爱的发的', 'http://www.kulongtai.com/1.jpg', '1', 1, '2019-06-08 22:44:28');
INSERT INTO `mp_order_sku` VALUES (2, 1, 1, 1, '保养1', '给你爱车一侧撒点附近拉速度1', 200.00, 200.00, 240.00, '爱的发的a', 'http://www.kulongtai.com/2.jpg', '1', 1, '2019-06-08 22:44:28');
INSERT INTO `mp_order_sku` VALUES (3, 2, 1, 1, '保养', '给你爱车一侧撒点附近拉速度', 100.00, 100.00, 120.00, '爱的发的', 'http://www.kulongtai.com/1.jpg', '1', 1, '2019-06-08 22:44:28');
INSERT INTO `mp_order_sku` VALUES (4, 2, 1, 1, '保养', '给你爱车一侧撒点附近拉速度', 100.00, 100.00, 120.00, '爱的发的', 'http://www.kulongtai.com/1.jpg', '1', 1, '2019-06-08 22:44:28');

-- ----------------------------
-- Table structure for mp_page
-- ----------------------------
DROP TABLE IF EXISTS `mp_page`;
CREATE TABLE `mp_page`  (
  `page_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 10 COMMENT '页面类型(10首页 20自定义页)',
  `page_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面数据',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mp_sku
-- ----------------------------
DROP TABLE IF EXISTS `mp_sku`;
CREATE TABLE `mp_sku`  (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简述',
  `sku_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品销售价格',
  `face_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品面值',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品画线价格',
  `sku_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `sales_init` int(11) NULL DEFAULT 0 COMMENT '初始销售数',
  `sales_num` int(11) NULL DEFAULT 0 COMMENT '销售数量=初始销售数量+实际销售数量',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序(越小越靠前)',
  `main_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图片url',
  `sku_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '商品状态（1上架2下架）',
  `catagory_id` int(11) NULL DEFAULT NULL COMMENT '商品分类id',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `buss_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '业务分类（1次数卡2E卡4套餐）',
  `frequency` int(11) NULL DEFAULT 1 COMMENT '次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mp_sku
-- ----------------------------
INSERT INTO `mp_sku` VALUES (1, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (2, '保养机油2', '一次温馨的小保养，给你爱车初恋般的呵护', 150.00, 150.00, 180.00, '<img src=\"http://www.kulongtai.com/2.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/2.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:33');
INSERT INTO `mp_sku` VALUES (3, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (4, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (5, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (6, '保养机油2', '一次温馨的小保养，给你爱车初恋般的呵护', 150.00, 150.00, 180.00, '<img src=\"http://www.kulongtai.com/2.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/2.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:33');
INSERT INTO `mp_sku` VALUES (7, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (8, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (9, '保养机油2', '一次温馨的小保养，给你爱车初恋般的呵护', 150.00, 150.00, 180.00, '<img src=\"http://www.kulongtai.com/2.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/2.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:33');
INSERT INTO `mp_sku` VALUES (10, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (11, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (12, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (13, '保养机油2', '一次温馨的小保养，给你爱车初恋般的呵护', 150.00, 150.00, 180.00, '<img src=\"http://www.kulongtai.com/2.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/2.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:33');
INSERT INTO `mp_sku` VALUES (14, '保养机油', '一次温馨的小保养，给你爱车初恋般的呵护', 100.00, 100.00, 150.00, '<img src=\"http://www.kulongtai.com/1.jpg\"/>', 0, 0, 100, 'http://www.kulongtai.com/1.jpg', '1', NULL, '0', '1', 1, '2019-06-03 23:40:23', '2019-06-03 23:41:28');
INSERT INTO `mp_sku` VALUES (15, '问答法上的', '阿道夫', 1.00, 3.00, 2.00, '<p>\n	爱的所发生的\n</p>\n<p>\n	ada速度发顺丰\n</p>\n<p>\n	阿斯蒂芬\n</p>', 0, 0, 100, 'http://localhost:9999/media\\20190608113834EFi.jpg', '1', NULL, '1', '1', 1, '2019-06-08 11:38:37', '2019-06-10 09:38:15');
INSERT INTO `mp_sku` VALUES (16, '案发撒的撒旦法', '阿打发斯蒂芬', 11.00, 100.00, 11.00, '<p>\n	阿斯达多asdfasdfasdf阿斯蒂芬\n</p>\n<p>\n	爱的发顺丰的\n</p>', 0, 0, 100, 'http://localhost:9999/media\\201906100939048TG.jpg', '1', NULL, '0', '1', 1, '2019-06-08 11:42:57', '2019-06-08 11:42:57');
INSERT INTO `mp_sku` VALUES (17, '案发撒的撒旦法', '阿打发斯蒂芬', 11.00, 100.00, 11.00, '<p>\n	阿斯达多asdfasdfasdf阿斯蒂芬\n</p>\n<p>\n	爱的发顺丰的\n</p>', 0, 0, 100, 'http://localhost:9999/media\\2019061009392175C.jpg', '1', NULL, '0', '1', 1, '2019-06-08 11:43:24', '2019-06-08 11:43:24');
INSERT INTO `mp_sku` VALUES (18, '案发撒的撒旦法1', '阿打发斯蒂芬12', 123.00, 10011.00, 213123.00, '<p>\n	阿斯达多asdfasdfasdf阿斯蒂芬\n</p>\n<p>\n	爱的发顺丰的阿道夫\n</p>', 1, 0, 1001, 'http://localhost:9999/media\\20190610093938W2K.jpg', '2', NULL, '0', '1', 1, '2019-06-08 11:44:42', '2019-06-08 11:44:42');
INSERT INTO `mp_sku` VALUES (19, '案发撒的撒旦法', '阿打发斯蒂芬', 11.00, 100.00, 11.00, '<p>\n	阿斯达多asdfasdfasdf阿斯蒂芬\n</p>\n<p>\n	爱的发顺丰的\n</p>', 0, 0, 100, 'http://localhost:9999/media\\20190608114243kfB.jpg', '1', NULL, '1', '1', 1, '2019-06-08 11:45:58', '2019-06-08 14:15:17');
INSERT INTO `mp_sku` VALUES (20, '爱的', '爱的发送到', 1.00, 45.00, 23.00, '<p>\n	啊实打实地方阿斯达多\n</p>\n<p>\n	asdasd按时+\n</p>', 0, 0, 100, 'http://localhost:9999/media\\20190608120639XZx.jpg', '1', NULL, '1', '1', 1, '2019-06-08 12:06:52', '2019-06-08 14:15:22');
INSERT INTO `mp_sku` VALUES (21, '山东分公司的', '234234', 24234.00, 234234.00, 2342.00, '胜多负少', 0, 0, 100, 'http://localhost:9999/media\\20190608120754l1K.jpg', '1', NULL, '1', '1', 1, '2019-06-08 12:07:57', '2019-06-08 14:06:59');
INSERT INTO `mp_sku` VALUES (22, '案发撒的撒旦法1', '阿打发斯蒂芬12', 123.00, 10011.00, 213123.00, '<p>\n	阿斯达多asdfasdfasdf阿斯蒂芬\n</p>\n<p>\n	爱的发顺丰的阿道夫\n</p>', 1, 1, 1001, 'http://localhost:9999/media\\20190610093929YFK.jpg', '1', NULL, '0', '1', 1, '2019-06-08 14:37:32', '2019-06-08 11:44:42');

-- ----------------------------
-- Table structure for mp_user
-- ----------------------------
DROP TABLE IF EXISTS `mp_user`;
CREATE TABLE `mp_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `gender` tinyint(3) NOT NULL DEFAULT 0 COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `openid` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 可用, 1 禁用, 2 注销',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mp_user
-- ----------------------------
INSERT INTO `mp_user` VALUES (1, '1', '', 0, '2019-06-09', NULL, 'ljl', '13842823735', 'http://www.kulongtai.com/head.jpg', '1', '', 0, '2019-06-09 14:01:45', '2019-06-09 14:04:02', 0);

SET FOREIGN_KEY_CHECKS = 1;
