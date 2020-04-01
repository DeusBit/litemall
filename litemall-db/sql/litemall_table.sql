-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: litemall
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `litemall_ad`
--

DROP TABLE IF EXISTS `litemall_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'Ad headline',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link to the advertised product page or event page',
  `url` varchar(255) NOT NULL COMMENT 'Advertising pictures',
  `position` tinyint(3) DEFAULT '1' COMMENT 'Advertising position: 1 is the home page',
  `content` varchar(255) DEFAULT '' COMMENT 'Activities',
  `start_time` datetime DEFAULT NULL COMMENT 'Ad start time',
  `end_time` datetime DEFAULT NULL COMMENT 'Ad end time',
  `enabled` tinyint(1) DEFAULT '0' COMMENT 'Whether to start',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Advertising Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_address`
--

DROP TABLE IF EXISTS `litemall_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'Consignee name',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User ID of user table',
  `province` varchar(63) NOT NULL COMMENT 'Province ID of administrative area table',
  `city` varchar(63) NOT NULL COMMENT 'City ID of the administrative area table',
  `county` varchar(63) NOT NULL COMMENT 'County ID of the administrative area table',
  `address_detail` varchar(127) NOT NULL DEFAULT '' COMMENT 'Detailed delivery address',
  `area_code` char(6) DEFAULT NULL COMMENT 'Area code',
  `postal_code` char(6) DEFAULT NULL COMMENT 'Postal code',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT 'Cellphone number',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the default address',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Delivery address table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_admin`
--

DROP TABLE IF EXISTS `litemall_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL DEFAULT '' COMMENT 'Administrator name',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT 'Administrator password',
  `last_login_ip` varchar(63) DEFAULT '' COMMENT 'Last login IP address',
  `last_login_time` datetime DEFAULT NULL COMMENT 'Last login time',
  `avatar` varchar(255) DEFAULT '''' COMMENT 'Avatar picture',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  `role_ids` varchar(127) DEFAULT '[]' COMMENT 'Role list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Administrator table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_aftersale`
--

DROP TABLE IF EXISTS `litemall_aftersale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_aftersale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aftersale_sn` varchar(63) DEFAULT NULL COMMENT 'After sales number',
  `order_id` int(11) NOT NULL COMMENT 'Order ID',
  `user_id` int(11) NOT NULL COMMENT 'User ID',
  `type` smallint(6) DEFAULT '0' COMMENT 'After-sales type, 0 is the refund of unreceived goods, 1 is the refund of the received goods (no need to return the goods), 2 users return the refund',
  `reason` varchar(31) DEFAULT '' COMMENT 'reason for return',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT 'Refund amount',
  `pictures` varchar(1023) DEFAULT '[]' COMMENT 'Refund voucher picture link array',
  `comment` varchar(511) DEFAULT '' COMMENT 'Refund instructions',
  `status` smallint(6) DEFAULT '0' COMMENT 'After-sales status, 0 is available for application, 1 is the user has applied, 2 is the administrator approval, 3 is the administrator refund success, 4 is the administrator rejection, 5 is the user has been canceled',
  `handle_time` datetime DEFAULT NULL COMMENT 'Administrator operation time',
  `add_time` datetime DEFAULT NULL COMMENT 'Add time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'After sales number',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='After-sales table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_brand`
--

DROP TABLE IF EXISTS `litemall_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Brand name',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT 'Brand introduction',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Brand picture of the brand page',
  `sort_order` tinyint(3) DEFAULT '50',
  `floor_price` decimal(10,2) DEFAULT '0.00' COMMENT 'The brand''s products are low-priced, only used for page display',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1046003 DEFAULT CHARSET=utf8mb4 COMMENT='Brand Business Form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_cart`
--

DROP TABLE IF EXISTS `litemall_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'User Table User ID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'Product ID of the product table',
  `goods_sn` varchar(63) DEFAULT NULL COMMENT 'Product Number',
  `goods_name` varchar(127) DEFAULT NULL COMMENT 'Product name',
  `product_id` int(11) DEFAULT NULL COMMENT 'Commodity ID of the commodity goods list',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT 'Price of goods',
  `number` smallint(5) DEFAULT '0' COMMENT 'Quantity of goods',
  `specifications` varchar(1023) DEFAULT NULL COMMENT 'Commodity specification value list, using JSON array format',
  `checked` tinyint(1) DEFAULT '1' COMMENT 'Whether the item in the shopping cart is selected',
  `pic_url` varchar(255) DEFAULT NULL COMMENT 'Product image or product image',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Shopping Cart Product List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_category`
--

