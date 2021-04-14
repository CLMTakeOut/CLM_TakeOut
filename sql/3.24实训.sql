/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.5.40 : Database - clm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clm`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址id(主键)',
  `user_id` int(10) NOT NULL COMMENT '用户id(外键)',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `telephone` varchar(11) NOT NULL COMMENT '电话',
  `address` varchar(60) NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`address_id`),
  KEY `address_用户id` (`user_id`),
  CONSTRAINT `address_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`address_id`,`user_id`,`name`,`telephone`,`address`) values (1,1,'李一','18183172997','重庆市'),(2,2,'康一','18183172997','重庆市'),(3,3,'康三','18183172997','重庆市');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `admin_name` varchar(20) DEFAULT NULL COMMENT '管理员用户名',
  `admin_pwd` varchar(20) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`),
  KEY `admn_店铺id` (`shop_id`),
  CONSTRAINT `admn_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`shop_id`,`admin_name`,`admin_pwd`) values (1,1,'管理员一号','123456'),(2,2,'管理员二号','123456'),(3,3,'管理员三号','123456'),(4,1,'管理员一号','123456');

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `announcement_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `picture` mediumblob COMMENT '图片',
  PRIMARY KEY (`announcement_id`),
  KEY `announcement_店铺id` (`shop_id`),
  KEY `announcement_用户id` (`user_id`),
  CONSTRAINT `announcement_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `announcement_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `announcement` */

insert  into `announcement`(`announcement_id`,`shop_id`,`user_id`,`picture`) values (1,1,1,NULL),(2,2,2,NULL),(3,3,3,NULL),(4,4,5,NULL);

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `collection_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`collection_id`),
  KEY `collection_用户id` (`user_id`),
  KEY `collection_商品id` (`goods_id`),
  KEY `collection_店铺id` (`shop_id`),
  CONSTRAINT `collection_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_商品id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `collection` */

insert  into `collection`(`collection_id`,`user_id`,`goods_id`,`shop_id`) values (1,1,1,1),(2,2,2,2);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id(主键)',
  `shop_id` int(10) NOT NULL COMMENT '店铺id(外键）',
  `goods_name` varchar(40) DEFAULT NULL COMMENT '商品名',
  `price` double DEFAULT NULL COMMENT '商品价格',
  `salesVolume` int(10) DEFAULT NULL COMMENT '销售量',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `describe` varchar(100) DEFAULT NULL COMMENT '详细描述',
  `goods_logo` mediumblob COMMENT '商品图片',
  `goods_recommend` enum('是','否') DEFAULT NULL COMMENT '推荐商品？',
  PRIMARY KEY (`goods_id`),
  KEY `goods_店铺id` (`shop_id`),
  CONSTRAINT `goods_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`goods_id`,`shop_id`,`goods_name`,`price`,`salesVolume`,`score`,`describe`,`goods_logo`,`goods_recommend`) values (1,1,'麻婆豆腐',10,100,3,'豆腐',NULL,NULL),(2,6,'炒白菜',5,20,4,'白菜',NULL,NULL),(3,2,'汉堡',8,235,5,'鸡腿堡',NULL,NULL);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `announcement_id` int(10) NOT NULL COMMENT '公告id(主键)',
  `user_id` int(10) NOT NULL COMMENT '用户id(主键)',
  `notice_detail` varchar(100) DEFAULT NULL COMMENT '公告详情',
  PRIMARY KEY (`announcement_id`,`user_id`),
  KEY `notice_用户id` (`user_id`),
  CONSTRAINT `notice_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_公告id` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`announcement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`announcement_id`,`user_id`,`notice_detail`) values (1,1,'x'),(4,2,'详情');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id(主键)',
  `user_id` int(10) NOT NULL COMMENT '用户id(外键)',
  `shop_id` int(10) NOT NULL COMMENT '店铺id(外键)',
  `goods_id` int(10) NOT NULL COMMENT '商品id(外键)',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_status` varchar(10) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`order_id`),
  KEY `用户_id` (`user_id`),
  KEY `店铺_id` (`shop_id`),
  KEY `商品_id` (`goods_id`),
  CONSTRAINT `order_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_商品id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`order_id`,`user_id`,`shop_id`,`goods_id`,`order_time`,`order_status`) values (2,5,1,2,'2021-03-01 09:24:07','已完成');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺id(主键)',
  `shop_name` varchar(20) NOT NULL COMMENT '店铺名',
  `shop_address` varchar(60) DEFAULT NULL COMMENT '店铺地址',
  `shop_contacts` varchar(10) DEFAULT NULL COMMENT '联系人',
  `shop_telephone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `admin_account` varchar(20) DEFAULT NULL COMMENT '管理员账号',
  `admin_pwd` varchar(20) DEFAULT NULL COMMENT '管理员密码',
  `shop_logo` blob COMMENT '店铺logo',
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `shop_店铺名` (`shop_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`shop_id`,`shop_name`,`shop_address`,`shop_contacts`,`shop_telephone`,`admin_account`,`admin_pwd`,`shop_logo`) values (1,'豆腐店','重庆市','李老板','18183172997','18183172997','132456',NULL),(2,'炸鸡汉堡','重庆市','炸鸡老板','18183172997','18183172997','132456',NULL),(3,'面条','重庆市','面条老板面老板','18183172997','18183172997','132456',NULL),(4,'稀饭','重庆市','稀饭老板','18183172997','18183172997','132456',NULL),(5,'馒头','重庆市','馒头老板','18183172997','18183172997','132456',NULL),(6,'炒菜','重庆市','炒菜老板','18183172997','18183172997',NULL,NULL);

/*Table structure for table `trolleys` */

DROP TABLE IF EXISTS `trolleys`;

CREATE TABLE `trolleys` (
  `trolleys_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `goods_id` int(10) NOT NULL COMMENT '商品id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`trolleys_id`),
  KEY `user_id` (`user_id`),
  KEY `trolleys_商品id` (`goods_id`),
  KEY `trolleys_店铺id` (`shop_id`),
  CONSTRAINT `trolleys_用户id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trolleys_商品id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trolleys_店铺id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trolleys` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id(主键)',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(20) NOT NULL COMMENT '密码',
  `sex` enum('男','女') NOT NULL COMMENT '性别',
  `telephone` varchar(11) NOT NULL COMMENT '电话',
  `balance` float DEFAULT NULL COMMENT '余额',
  `integral` float DEFAULT NULL COMMENT '积分',
  `user_portrait` mediumblob COMMENT '用户头像',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_pwd`,`sex`,`telephone`,`balance`,`integral`,`user_portrait`) values (1,'李一','123456','男','18183172997',100,0,NULL),(2,'李二','123456','男','1324563211',354,0,NULL),(3,'李三','123456','男','18183172997',600,50,NULL),(4,'李四','123456','男','18183172997',750,36,NULL),(5,'李五','123456','女','12345678911',43,90,NULL),(7,'王五','654321','男','18183172997',800,150,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
