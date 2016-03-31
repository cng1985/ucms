-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.40 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 iwandb 的数据库结构
DROP DATABASE IF EXISTS `iwandb`;
CREATE DATABASE IF NOT EXISTS `iwandb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iwandb`;


-- 导出  表 iwandb.activity 结构
DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `note` longtext,
  `catalog_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eutq9y5b158l68boor28tuttk` (`catalog_id`),
  KEY `FK_diwfgyhcm1yt2d0o6jr9j3hrm` (`user_id`),
  CONSTRAINT `FK_diwfgyhcm1yt2d0o6jr9j3hrm` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_eutq9y5b158l68boor28tuttk` FOREIGN KEY (`catalog_id`) REFERENCES `activity_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.activity 的数据：~0 rows (大约)
DELETE FROM `activity`;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;


-- 导出  表 iwandb.activity_catalog 结构
DROP TABLE IF EXISTS `activity_catalog`;
CREATE TABLE IF NOT EXISTS `activity_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m4sicbxobk3sivp7ihvjfk0qv` (`pid`),
  CONSTRAINT `FK_m4sicbxobk3sivp7ihvjfk0qv` FOREIGN KEY (`pid`) REFERENCES `activity_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.activity_catalog 的数据：~0 rows (大约)
DELETE FROM `activity_catalog`;
/*!40000 ALTER TABLE `activity_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_catalog` ENABLE KEYS */;


-- 导出  表 iwandb.album_album 结构
DROP TABLE IF EXISTS `album_album`;
CREATE TABLE IF NOT EXISTS `album_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lvarlpw2uby4sfnmths3kime5` (`user_id`),
  CONSTRAINT `FK_lvarlpw2uby4sfnmths3kime5` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_album 的数据：~0 rows (大约)
DELETE FROM `album_album`;
/*!40000 ALTER TABLE `album_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_album` ENABLE KEYS */;


-- 导出  表 iwandb.album_category 结构
DROP TABLE IF EXISTS `album_category`;
CREATE TABLE IF NOT EXISTS `album_category` (
  `id` varchar(255) NOT NULL,
  `atime` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `cover_temp` varchar(255) DEFAULT NULL,
  `icover` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_category 的数据：~0 rows (大约)
DELETE FROM `album_category`;
/*!40000 ALTER TABLE `album_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_category` ENABLE KEYS */;


-- 导出  表 iwandb.album_feed 结构
DROP TABLE IF EXISTS `album_feed`;
CREATE TABLE IF NOT EXISTS `album_feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_j4rqppt0mtj4oxp6ohlh7mivs` (`user_id`),
  CONSTRAINT `FK_j4rqppt0mtj4oxp6ohlh7mivs` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_feed 的数据：~0 rows (大约)
DELETE FROM `album_feed`;
/*!40000 ALTER TABLE `album_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_feed` ENABLE KEYS */;


-- 导出  表 iwandb.album_photo 结构
DROP TABLE IF EXISTS `album_photo`;
CREATE TABLE IF NOT EXISTS `album_photo` (
  `id` varchar(255) NOT NULL,
  `addDate` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m59hkeaiwek2sq1mks8360eyd` (`img`),
  KEY `FK_4w0a9x50nb16vv2he99jowdpc` (`album_id`),
  KEY `FK_hjt7tua1pry915x946ln5w05a` (`category_id`),
  KEY `FK_ryvhg7op636r2kja0je3x4iod` (`user_id`),
  CONSTRAINT `FK_ryvhg7op636r2kja0je3x4iod` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_4w0a9x50nb16vv2he99jowdpc` FOREIGN KEY (`album_id`) REFERENCES `album_album` (`id`),
  CONSTRAINT `FK_hjt7tua1pry915x946ln5w05a` FOREIGN KEY (`category_id`) REFERENCES `album_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_photo 的数据：~0 rows (大约)
DELETE FROM `album_photo`;
/*!40000 ALTER TABLE `album_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_photo` ENABLE KEYS */;