DROP TABLE IF EXISTS `litemall_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'Category name',
  `keywords` varchar(1023) NOT NULL DEFAULT '' COMMENT 'Category keywords, in JSON array format',
  `desc` varchar(255) DEFAULT '' COMMENT 'Category slogan introduction',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent category ID',
  `icon_url` varchar(255) DEFAULT '' COMMENT 'Category icon',
  `pic_url` varchar(255) DEFAULT '' COMMENT '类目图片',
  `level` varchar(255) DEFAULT 'L1',
  `sort_order` tinyint(3) DEFAULT '50' COMMENT 'Sort',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1036007 DEFAULT CHARSET=utf8mb4 COMMENT='Category table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_collect`
--

DROP TABLE IF EXISTS `litemall_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User table User ID',
  `value_id` int(11) NOT NULL DEFAULT '0' COMMENT 'If type = 0, it is the product ID; if type = 1, it is the topic ID',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Collection type, if type = 0, it is the product ID; if type = 1, it is the topic ID',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Favorite Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_comment`
--

DROP TABLE IF EXISTS `litemall_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) NOT NULL DEFAULT '0' COMMENT 'If type = 0, it is a product review; if type = 1, it is a thematic review.',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Comment type, if type = 0, it is a product review; if it is type = 1, it is a thematic review;',
  `content` varchar(1023) NOT NULL COMMENT 'Comments',
  `admin_content` varchar(511) NOT NULL COMMENT 'Administrator reply content',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User table User ID',
  `has_picture` tinyint(1) DEFAULT '0' COMMENT 'Does it contain pictures',
  `pic_urls` varchar(1023) DEFAULT NULL COMMENT 'Image address list, using JSON array format',
  `star` smallint(6) DEFAULT '1' COMMENT 'score， 1-5',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `id_value` (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COMMENT='Comment form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_coupon`
--

DROP TABLE IF EXISTS `litemall_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL COMMENT 'Coupon name',
  `desc` varchar(127) DEFAULT '' COMMENT 'Coupon introduction, usually showing the text of coupon restrictions',
  `tag` varchar(63) DEFAULT '' COMMENT 'Coupon labels, such as for newcomers',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of coupons, if it is 0, it is unlimited',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT 'Discounted price',
  `min` decimal(10,2) DEFAULT '0.00' COMMENT 'Coupons can only be used with a minimum spending amount.',
  `limit` smallint(6) DEFAULT '1' COMMENT 'The number of users can receive coupons, if it is 0, it is not limited; the default is 1, which is limited to one coupon.',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon gift type, if it is 0, the general coupon will be collected by the user; if it is 1, it will be a registered coupon; if it is 2, it will be a coupon code redemption;',
  `status` smallint(6) DEFAULT '0' COMMENT 'Coupon status, if it is 0, it is normally available; if it is 1, it is expired; if it is 2, it is off the shelf.',
  `goods_type` smallint(6) DEFAULT '0' COMMENT 'Commodity restriction type, if 0 is all products, if it is 1, it is category restriction, if it is 2, it is product restriction',
  `goods_value` varchar(1023) DEFAULT '[]' COMMENT 'Commodity limit value, if goods_type is 0, it is an empty collection, if it is 1, it is a category collection, if it is 2, it is a commodity collection.',
  `code` varchar(63) DEFAULT NULL COMMENT 'Coupon redemption code',
  `time_type` smallint(6) DEFAULT '0' COMMENT 'Effective time limit, if it is 0, it is based on the number of days of validity of the collection time; if it is 1, then start_time and end_time are the coupon validity period',
  `days` smallint(6) DEFAULT '0' COMMENT 'Effective days based on the time of receipt.',
  `start_time` datetime DEFAULT NULL COMMENT 'Coupon start time',
  `end_time` datetime DEFAULT NULL COMMENT 'Coupon deadline',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='Coupon information and rules table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_coupon_user`
--

DROP TABLE IF EXISTS `litemall_coupon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'User ID',
  `coupon_id` int(11) NOT NULL COMMENT 'Coupon ID',
  `status` smallint(6) DEFAULT '0' COMMENT 'Usage status, if it is 0, it is not used; if it is 1, it is used; if it is 2, it has expired; if it is 3, it has been discontinued;',
  `used_time` datetime DEFAULT NULL COMMENT 'usage time',
  `start_time` datetime DEFAULT NULL COMMENT 'Effective period start time',
  `end_time` datetime DEFAULT NULL COMMENT 'Deadline of validity',
  `order_id` int(11) DEFAULT NULL COMMENT 'Order ID',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Coupon user usage form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_feedback`
--

