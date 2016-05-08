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

-- 导出  表 iwan.menu 结构
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g3j78mw4mbi5gtex1tod3q57h` (`pid`),
  CONSTRAINT `FK_g3j78mw4mbi5gtex1tod3q57h` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- 正在导出表  iwan.menu 的数据：~30 rows (大约)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `icon`, `ids`, `levelinfo`, `lft`, `name`, `path`, `rgt`, `sortnum`, `pid`, `addDate`, `lastDate`) VALUES
	(1, 'menu-icon fa fa-angle-right ', '1', 1, 1, '一级菜单', '', 62, 16, NULL, NULL, NULL),
	(49, 'menu-icon fa fa-angle-right ', '1,49', 2, 4, '文章管理', '', 11, 0, 1, NULL, NULL),
	(50, 'menu-icon fa fa-angle-right ', '1,49,50', 3, 5, '文章管理', 'admin/article/list.htm', 6, 0, 49, NULL, NULL),
	(51, 'menu-icon fa fa-angle-right ', '1,49,51', 3, 7, '文章分类管理', 'admin/article_catalog/list.htm', 8, 0, 49, NULL, NULL),
	(52, 'menu-icon fa fa-angle-right ', '1,49,52', 3, 9, '标签管理', 'admin/articletags/view_list.htm', 10, 0, 49, NULL, NULL),
	(53, 'menu-icon fa fa-angle-right ', '1,53', NULL, 12, '用户管理', 'admin/users/list.htm', 27, 0, 1, NULL, NULL),
	(54, 'menu-icon fa fa-angle-right ', '1,54', 2, 28, '系统管理', '', 33, 0, 1, NULL, NULL),
	(55, 'menu-icon fa fa-angle-right ', '1,54,55', 3, 29, '友情链接', 'admin/friendlinks/view_list.htm', 30, 0, 54, NULL, NULL),
	(56, 'menu-icon fa fa-angle-right ', '1,54,56', 3, 31, '菜单管理', 'admin/menu/list.htm', 32, 1, 54, '2016-03-12 22:42:50', '2016-03-12 22:42:50'),
	(57, 'menu-icon fa fa-angle-right ', '1,57', 2, 34, '股票管理', '', 41, NULL, 1, '2016-03-12 22:43:04', '2016-03-12 22:43:04'),
	(58, 'menu-icon fa fa-angle-right', '1,57,58', 3, 35, '每日记录', 'admin/stockday/view_list.htm', 36, 1, 57, '2016-03-12 22:43:47', '2016-03-12 22:43:47'),
	(60, 'menu-icon fa fa-angle-right ', '1,57,60', 3, 37, '股票管理', 'admin/stock/view_list.htm', 38, NULL, 57, '2016-03-12 22:44:50', '2016-03-12 22:44:50'),
	(61, 'menu-icon fa fa-angle-right ', '1,57,61', 3, 39, '股票价格记录', 'admin/stockdetail/view_list.htm', 40, NULL, 57, '2016-03-12 22:57:21', '2016-03-12 22:57:21'),
	(62, 'menu-icon fa fa-angle-right ', '1,62', 2, 42, '问答管理', '', 49, NULL, 1, '2016-03-21 23:00:34', '2016-03-21 23:00:34'),
	(63, 'menu-icon fa fa-angle-right ', '1,62,63', 3, 43, '问答分类管理', 'admin/questioncatalog/view_list.htm', 44, NULL, 62, '2016-03-21 23:00:55', '2016-03-21 23:00:55'),
	(64, 'menu-icon fa fa-angle-right ', '1,62,64', 3, 45, '问答管理', 'admin/question/view_list.htm', 46, NULL, 62, '2016-03-27 21:12:54', '2016-03-27 21:12:54'),
	(65, 'menu-icon fa fa-angle-right ', '1,62,65', 3, 47, '回答管理', 'admin/questionanswer/view_list.htm', 48, NULL, 62, '2016-03-27 21:13:22', '2016-03-27 21:13:22'),
	(66, 'menu-icon fa fa-angle-right ', '1,66', 2, 50, '照片管理', '', 57, NULL, 1, '2016-03-27 21:24:42', '2016-03-27 21:24:42'),
	(67, 'menu-icon fa fa-angle-right ', '1,66,67', 3, 51, '照片管理', 'admin/photo/view_list.htm', 52, NULL, 66, '2016-03-27 21:50:00', '2016-03-27 21:50:00'),
	(68, 'menu-icon fa fa-angle-right ', '1,66,68', 3, 53, '相册管理', 'admin/album/view_list.htm', 54, NULL, 66, '2016-03-27 21:50:33', '2016-03-27 21:50:33'),
	(69, 'menu-icon fa fa-angle-right ', '1,66,69', 3, 55, '分类管理', 'admin/category/view_list.htm', 56, NULL, 66, '2016-03-27 21:50:54', '2016-03-27 21:50:54'),
	(70, 'menu-icon fa fa-angle-right ', '1,53,70', 2, 13, '用户管理', 'admin/userinfo/view_list.htm', 14, NULL, 53, '2016-04-14 23:05:03', '2016-04-14 23:05:03'),
	(71, 'menu-icon fa fa-angle-right ', '1,71', 2, 58, '活动管理', '', 61, NULL, 1, '2016-04-14 23:35:26', '2016-04-14 23:35:26'),
	(72, 'menu-icon fa fa-angle-right ', '1,71,72', 3, 59, '活动管理', 'admin/activity/view_list.htm', 60, NULL, 71, '2016-04-14 23:41:24', '2016-04-14 23:41:24'),
	(73, 'menu-icon fa fa-angle-right ', '1,53,73', 2, 15, '第三方登陆', '', 26, NULL, 53, '2016-05-08 12:47:22', '2016-05-08 12:47:22'),
	(74, 'menu-icon fa fa-angle-right ', '1,53,73,74', 3, 16, 'github登陆', 'admin/usergithub/view_list.htm', 17, NULL, 73, '2016-05-08 12:47:53', '2016-05-08 12:47:53'),
	(75, 'menu-icon fa fa-angle-right ', '1,53,73,75', 3, 18, '第三方登陆', 'admin/useroauthtoken/view_list.htm', 19, NULL, 73, '2016-05-08 12:48:19', '2016-05-08 12:48:19'),
	(76, 'menu-icon fa fa-angle-right ', '1,53,73,76', 3, 20, '微博登陆', 'admin/useroauthweibo/view_list.htm', 21, NULL, 73, '2016-05-08 12:48:44', '2016-05-08 12:48:44'),
	(77, 'menu-icon fa fa-angle-right ', '1,53,73,77', 3, 22, '开源中国登陆', 'admin/useroschina/view_list.htm', 23, NULL, 73, '2016-05-08 12:49:09', '2016-05-08 12:49:09'),
	(78, 'menu-icon fa fa-angle-right ', '1,53,73,78', 3, 24, 'qq登陆', 'admin/useroschina/view_list.htm', 25, NULL, 73, '2016-05-08 12:49:37', '2016-05-08 12:49:37');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
