/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3307
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : localhost:3307
 Source Schema         : myshop

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 13/04/2019 21:53:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_adminuser`;
CREATE TABLE `tb_adminuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ausername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_adminuser
-- ----------------------------
INSERT INTO `tb_adminuser` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_adminuser` VALUES (2, 'test', '4297f44b13955235245b2497399d7a93');

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `busertable_id`(`busertable_id`) USING BTREE,
  INDEX `goodstable_id`(`goodstable_id`) USING BTREE,
  CONSTRAINT `tb_cart_ibfk_1` FOREIGN KEY (`busertable_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_cart_ibfk_2` FOREIGN KEY (`goodstable_id`) REFERENCES `tb_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_focus
-- ----------------------------
DROP TABLE IF EXISTS `tb_focus`;
CREATE TABLE `tb_focus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodstable_id`(`goodstable_id`) USING BTREE,
  INDEX `busertable_id`(`busertable_id`) USING BTREE,
  CONSTRAINT `tb_focus_ibfk_1` FOREIGN KEY (`goodstable_id`) REFERENCES `tb_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_focus_ibfk_2` FOREIGN KEY (`busertable_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goprice` double NOT NULL,
  `grprice` double NOT NULL,
  `gstore` int(11) NOT NULL,
  `gpicture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodstype_id` int(11) NOT NULL,
  `iputtime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodstype_id`(`goodstype_id`) USING BTREE,
  CONSTRAINT `tb_goods_ibfk_1` FOREIGN KEY (`goodstype_id`) REFERENCES `tb_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (2, '果汁', 20, 18, 9999, 'http://localhost:8080/views/upload/bc092b82-e070-462b-a291-304bd48c6a0d.png', 3, '2019-04-04 16:31:56');
INSERT INTO `tb_goods` VALUES (3, '华为手机', 3858, 3500, 820, 'http://localhost:8080/views/upload/55ebc1b0-f240-4d03-aca9-61720e6a9e31.jpg', 2, '2019-04-09 19:11:35');
INSERT INTO `tb_goods` VALUES (4, '海尔冰箱', 2800, 2750, 600, 'http://localhost:8080/views/upload/bc092b82-e070-462b-a291-304bd48c6a0d.png', 1, '2019-04-04 16:32:54');
INSERT INTO `tb_goods` VALUES (5, 'Java入门', 100, 99, 7777, 'http://localhost:8080/views/upload/ec65e19d-9033-4c5d-be71-19fbc6235344.jpg', 4, '2019-04-09 19:09:49');
INSERT INTO `tb_goods` VALUES (6, '最代码', 888, 888, 1000, 'http://localhost:8080/views/upload/4ea54f67-ec16-41ea-86f6-166903d1d913.jpg', 4, '2019-04-10 08:24:21');
INSERT INTO `tb_goods` VALUES (7, 'Oracle', 88, 78, 1000, 'http://localhost:8080/views/upload/4221c093-735b-4ee5-9045-0b0e2601d7c3.png', 4, '2019-04-10 08:26:46');
INSERT INTO `tb_goods` VALUES (8, '最代码', 100, 100, 100, 'http://localhost:8080/views/upload/0f0c27ba-567a-4a8b-baf8-46ecf90c28cd.jpg', 1, '2019-04-13 21:46:17');
INSERT INTO `tb_goods` VALUES (9, 'test', 1111, 11, 111, 'http://localhost:8080/views/upload/01ee9537-1cfd-4c31-9f46-52155cd84ac4.jpg', 1, '2019-04-13 21:45:18');

-- ----------------------------
-- Table structure for tb_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `tb_goodstype`;
CREATE TABLE `tb_goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_goodstype
-- ----------------------------
INSERT INTO `tb_goodstype` VALUES (1, '家电');
INSERT INTO `tb_goodstype` VALUES (2, '手机');
INSERT INTO `tb_goodstype` VALUES (3, '食品');
INSERT INTO `tb_goodstype` VALUES (4, '电脑');
INSERT INTO `tb_goodstype` VALUES (5, '最代码');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ncontent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ntime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES (1, '测试1', '测试001', '2019-04-07 23:12:16');
INSERT INTO `tb_notice` VALUES (2, '测试2', '测试002', '2019-04-07 23:12:33');
INSERT INTO `tb_notice` VALUES (3, '测试3', '测试003', '2019-04-07 23:12:45');
INSERT INTO `tb_notice` VALUES (4, '测试4', '测试004', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (5, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (6, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (7, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (8, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (10, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (11, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (12, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (13, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (14, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (15, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (16, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (17, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (18, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (19, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (20, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (21, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (22, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (23, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (24, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (25, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (26, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (27, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (28, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (29, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (30, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (31, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (32, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (33, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (34, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (35, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (36, '测试', '测试000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES (37, '测试', '测试99999', '2019-04-08 08:36:46');
INSERT INTO `tb_notice` VALUES (38, '最代码网站上线', 'zuidaima.com上线了', '2019-04-13 21:52:41');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderdate` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `busertable_id`(`user_id`) USING BTREE,
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (10001, 1, 200, '1', '2019-04-09 13:02:44');
INSERT INTO `tb_order` VALUES (10002, 2, 3500, '0', '2019-04-09 15:28:57');
INSERT INTO `tb_order` VALUES (10003, 3, 8888, '1', '2019-04-09 19:39:42');

-- ----------------------------
-- Table structure for tb_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE `tb_orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderbasetable_id`(`order_id`) USING BTREE,
  INDEX `goodstable_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_orderdetail
-- ----------------------------
INSERT INTO `tb_orderdetail` VALUES (1, 10001, 2, 10);
INSERT INTO `tb_orderdetail` VALUES (3, 10002, 3, 1);
INSERT INTO `tb_orderdetail` VALUES (4, 10003, 6, 1);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'xiaozhang', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '张先生', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (2, 'xiaowang', 'e10adc3949ba59abbe56e057f20f883e', 'xiaowang@sina.com', '王先生', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (3, '最代码', 'e10adc3949ba59abbe56e057f20f883e', 'xiaohe@sina.com', '何先生', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (4, 'hehe', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '呵呵', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (5, 'didi', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '滴滴', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (6, 'xiaoliu', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '刘先生', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (7, 'xiaoli', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '小丽', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (8, 'xiaohua', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '小华', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (9, 'wanger', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '王二', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
INSERT INTO `tb_user` VALUES (10, 'hexiao', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '何晓', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');

SET FOREIGN_KEY_CHECKS = 1;