DROP TABLE IF EXISTS `litemall_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User table User ID',
  `username` varchar(63) NOT NULL DEFAULT '' COMMENT 'user name',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT 'phone number',
  `feed_type` varchar(63) NOT NULL DEFAULT '' COMMENT 'Feedback type',
  `content` varchar(1023) NOT NULL COMMENT 'Feedback content',
  `status` int(3) NOT NULL DEFAULT '0' COMMENT 'status',
  `has_picture` tinyint(1) DEFAULT '0' COMMENT 'Does it contain pictures',
  `pic_urls` varchar(1023) DEFAULT NULL COMMENT 'Picture address list, using JSON array format',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `id_value` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Feedback form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_footprint`
--

DROP TABLE IF EXISTS `litemall_footprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User table User ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Browse product ID',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User browses footprint table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_goods`
--

DROP TABLE IF EXISTS `litemall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT 'Product Number',
  `name` varchar(127) NOT NULL DEFAULT '' COMMENT 'Product name',
  `category_id` int(11) DEFAULT '0' COMMENT 'Category ID of the product',
  `brand_id` int(11) DEFAULT '0',
  `gallery` varchar(1023) DEFAULT NULL COMMENT 'List of product promotion pictures in JSON array format',
  `keywords` varchar(255) DEFAULT '' COMMENT 'Commodity keywords, separated by commas',
  `brief` varchar(255) DEFAULT '' COMMENT 'Product Description',
  `is_on_sale` tinyint(1) DEFAULT '1' COMMENT 'Whether it is on the shelf',
  `sort_order` smallint(4) DEFAULT '100',
  `pic_url` varchar(255) DEFAULT NULL COMMENT 'Commodity page commodity picture',
  `share_url` varchar(255) DEFAULT NULL COMMENT 'Commodity sharing circle of friends pictures',
  `is_new` tinyint(1) DEFAULT '0' COMMENT 'Whether it is a new product launch, if set, it can be displayed on the new product launch page',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT 'Whether it is popular, if it is set, it can be displayed on the popular recommendation page',
  `unit` varchar(31) DEFAULT 'Cases' COMMENT 'Commodity units, such as pieces, boxes',
  `counter_price` decimal(10,2) DEFAULT '0.00' COMMENT 'Counter price',
  `retail_price` decimal(10,2) DEFAULT '100000.00' COMMENT 'retail price',
  `detail` text COMMENT 'Product details, in rich text format',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1181004 DEFAULT CHARSET=utf8mb4 COMMENT='Commodity basic information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_goods_attribute`
--

DROP TABLE IF EXISTS `litemall_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Product ID of the product table',
  `attribute` varchar(255) NOT NULL COMMENT 'Product parameter name',
  `value` varchar(255) NOT NULL COMMENT 'Commodity parameter value',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=877 DEFAULT CHARSET=utf8mb4 COMMENT='Commodity parameter table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_goods_product`
--

DROP TABLE IF EXISTS `litemall_goods_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_goods_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Product ID of the product table',
  `specifications` varchar(1023) NOT NULL COMMENT 'Commodity specification value list, using JSON array format',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Commodity price',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT 'Quantity of goods',
  `url` varchar(125) DEFAULT NULL COMMENT 'Commodity Picture',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COMMENT='Commodity list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_goods_specification`
--

DROP TABLE IF EXISTS `litemall_goods_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_goods_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Product ID of the product table',
  `specification` varchar(255) NOT NULL DEFAULT '' COMMENT 'Product specification name',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Product specifications',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Product Specification Picture',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COMMENT='Product specification table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_groupon`
--

DROP TABLE IF EXISTS `litemall_groupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_groupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'The associated Order ID',
  `groupon_id` int(11) DEFAULT '0' COMMENT 'If it is a group user, groupon_id is 0; if it is a group user, groupon_id is the group purchase activity ID',
  `rules_id` int(11) NOT NULL COMMENT 'Group purchase rule ID, associated with the IDmall_groupon_rules table ID field',
  `user_id` int(11) NOT NULL COMMENT 'User ID',
  `share_url` varchar(255) DEFAULT NULL COMMENT 'Group purchase share picture address',
  `creator_user_id` int(11) NOT NULL COMMENT 'Open group User ID',
  `creator_user_time` datetime DEFAULT NULL COMMENT 'Departure time',
  `status` smallint(6) DEFAULT '0' COMMENT 'Group purchase activity status, 0 for unopened group, 1 for open group, 2 for open group',
  `add_time` datetime NOT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Group purchase activity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_groupon_rules`
--

