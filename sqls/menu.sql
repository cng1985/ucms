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
-- 正在导出表  iwan.menu 的数据：~22 rows (大约)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `icon`, `ids`, `levelinfo`, `lft`, `name`, `path`, `rgt`, `sortnum`, `pid`, `addDate`, `lastDate`) VALUES
	(1, 'menu-icon fa fa-angle-right ', '1', 1, 1, '一级菜单', '', 50, 16, NULL, NULL, NULL),
	(49, 'menu-icon fa fa-angle-right ', '1,49', 2, 4, '文章管理', '', 11, 0, 1, NULL, NULL),
	(50, 'menu-icon fa fa-angle-right ', '1,49,50', 3, 5, '文章管理', 'admin/article/list.htm', 6, 0, 49, NULL, NULL),
	(51, 'menu-icon fa fa-angle-right ', '1,49,51', 3, 7, '文章分类管理', 'admin/article_catalog/list.htm', 8, 0, 49, NULL, NULL),
	(52, 'menu-icon fa fa-angle-right ', '1,49,52', 3, 9, '标签管理', 'admin/articletags/view_list.htm', 10, 0, 49, NULL, NULL),
	(53, 'menu-icon fa fa-angle-right ', '1,53', NULL, 12, '用户管理', 'admin/users/list.htm', 15, 0, 1, NULL, NULL),
	(54, 'menu-icon fa fa-angle-right ', '1,54', 2, 16, '系统管理', '', 21, 0, 1, NULL, NULL),
	(55, 'menu-icon fa fa-angle-right ', '1,54,55', 3, 17, '友情链接', 'admin/friendlinks/view_list.htm', 18, 0, 54, NULL, NULL),
	(56, 'menu-icon fa fa-angle-right ', '1,54,56', 3, 19, '菜单管理', 'admin/menu/list.htm', 20, 1, 54, '2016-03-12 22:42:50', '2016-03-12 22:42:50'),
	(57, 'menu-icon fa fa-angle-right ', '1,57', 2, 22, '股票管理', '', 29, NULL, 1, '2016-03-12 22:43:04', '2016-03-12 22:43:04'),
	(58, 'menu-icon fa fa-angle-right', '1,57,58', 3, 23, '每日记录', 'admin/stockday/view_list.htm', 24, 1, 57, '2016-03-12 22:43:47', '2016-03-12 22:43:47'),
	(60, 'menu-icon fa fa-angle-right ', '1,57,60', 3, 25, '股票管理', 'admin/stock/view_list.htm', 26, NULL, 57, '2016-03-12 22:44:50', '2016-03-12 22:44:50'),
	(61, 'menu-icon fa fa-angle-right ', '1,57,61', 3, 27, '股票价格记录', 'admin/stockdetail/view_list.htm', 28, NULL, 57, '2016-03-12 22:57:21', '2016-03-12 22:57:21'),
	(62, 'menu-icon fa fa-angle-right ', '1,62', 2, 30, '问答管理', '', 37, NULL, 1, '2016-03-21 23:00:34', '2016-03-21 23:00:34'),
	(63, 'menu-icon fa fa-angle-right ', '1,62,63', 3, 31, '问答分类管理', 'admin/questioncatalog/view_list.htm', 32, NULL, 62, '2016-03-21 23:00:55', '2016-03-21 23:00:55'),
	(64, 'menu-icon fa fa-angle-right ', '1,62,64', 3, 33, '问答管理', 'admin/question/view_list.htm', 34, NULL, 62, '2016-03-27 21:12:54', '2016-03-27 21:12:54'),
	(65, 'menu-icon fa fa-angle-right ', '1,62,65', 3, 35, '回答管理', 'admin/questionanswer/view_list.htm', 36, NULL, 62, '2016-03-27 21:13:22', '2016-03-27 21:13:22'),
	(66, 'menu-icon fa fa-angle-right ', '1,66', 2, 38, '照片管理', '', 45, NULL, 1, '2016-03-27 21:24:42', '2016-03-27 21:24:42'),
	(67, 'menu-icon fa fa-angle-right ', '1,66,67', 3, 39, '照片管理', 'admin/photo/view_list.htm', 40, NULL, 66, '2016-03-27 21:50:00', '2016-03-27 21:50:00'),
	(68, 'menu-icon fa fa-angle-right ', '1,66,68', 3, 41, '相册管理', 'admin/album/view_list.htm', 42, NULL, 66, '2016-03-27 21:50:33', '2016-03-27 21:50:33'),
	(69, 'menu-icon fa fa-angle-right ', '1,66,69', 3, 43, '分类管理', 'admin/category/view_list.htm', 44, NULL, 66, '2016-03-27 21:50:54', '2016-03-27 21:50:54'),
	(70, 'menu-icon fa fa-angle-right ', '1,53,70', 2, 13, '用户管理', 'admin/userinfo/view_list.htm', 14, NULL, 53, '2016-04-14 23:05:03', '2016-04-14 23:05:03'),
	(71, 'menu-icon fa fa-angle-right ', '1,71', 2, 46, '活动管理', '', 49, NULL, 1, '2016-04-14 23:35:26', '2016-04-14 23:35:26'),
	(72, 'menu-icon fa fa-angle-right ', '1,71,72', 3, 47, '活动管理', 'admin/activity/view_list.htm', 48, NULL, 71, '2016-04-14 23:41:24', '2016-04-14 23:41:24');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
