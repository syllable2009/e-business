/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.54 : Database - jia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `jia`;

/*Table structure for table `option_sku_0` */

DROP TABLE IF EXISTS `option_sku_0`;

CREATE TABLE `option_sku_0` (
  `OPTION_SKU_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `PROP_ID` bigint(20) DEFAULT NULL,
  `OPTION_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`OPTION_SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `option_sku_0` */

/*Table structure for table `product_0` */

DROP TABLE IF EXISTS `product_0`;

CREATE TABLE `product_0` (
  `PRODUCT_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增货品id',
  `BARCODE` varchar(20) DEFAULT NULL COMMENT '二维码',
  `PEODUCT_NAME` varchar(50) DEFAULT NULL COMMENT '货品名称',
  `CAT_ID` bigint(20) DEFAULT '0' COMMENT '分类',
  `BRAND` bigint(20) DEFAULT '0' COMMENT '品牌',
  `IS_NEW` tinyint(2) DEFAULT '0' COMMENT '是否新品',
  `IS_HOT` tinyint(2) DEFAULT '0' COMMENT '是否热门',
  `PRODUCT_INTRODUCE` varchar(100) DEFAULT NULL COMMENT '货品介绍',
  `PRODUCT_DETAIL` varchar(200) DEFAULT NULL COMMENT '货品详细',
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_0` */

insert  into `product_0`(`PRODUCT_ID`,`BARCODE`,`PEODUCT_NAME`,`CAT_ID`,`BRAND`,`IS_NEW`,`IS_HOT`,`PRODUCT_INTRODUCE`,`PRODUCT_DETAIL`) values (1,'P-0-2017-03-05-346','农用复合肥',4,2,0,0,NULL,NULL);

/*Table structure for table `product_picture_0` */

DROP TABLE IF EXISTS `product_picture_0`;

CREATE TABLE `product_picture_0` (
  `PICTURE_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一自增id',
  `PRODUCT_ID` bigint(20) unsigned DEFAULT NULL COMMENT '商品id',
  `IS_COVER` tinyint(2) DEFAULT '0' COMMENT '是否为封面',
  `PICTURE_URL` varchar(100) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`PICTURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_picture_0` */

/*Table structure for table `product_sku_0` */

DROP TABLE IF EXISTS `product_sku_0`;

CREATE TABLE `product_sku_0` (
  `SKU_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一自增id，唯一商品id',
  `PRODUCT_ID` bigint(20) unsigned DEFAULT NULL COMMENT '货品id',
  `SKU_BARCODE` varchar(50) DEFAULT NULL COMMENT '货品二维码',
  `SKU_UID` varchar(50) DEFAULT NULL COMMENT 'sku选项id串,json数组串',
  PRIMARY KEY (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_sku_0` */

/*Table structure for table `stock_0` */

DROP TABLE IF EXISTS `stock_0`;

CREATE TABLE `stock_0` (
  `STOCK_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `PRODUCT_ID` bigint(20) unsigned DEFAULT NULL COMMENT '货品ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '所属用户',
  `STOCK_NO` float DEFAULT NULL COMMENT '库存数目',
  `SKU_ID` bigint(20) DEFAULT NULL COMMENT '产品SKU_ID',
  `PRICE` float(7,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`STOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `stock_0` */

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `CAT_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `CAT_PID` bigint(20) unsigned DEFAULT '0' COMMENT '分类父ID',
  `CAT_NAME` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `CAT_ALIAS` varchar(200) DEFAULT NULL COMMENT '分类别名',
  `CAT_WERGHT` float(3,2) DEFAULT '1.00' COMMENT '分类权重',
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_category` */

insert  into `t_category`(`CAT_ID`,`CAT_PID`,`CAT_NAME`,`CAT_ALIAS`,`CAT_WERGHT`) values (1,0,'农业',NULL,2.00),(2,1,'农药',NULL,9.00),(3,1,'种子',NULL,8.00),(4,1,'化肥',NULL,7.00),(5,1,'农膜',NULL,6.00),(6,1,'农机具',NULL,5.00),(7,1,'其他',NULL,4.00),(8,0,'服装',NULL,1.00),(9,8,'男装',NULL,2.00),(10,8,'女装',NULL,1.00);

/*Table structure for table `t_category_brand` */

DROP TABLE IF EXISTS `t_category_brand`;

CREATE TABLE `t_category_brand` (
  `BRAND_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌',
  `CAT_ID` bigint(20) unsigned NOT NULL COMMENT '与分类的关系',
  `BRAND_NAME` varchar(50) DEFAULT NULL COMMENT '品牌名字',
  `BRAND_ALIAS` varchar(50) DEFAULT NULL COMMENT '品牌别名',
  `BRAND_INTRODUCE` varchar(200) DEFAULT NULL COMMENT '品牌介绍',
  `BRAND_LOGO` varchar(50) DEFAULT NULL COMMENT '品牌logo',
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_category_brand` */

insert  into `t_category_brand`(`BRAND_ID`,`CAT_ID`,`BRAND_NAME`,`BRAND_ALIAS`,`BRAND_INTRODUCE`,`BRAND_LOGO`) values (1,4,'金正大',NULL,NULL,NULL),(2,4,'史丹利',NULL,NULL,NULL);

/*Table structure for table `t_category_prop` */

DROP TABLE IF EXISTS `t_category_prop`;

CREATE TABLE `t_category_prop` (
  `PROP_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一自增ID',
  `PROP_PID` bigint(20) unsigned DEFAULT '0' COMMENT '子父关系ID',
  `PROP_NAME` varchar(200) DEFAULT NULL COMMENT '属性名称',
  `CAT_ID` bigint(20) unsigned DEFAULT NULL COMMENT '类目ID',
  PRIMARY KEY (`PROP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_category_prop` */

insert  into `t_category_prop`(`PROP_ID`,`PROP_PID`,`PROP_NAME`,`CAT_ID`) values (1,0,'颜色',4),(2,0,'尺寸',4),(3,0,'规格',4);

/*Table structure for table `t_prop_option` */

DROP TABLE IF EXISTS `t_prop_option`;

CREATE TABLE `t_prop_option` (
  `OPTION_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `OPTION_NAME` varchar(50) DEFAULT NULL COMMENT '选项名称',
  `PROP_ID` bigint(20) unsigned NOT NULL COMMENT '属性ID',
  PRIMARY KEY (`OPTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_prop_option` */

insert  into `t_prop_option`(`OPTION_ID`,`OPTION_NAME`,`PROP_ID`) values (1,'红色',1),(2,'黑色',1),(3,'XL',2),(4,'XXL',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