DROP TABLE IF EXISTS `litemall_groupon_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_groupon_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT 'Product ID of the product table',
  `goods_name` varchar(127) NOT NULL COMMENT 'Product name',
  `pic_url` varchar(255) DEFAULT NULL COMMENT 'Product image or product image',
  `discount` decimal(63,0) NOT NULL COMMENT 'Discounted price',
  `discount_member` int(11) NOT NULL COMMENT 'Number of people who meet the preferential conditions',
  `expire_time` datetime DEFAULT NULL COMMENT 'Group purchase expiration time',
  `status` smallint(6) DEFAULT '0' COMMENT 'Group purchase rule status, normal online is 0, automatic expiry is 1 when expiring, and manual manual is 2',
  `add_time` datetime NOT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Group purchase rules table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_issue`
--

DROP TABLE IF EXISTS `litemall_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL COMMENT 'Question title',
  `answer` varchar(255) DEFAULT NULL COMMENT 'Answer',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='FAQ table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_keyword`
--

DROP TABLE IF EXISTS `litemall_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(127) NOT NULL DEFAULT '' COMMENT 'Keyword',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Keyword jump link',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is it a popular keyword',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is it the default keyword',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT 'Sort',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Keyword list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_log`
--

DROP TABLE IF EXISTS `litemall_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'administrator',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Administrator address',
  `type` int(11) DEFAULT NULL COMMENT 'Operation classification',
  `action` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Action',
  `status` tinyint(1) DEFAULT NULL COMMENT 'Operation status',
  `result` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Operation result，or success message, or failure message',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Additional information',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Operation log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_notice`
--

DROP TABLE IF EXISTS `litemall_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(63) DEFAULT NULL COMMENT 'Notification title',
  `content` varchar(511) DEFAULT NULL COMMENT 'Notification content',
  `admin_id` int(11) DEFAULT '0' COMMENT 'The administrator ID that created the notification, or 0 if it is a built-in notification',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Notification Form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_notice_admin`
--

DROP TABLE IF EXISTS `litemall_notice_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_notice_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) DEFAULT NULL COMMENT 'Notification ID',
  `notice_title` varchar(63) DEFAULT NULL COMMENT 'Notification title',
  `admin_id` int(11) DEFAULT NULL COMMENT 'Administrator ID to receive notification',
  `read_time` datetime DEFAULT NULL COMMENT 'Reading time, if it is NULL, it is unread',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Notify Administrator Form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_order`
--

DROP TABLE IF EXISTS `litemall_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'User table User ID',
  `order_sn` varchar(63) NOT NULL COMMENT 'Order number',
  `order_status` smallint(6) NOT NULL COMMENT 'Order Status',
  `aftersale_status` smallint(6) DEFAULT '0' COMMENT 'After-sales status, 0 is available for application, 1 is the user has applied, 2 is the administrator approval, 3 is the administrator refund success, 4 is the administrator rejection, 5 is the user has been canceled',
  `consignee` varchar(63) NOT NULL COMMENT 'Consignee name',
  `mobile` varchar(63) NOT NULL COMMENT 'Consignee mobile phone number',
  `address` varchar(127) NOT NULL COMMENT 'Delivery specific address',
  `message` varchar(512) NOT NULL DEFAULT '' COMMENT 'User order message',
  `goods_price` decimal(10,2) NOT NULL COMMENT 'Total cost of goods',
  `freight_price` decimal(10,2) NOT NULL COMMENT 'Shipping fees',
  `coupon_price` decimal(10,2) NOT NULL COMMENT 'Coupon reduction',
  `integral_price` decimal(10,2) NOT NULL COMMENT 'User Points Reduction',
  `groupon_price` decimal(10,2) NOT NULL COMMENT 'Group purchase discount',
  `order_price` decimal(10,2) NOT NULL COMMENT 'Order fee, = goods_price + freight_price-coupon_price',
  `actual_price` decimal(10,2) NOT NULL COMMENT 'Actual cost, = order_price-integral_price',
  `pay_id` varchar(63) DEFAULT NULL COMMENT 'WeChat payment number',
  `pay_time` datetime DEFAULT NULL COMMENT 'WeChat payment time',
  `ship_sn` varchar(63) DEFAULT NULL COMMENT 'Delivery number',
  `ship_channel` varchar(63) DEFAULT NULL COMMENT 'Delivery Courier',
  `ship_time` datetime DEFAULT NULL COMMENT 'Delivery start time',
  `refund_amount` decimal(10,2) DEFAULT NULL COMMENT 'The actual refund amount, (it is possible that the refund amount is less than the actual payment amount)',
  `refund_type` varchar(63) DEFAULT NULL COMMENT 'Refund method',
  `refund_content` varchar(127) DEFAULT NULL COMMENT 'Refund notes',
  `refund_time` datetime DEFAULT NULL COMMENT 'Refund time',
  `confirm_time` datetime DEFAULT NULL COMMENT 'The user confirms the receipt time',
  `comments` smallint(6) DEFAULT '0' COMMENT 'Number of items to be evaluated',
  `end_time` datetime DEFAULT NULL COMMENT 'Order closing time',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Order form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_order_goods`
