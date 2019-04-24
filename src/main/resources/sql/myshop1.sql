/*
Navicat MySQL Data Transfer

Source Server         : du
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2019-04-24 15:03:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `tb_adminuser`;
CREATE TABLE `tb_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ausername` varchar(50) NOT NULL,
  `apassword` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_adminuser
-- ----------------------------
INSERT INTO `tb_adminuser` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_adminuser` VALUES ('2', 'test', '4297f44b13955235245b2497399d7a93');
INSERT INTO `tb_adminuser` VALUES ('3', 'du', '123');

-- ----------------------------
-- Table structure for `tb_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `busertable_id` (`busertable_id`) USING BTREE,
  KEY `goodstable_id` (`goodstable_id`) USING BTREE,
  CONSTRAINT `tb_cart_ibfk_1` FOREIGN KEY (`busertable_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `tb_cart_ibfk_2` FOREIGN KEY (`goodstable_id`) REFERENCES `tb_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_focus`
-- ----------------------------
DROP TABLE IF EXISTS `tb_focus`;
CREATE TABLE `tb_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goodstable_id` (`goodstable_id`) USING BTREE,
  KEY `busertable_id` (`busertable_id`) USING BTREE,
  CONSTRAINT `tb_focus_ibfk_1` FOREIGN KEY (`goodstable_id`) REFERENCES `tb_goods` (`id`),
  CONSTRAINT `tb_focus_ibfk_2` FOREIGN KEY (`busertable_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) NOT NULL,
  `goprice` double NOT NULL,
  `grprice` double NOT NULL,
  `gstore` int(11) NOT NULL,
  `gpicture` varchar(200) DEFAULT NULL,
  `goodstype_id` int(11) NOT NULL,
  `iputtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goodstype_id` (`goodstype_id`) USING BTREE,
  CONSTRAINT `tb_goods_ibfk_1` FOREIGN KEY (`goodstype_id`) REFERENCES `tb_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('2', '果汁', '20', '18', '9999', 'http://localhost:8080/views/upload/bc092b82-e070-462b-a291-304bd48c6a0d.png', '3', '2019-04-04 16:31:56');
INSERT INTO `tb_goods` VALUES ('3', '鍗庝负鎵嬫満', '3858', '3500', '820', 'http://localhost:8080/views/upload/55ebc1b0-f240-4d03-aca9-61720e6a9e31.jpg', '2', '2019-04-09 19:11:35');
INSERT INTO `tb_goods` VALUES ('4', '娴峰皵鍐扮', '2800', '2750', '600', 'http://localhost:8080/views/upload/bc092b82-e070-462b-a291-304bd48c6a0d.png', '1', '2019-04-04 16:32:54');
INSERT INTO `tb_goods` VALUES ('5', 'Java鍏ラ棬', '100', '99', '7777', 'http://localhost:8080/views/upload/ec65e19d-9033-4c5d-be71-19fbc6235344.jpg', '4', '2019-04-09 19:09:49');
INSERT INTO `tb_goods` VALUES ('6', '鏈€浠ｇ爜', '888', '888', '1000', 'http://localhost:8080/views/upload/4ea54f67-ec16-41ea-86f6-166903d1d913.jpg', '4', '2019-04-10 08:24:21');
INSERT INTO `tb_goods` VALUES ('7', 'Oracle', '88', '78', '1000', 'http://localhost:8080/views/upload/4221c093-735b-4ee5-9045-0b0e2601d7c3.png', '4', '2019-04-10 08:26:46');
INSERT INTO `tb_goods` VALUES ('8', '鏈€浠ｇ爜', '100', '100', '100', 'http://localhost:8080/views/upload/0f0c27ba-567a-4a8b-baf8-46ecf90c28cd.jpg', '1', '2019-04-13 21:46:17');
INSERT INTO `tb_goods` VALUES ('9', 'test', '1111', '11', '111', 'http://localhost:8080/views/upload/01ee9537-1cfd-4c31-9f46-52155cd84ac4.jpg', '1', '2019-04-13 21:45:18');

-- ----------------------------
-- Table structure for `tb_goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goodstype`;
CREATE TABLE `tb_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_goodstype
-- ----------------------------
INSERT INTO `tb_goodstype` VALUES ('1', '家电');
INSERT INTO `tb_goodstype` VALUES ('2', '鎵嬫満');
INSERT INTO `tb_goodstype` VALUES ('3', '椋熷搧');
INSERT INTO `tb_goodstype` VALUES ('4', '鐢佃剳');
INSERT INTO `tb_goodstype` VALUES ('5', '鏈€浠ｇ爜');

-- ----------------------------
-- Table structure for `tb_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(100) NOT NULL,
  `ncontent` varchar(500) NOT NULL,
  `ntime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('1', '测试1', '测试001', '2019-04-07 23:12:16');
INSERT INTO `tb_notice` VALUES ('2', '娴嬭瘯2', '娴嬭瘯002', '2019-04-07 23:12:33');
INSERT INTO `tb_notice` VALUES ('3', '娴嬭瘯3', '娴嬭瘯003', '2019-04-07 23:12:45');
INSERT INTO `tb_notice` VALUES ('4', '娴嬭瘯4', '娴嬭瘯004', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('5', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('6', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('7', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('8', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('10', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('11', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('12', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('13', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('14', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('15', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('16', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('17', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('18', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('19', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('20', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('21', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('22', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('23', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('24', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('25', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('26', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('27', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('28', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('29', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('30', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('31', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('32', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('33', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('34', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('35', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('36', '娴嬭瘯', '娴嬭瘯000000', '2019-04-07 23:13:01');
INSERT INTO `tb_notice` VALUES ('37', '娴嬭瘯', '娴嬭瘯99999', '2019-04-08 08:36:46');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(4) NOT NULL,
  `orderdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `busertable_id` (`user_id`) USING BTREE,
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('10001', '1', '200', '1', '2019-04-09 13:02:44');

-- ----------------------------
-- Table structure for `tb_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE `tb_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orderbasetable_id` (`order_id`) USING BTREE,
  KEY `goodstable_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_orderdetail
-- ----------------------------
INSERT INTO `tb_orderdetail` VALUES ('1', '10001', '2', '10');
INSERT INTO `tb_orderdetail` VALUES ('3', '10002', '3', '1');
INSERT INTO `tb_orderdetail` VALUES ('4', '10003', '6', '1');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'xiaozhang', 'e10adc3949ba59abbe56e057f20f883e', 'xiaozhang@sina.com', '张先生', '江西省南昌市南昌县天祥大道388号江西工业职业技术学院', '18978878780');
