/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : clm

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 15/04/2021 09:43:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址id(主键)',
  `user_id` int(10) NOT NULL COMMENT '用户id(外键)',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `address_用户id`(`user_id`) USING BTREE,
  CONSTRAINT `address_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '李一', '18183172997', '重庆市');
INSERT INTO `address` VALUES (2, 2, '康一', '18183172997', '重庆市');
INSERT INTO `address` VALUES (3, 3, '康三', '18183172997', '重庆市');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员用户名',
  `admin_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `admn_店铺id`(`shop_id`) USING BTREE,
  CONSTRAINT `admn_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, '管理员一号', '123456');
INSERT INTO `admin` VALUES (2, 2, '管理员二号', '123456');
INSERT INTO `admin` VALUES (3, 3, '管理员三号', '123456');
INSERT INTO `admin` VALUES (4, 1, '管理员一号', '123456');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `announcement_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `picture` mediumblob NOT NULL COMMENT '图片',
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  PRIMARY KEY (`announcement_id`) USING BTREE,
  INDEX `announcement_店铺id`(`shop_id`) USING BTREE,
  INDEX `announcement_用户id`(`user_id`) USING BTREE,
  CONSTRAINT `announcement_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `announcement_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, 1, 1, '', NULL);
INSERT INTO `announcement` VALUES (2, 2, 2, '', NULL);
INSERT INTO `announcement` VALUES (3, 3, 3, '', NULL);
INSERT INTO `announcement` VALUES (4, 4, 5, '', NULL);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `collection_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `goods_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`collection_id`) USING BTREE,
  INDEX `collection_用户id`(`user_id`) USING BTREE,
  INDEX `collection_商品id`(`goods_id`) USING BTREE,
  CONSTRAINT `collection_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_商品id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 1, 1);
INSERT INTO `collection` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id(主键)',
  `shop_id` int(10) NOT NULL COMMENT '店铺id(外键）',
  `goods_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `price` double NULL DEFAULT NULL COMMENT '商品价格',
  `salesVolume` int(10) NULL DEFAULT NULL COMMENT '销售量',
  `score` int(11) NULL DEFAULT NULL COMMENT '评分',
  `describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `goods_logo` mediumblob NULL COMMENT '商品图片',
  `goods_recommend` enum('是','否') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐商品？',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `goods_店铺id`(`shop_id`) USING BTREE,
  CONSTRAINT `goods_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 1, '麻婆豆腐', 10, 100, 3, '豆腐', NULL, NULL);
INSERT INTO `goods` VALUES (2, 6, '炒白菜', 5, 20, 4, '白菜', NULL, NULL);
INSERT INTO `goods` VALUES (3, 2, '汉堡', 8, 235, 5, '鸡腿堡', NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id(主键)',
  `user_id` int(10) NOT NULL COMMENT '用户id(外键)',
  `shop_id` int(10) NOT NULL COMMENT '店铺id(外键)',
  `goods_id` int(10) NOT NULL COMMENT '商品id(外键)',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `用户_id`(`user_id`) USING BTREE,
  INDEX `店铺_id`(`shop_id`) USING BTREE,
  INDEX `商品_id`(`goods_id`) USING BTREE,
  CONSTRAINT `order_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_商品id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (2, 5, 1, 2, '2021-03-01 09:24:07', '已完成');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺id(主键)',
  `shop_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名',
  `shop_address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺地址',
  `shop_contacts` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `shop_telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `shop_logo` blob NULL COMMENT '店铺logo',
  PRIMARY KEY (`shop_id`) USING BTREE,
  UNIQUE INDEX `shop_店铺名`(`shop_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, '豆腐店', '重庆市', '李老板', '18183172997', NULL);
INSERT INTO `shop` VALUES (2, '炸鸡汉堡', '重庆市', '炸鸡老板', '18183172997', NULL);
INSERT INTO `shop` VALUES (3, '面条', '重庆市', '面条老板面老板', '18183172997', NULL);
INSERT INTO `shop` VALUES (4, '稀饭', '重庆市', '稀饭老板', '18183172997', NULL);
INSERT INTO `shop` VALUES (5, '馒头', '重庆市', '馒头老板', '18183172997', NULL);
INSERT INTO `shop` VALUES (6, '炒菜', '重庆市', '炒菜老板', '18183172997', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id(主键)',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `balance` float NULL DEFAULT NULL COMMENT '余额',
  `integral` float NULL DEFAULT NULL COMMENT '积分',
  `user_portrait` mediumblob NULL COMMENT '用户头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李一', '123456', '男', '18183172997', 100, 0, NULL);
INSERT INTO `user` VALUES (2, '李二', '123456', '男', '1324563211', 354, 0, NULL);
INSERT INTO `user` VALUES (3, '李三', '123456', '男', '18183172997', 600, 50, NULL);
INSERT INTO `user` VALUES (4, '李四', '123456', '男', '18183172997', 750, 36, NULL);
INSERT INTO `user` VALUES (5, '李五', '123456', '女', '12345678911', 43, 90, NULL);
INSERT INTO `user` VALUES (7, '王五', '654321', '男', '18183172997', 800, 150, NULL);

SET FOREIGN_KEY_CHECKS = 1;