--

DROP TABLE IF EXISTS `litemall_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Order ID of the order form',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Product ID of the product table',
  `goods_name` varchar(127) NOT NULL DEFAULT '' COMMENT 'Product name',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT 'Product Number',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Commodity ID of the commodity goods list',
  `number` smallint(5) NOT NULL DEFAULT '0' COMMENT 'Quantity of goods purchased',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Commodity price',
  `specifications` varchar(1023) NOT NULL COMMENT 'Product specifications list',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Product picture or product picture',
  `comment` int(11) DEFAULT '0' COMMENT 'Order product reviews, if it is -1, it can not be overdue for evaluation; if it is 0, it can be evaluated; if other values, it is the comment ID in the comment table.',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Order product list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_permission`
--

DROP TABLE IF EXISTS `litemall_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT 'Role ID',
  `permission` varchar(63) DEFAULT NULL COMMENT 'Authority',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='Permissions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_region`
--

DROP TABLE IF EXISTS `litemall_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The parent ID of the administrative area, for example, the pid of the district and county points to the city, the pid of the city points to the province, and the pid of the province is 0',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT 'Administrative area name',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'The type of administrative area, such as 1, it is a province, if it is 2, it is a city, if it is 3, it is a district or county',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT 'Administrative region code',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`),
  KEY `region_type` (`type`),
  KEY `agency_id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8mb4 COMMENT='Administrative area table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_role`
--

DROP TABLE IF EXISTS `litemall_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL COMMENT 'Role Name',
  `desc` varchar(1023) DEFAULT NULL COMMENT 'Role description',
  `enabled` tinyint(1) DEFAULT '1' COMMENT 'Whether to enable',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='Role table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_search_history`
--

DROP TABLE IF EXISTS `litemall_search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_search_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'User table User ID',
  `keyword` varchar(63) NOT NULL COMMENT 'search for the keyword',
  `from` varchar(63) NOT NULL DEFAULT '' COMMENT 'Search source, such as pc, wx, app',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Search history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_storage`
--

DROP TABLE IF EXISTS `litemall_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(63) NOT NULL COMMENT 'The unique index of the file',
  `name` varchar(255) NOT NULL COMMENT 'file name',
  `type` varchar(20) NOT NULL COMMENT 'file type',
  `size` int(11) NOT NULL COMMENT 'File size',
  `url` varchar(255) DEFAULT NULL COMMENT 'File access link',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='File storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_system`
--

DROP TABLE IF EXISTS `litemall_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) NOT NULL COMMENT 'System configuration name',
  `key_value` varchar(255) NOT NULL COMMENT 'System configuration value',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='System configuration table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_topic`
--

DROP TABLE IF EXISTS `litemall_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''' COMMENT 'Topic title',
  `subtitle` varchar(255) DEFAULT '''' COMMENT 'Topic subtitle',
  `content` text COMMENT 'Thematic content, rich text format',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT 'The lowest price of topic-related products',
  `read_count` varchar(255) DEFAULT '1k' COMMENT 'Thematic reading',
  `pic_url` varchar(255) DEFAULT '' COMMENT 'Thematic pictures',
  `sort_order` int(11) DEFAULT '100' COMMENT 'Sort',
  `goods` varchar(1023) DEFAULT '' COMMENT 'Topic related products, using JSON array format',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COMMENT='Thematic table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `litemall_user`
--

DROP TABLE IF EXISTS `litemall_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litemall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL COMMENT 'user name',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT 'user password',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Gender: 0 unknown, 1 male, 1 female',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT 'Last login time',
  `last_login_ip` varchar(63) NOT NULL DEFAULT '' COMMENT 'Last login IP address',
  `user_level` tinyint(3) DEFAULT '0' COMMENT '0 Ordinary users, 1 VIP users, 2 advanced VIP users',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT 'User nickname or network name',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT 'User phone number',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT 'User avatar picture',
-- TODO Use social id to instead of this to link user to social table(TODO add the table)
  `weixin_openid` varchar(63) NOT NULL DEFAULT '' COMMENT 'WeChat login openid',
  `session_key` varchar(100) NOT NULL DEFAULT '' COMMENT 'WeChat login session KEY',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 available, 1 disabled, 2 logout',
  `add_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'Tombstone',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='user table';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16 23:12:57