-- 导出  表 iwandb.album_photo_feeds 结构
DROP TABLE IF EXISTS `album_photo_feeds`;
CREATE TABLE IF NOT EXISTS `album_photo_feeds` (
  `album_feed_id` bigint(20) NOT NULL,
  `photos_id` varchar(255) NOT NULL,
  PRIMARY KEY (`album_feed_id`,`photos_id`),
  KEY `FK_ccdy0adi5ws1flwqw7jyb5xta` (`photos_id`),
  CONSTRAINT `FK_ibdcop6altelvfn5te0m7yq84` FOREIGN KEY (`album_feed_id`) REFERENCES `album_feed` (`id`),
  CONSTRAINT `FK_ccdy0adi5ws1flwqw7jyb5xta` FOREIGN KEY (`photos_id`) REFERENCES `album_photo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_photo_feeds 的数据：~0 rows (大约)
DELETE FROM `album_photo_feeds`;
/*!40000 ALTER TABLE `album_photo_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_photo_feeds` ENABLE KEYS */;


-- 导出  表 iwandb.album_photo_tags 结构
DROP TABLE IF EXISTS `album_photo_tags`;
CREATE TABLE IF NOT EXISTS `album_photo_tags` (
  `album_photo_id` varchar(255) NOT NULL,
  `tags_name` varchar(255) NOT NULL,
  PRIMARY KEY (`album_photo_id`,`tags_name`),
  KEY `FK_nqlnookme96kg2qdyo3hu6852` (`tags_name`),
  CONSTRAINT `FK_n5e3un0lgisd6fmr8yf4cu1lb` FOREIGN KEY (`album_photo_id`) REFERENCES `album_photo` (`id`),
  CONSTRAINT `FK_nqlnookme96kg2qdyo3hu6852` FOREIGN KEY (`tags_name`) REFERENCES `album_tag` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_photo_tags 的数据：~0 rows (大约)
DELETE FROM `album_photo_tags`;
/*!40000 ALTER TABLE `album_photo_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_photo_tags` ENABLE KEYS */;


-- 导出  表 iwandb.album_tag 结构
DROP TABLE IF EXISTS `album_tag`;
CREATE TABLE IF NOT EXISTS `album_tag` (
  `name` varchar(255) NOT NULL,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.album_tag 的数据：~0 rows (大约)
DELETE FROM `album_tag`;
/*!40000 ALTER TABLE `album_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_tag` ENABLE KEYS */;


-- 导出  表 iwandb.article 结构
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `exts` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ups` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_37o0u6k8xxsib82998csxpos8` (`catalog_id`),
  KEY `FK_tcgc5bv7iarylc19wy17n3r6c` (`user_id`),
  CONSTRAINT `FK_tcgc5bv7iarylc19wy17n3r6c` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_37o0u6k8xxsib82998csxpos8` FOREIGN KEY (`catalog_id`) REFERENCES `article_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.article 的数据：~0 rows (大约)
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- 导出  表 iwandb.article_catalog 结构
DROP TABLE IF EXISTS `article_catalog`;
CREATE TABLE IF NOT EXISTS `article_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `nums` bigint(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_toxqv5vpba5himteqsb27tn4n` (`pid`),
  CONSTRAINT `FK_toxqv5vpba5himteqsb27tn4n` FOREIGN KEY (`pid`) REFERENCES `article_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.article_catalog 的数据：~0 rows (大约)
DELETE FROM `article_catalog`;
/*!40000 ALTER TABLE `article_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_catalog` ENABLE KEYS */;


-- 导出  表 iwandb.article_comment 结构
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE IF NOT EXISTS `article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `articleid` bigint(20) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qu0inbk09l2sglvyjnvftwc2g` (`article_id`),
  KEY `FK_brnnhj1u0lbcc9r3smwgbsdpo` (`user_id`),
  CONSTRAINT `FK_brnnhj1u0lbcc9r3smwgbsdpo` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_qu0inbk09l2sglvyjnvftwc2g` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.article_comment 的数据：~0 rows (大约)
DELETE FROM `article_comment`;
/*!40000 ALTER TABLE `article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_comment` ENABLE KEYS */;


-- 导出  表 iwandb.article_link_tag 结构
DROP TABLE IF EXISTS `article_link_tag`;
CREATE TABLE IF NOT EXISTS `article_link_tag` (
  `article_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_id`,`tags_id`),
  KEY `FK_tnow9uj5bhcwb6wsbvk94nodq` (`tags_id`),
  CONSTRAINT `FK_c4ayi2ivva0imue7fnomufjlw` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_tnow9uj5bhcwb6wsbvk94nodq` FOREIGN KEY (`tags_id`) REFERENCES `article_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.article_link_tag 的数据：~0 rows (大约)
DELETE FROM `article_link_tag`;
/*!40000 ALTER TABLE `article_link_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_link_tag` ENABLE KEYS */;


-- 导出  表 iwandb.article_tag 结构
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.article_tag 的数据：~0 rows (大约)
DELETE FROM `article_tag`;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;


-- 导出  表 iwandb.friendlink 结构
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE IF NOT EXISTS `friendlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.friendlink 的数据：~0 rows (大约)
DELETE FROM `friendlink`;
/*!40000 ALTER TABLE `friendlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendlink` ENABLE KEYS */;


-- 导出  表 iwandb.menu 结构
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g3j78mw4mbi5gtex1tod3q57h` (`pid`),
  CONSTRAINT `FK_g3j78mw4mbi5gtex1tod3q57h` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.menu 的数据：~21 rows (大约)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `addDate`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `icon`, `path`, `pid`) VALUES
	(1, NULL, '1', NULL, 1, 1, '一级菜单', 44, 16, 'menu-icon fa fa-angle-right ', '', NULL),
	(49, NULL, '1,49', NULL, 2, 4, '文章管理', 11, 0, 'menu-icon fa fa-angle-right ', '', 1),
	(50, NULL, '1,49,50', NULL, 3, 5, '文章管理', 6, 0, 'menu-icon fa fa-angle-right ', 'admin/article/list.htm', 49),
	(51, NULL, '1,49,51', NULL, 3, 7, '文章分类管理', 8, 0, 'menu-icon fa fa-angle-right ', 'admin/article_catalog/list.htm', 49),
	(52, NULL, '1,49,52', NULL, 3, 9, '标签管理', 10, 0, 'menu-icon fa fa-angle-right ', 'admin/articletags/view_list.htm', 49),
	(53, NULL, '1,53', NULL, 2, 12, '用户管理', 13, 0, 'menu-icon fa fa-angle-right ', 'admin/users/list.htm', 1),
	(54, NULL, '1,54', NULL, 2, 14, '系统管理', 19, 0, 'menu-icon fa fa-angle-right ', '', 1),
	(55, NULL, '1,54,55', NULL, 3, 15, '友情链接', 16, 0, 'menu-icon fa fa-angle-right ', 'admin/friendlinks/view_list.htm', 54),
	(56, '2016-03-12 22:42:50', '1,54,56', '2016-03-12 22:42:50', 3, 17, '菜单管理', 18, 1, 'menu-icon fa fa-angle-right ', 'admin/menu/list.htm', 54),
	(57, '2016-03-12 22:43:04', '1,57', '2016-03-12 22:43:04', 2, 20, '股票管理', 27, NULL, 'menu-icon fa fa-angle-right ', '', 1),
	(58, '2016-03-12 22:43:47', '1,57,58', '2016-03-12 22:43:47', 3, 21, '每日记录', 22, 1, 'menu-icon fa fa-angle-right', 'admin/stockday/view_list.htm', 57),
	(60, '2016-03-12 22:44:50', '1,57,60', '2016-03-12 22:44:50', 3, 23, '股票管理', 24, NULL, 'menu-icon fa fa-angle-right ', 'admin/stock/view_list.htm', 57),
	(61, '2016-03-12 22:57:21', '1,57,61', '2016-03-12 22:57:21', 3, 25, '股票价格记录', 26, NULL, 'menu-icon fa fa-angle-right ', 'admin/stockdetail/view_list.htm', 57),
	(62, '2016-03-21 23:00:34', '1,62', '2016-03-21 23:00:34', 2, 28, '问答管理', 35, NULL, 'menu-icon fa fa-angle-right ', '', 1),
	(63, '2016-03-21 23:00:55', '1,62,63', '2016-03-21 23:00:55', 3, 29, '问答分类管理', 30, NULL, 'menu-icon fa fa-angle-right ', 'admin/questioncatalog/view_list.htm', 62),
	(64, '2016-03-27 21:12:54', '1,62,64', '2016-03-27 21:12:54', 3, 31, '问答管理', 32, NULL, 'menu-icon fa fa-angle-right ', 'admin/question/view_list.htm', 62),
	(65, '2016-03-27 21:13:22', '1,62,65', '2016-03-27 21:13:22', 3, 33, '回答管理', 34, NULL, 'menu-icon fa fa-angle-right ', 'admin/questionanswer/view_list.htm', 62),
	(66, '2016-03-27 21:24:42', '1,66', '2016-03-27 21:24:42', 2, 36, '照片管理', 43, NULL, 'menu-icon fa fa-angle-right ', '', 1),
	(67, '2016-03-27 21:50:00', '1,66,67', '2016-03-27 21:50:00', 3, 37, '照片管理', 38, NULL, 'menu-icon fa fa-angle-right ', 'admin/photo/view_list.htm', 66),
	(68, '2016-03-27 21:50:33', '1,66,68', '2016-03-27 21:50:33', 3, 39, '相册管理', 40, NULL, 'menu-icon fa fa-angle-right ', 'admin/album/view_list.htm', 66),
	(69, '2016-03-27 21:50:54', '1,66,69', '2016-03-27 21:50:54', 3, 41, '分类管理', 42, NULL, 'menu-icon fa fa-angle-right ', 'admin/category/view_list.htm', 66);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- 导出  表 iwandb.plugin_config 结构
DROP TABLE IF EXISTS `plugin_config`;
CREATE TABLE IF NOT EXISTS `plugin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `isEnabled` bit(1) NOT NULL,
  `pluginId` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d80yc0eis8aaqm59fnxc5rs0l` (`pluginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.plugin_config 的数据：~0 rows (大约)
DELETE FROM `plugin_config`;
/*!40000 ALTER TABLE `plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_config` ENABLE KEYS */;


-- 导出  表 iwandb.plugin_config_attribute 结构
DROP TABLE IF EXISTS `plugin_config_attribute`;
CREATE TABLE IF NOT EXISTS `plugin_config_attribute` (
  `PluginConfig_id` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`PluginConfig_id`,`name`),
  CONSTRAINT `FK_j9ehw8bx1uvrj21f4wr4vlnl6` FOREIGN KEY (`PluginConfig_id`) REFERENCES `plugin_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.plugin_config_attribute 的数据：~0 rows (大约)
DELETE FROM `plugin_config_attribute`;
/*!40000 ALTER TABLE `plugin_config_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_config_attribute` ENABLE KEYS */;


-- 导出  表 iwandb.question 结构
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `answers` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `favorites` int(11) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_luadcq65aplncgg8oka5nhbwh` (`catalog_id`),
  KEY `FK_d8yajt6iqqcq52d7x70p6hvi9` (`userid`),
  CONSTRAINT `FK_d8yajt6iqqcq52d7x70p6hvi9` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_luadcq65aplncgg8oka5nhbwh` FOREIGN KEY (`catalog_id`) REFERENCES `question_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question 的数据：~0 rows (大约)
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- 导出  表 iwandb.question_answer 结构
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE IF NOT EXISTS `question_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ups` int(11) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1i8u28d6ugyv29hh66rsx2s99` (`question_id`),
  KEY `FK_7lh95q9sqwdo70amfuoyct7dl` (`userid`),
  CONSTRAINT `FK_7lh95q9sqwdo70amfuoyct7dl` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_1i8u28d6ugyv29hh66rsx2s99` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_answer 的数据：~0 rows (大约)
DELETE FROM `question_answer`;
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;


-- 导出  表 iwandb.question_catalog 结构
DROP TABLE IF EXISTS `question_catalog`;
CREATE TABLE IF NOT EXISTS `question_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nums` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_glylgagm288q4ulw32j9dcyog` (`pid`),
  CONSTRAINT `FK_glylgagm288q4ulw32j9dcyog` FOREIGN KEY (`pid`) REFERENCES `question_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_catalog 的数据：~0 rows (大约)
DELETE FROM `question_catalog`;
/*!40000 ALTER TABLE `question_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_catalog` ENABLE KEYS */;


-- 导出  表 iwandb.question_favorite 结构
DROP TABLE IF EXISTS `question_favorite`;
CREATE TABLE IF NOT EXISTS `question_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5n7qqcb2o5fegw97t8r20qvrg` (`question_id`),
  KEY `FK_h2bqv2l9y99ualn76enbxb321` (`userid`),
  CONSTRAINT `FK_h2bqv2l9y99ualn76enbxb321` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_5n7qqcb2o5fegw97t8r20qvrg` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_favorite 的数据：~0 rows (大约)
DELETE FROM `question_favorite`;
/*!40000 ALTER TABLE `question_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_favorite` ENABLE KEYS */;


-- 导出  表 iwandb.question_points 结构
DROP TABLE IF EXISTS `question_points`;
CREATE TABLE IF NOT EXISTS `question_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `adownvotes` int(11) DEFAULT NULL,
  `aposts` int(11) DEFAULT NULL,
  `aselecteds` int(11) DEFAULT NULL,
  `aselects` int(11) DEFAULT NULL,
  `aupvotes` int(11) DEFAULT NULL,
  `avoteds` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `cposts` int(11) DEFAULT NULL,
  `downvoteds` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `qdownvotes` int(11) DEFAULT NULL,
  `qposts` int(11) DEFAULT NULL,
  `qupvotes` int(11) DEFAULT NULL,
  `qvoteds` int(11) DEFAULT NULL,
  `upvoteds` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_j9adb1oc832xs0gvrexcntnxw` (`user_id`),
  CONSTRAINT `FK_j9adb1oc832xs0gvrexcntnxw` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_points 的数据：~0 rows (大约)
DELETE FROM `question_points`;
/*!40000 ALTER TABLE `question_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_points` ENABLE KEYS */;


-- 导出  表 iwandb.question_tag 结构
DROP TABLE IF EXISTS `question_tag`;
CREATE TABLE IF NOT EXISTS `question_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_72eddk8u7mq3adgulp9jmn8xn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_tag 的数据：~0 rows (大约)
DELETE FROM `question_tag`;
/*!40000 ALTER TABLE `question_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_tag` ENABLE KEYS */;


-- 导出  表 iwandb.question_vote 结构
DROP TABLE IF EXISTS `question_vote`;
CREATE TABLE IF NOT EXISTS `question_vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flag` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_30lqw8fd3sv5y4epor2rtckni` (`answer_id`),
  KEY `FK_jvrq62on9l4rhtvp71hvwy72r` (`userid`),
  CONSTRAINT `FK_jvrq62on9l4rhtvp71hvwy72r` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_30lqw8fd3sv5y4epor2rtckni` FOREIGN KEY (`answer_id`) REFERENCES `question_answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_vote 的数据：~0 rows (大约)
DELETE FROM `question_vote`;
/*!40000 ALTER TABLE `question_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_vote` ENABLE KEYS */;


-- 导出  表 iwandb.question_word 结构
DROP TABLE IF EXISTS `question_word`;
CREATE TABLE IF NOT EXISTS `question_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `contentcount` int(11) DEFAULT NULL,
  `tagcount` int(11) DEFAULT NULL,
  `tagwordcount` int(11) DEFAULT NULL,
  `titlecount` int(11) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.question_word 的数据：~0 rows (大约)
DELETE FROM `question_word`;
/*!40000 ALTER TABLE `question_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_word` ENABLE KEYS */;


-- 导出  表 iwandb.stock 结构
DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `bvps` float NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `eps` float NOT NULL,
  `fixedassets` float NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `liquidassets` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `outstanding` float NOT NULL,
  `pb` float NOT NULL,
  `pe` float NOT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `pinyinHead` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `reserved` float NOT NULL,
  `reservedpershare` float NOT NULL,
  `timetomarket` datetime DEFAULT NULL,
  `totalassets` float NOT NULL,
  `totals` float NOT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_by13tliqb2rowq8kgawcxy8a` (`catalog_id`),
  CONSTRAINT `FK_by13tliqb2rowq8kgawcxy8a` FOREIGN KEY (`catalog_id`) REFERENCES `stock_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock 的数据：~0 rows (大约)
DELETE FROM `stock`;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


-- 导出  表 iwandb.stock_catalog 结构
DROP TABLE IF EXISTS `stock_catalog`;
CREATE TABLE IF NOT EXISTS `stock_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ls3daudeuwkcu9x9jo0ld20bh` (`pid`),
  CONSTRAINT `FK_ls3daudeuwkcu9x9jo0ld20bh` FOREIGN KEY (`pid`) REFERENCES `stock_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_catalog 的数据：~0 rows (大约)
DELETE FROM `stock_catalog`;
/*!40000 ALTER TABLE `stock_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_catalog` ENABLE KEYS */;


-- 导出  表 iwandb.stock_day 结构
DROP TABLE IF EXISTS `stock_day`;
CREATE TABLE IF NOT EXISTS `stock_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `OpenningPrice` float NOT NULL,
  `auctionPrice` float NOT NULL,
  `buyFive` float NOT NULL,
  `buyFivePrice` float NOT NULL,
  `buyFour` float NOT NULL,
  `buyFourPrice` float NOT NULL,
  `buyOne` float NOT NULL,
  `buyOnePrice` float NOT NULL,
  `buyThree` float NOT NULL,
  `buyThreePrice` float NOT NULL,
  `buyTwo` float NOT NULL,
  `buyTwoPrice` float NOT NULL,
  `closingPrice` float NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `competitivePrice` float NOT NULL,
  `currentPrice` float NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `hPrice` float NOT NULL,
  `lPrice` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sellFive` float NOT NULL,
  `sellFivePrice` float NOT NULL,
  `sellFour` float NOT NULL,
  `sellFourPrice` float NOT NULL,
  `sellOne` float NOT NULL,
  `sellOnePrice` float NOT NULL,
  `sellThree` float NOT NULL,
  `sellThreePrice` float NOT NULL,
  `sellTwo` float NOT NULL,
  `sellTwoPrice` float NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `totalNumber` float NOT NULL,
  `turnover` float NOT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bl9e4avut9b42lyfjmbmwvcoj` (`stock_id`),
  CONSTRAINT `FK_bl9e4avut9b42lyfjmbmwvcoj` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_day 的数据：~0 rows (大约)
DELETE FROM `stock_day`;
/*!40000 ALTER TABLE `stock_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_day` ENABLE KEYS */;


-- 导出  表 iwandb.stock_detail 结构
DROP TABLE IF EXISTS `stock_detail`;
CREATE TABLE IF NOT EXISTS `stock_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `OpenningPrice` float NOT NULL,
  `auctionPrice` float NOT NULL,
  `buyFive` float NOT NULL,
  `buyFivePrice` float NOT NULL,
  `buyFour` float NOT NULL,
  `buyFourPrice` float NOT NULL,
  `buyOne` float NOT NULL,
  `buyOnePrice` float NOT NULL,
  `buyThree` float NOT NULL,
  `buyThreePrice` float NOT NULL,
  `buyTwo` float NOT NULL,
  `buyTwoPrice` float NOT NULL,
  `closingPrice` float NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `competitivePrice` float NOT NULL,
  `currentPrice` float NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `hPrice` float NOT NULL,
  `lPrice` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sellFive` float NOT NULL,
  `sellFivePrice` float NOT NULL,
  `sellFour` float NOT NULL,
  `sellFourPrice` float NOT NULL,
  `sellOne` float NOT NULL,
  `sellOnePrice` float NOT NULL,
  `sellThree` float NOT NULL,
  `sellThreePrice` float NOT NULL,
  `sellTwo` float NOT NULL,
  `sellTwoPrice` float NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `totalNumber` float NOT NULL,
  `turnover` float NOT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q44rt81tymhyvlrpkd3bgaojb` (`stock_id`),
  CONSTRAINT `FK_q44rt81tymhyvlrpkd3bgaojb` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_detail 的数据：~0 rows (大约)
DELETE FROM `stock_detail`;
/*!40000 ALTER TABLE `stock_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_detail` ENABLE KEYS */;


-- 导出  表 iwandb.stock_like 结构
DROP TABLE IF EXISTS `stock_like`;
CREATE TABLE IF NOT EXISTS `stock_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_scm3gofd66c4ffnpx4og0y0fx` (`stock_id`),
  KEY `FK_k7unv5v8rvuc6rb3kxkqsphc3` (`user_id`),
  CONSTRAINT `FK_k7unv5v8rvuc6rb3kxkqsphc3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_scm3gofd66c4ffnpx4og0y0fx` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_like 的数据：~0 rows (大约)
DELETE FROM `stock_like`;
/*!40000 ALTER TABLE `stock_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_like` ENABLE KEYS */;


-- 导出  表 iwandb.stock_note 结构
DROP TABLE IF EXISTS `stock_note`;
CREATE TABLE IF NOT EXISTS `stock_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mowb4rsc6ow3rb1e4i9k94nt1` (`stock_id`),
  KEY `FK_g3h4j8q9kry7yt3ot032uh90m` (`user_id`),
  CONSTRAINT `FK_g3h4j8q9kry7yt3ot032uh90m` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_mowb4rsc6ow3rb1e4i9k94nt1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_note 的数据：~0 rows (大约)
DELETE FROM `stock_note`;
/*!40000 ALTER TABLE `stock_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_note` ENABLE KEYS */;


-- 导出  表 iwandb.stock_record 结构
DROP TABLE IF EXISTS `stock_record`;
CREATE TABLE IF NOT EXISTS `stock_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `bvps` float NOT NULL,
  `eps` float NOT NULL,
  `fixedassets` float NOT NULL,
  `liquidassets` float NOT NULL,
  `outstanding` float NOT NULL,
  `pb` float NOT NULL,
  `pe` float NOT NULL,
  `reserved` float NOT NULL,
  `reservedpershare` float NOT NULL,
  `totalassets` float NOT NULL,
  `totals` float NOT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g6solnuc1nrgfae99ktapqn6` (`stock_id`),
  CONSTRAINT `FK_g6solnuc1nrgfae99ktapqn6` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.stock_record 的数据：~0 rows (大约)
DELETE FROM `stock_record`;
/*!40000 ALTER TABLE `stock_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_record` ENABLE KEYS */;


-- 导出  表 iwandb.uid 结构
DROP TABLE IF EXISTS `uid`;
CREATE TABLE IF NOT EXISTS `uid` (
  `user_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bvip6kuu6a6cw5bnitjekc7pq` (`user_id`),
  CONSTRAINT `FK_djgeotmnbqk54349k1yu5jjjh` FOREIGN KEY (`id`) REFERENCES `user_message_subject` (`id`),
  CONSTRAINT `FK_bvip6kuu6a6cw5bnitjekc7pq` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.uid 的数据：~0 rows (大约)
DELETE FROM `uid`;
/*!40000 ALTER TABLE `uid` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid` ENABLE KEYS */;


-- 导出  表 iwandb.user_attribute 结构
DROP TABLE IF EXISTS `user_attribute`;
CREATE TABLE IF NOT EXISTS `user_attribute` (
  `UserInfo_id` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`UserInfo_id`,`name`),
  CONSTRAINT `FK_7a9kujmkrqc78uy655uymox0l` FOREIGN KEY (`UserInfo_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_attribute 的数据：~0 rows (大约)
DELETE FROM `user_attribute`;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;


-- 导出  表 iwandb.user_device 结构
DROP TABLE IF EXISTS `user_device`;
CREATE TABLE IF NOT EXISTS `user_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rcl74t5rnw5obtvauqiek91xa` (`userid`),
  CONSTRAINT `FK_rcl74t5rnw5obtvauqiek91xa` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_device 的数据：~0 rows (大约)
DELETE FROM `user_device`;
/*!40000 ALTER TABLE `user_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_device` ENABLE KEYS */;


-- 导出  表 iwandb.user_feedback 结构
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE IF NOT EXISTS `user_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `contents` varchar(5000) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `exts` varchar(5000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2w10m227eckw42jre23ykyj8p` (`userid`),
  CONSTRAINT `FK_2w10m227eckw42jre23ykyj8p` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_feedback 的数据：~0 rows (大约)
DELETE FROM `user_feedback`;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;


-- 导出  表 iwandb.user_follow 结构
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `followid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_57640isu1ulyiej1qr6d2rqek` (`followid`),
  KEY `FK_b2ny4gkt33dtem561w4wq209t` (`userid`),
  CONSTRAINT `FK_b2ny4gkt33dtem561w4wq209t` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_57640isu1ulyiej1qr6d2rqek` FOREIGN KEY (`followid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_follow 的数据：~0 rows (大约)
DELETE FROM `user_follow`;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;


-- 导出  表 iwandb.user_friend 结构
DROP TABLE IF EXISTS `user_friend`;
CREATE TABLE IF NOT EXISTS `user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `friendid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e5dyqan2ha40wsfpnyjha3u2r` (`friendid`),
  KEY `FK_ladm174uvd416a09qt2oecsho` (`userid`),
  CONSTRAINT `FK_ladm174uvd416a09qt2oecsho` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_e5dyqan2ha40wsfpnyjha3u2r` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_friend 的数据：~0 rows (大约)
DELETE FROM `user_friend`;
/*!40000 ALTER TABLE `user_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friend` ENABLE KEYS */;


-- 导出  表 iwandb.user_friend_request 结构
DROP TABLE IF EXISTS `user_friend_request`;
CREATE TABLE IF NOT EXISTS `user_friend_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `friendid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e34iertu1s5nu9wxy4eip0mqv` (`friendid`),
  KEY `FK_drnm2rxnn3q5tq778qbmmshu5` (`userid`),
  CONSTRAINT `FK_drnm2rxnn3q5tq778qbmmshu5` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_e34iertu1s5nu9wxy4eip0mqv` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_friend_request 的数据：~0 rows (大约)
DELETE FROM `user_friend_request`;
/*!40000 ALTER TABLE `user_friend_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friend_request` ENABLE KEYS */;


-- 导出  表 iwandb.user_info 结构
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `friends` int(11) DEFAULT NULL,
  `goods` int(11) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `logintimes` int(11) DEFAULT NULL,
  `macaddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_info 的数据：~1 rows (大约)
DELETE FROM `user_info`;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `addDate`, `lastDate`, `comments`, `email`, `friends`, `goods`, `headimg`, `logintimes`, `macaddress`, `name`, `password`, `phone`, `phonenum`, `salt`, `username`) VALUES
	(1, '2016-03-31 09:17:47', '2016-03-31 09:17:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4edbcf99bea82d0e5c0d189461170095a96801f8', NULL, NULL, 'fdca3030de435bb5', 'admin');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;


-- 导出  表 iwandb.user_message 结构
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE IF NOT EXISTS `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m00suhfuic30inun399faawpk` (`subject_id`),
  KEY `FK_k7cs8wn3l9kifglmmw27qkddk` (`user_id`),
  CONSTRAINT `FK_k7cs8wn3l9kifglmmw27qkddk` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_m00suhfuic30inun399faawpk` FOREIGN KEY (`subject_id`) REFERENCES `user_message_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_message 的数据：~0 rows (大约)
DELETE FROM `user_message`;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;


-- 导出  表 iwandb.user_message_member 结构
DROP TABLE IF EXISTS `user_message_member`;
CREATE TABLE IF NOT EXISTS `user_message_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `subjectid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sqjmyb0fxui9cqstdua55n1wn` (`subjectid`),
  KEY `FK_bh002x3hiqnoph9y5veees196` (`uid`),
  CONSTRAINT `FK_bh002x3hiqnoph9y5veees196` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_sqjmyb0fxui9cqstdua55n1wn` FOREIGN KEY (`subjectid`) REFERENCES `user_message_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_message_member 的数据：~0 rows (大约)
DELETE FROM `user_message_member`;
/*!40000 ALTER TABLE `user_message_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message_member` ENABLE KEYS */;


-- 导出  表 iwandb.user_message_subject 结构
DROP TABLE IF EXISTS `user_message_subject`;
CREATE TABLE IF NOT EXISTS `user_message_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `lastMessage` varchar(255) DEFAULT NULL,
  `members` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_message_subject 的数据：~0 rows (大约)
DELETE FROM `user_message_subject`;
/*!40000 ALTER TABLE `user_message_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message_subject` ENABLE KEYS */;


-- 导出  表 iwandb.user_notification 结构
DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE IF NOT EXISTS `user_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `authorid` bigint(20) DEFAULT NULL,
  `catalogid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p3x2p7d0or0mde5sc8h1jj019` (`authorid`),
  KEY `FK_7bpapp7u2vuuf2aqeye14072d` (`catalogid`),
  CONSTRAINT `FK_7bpapp7u2vuuf2aqeye14072d` FOREIGN KEY (`catalogid`) REFERENCES `user_notification_catalog` (`id`),
  CONSTRAINT `FK_p3x2p7d0or0mde5sc8h1jj019` FOREIGN KEY (`authorid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_notification 的数据：~0 rows (大约)
DELETE FROM `user_notification`;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;


-- 导出  表 iwandb.user_notification_catalog 结构
DROP TABLE IF EXISTS `user_notification_catalog`;
CREATE TABLE IF NOT EXISTS `user_notification_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_97f00mbskhset0sg6duty4apb` (`pid`),
  CONSTRAINT `FK_97f00mbskhset0sg6duty4apb` FOREIGN KEY (`pid`) REFERENCES `user_notification_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_notification_catalog 的数据：~0 rows (大约)
DELETE FROM `user_notification_catalog`;
/*!40000 ALTER TABLE `user_notification_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_catalog` ENABLE KEYS */;


-- 导出  表 iwandb.user_notification_member 结构
DROP TABLE IF EXISTS `user_notification_member`;
CREATE TABLE IF NOT EXISTS `user_notification_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `notificationid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_v45oqm03pnk2j74dc98opvms` (`notificationid`),
  KEY `FK_rfekdoj25a5akl82hqkyf1lvn` (`uid`),
  CONSTRAINT `FK_rfekdoj25a5akl82hqkyf1lvn` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_v45oqm03pnk2j74dc98opvms` FOREIGN KEY (`notificationid`) REFERENCES `user_notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_notification_member 的数据：~0 rows (大约)
DELETE FROM `user_notification_member`;
/*!40000 ALTER TABLE `user_notification_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_member` ENABLE KEYS */;


-- 导出  表 iwandb.user_notification_num 结构
DROP TABLE IF EXISTS `user_notification_num`;
CREATE TABLE IF NOT EXISTS `user_notification_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `mid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jr531x4e613hr7kpif7rb6ct2` (`uid`),
  CONSTRAINT `FK_jr531x4e613hr7kpif7rb6ct2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_notification_num 的数据：~0 rows (大约)
DELETE FROM `user_notification_num`;
/*!40000 ALTER TABLE `user_notification_num` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_num` ENABLE KEYS */;


-- 导出  表 iwandb.user_notification_time 结构
DROP TABLE IF EXISTS `user_notification_time`;
CREATE TABLE IF NOT EXISTS `user_notification_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_13dmi805m60af2jj3vo7suh45` (`uid`),
  CONSTRAINT `FK_13dmi805m60af2jj3vo7suh45` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_notification_time 的数据：~0 rows (大约)
DELETE FROM `user_notification_time`;
/*!40000 ALTER TABLE `user_notification_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_time` ENABLE KEYS */;


-- 导出  表 iwandb.user_qq 结构
DROP TABLE IF EXISTS `user_qq`;
CREATE TABLE IF NOT EXISTS `user_qq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL,
  `figureurl1` varchar(255) DEFAULT NULL,
  `figureurl2` varchar(255) DEFAULT NULL,
  `figureurl_qq_1` varchar(255) DEFAULT NULL,
  `figureurl_qq_2` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `level_info` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `yellow_vip` int(11) DEFAULT NULL,
  `yellow_level` int(11) DEFAULT NULL,
  `yellow_year_vip` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jh9j8birvlb9u6krb98rkks7w` (`userid`),
  CONSTRAINT `FK_jh9j8birvlb9u6krb98rkks7w` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_qq 的数据：~0 rows (大约)
DELETE FROM `user_qq`;
/*!40000 ALTER TABLE `user_qq` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_qq` ENABLE KEYS */;


-- 导出  表 iwandb.user_role 结构
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isSystem` bit(1) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_role 的数据：~1 rows (大约)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `addDate`, `lastDate`, `description`, `isSystem`, `name`) VALUES
	(1, '2016-03-31 09:16:16', '2016-03-31 09:16:17', '管理员', b'1', 'admin');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;


-- 导出  表 iwandb.user_role_authority 结构
DROP TABLE IF EXISTS `user_role_authority`;
CREATE TABLE IF NOT EXISTS `user_role_authority` (
  `UserRole_id` bigint(20) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  KEY `FK_754e0gpt61tmar65ipxmtjdlg` (`UserRole_id`),
  CONSTRAINT `FK_754e0gpt61tmar65ipxmtjdlg` FOREIGN KEY (`UserRole_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_role_authority 的数据：~0 rows (大约)
DELETE FROM `user_role_authority`;
/*!40000 ALTER TABLE `user_role_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_authority` ENABLE KEYS */;


-- 导出  表 iwandb.user_role_links 结构
DROP TABLE IF EXISTS `user_role_links`;
CREATE TABLE IF NOT EXISTS `user_role_links` (
  `user_info_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_info_id`,`roles_id`),
  KEY `FK_t0o9tcrnks24168qe2ptmw56u` (`roles_id`),
  CONSTRAINT `FK_lorv38ccc9xm6lp0k02f05i3p` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_t0o9tcrnks24168qe2ptmw56u` FOREIGN KEY (`roles_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_role_links 的数据：~0 rows (大约)
DELETE FROM `user_role_links`;
/*!40000 ALTER TABLE `user_role_links` DISABLE KEYS */;
INSERT INTO `user_role_links` (`user_info_id`, `roles_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `user_role_links` ENABLE KEYS */;


-- 导出  表 iwandb.user_token 结构
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7l02nwyfn6h46s08rdn6qob3m` (`userid`),
  CONSTRAINT `FK_7l02nwyfn6h46s08rdn6qob3m` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_token 的数据：~0 rows (大约)
DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;


-- 导出  表 iwandb.user_verification 结构
DROP TABLE IF EXISTS `user_verification`;
CREATE TABLE IF NOT EXISTS `user_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_verification 的数据：~0 rows (大约)
DELETE FROM `user_verification`;
/*!40000 ALTER TABLE `user_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_verification` ENABLE KEYS */;


-- 导出  表 iwandb.user_weixin 结构
DROP TABLE IF EXISTS `user_weixin`;
CREATE TABLE IF NOT EXISTS `user_weixin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5ghfx3px6dm4tke74yhhh5173` (`userid`),
  CONSTRAINT `FK_5ghfx3px6dm4tke74yhhh5173` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  iwandb.user_weixin 的数据：~0 rows (大约)
DELETE FROM `user_weixin`;
/*!40000 ALTER TABLE `user_weixin` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_weixin` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
