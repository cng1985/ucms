-- phpMyAdmin SQL Dump
-- http://www.phpmyadmin.net
--
-- 生成日期: 2018 年 05 月 30 日 08:51

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `fzmpvwjsNUmcNSizcXpG`
--

-- --------------------------------------------------------

--
-- 表的结构 `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `note` longtext,
  `catalog_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj0xhtuxsig80ijl8y2m9qlm8x` (`catalog_id`),
  KEY `FK24r943kdkhofv6euw05a66v83` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `activity_catalog`
--

CREATE TABLE IF NOT EXISTS `activity_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi9yn9gnn9djfomgppfos0sogc` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `activity_catalog`
--

INSERT INTO `activity_catalog` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `pid`) VALUES
(1, '2017-12-08 15:39:17', '', '1', '2017-12-08 15:39:17', 1, 1, '根节点', 6, 0, NULL),
(2, '2017-12-19 09:18:18', '001', '1,2', '2017-12-19 09:18:18', 2, 2, '线上活动', 3, NULL, 1),
(3, '2017-12-19 09:18:26', '002', '1,3', '2017-12-19 09:18:26', 2, 4, '线下活动', 5, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `album_album`
--

CREATE TABLE IF NOT EXISTS `album_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb28j7s432btfaynlc2ft12o0o` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `album_category`
--

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

-- --------------------------------------------------------

--
-- 表的结构 `album_feed`
--

CREATE TABLE IF NOT EXISTS `album_feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK867e395vayv607srm5dijy9jo` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `album_photo`
--

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
  KEY `FK716u4nm9v4ib2c154jxwl6ov` (`album_id`),
  KEY `FKeyyfgnxyndk5e3iaebdqegn4f` (`category_id`),
  KEY `FKci8lm9bfx09ohlyn94inyid14` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `album_photo_feeds`
--

CREATE TABLE IF NOT EXISTS `album_photo_feeds` (
  `PhotoFeed_id` bigint(20) NOT NULL,
  `photos_id` varchar(255) NOT NULL,
  PRIMARY KEY (`PhotoFeed_id`,`photos_id`),
  KEY `FKk0vl5583gj2ij15crk6wqvk59` (`photos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `album_photo_tags`
--

CREATE TABLE IF NOT EXISTS `album_photo_tags` (
  `Photo_id` varchar(255) NOT NULL,
  `tags_name` varchar(255) NOT NULL,
  PRIMARY KEY (`Photo_id`,`tags_name`),
  KEY `FK8bjxnv5i8setjy93980v6msw8` (`tags_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `album_tag`
--

CREATE TABLE IF NOT EXISTS `album_tag` (
  `name` varchar(255) NOT NULL,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `contents` text,
  `exts` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ups` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2aptines4lfv2116021bh53gs` (`catalog_id`),
  KEY `FKgfkys9w7qv3xcubq0drrayuu3` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `addDate`, `lastDate`, `comments`, `contents`, `exts`, `images`, `img`, `introduction`, `title`, `ups`, `views`, `catalog_id`, `user_id`, `likes`) VALUES
(1, '2017-05-30 18:07:24', '2017-05-30 18:07:24', 0, '<p>\r\n	Jodd 是一个开源的 Java 工具集， 包含一些实用的工具类和小型框架。简单，却很强大！\r\n</p>\r\n<blockquote>\r\n	Jodd = Tools + IoC + MVC + DB + AOP + TX + JSON + HTML &lt; 1.5 Mb\r\n</blockquote>\r\n<p>\r\n	Jodd 被分成众多模块，按需选择，其中\r\n</p>\r\n<ul class=" list-paddingleft-2">\r\n	<li>\r\n		<p>\r\n			工具类模块有：\r\n		</p>\r\n	</li>\r\n	<ul class=" list-paddingleft-2">\r\n		<li>\r\n			<p>\r\n				jodd-core&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一些工具类，包括<a href="http://jodd.org/doc/printf.html" target="_blank">Printf</a>、<a href="http://jodd.org/doc/jdatetime.html" target="_blank">JDateTime</a>、<a href="http://jodd.org/doc/stringutil.html" target="_blank">StringUtil</a>、<a href="http://jodd.org/doc/fast-buffers.html" target="_blank">Fast buffers</a>等等\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/beanutil.html" target="_blank">jodd-bean</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BeanUtil以及类型检查转换工具\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/props.html" target="_blank">jodd-props</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;更强大的Java Properties替代\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/email.html" target="_blank">jodd-email</a>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;更简单易用的e-mail收发\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				jodd-upload &nbsp; &nbsp;&nbsp;&nbsp;处理HTTP上传\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/servlets.html" target="_blank">jodd-servlets</a>&nbsp;&nbsp; &nbsp;一些Servlet相关的工具类, 附带一套漂亮的<a href="http://jodd.org/doc/taglibrary.html" target="_blank">JSP标签库</a> \r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/http.html" target="_blank">jodd-http</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;轻巧的HTTP客户端\r\n			</p>\r\n		</li>\r\n	</ul>\r\n	<li>\r\n		<p>\r\n			小型框架模块有：\r\n		</p>\r\n	</li>\r\n	<ul class=" list-paddingleft-2">\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#madvoc" target="_blank">jodd-madvoc</a>&nbsp; &nbsp; &nbsp; 一个MVC框架\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#petite" target="_blank">jodd-petite</a>&nbsp;&nbsp; &nbsp; &nbsp;一个依赖注入容器\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#lagarto" target="_blank">jodd-lagarto</a>&nbsp;&nbsp; &nbsp; HTML/XML解析器，包含<a href="http://jodd.org/doc/#jerry" target="_blank">Jerry</a>和<a href="http://jodd.org/doc/csselly/index.html" target="_blank">CSSelly</a>，让你像jQuery一样筛选HTML节点\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				jodd-lagarto-web Lagarto的Web扩展，包含<a href="http://jodd.org/doc/#decora" target="_blank">Decora</a>、<a href="http://jodd.org/doc/#htmlstapler" target="_blank">HtmlStapler</a>等等\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#proxetta" target="_blank">jodd-proxetta</a>&nbsp;&nbsp; &nbsp;帮你实现动态代理，获取函数参数名\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#dboom" target="_blank">jodd-dboom</a>&nbsp;&nbsp; &nbsp; &nbsp; 数据库访问的轻量级封装，可看作一个简单的ORM\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/#json" target="_blank">jodd-json</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;JSON解析、序列化\r\n			</p>\r\n		</li>\r\n		<li>\r\n			<p>\r\n				<a href="http://jodd.org/doc/vtor/index.html" target="_blank">jodd-vtor</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;一个基于注解的字段验证框架\r\n			</p>\r\n		</li>\r\n	</ul>\r\n</ul>', NULL, NULL, '', 'Jodd 是一个开源的 Java 工具集， 包含一些实用的工具类和小型框架。简单，却很强大！', 'Jodd 详细介绍', NULL, 167, 4, 6, NULL),
(2, '2017-05-30 18:10:47', '2017-05-30 18:10:47', 0, '<br />\r\n<pre class="prettyprint lang-java">  &lt;repositories&gt;\r\n        &lt;repository&gt;\r\n            &lt;id&gt;aliyun&lt;/id&gt;\r\n            &lt;url&gt;http://maven.aliyun.com/nexus/content/repositories/central/&lt;/url&gt;\r\n        &lt;/repository&gt;\r\n    &lt;/repositories&gt;</pre>', NULL, NULL, '', '', ' 国内maven镜像 ', NULL, 81, 19, 4, 1),
(3, '2017-05-30 18:18:51', '2017-05-30 18:18:51', 0, '<pre class="prettyprint lang-java">  //我们的写代码方式\r\n        if(subdirs!=null&amp;&amp;subdirs.length&gt;0){\r\n            for (int i = 0; i &lt;subdirs.length ; i++) {\r\n                if(i!=subdirs.length-1){\r\n                    str = str + subdirs[i]+"/";\r\n                }else{\r\n                    str  = str+ subdirs[i];\r\n                }\r\n            }\r\n        }\r\n        System.out.println("str:"+str);\r\n\r\n\r\n        //google 工程师的写代码方式\r\n        Iterable iterable= (Iterable) Arrays.asList(subdirs);\r\n        Iterator iterator=  iterable.iterator();\r\n        StringBuffer xx=new StringBuffer();\r\n        xx.append(iterator.next());\r\n        while (iterator.hasNext()){\r\n            xx.append("/");\r\n            xx.append(iterator.next());\r\n        }\r\n        System.out.println("xx:"+xx);\r\n\r\n        StringBuffer yyy=new StringBuffer();\r\n        iterator=  iterable.iterator();\r\n        while (iterator.hasNext()){\r\n            yyy.append(iterator.next());\r\n            if (iterator.hasNext()){\r\n                yyy.append("/");\r\n            }\r\n        }\r\n        System.out.println("yyy:"+yyy);</pre>', NULL, NULL, '', '', '字符串拼接我们的思维方式和google工程师的思维方式', NULL, 111, 9, 4, NULL),
(4, '2017-06-02 23:27:53', '2017-06-02 23:27:53', 0, '<p>\r\n	安全是企业应用中不可缺少的功能，在众多权限框架中，Shiro（其前身是<a href="http://www.oschina.net/p/jsecurity">JSecurity</a>）因其简单而又不失强大的特点引起了不少开发者的注 意。随着Grails的关注度越来越高，在Grails社区也出现了Shiro的插件。\r\n</p>\r\n<p>\r\n	Shiro最早的名字是JSecurity，后来更名为Shiro并成为Apache的孵化项目。这次改名也同样影响了Grails\r\n Shiro \r\n&nbsp;Plugin。它最早在Shiro还未改名之前就已经存在了，后来因为Shiro的名字变更，也就一道跟着&amp;ldquo;改名换姓&amp;rdquo;。由于Grails\r\n Shiro &nbsp;Plugin中已经包含了Shiro相关的Jar，因此对于插件的使用者而言，不必专门下载Shiro。\r\n</p>\r\n<p>\r\n	<img src="http://www.oschina.net/uploads/img/201001/12154206_OzSF.png" alt="" />\r\n</p>', NULL, NULL, '', 'shiro是apache推出的一款权限框架', ' 权限框架 Shiro ', NULL, 134, 1, 4, NULL),
(5, '2017-06-09 10:40:16', '2017-06-09 10:40:16', 0, '<p>\r\n	github地址：https://github.com/uxsolutions/bootstrap-datepicker\r\n</p>\r\n<p>\r\n	<br />\r\n在线例子：https://uxsolutions.github.io/bootstrap-datepicker/?markup=input&amp;format=&amp;weekStart=&amp;startDate=&amp;endDate=&amp;startView=0&amp;minViewMode=0&amp;maxViewMode=4&amp;todayBtn=false&amp;clearBtn=false&amp;language=en&amp;orientation=auto&amp;multidate=&amp;multidateSeparator=&amp;keyboardNavigation=on&amp;forceParse=on#sandbox\r\n</p>', NULL, NULL, '', 'https://github.com/uxsolutions/bootstrap-datepicker', 'bootstrap-datepicker最好用的bootstrap时间选择器', 0, 121, 2, 4, NULL),
(6, '2017-06-20 22:17:10', '2017-06-20 22:17:10', 0, '<h1 id="h1_0">\r\n	一、事务的作用\r\n</h1>\r\n<p>\r\n	&nbsp; 将若干的数据库操作作为一个整体控制,一起成功或一起失败。<br />\r\n&nbsp; <strong>原子性</strong>：指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生。<br />\r\n&nbsp; <strong>一致性</strong>：指事务前后数据的完整性必须保持一致。<br />\r\n&nbsp; <strong>隔离性</strong>：指多个用户并发访问数据库时，一个用户的事务不能被其他用户的事务所干扰，多个并发事务之间数据要相互隔离。<br />\r\n&nbsp; <strong>持久性</strong>：指一个事务一旦被提交，它对数据库中数据的改变就是永久性的，即时数据库发生故障也不应该对其有任何影响。\r\n</p>\r\n<span id="OSC_h1_2"></span> \r\n<h1 id="h1_1">\r\n	二、Spring事务管理高层抽象主要包括3个接口\r\n</h1>\r\n<p>\r\n	&nbsp; --<strong>Platform TransactionManager</strong> 事务管理器（提交、回滚事务）<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; Spring为不同的持久化框架提供了不同的Platform TransactionManager接口实现。如：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 使用Spring JDBC或iBatis进行持久化数据时使用DataSourceTransactionManager<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 使用Hibernate3.0版本进行持久化数据时使用HibernateTransactionManager<br />\r\n&nbsp; --<strong>TransactionDefinition</strong> 事务定义信息（隔离、传播、超时、只读）<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;脏读：一个事务读取了另一个事务改写但还未提交的数据，如果这些数据被回滚，则读到的数据是无效的。<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;不可重复读：在同一事务中，多次读取同一数据返回的结果有所不同。<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;幻读：一个事务读取了几行记录后，另一个事务插入一些记录，幻读就发生了。再后来的查询中，第一个事务就会发现有些原来没有的记录。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事务隔离级别：（五种）\r\n</p>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;<span style="color:#FF0000;">DEFAULT--使用后端数据库默认的隔离级别</span>（Spring中的选择项）\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;READ_UNCOMMITED--允许你读取还未提交的改变了的数据。可能导致脏、幻、不可重复读\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;READ_COMMITTED--允许在并发事务已经提交后读取。可防止脏读，但幻读和不可重复读仍可发生\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;REPEATABLE_READ--对相同字段的多次读取是一致的，除非数据被事务本身改变。可防止脏、不可重复读，但幻读仍可能发生\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;SERIALIZABLE--完全服从ACID的隔离级别，确保不发生脏、幻、不可重复读。这在所有的隔离级别中是最慢的，它是典型的通过完全锁定在事务中涉及的数据表来完成的\r\n	</li>\r\n</ul>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 其中，MySQL默认采用REPEATABLE_READ隔离级别；Oracle默认采用READ_COMMITTED隔离级别<br />\r\n<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 事务传播行为：（七种）\r\n</p>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;<span style="color:#FF0000;">REQUIRED--支持当前事务，如果当前没有事务，就新建一个事务。这是最常见的选择。</span>\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;SUPPORTS--支持当前事务，如果当前没有事务，就以非事务方式执行。\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;MANDATORY--支持当前事务，如果当前没有事务，就抛出异常。\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;<span style="color:#FF0000;">REQUIRES_NEW--新建事务，如果当前存在事务，把当前事务挂起。</span>\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;NOT_SUPPORTED--以非事务方式执行操作，如果当前存在事务，就把当前事务挂起。\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;NEVER--以非事务方式执行，如果当前存在事务，则抛出异常。\r\n	</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		&nbsp;&nbsp; &nbsp;<span style="color:#FF0000;">NESTED--如果当前存在事务，则在嵌套事务内执行。如果当前没有事务，则进行与REQUIRED类似的操作。</span>拥有多个可以回滚的保存点，内部回滚不会对外部事务产生影响。只对DataSourceTransactionManager有效\r\n	</li>\r\n</ul>\r\n<span id="OSC_h1_3"></span> \r\n<h1 id="h1_2">\r\n	三关于事物隔离的说明\r\n</h1>\r\n<p>\r\n	数据库事务的隔离级别有4种，由低到高分别为Read uncommitted 、Read committed 、Repeatable \r\nread 、Serializable 。而且，在事务的并发操作中可能会出现脏读，不可重复读，幻读。下面通过事例一一阐述它们的概念与联系。\r\n</p>\r\n<p>\r\n	<strong>Read uncommitted</strong>\r\n</p>\r\n<p>\r\n	读未提交，顾名思义，就是一个事务可以读取另一个未提交事务的数据。\r\n</p>\r\n<p>\r\n	事例：老板要给程序员发工资，程序员的工资是3.6万/月。但是发工资时老板不小心按错了数字，按成3.9万/月，该钱已经打到程序员的户口，但是事务还没有提交，就在这时，程序员去查看自己这个月的工资，发现比往常多了3千元，以为涨工资了非常高兴。但是老板及时发现了不对，马上回滚差点就提交了的事务，将数字改成3.6万再提交。\r\n</p>\r\n<p>\r\n	分析：实际程序员这个月的工资还是3.6万，但是程序员看到的是3.9万。他看到的是老板还没提交事务时的数据。这就是脏读。\r\n</p>\r\n<p>\r\n	那怎么解决脏读呢？Read committed！读提交，能解决脏读问题。\r\n</p>\r\n<p>\r\n	<strong>Read committed</strong>\r\n</p>\r\n<p>\r\n	读提交，顾名思义，就是一个事务要等另一个事务提交后才能读取数据。\r\n</p>\r\n<p>\r\n	事例：程序员拿着信用卡去享受生活（卡里当然是只有3.6万），当他埋单时（程序员事务开启），收费系统事先检测到他的卡里有3.6万，就在这个时候！！程序员的妻子要把钱全部转出充当家用，并提交。当收费系统准备扣款时，再检测卡里的金额，发现已经没钱了（第二次检测金额当然要等待妻子转出金额事务提交完）。程序员就会很郁闷，明明卡里是有钱的…\r\n</p>\r\n<p>\r\n	分析：这就是读提交，若有事务对数据进行更新（UPDATE）操作时，读操作事务要等待这个更新操作事务提交后才能读取数据，可以解决脏读问题。但在这个事例中，出现了一个事务范围内两个相同的查询却返回了不同数据，这就是不可重复读。\r\n</p>\r\n<p>\r\n	那怎么解决可能的不可重复读问题？Repeatable read ！\r\n</p>\r\n<p>\r\n	<strong>Repeatable read</strong>\r\n</p>\r\n<p>\r\n	重复读，就是在开始读取数据（事务开启）时，不再允许修改操作\r\n</p>\r\n<p>\r\n	事例：程序员拿着信用卡去享受生活（卡里当然是只有3.6万），当他埋单时（事务开启，不允许其他事务的UPDATE修改操作），收费系统事先检测到他的卡里有3.6万。这个时候他的妻子不能转出金额了。接下来收费系统就可以扣款了。\r\n</p>\r\n<p>\r\n	分析：重复读可以解决不可重复读问题。写到这里，应该明白的一点就是，不可重复读对应的是修改，即UPDATE操作。但是可能还会有幻读问题。因为幻读问题对应的是插入INSERT操作，而不是UPDATE操作。\r\n</p>\r\n<p>\r\n	<strong>什么时候会出现幻读？</strong>\r\n</p>\r\n<p>\r\n	事例：程序员某一天去消费，花了2千元，然后他的妻子去查看他今天的消费记录（全表扫描FTS，妻子事务开启），看到确实是花了2千元，就在这个时候，程序员花了1万买了一部电脑，即新增INSERT了一条消费记录，并提交。当妻子打印程序员的消费记录清单时（妻子事务提交），发现花了1.2万元，似乎出现了幻觉，这就是幻读。\r\n</p>\r\n<p>\r\n	那怎么解决幻读问题？Serializable！\r\n</p>\r\n<p>\r\n	<strong>Serializable 序列化</strong>\r\n</p>\r\n<p>\r\n	Serializable 是最高的事务隔离级别，在该级别下，事务串行化顺序执行，可以避免脏读、不可重复读与幻读。但是这种事务隔离级别效率低下，比较耗数据库性能，一般不使用。\r\n</p>\r\n<p>\r\n	值得一提的是：大多数数据库默认的事务隔离级别是Read committed，比如Sql Server , Oracle。<a href="http://lib.csdn.net/base/14" target="_blank">MySQL</a>的默认隔离级别是Repeatable read。\r\n</p>', NULL, NULL, '', '  将若干的数据库操作作为一个整体控制,一起成功或一起失败。\r\n  原子性：指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生。\r\n  一致性：指事务前后数据的完整性必须保持一致。\r\n  隔离性：指多个用户并发访问数据库时，一个用户的事务不能被其他用户的事务所干扰，多个并发事务之间数据要相互隔离。\r\n  持久性：指一个事务一旦被提交，它对数据库中数据的改变就是永久性的，即时数据库发生故障也不应该对其有任何影响。', 'Spring事务管理的四种方式 ', NULL, 105, 27, 4, NULL),
(7, '2017-11-02 11:05:04', '2017-11-02 11:05:04', 0, '<h2>规则一：由于继承而发生样式冲突时，最近祖先获胜。</h2><h2>规则二：继承的样式和直接指定的样式冲突时，直接指定的样式获胜。</h2><h2>规则三：直接指定的样式发生冲突时，样式权值高者获胜。</h2><p>样式的权值取决于样式的选择器，权值定义如下表。</p><table><tbody><tr class="firstRow"><th style="border-color:initial; text-align:left; vertical-align:baseline">CSS选择器</th><th style="border-color:initial; text-align:left; vertical-align:baseline">权值</th></tr></tbody><tbody><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">标签选择器</td><td style="border-color:initial; text-align:left; vertical-align:baseline">1</td></tr><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">类选择器</td><td style="border-color:initial; text-align:left; vertical-align:baseline">10</td></tr><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">ID选择器</td><td style="border-color:initial; text-align:left; vertical-align:baseline">100</td></tr><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">内联样式</td><td style="border-color:initial; text-align:left; vertical-align:baseline">1000</td></tr><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">伪元素(:first-child等)</td><td style="border-color:initial; text-align:left; vertical-align:baseline">1</td></tr><tr><td style="border-color:initial; text-align:left; vertical-align:baseline">伪类(:link等)</td><td style="border-color:initial; text-align:left; vertical-align:baseline">10</td></tr></tbody></table><p>可以看到，内联样式的权值&gt;&gt;ID选择器&gt;&gt;类选择器&gt;&gt;标签选择器，除此以外，后代选择器的权值为每项权值之和，比如”#nav .current a”的权值为100 + 10 + 1 = 111。</p><h2>规则四：样式权值相同时，后者获胜。</h2><h2>规则五：!important的样式属性不被覆盖。</h2><p>!important可以看做是万不得已的时候，打破上述四个规则的”金手指”。如果你一定要采用某个样式属性，而不让它被覆盖的，可以在属性值后加上!important，以规则四的例子为例，”.byline\r\n a {color:red \r\n!important;}”可以强行使链接显示红色。大多数情况下都可以通过其他方式来控制样式的覆盖，不能滥用!important。</p><p><br/></p>', NULL, NULL, '', 'CSS样式覆盖规则 ', 'CSS样式覆盖规则 ', NULL, NULL, 22, NULL, 2),
(8, '2017-12-04 08:49:39', '2017-12-04 08:49:39', 4, '<p> </p>\n<p><br></p>\n<p>slf4j是一个日志聚合类库。通过阅读源代码，silf4j采用了适配器模式和工厂模式，下面是一个获取日志类的顺序图</p>\n<p><img src="http://store.quhaodian.com/sjf4j.jpg" title="" alt="" width="680" height="542"></p>\n<p><br></p>\n<p><br></p>\n<p><br></p>\n<p> </p>', NULL, NULL, '', 'slf4j源码分析', 'slf4j源码分析', 0, NULL, 9, NULL, 2),
(9, '2017-12-19 09:32:36', '2017-12-19 09:32:36', 0, '<p> </p>\n<p><br></p>\n<p>discover</p>\n<blockquote>\n <p>discover 是一个集成spring mvc+spring+hibernate的基础功能工程</p>\n</blockquote>\n<p>定义功能</p>\n<blockquote>\n <p>一个模块由后台管理，接口，freemarker标签组成，给前端更大的自由。前端可以通过标签或者接口构建页面和功能</p>\n</blockquote>\n<p>技术选型：</p>\n<p><strong>服务端</strong></p>\n<ul>\n <li><p>SSH (Spring、SpringMVC、Hibernate)</p></li>\n <li><p>安全权限 Shiro</p></li>\n <li><p>缓存 Ehcache</p></li>\n <li><p>视图模板 freemarker</p></li>\n <li><p>其它 Jsoup、gson</p></li>\n</ul>\n<p><br></p>\n<p>已经发布到maven中央仓库了</p>\n<pre>&lt;dependency&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&lt;groupId&gt;com.quhaodian&lt;/groupId&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&lt;artifactId&gt;user_hibernate&lt;/artifactId&gt;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&lt;version&gt;1.6.3&lt;/version&gt;\r\n&lt;/dependency&gt;</pre>\n<p>代码生成类ChainMake使用</p>\n<pre>&nbsp;&nbsp;&nbsp;ChainMake&nbsp;make=	new&nbsp;ChainMake(TemplateSimpleDir.class,TemplateHibernateDir.class);&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;make.setAction("com.youapp.controller.admin");//Controller类所在包\r\n&nbsp;&nbsp;&nbsp;//项目模板位置\r\n&nbsp;&nbsp;&nbsp;File&nbsp;view=new&nbsp;File("E:\\\\youweb\\\\src\\\\main\\\\webapp\\\\WEB-INF\\\\ftl\\\\admin");&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;make.setView(view);\r\n&nbsp;&nbsp;&nbsp;List&lt;Class&lt;?&gt;&gt;&nbsp;cs=new&nbsp;ArrayList&lt;Class&lt;?&gt;&gt;();\r\n&nbsp;&nbsp;&nbsp;cs.add(LeaveData.class);//实体对象\r\n&nbsp;&nbsp;&nbsp;make.setMenus("1,39,44");//后台菜单号\r\n&nbsp;&nbsp;&nbsp;make.setDao(false);//是否生成dao代码\r\n&nbsp;&nbsp;&nbsp;make.setService(false);//是否生成Service代码\r\n&nbsp;&nbsp;&nbsp;make.setView(false);//是否生成后台管理页面\r\n&nbsp;&nbsp;&nbsp;make.setAction(true);//是否生成Controller代码\r\n&nbsp;&nbsp;&nbsp;make.makes(cs);</pre>\n<p><img alt="" src="https://static.oschina.net/uploads/space/2017/1204/144618_R9Wx_121058.jpg" width="612" height="347"></p>\n<p>&nbsp;</p>\n<p><span><strong>包介绍：</strong></span></p>\n<p>com.quhaodian.admin 后台管理功能</p>\n<p>com.quhaodian.album 相册功能</p>\n<p>com.quhaodian.area 地区功能</p>\n<p>com.quhaodian.article 文章功能</p>\n<p>com.quhaodian.data hibernate公共包</p>\n<p>com.quhaodian.feed 动态功能</p>\n<p>com.quhaodian.plugin 插件功能</p>\n<p>com.quhaodian.question 问答功能</p>\n<p>com.quhaodian.shiro shiro权限功能依赖用户模块</p>\n<p>com.quhaodian.user 用户模块</p>\n<p>com.young.word 验证码生成</p>\n<p>com.young.security 各种安全工具</p>\n<p><br></p>\n<p><br></p>\n<p> </p>', NULL, NULL, '', 'discover 是一个集成spring mvc+spring+hibernate的基础功能工程', 'discover', 0, NULL, 2, NULL, 1),
(10, '2018-01-09 10:08:32', '2018-01-09 10:08:32', 1, '本次更新内容\n<br> \n<p>1.新增定时任务功能，底层采用quartz。存储暂时采用内存模型。</p>\n<p>2.定时任务中新增访问网站功能，新增任务执行记录功能</p>\n<p>3.添加工作流模块，采用activiti技术。目前采用最新的版本7-201711-EA，有兴趣的同学可以一起讨论下activiti，目前activiti移除的用户和用户组模块，新增了多租户功能。</p>\n<p>4.新增用户通知功能，同时支持pull和push模型，pull模型提供时间戳模型和id模型。</p>\n<p><br></p>', NULL, NULL, '', 'adminstore新增工作流和定时任务', 'adminstore新增工作流和定时任务', NULL, NULL, 2, NULL, 1),
(11, '2018-03-20 11:35:18', '2018-03-20 11:35:18', 1, '<p>〈人生28个零，太经典了〉<br>&nbsp;1 、有计划-没行动=零<br>&nbsp;2 、有机会-没抓住=零<br>&nbsp;3 、有落实-没完成=零<br>&nbsp;4 、有价值-没体现=零 <br>&nbsp;5 、有进步-没耐心=零<br>&nbsp;6 、有任务-没沟通=零<br>&nbsp;7 、有能力-没发挥=零<br>&nbsp;8 、有创造-没推销=零 <br>&nbsp;9 、有知识-没应用=零<br>10、有舞台-没出色=零<br>11、有付出-没效益=零<br>12、有原则-没坚持=零 <br>13、有意志-没持久=零<br>14、有热情-没定力=零<br>15、有毅力-没恒心=零<br>16、有意识-没态度=零 <br>17、有胸怀-没谦虚=零<br>18、有指令-没执行=零<br>19、有方法-没行动=零<br>20、有行动-没效率=零 <br>21、有平台-没创新=零<br>22、有工作-没定量=零<br>23、有标准-没考核=零<br>24、有成绩-没激励=零 <br>25、有布置-没检查=零<br>26、有团队-没合作=零<br>27、有眼光-没发现=零<br>28、有问题-没解决=零&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></p>', NULL, NULL, '', '人生28个零，太经典了', '人生28个零，太经典了', NULL, NULL, 7, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `article_catalog`
--

CREATE TABLE IF NOT EXISTS `article_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
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
  KEY `FKeltrcktceyicg6so4kxa1muy5` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `article_catalog`
--

INSERT INTO `article_catalog` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `nums`, `pid`) VALUES
(1, '2017-05-30 10:25:20', NULL, '1', '2017-06-20 22:17:10', 1, 1, '文章分类', 60, NULL, 11, NULL),
(2, '2018-04-16 16:38:40', '001', '1,2', '2018-04-16 16:38:40', 2, 8, '开源类库', 17, NULL, 4, 1),
(3, '2017-05-30 17:06:11', '0', '1,2,3', '2017-05-30 17:06:11', 3, 9, 'ios', 10, NULL, NULL, 2),
(4, '2017-05-30 17:06:24', '0', '1,2,4', '2017-05-30 18:07:24', 3, 11, 'java', 12, NULL, 1, 2),
(5, '2017-05-30 17:06:33', '1', '1,2,5', '2017-05-30 17:06:33', 3, 13, 'android', 14, NULL, NULL, 2),
(6, '2017-05-30 17:06:45', '1', '1,2,6', '2017-05-30 17:06:45', 3, 15, '前端', 16, NULL, NULL, 2),
(7, '2017-05-30 17:07:00', '002', '1,7', '2017-05-30 18:18:51', 2, 18, '一尺三寸', 23, NULL, 3, 1),
(8, '2017-05-30 17:07:14', '0', '1,7,8', '2017-05-30 17:07:14', 3, 19, '开发计划', 20, NULL, NULL, 7),
(9, '2017-05-30 17:07:23', '1', '1,7,9', '2017-05-30 18:18:51', 3, 21, '技术探讨', 22, NULL, 2, 7),
(10, '2017-05-30 17:07:37', '003', '1,10', '2017-05-30 17:07:37', 2, 24, '架构设计', 29, NULL, NULL, 1),
(11, '2017-05-30 17:07:48', '1', '1,10,11', '2017-05-30 17:07:48', 3, 25, '架构是什么', 26, NULL, NULL, 10),
(12, '2017-05-30 17:07:57', '2', '1,10,12', '2017-05-30 17:07:57', 3, 27, '设计模式', 28, NULL, NULL, 10),
(13, '2017-05-30 17:08:13', '004', '1,13', '2017-05-30 17:08:13', 2, 30, '技术探讨', 39, NULL, NULL, 1),
(14, '2017-05-30 17:08:23', '1', '1,13,14', '2017-05-30 17:08:23', 3, 31, '大数据', 32, NULL, NULL, 13),
(15, '2017-05-30 17:08:39', '1', '1,13,15', '2017-05-30 17:08:39', 3, 33, '分布式计算', 34, NULL, NULL, 13),
(16, '2017-05-30 17:08:47', '1', '1,13,16', '2017-05-30 17:08:47', 3, 35, '敏捷开发', 36, NULL, NULL, 13),
(17, '2017-05-30 17:08:55', '1', '1,13,17', '2017-05-30 17:08:55', 3, 37, '软件工程', 38, NULL, NULL, 13),
(18, '2017-05-30 17:09:06', '005', '1,18', '2017-05-30 18:10:47', 2, 40, '编程基础', 55, NULL, 1, 1),
(19, '2017-05-30 17:09:18', '1', '1,18,19', '2017-05-30 18:10:47', 3, 41, 'java语言', 42, NULL, 1, 18),
(20, '2017-05-30 17:09:27', '1', '1,18,20', '2017-05-30 17:09:27', 3, 43, 'go语言', 44, NULL, NULL, 18),
(21, '2017-05-30 17:09:34', '1', '1,18,21', '2017-05-30 17:09:34', 3, 45, 'javascript', 46, NULL, NULL, 18),
(22, '2017-05-30 17:09:41', '1', '1,18,22', '2017-05-30 17:09:41', 3, 47, 'html', 48, NULL, NULL, 18),
(23, '2017-05-30 17:09:49', '1', '1,18,23', '2017-05-30 17:09:49', 3, 49, 'css', 50, NULL, NULL, 18),
(24, '2017-05-30 17:09:55', '1', '1,18,24', '2017-05-30 17:09:55', 3, 51, '数据库', 52, NULL, NULL, 18),
(25, '2017-05-30 17:10:02', '1', '1,18,25', '2017-05-30 17:10:02', 3, 53, 'outh登陆', 54, NULL, NULL, 18),
(26, '2017-05-30 17:10:15', '006', '1,26', '2017-05-30 17:10:15', 2, 56, '国家标准', 57, NULL, NULL, 1),
(27, '2017-06-20 22:15:53', '007', '1,27', '2017-06-20 22:17:10', 2, 58, '后台开发', 59, NULL, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `article_comment`
--

CREATE TABLE IF NOT EXISTS `article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghmocqkgqs5tkmucf5putw64t` (`article_id`),
  KEY `FKq2u0dy36tq655hnhxal16of7k` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `article_comment`
--

INSERT INTO `article_comment` (`id`, `addDate`, `lastDate`, `contents`, `title`, `article_id`, `user_id`) VALUES
(1, '2017-12-04 08:55:24', '2017-12-04 08:55:24', '分析太简单了', NULL, 8, 4),
(2, '2017-12-06 14:31:41', '2017-12-06 14:31:41', '01', NULL, 8, 26),
(3, '2018-04-11 15:28:25', '2018-04-11 15:28:25', '1', NULL, 8, 77),
(4, '2018-04-11 15:28:35', '2018-04-11 15:28:35', '1', NULL, 8, 77),
(5, '2018-05-07 15:37:45', '2018-05-07 15:37:45', '111', NULL, 10, 84),
(6, '2018-05-21 01:06:33', '2018-05-21 01:06:33', '4567', NULL, 11, 87);

-- --------------------------------------------------------

--
-- 表的结构 `article_like`
--

CREATE TABLE IF NOT EXISTS `article_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKabthli6g1qjriusniw93pbesw` (`article_id`),
  KEY `FK13bn3spxe6xfy318i80669hon` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `article_like`
--

INSERT INTO `article_like` (`id`, `addDate`, `lastDate`, `article_id`, `user_id`) VALUES
(1, '2017-12-06 14:31:35', '2017-12-06 14:31:35', 8, 26),
(2, '2017-12-06 16:12:29', '2017-12-06 16:12:29', 7, 4),
(3, '2017-12-08 08:26:49', '2017-12-08 08:26:49', 2, 4),
(4, '2017-12-19 09:34:28', '2017-12-19 09:34:28', 9, 1),
(5, '2017-12-27 03:45:07', '2017-12-27 03:45:07', 8, 41),
(6, '2018-05-04 18:34:02', '2018-05-04 18:34:02', 7, 84),
(7, '2018-05-07 15:37:55', '2018-05-07 15:37:55', 10, 84),
(8, '2018-05-21 01:06:17', '2018-05-21 01:06:17', 11, 87);

-- --------------------------------------------------------

--
-- 表的结构 `article_link_tag`
--

CREATE TABLE IF NOT EXISTS `article_link_tag` (
  `Article_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Article_id`,`tags_id`),
  KEY `FK8cbs5lfskjdpwpae5p48um1gr` (`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `article_sensitive_category`
--

CREATE TABLE IF NOT EXISTS `article_sensitive_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6yr0lp832885ybn738e80wlp4` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `article_sensitive_word`
--

CREATE TABLE IF NOT EXISTS `article_sensitive_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `replace_word` varchar(255) DEFAULT NULL,
  `word_size` int(11) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jx243akswqmswta87kwsr4wb` (`category_id`),
  KEY `FKebq1aflt9h1l0hki7qu3292yj` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `article_tag`
--

CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum`
--

CREATE TABLE IF NOT EXISTS `bbs_froum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `nums` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK99cbquciodl5d60fv27360ey0` (`pid`),
  KEY `FKcpeqv28x1i4pp9fraf175v9bf` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `bbs_froum`
--

INSERT INTO `bbs_froum` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `pid`, `user_id`, `nums`) VALUES
(1, NULL, '1', '1', NULL, 1, 1, '论坛分类', 40, NULL, NULL, NULL, 0),
(2, '2017-06-27 22:28:08', '1', '1,2', '2017-06-27 22:28:08', 2, 2, '前端技术', 11, NULL, 1, NULL, 0),
(3, '2017-06-27 22:28:18', '2', '1,3', '2017-06-27 22:28:18', 2, 12, '后端技术', 31, NULL, 1, NULL, 0),
(4, '2017-06-27 22:28:33', '3', '1,4', '2017-06-27 22:28:33', 2, 32, '网站站务', 37, NULL, 1, NULL, NULL),
(5, '2017-06-27 22:28:46', '1', '1,2,5', '2017-06-27 22:28:46', 3, 3, 'Jquery', 4, NULL, 2, NULL, 0),
(6, '2017-06-27 22:28:58', '2', '1,2,6', '2017-06-27 22:28:58', 3, 5, 'Bootstrap', 6, NULL, 2, NULL, NULL),
(7, '2017-06-27 22:29:14', '3', '1,2,7', '2017-06-27 22:29:14', 3, 7, 'knockoutjs', 8, NULL, 2, NULL, NULL),
(8, '2017-06-27 22:29:23', '4', '1,2,8', '2017-06-27 22:29:23', 3, 9, 'css', 10, NULL, 2, NULL, NULL),
(9, '2017-06-27 22:30:11', '1', '1,3,9', '2017-06-27 22:30:11', 3, 13, 'hibernate', 14, NULL, 3, NULL, 0),
(10, '2017-06-27 22:30:21', '2', '1,3,10', '2017-06-27 22:30:21', 3, 15, 'spring-framework', 16, NULL, 3, NULL, NULL),
(11, '2017-06-27 22:30:29', '3', '1,3,11', '2017-06-27 22:30:29', 3, 17, 'freemarker', 18, NULL, 3, NULL, NULL),
(12, '2017-06-27 22:30:45', '4', '1,3,12', '2017-06-27 22:30:45', 3, 19, 'struts2', 20, NULL, 3, NULL, NULL),
(13, '2017-06-27 22:30:58', '5', '1,3,13', '2017-06-27 22:30:58', 3, 21, 'mybatis', 22, NULL, 3, NULL, NULL),
(14, '2017-06-27 22:31:26', '6', '1,3,14', '2017-06-27 22:31:26', 3, 23, 'elasticsearch', 24, NULL, 3, NULL, NULL),
(15, '2017-06-27 22:31:44', '7', '1,3,15', '2017-06-27 22:31:44', 3, 25, 'lucene', 26, NULL, 3, NULL, NULL),
(16, '2017-06-27 22:31:57', '8', '1,3,16', '2017-06-27 22:31:57', 3, 27, 'hadoop', 28, NULL, 3, NULL, NULL),
(17, '2017-06-27 22:32:12', '9', '1,3,17', '2017-06-27 22:32:12', 3, 29, 'zookeeper', 30, NULL, 3, NULL, NULL),
(18, '2017-06-27 22:32:35', '1', '1,4,18', '2017-06-27 22:32:35', 3, 33, '需求管理', 34, NULL, 4, NULL, NULL),
(19, '2017-06-27 22:32:53', '2', '1,4,19', '2017-06-27 22:32:53', 3, 35, '技术交流', 36, NULL, 4, NULL, NULL),
(20, '2017-12-19 09:35:38', '004', '1,20', '2017-12-19 09:35:38', 2, 38, '云计算', 39, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum_like`
--

CREATE TABLE IF NOT EXISTS `bbs_froum_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq69g1l1r0cvjlktxqcxx7xbh2` (`forum_id`),
  KEY `FKjcpxxoemhrqpoiqgpcylflqqc` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum_post`
--

CREATE TABLE IF NOT EXISTS `bbs_froum_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKibbpsgu59dqb2pn93frws97ue` (`forum_id`),
  KEY `FKgj7qy7909dd2ol6jyqsng4vma` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `bbs_froum_post`
--

INSERT INTO `bbs_froum_post` (`id`, `addDate`, `lastDate`, `name`, `user_id`, `forum_id`, `likes`, `views`) VALUES
(1, '2017-07-06 09:49:48', '2017-07-06 09:49:48', 'jQuery ', 1, 5, NULL, 141),
(2, '2017-12-19 09:37:20', '2017-12-19 09:37:20', 'layDate 日期与时间组件', 1, 5, NULL, 137),
(3, '2018-05-07 15:58:00', '2018-05-07 15:58:00', '阿斯顿', 40, 9, NULL, 74),
(4, '2018-04-19 22:32:24', '2018-04-19 22:32:24', '测试帖子', 79, 5, NULL, 32);

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum_post_comment`
--

CREATE TABLE IF NOT EXISTS `bbs_froum_post_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl3609kpq1ndm8sj537g0n4h52` (`post_id`),
  KEY `FK7c99tgmo41xp25p806yb3td7f` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum_post_like`
--

CREATE TABLE IF NOT EXISTS `bbs_froum_post_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK54q1j1txofkjnp86488hg4bmt` (`post_id`),
  KEY `FKpjxwd5j68bgpp0ca3t47pdr9u` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_froum_post_text`
--

CREATE TABLE IF NOT EXISTS `bbs_froum_post_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(10000) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKwm5wd5qoe1gldvyqrnsnncg6` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `bbs_froum_post_text`
--

INSERT INTO `bbs_froum_post_text` (`id`, `note`, `post_id`) VALUES
(1, 'jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互。\r\njQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。jQuery兼容各种主流浏览器，如IE 6.0+、FF 1.5+、Safari 2.0+、Opera 9.0+等。', 1),
(2, 'layDate 在 layui 2.0 的版本中迎来一次重生。无论曾经它给你带来过多么糟糕的体验，从今往后，所有的旧坑都将弥合。全面重写的 layDate 包含了大量的更新，其中主要以：年选择器、年月选择器、日期选择器、时间选择器、日期时间选择器 五种类型的选择方式为基本核心，并且均支持范围选择（即双控件）。内置强劲的自定义日期格式解析和合法校正机制，含中文版和国际版，主题简约却又不失灵活多样。由于内部采用的是零依赖的原生 JavaScript 编写，因此又可作为独立组件使用。毫无疑问，这是 layui 的虔心之作。 ', 2),
(3, '', 3),
(4, '测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子测试帖子', 4);

-- --------------------------------------------------------

--
-- 表的结构 `config_data_version`
--

CREATE TABLE IF NOT EXISTS `config_data_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `sequence` varchar(255) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `versionnum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f8c3y9hevq9jmdrb1wjyyqut` (`versionnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `friendlink`
--

CREATE TABLE IF NOT EXISTS `friendlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `friendlink`
--

INSERT INTO `friendlink` (`id`, `addDate`, `lastDate`, `sortnum`, `catalog`, `name`, `url`) VALUES
(1, '2017-06-02 22:49:33', '2017-06-02 22:49:33', 1, NULL, '开源中国', 'http://www.oschina.net/'),
(2, '2017-06-02 22:49:54', '2017-06-02 22:49:54', 2, NULL, 'github', 'https://github.com/'),
(3, '2017-06-02 22:50:53', '2017-06-02 22:50:53', 3, NULL, '网站源码', 'https://git.oschina.net/cng1985/iwan');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelInfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortNum` int(11) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nums` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqcf9gem97gqa5qjm4d3elcqt5` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelInfo`, `lft`, `name`, `rgt`, `sortNum`, `catalog`, `icon`, `nums`, `path`, `permission`, `pid`) VALUES
(1, '2017-09-25 14:25:39', '', '1', '2017-09-25 14:25:39', 1, 1, '根节点', 66, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2017-12-06 10:40:52', NULL, '1,2', '2017-12-06 10:40:52', 2, 2, '系统设置', 21, 1000, 0, 'fa  fa-gear', 0, '', '2', 1),
(3, '2017-09-25 14:34:37', NULL, '1,2,3', '2017-09-25 14:34:37', 3, 3, '菜单管理', 4, 0, 0, 'fa  fa-reorder', 0, 'admin/menu/view_list.htm', 'menu', 2),
(4, '2017-09-25 14:36:59', NULL, '1,2,4', '2017-09-25 14:36:59', 3, 5, '角色管理', 6, 0, 0, 'fa  fa-tree', 0, 'admin/userrole/view_list.htm', 'userrole', 2),
(5, '2017-09-25 14:38:29', NULL, '1,2,5', '2017-09-25 14:38:29', 3, 7, '第三方登陆配置', 8, 0, 0, 'fa  fa-connectdevelop', 0, 'admin/useroauthconfig/view_list.htm', 'useroauthconfig', 2),
(6, '2017-09-25 14:35:30', NULL, '1,2,6', '2017-09-25 14:35:30', 3, 9, '友情链接分类管理', 10, 0, 0, 'fa  fa-link', 0, 'admin/linktype/view_list.htm', 'linktype', 2),
(7, '2017-09-25 14:37:37', NULL, '1,2,7', '2017-09-25 14:37:37', 3, 11, '友情链接管理', 12, 0, 0, 'fa  fa-link', 0, 'admin/link/view_list.htm', 'link', 2),
(8, '2017-09-25 14:48:04', NULL, '1,2,8', '2017-09-25 14:48:04', 3, 13, '角色分类配置', 14, 0, 0, 'fa  fa-user-secret', 0, 'admin/userrolecatalog/view_list.htm', 'userrolecatalog', 2),
(9, '2017-09-25 14:47:35', NULL, '1,2,9', '2017-09-25 14:47:35', 3, 15, '移动app配置', 16, 0, 0, 'fa  fa-life-ring', 0, 'admin/app/view_list.htm', 'app', 2),
(10, '2017-09-25 15:22:17', NULL, '1,2,10', '2017-09-25 15:22:17', 3, 17, '网站主题配置', 18, 0, 0, 'fa  fa-sitemap', 0, 'admin/theme.htm', '10', 2),
(11, '2017-09-26 10:34:40', NULL, '1,2,11', '2017-09-26 10:34:40', 3, 19, '模板管理', 20, NULL, 0, 'fa fa-circle-o', NULL, 'admin/tmpl/view_list.htm', 'tmpl', 2),
(12, '2017-12-06 11:03:34', NULL, '1,12', '2017-12-06 11:03:34', 2, 22, '文章管理', 27, 3, 0, 'fa fa-book', 0, '', '12', 1),
(13, '2017-10-25 16:07:28', NULL, '1,12,13', '2017-10-25 16:07:28', 3, 23, '文章分类管理', 24, 0, 0, 'fa fa-circle-o', 0, 'admin/articlecatalog/view_list.htm', 'articlecatalog', 12),
(14, '2017-10-25 16:06:34', NULL, '1,12,14', '2017-10-25 16:06:34', 3, 25, '文章管理', 26, 0, 0, 'fa fa-circle-o', 0, 'admin/article/view_list.htm', 'article', 12),
(15, '2017-12-06 10:58:54', NULL, '1,15', '2017-12-06 10:58:54', 2, 28, '论坛管理', 33, 1, 0, 'fa fa-th', 0, '5', '15', 1),
(16, '2017-11-27 09:32:24', NULL, '1,15,16', '2017-11-27 09:32:24', 3, 29, '模块配置', 30, 1, 0, 'menu-icon fa fa-angle-right', NULL, 'admin/forum/view_list.htm', 'forum', 15),
(17, '2017-11-27 09:33:16', NULL, '1,15,17', '2017-11-27 09:33:16', 3, 31, '帖子管理', 32, 2, 0, 'menu-icon fa fa-angle-right', 0, 'admin/forumpost/view_list.htm', 'forumpost', 15),
(18, '2017-12-06 10:57:37', NULL, '1,18', '2017-12-06 10:57:37', 2, 34, '控制台', 35, 0, 0, 'fa fa-home', 0, 'admin/index.htm', '18', 1),
(19, '2017-12-06 11:00:05', NULL, '1,19', '2017-12-06 11:00:05', 2, 36, '问答管理', 41, 1, 0, 'fa  fa-question-circle', 0, '', '19', 1),
(20, '2017-12-06 11:02:47', NULL, '1,20', '2017-12-06 11:02:47', 2, 42, '活动管理', 47, 2, 0, 'fa  fa-futbol-o', 0, '', '20', 1),
(21, '2017-12-06 11:00:32', NULL, '1,21', '2017-12-06 11:00:32', 2, 48, '用户管理', 55, 0, 0, 'fa  fa-users', 0, '', '21', 1),
(22, '2017-12-06 10:47:52', NULL, '1,20,22', '2017-12-06 10:47:52', 3, 43, '活动分类管理', 44, 0, 0, 'fa fa-circle-o', 0, 'admin/activitycatalog/view_list.htm', 'activitycatalog', 20),
(23, '2017-12-06 10:47:46', NULL, '1,20,23', '2017-12-06 10:47:46', 3, 45, '活动管理', 46, 2, 0, 'fa fa-circle-o', 0, 'admin/activity/view_list.htm', 'activity', 20),
(24, '2017-12-06 11:05:08', NULL, '1,21,24', '2017-12-06 11:05:08', 3, 49, '用户管理', 50, 0, 0, 'fa fa-user', 0, 'admin/userinfo/view_list.htm', 'userinfo', 21),
(25, '2017-12-06 11:12:54', NULL, '1,19,25', '2017-12-06 11:12:54', 3, 37, '问答分类管理', 38, 0, 0, 'fa fa-circle-o', 0, 'admin/questioncatalog/view_list.htm', 'questioncatalog', 19),
(26, '2017-12-06 11:13:11', NULL, '1,19,26', '2017-12-06 11:13:11', 3, 39, '问答管理', 40, 0, 0, 'fa fa-circle-o', 0, 'admin/question/view_list.htm', 'question', 19),
(27, '2017-12-06 14:57:58', NULL, '1,21,27', '2017-12-06 14:57:58', 3, 51, '账号管理', 52, 0, 0, 'fa fa-list', 0, 'admin/useraccount/view_list.htm', 'useraccount', 21),
(28, '2017-12-06 16:13:33', NULL, '1,21,28', '2017-12-06 16:13:33', 3, 53, '标签管理', 54, NULL, 0, 'fa fa-circle-o', NULL, 'admin/userlabel/view_list.htm', 'userlabel', 21),
(29, '2017-12-06 17:44:37', NULL, '1,29', '2017-12-06 17:44:37', 2, 56, '服务插件管理', 59, 1500, 0, 'fa  fa-cloud', 0, '', '29', 1),
(31, '2017-12-06 17:45:06', NULL, '1,29,31', '2017-12-06 17:45:06', 3, 57, '存储插件配置', 58, 0, 0, 'fa  fa-cloud-upload', 0, 'admin/storage_plugin/list.htm', 'storage_plugin', 29),
(32, '2018-05-21 08:57:30', NULL, '1,32', '2018-05-21 08:57:30', 2, 60, '股票模块', 65, 3, 0, 'fa  fa-money', 0, '', '32', 1),
(33, '2018-05-21 08:51:37', NULL, '1,32,33', '2018-05-21 08:51:37', 3, 61, '股票管理', 62, NULL, 0, 'fa fa-circle-o', NULL, 'admin/stock/view_list.htm', 'stock', 32),
(34, '2018-05-21 08:51:53', NULL, '1,32,34', '2018-05-21 08:51:53', 3, 63, '股票分时数据', 64, NULL, 0, 'fa fa-circle-o', NULL, 'admin/stockdaytime/view_list.htm', 'stockdaytime', 32);

-- --------------------------------------------------------

--
-- 表的结构 `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `versionnum` bigint(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfy0n186b8arfdbdkkwp2h5cc5` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `plugin_config`
--

CREATE TABLE IF NOT EXISTS `plugin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `isEnabled` bit(1) NOT NULL,
  `pluginId` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d80yc0eis8aaqm59fnxc5rs0l` (`pluginId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `plugin_config`
--

INSERT INTO `plugin_config` (`id`, `addDate`, `lastDate`, `sortnum`, `isEnabled`, `pluginId`) VALUES
(1, '2017-12-06 18:22:42', '2017-12-06 18:22:42', 1, b'1', 'qiNiuStoragePlugin'),
(2, '2018-01-02 16:58:16', '2018-01-02 16:58:16', NULL, b'0', 'diskFilePlugin'),
(3, '2018-01-03 19:53:37', '2018-01-03 19:53:37', NULL, b'0', 'filePlugin');

-- --------------------------------------------------------

--
-- 表的结构 `plugin_config_attribute`
--

CREATE TABLE IF NOT EXISTS `plugin_config_attribute` (
  `PluginConfig_id` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`PluginConfig_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `plugin_config_attribute`
--

INSERT INTO `plugin_config_attribute` (`PluginConfig_id`, `attributes`, `name`) VALUES
(1, 'U5VKtUFe6bCJ642tnFu4--fP2DSydhNxJ13Dc74O', 'accessKey'),
(1, 'iwan', 'domain'),
(1, 'Exi35KBoHRKw6ensQMJBECKnRTEIEsu4aXvMJDA2', 'secretKey'),
(1, 'http://image.yichisancun.com/', 'url');

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `answers` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `favorites` int(11) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1qppmll4xo1lc5mo29t1btl4p` (`catalog_id`),
  KEY `FKtish917q79dtiyfly6coc9080` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `question`
--

INSERT INTO `question` (`id`, `addDate`, `lastDate`, `answers`, `contents`, `favorites`, `images`, `state`, `title`, `views`, `votes`, `catalog_id`, `userid`) VALUES
(1, '2017-06-02 22:36:12', '2017-06-02 22:36:12', 1, '怎么去学习一门编程语言', NULL, NULL, 0, '怎么去学习一门编程语言', 0, NULL, NULL, 4),
(2, '2017-11-17 09:50:01', '2017-11-17 09:50:01', NULL, '如题。', NULL, NULL, 0, '好好学习，天天向上就行', 0, NULL, 2, 19),
(3, '2017-11-23 15:05:27', '2017-11-23 15:05:27', NULL, '怎么提高网站的ui体验', NULL, NULL, 0, '怎么提高网站的ui体验', 0, NULL, 2, 20),
(4, '2017-12-04 08:31:07', '2017-12-04 08:31:07', NULL, '毕业前去的一家公司，工资不高，但是每月公积金交的多，公司福利好；由于个人原因不到半年辞职了；然后过了两月后，又找了一家外包公司，被分配到厂商驻地开发，个人感觉没有之前公司的气氛，这边的人也很冷漠，只要完成任务即可，内心稍有些失落...............', NULL, NULL, 0, '', 0, NULL, 5, 4),
(5, '2017-12-19 09:22:31', '2017-12-19 09:22:31', NULL, '怎样提供自己的技术水平？，出看书外还有什么办法', NULL, NULL, 0, '怎样提供自己的技术水平？', 0, NULL, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `question_answer`
--

CREATE TABLE IF NOT EXISTS `question_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ups` int(11) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKflwcda2rengsndju5f1deywok` (`question_id`),
  KEY `FKqywdip0nvnrxt1ticvl3kydnw` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `question_answer`
--

INSERT INTO `question_answer` (`id`, `addDate`, `lastDate`, `contents`, `images`, `state`, `title`, `ups`, `question_id`, `userid`) VALUES
(1, '2017-06-02 22:37:34', '2017-06-02 22:37:34', '可以先培养一下编程习惯！', NULL, NULL, NULL, 0, 1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `question_answer_vote`
--

CREATE TABLE IF NOT EXISTS `question_answer_vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm1h5ifaa0uijbicdhjgspbcxh` (`answer_id`),
  KEY `FKl4eaxmxp38b602u7slx5wpvqy` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_catalog`
--

CREATE TABLE IF NOT EXISTS `question_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
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
  KEY `FKcsqfog6i2c9dluroqo1e5dwdd` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `question_catalog`
--

INSERT INTO `question_catalog` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `icon`, `nums`, `path`, `pid`) VALUES
(1, '2017-06-03 00:00:00', NULL, '1', '2017-06-03 00:00:00', 1, 1, '问答分类', 12, 1, NULL, NULL, NULL, NULL),
(2, '2017-06-03 13:19:55', NULL, '1,2', '2017-06-03 13:19:55', 2, 2, '技术问答', 3, NULL, 'menu-icon fa fa-angle-right ', NULL, '', 1),
(3, '2017-06-03 13:20:15', NULL, '1,3', '2017-06-03 13:20:15', 2, 4, '技术分享', 5, NULL, 'menu-icon fa fa-angle-right ', NULL, '', 1),
(4, '2017-06-03 13:20:27', NULL, '1,4', '2017-06-03 13:20:27', 2, 6, 'IT大杂烩', 7, NULL, 'menu-icon fa fa-angle-right ', NULL, '', 1),
(5, '2017-06-03 13:20:35', NULL, '1,5', '2017-06-03 13:20:35', 2, 8, '职业生涯', 9, NULL, 'menu-icon fa fa-angle-right ', NULL, '', 1),
(6, '2017-06-03 13:20:43', NULL, '1,6', '2017-06-03 13:20:43', 2, 10, '站务/建议', 11, NULL, 'menu-icon fa fa-angle-right ', NULL, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `question_favorite`
--

CREATE TABLE IF NOT EXISTS `question_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhsljtebjn3ao1k2dihn89flu5` (`question_id`),
  KEY `FKclt463wvm2gf9s4rl8ldjq8w1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_points`
--

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
  KEY `FKcp6ky2ygv6jcaokw12xxeg2gi` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_tag`
--

CREATE TABLE IF NOT EXISTS `question_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_72eddk8u7mq3adgulp9jmn8xn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_vote`
--

CREATE TABLE IF NOT EXISTS `question_vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKast4xiggbs08xfqm2oltcl32l` (`question_id`),
  KEY `FKmepf1jggv0klnbk6ctaprihdh` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_word`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `site_app`
--

CREATE TABLE IF NOT EXISTS `site_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `appKey` varchar(255) DEFAULT NULL,
  `appSecret` varchar(255) DEFAULT NULL,
  `downUrl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(255) DEFAULT NULL,
  `counts` bigint(20) DEFAULT NULL,
  `system_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jfx5shexfh9lo32836m2t62ga` (`packageName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `site_app_version`
--

CREATE TABLE IF NOT EXISTS `site_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `downUrl` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(255) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9rgjxw6r5h7gf0e7ijfbademt` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `site_config`
--

CREATE TABLE IF NOT EXISTS `site_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `domainName` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `icp` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `pageSize` int(11) DEFAULT NULL,
  `shortName` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mobile` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `site_config`
--

INSERT INTO `site_config` (`id`, `addDate`, `lastDate`, `description`, `domainName`, `favicon`, `icp`, `keywords`, `logo`, `pageSize`, `shortName`, `theme`, `title`, `mobile`) VALUES
(1, '2017-10-25 14:46:35', '2017-10-25 14:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'adminlte', NULL, b'0');

-- --------------------------------------------------------

--
-- 表的结构 `site_link`
--

CREATE TABLE IF NOT EXISTS `site_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sortNum` int(11) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `linkType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1316ht5o7bmu4jbixoso45paa` (`linkType_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `site_link`
--

INSERT INTO `site_link` (`id`, `addDate`, `lastDate`, `icon`, `name`, `sortNum`, `target`, `url`, `linkType_id`) VALUES
(1, '2017-12-05 16:20:29', '2017-12-05 16:20:29', NULL, '同纳信息', 1, '_blank', 'http://www.tongnainfo.com', 2),
(2, '2017-12-05 16:21:39', '2017-12-05 16:21:39', NULL, 'disconver库', NULL, '_blank', 'https://gitee.com/quhaodian/disconver', 3),
(3, '2017-12-08 15:52:05', '2017-12-08 15:52:05', NULL, '重庆不挂科', 2, '_blank', 'http://www.buguake.cc/', 2);

-- --------------------------------------------------------

--
-- 表的结构 `site_link_type`
--

CREATE TABLE IF NOT EXISTS `site_link_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsve8aryqrci3acgot8k7rt6ix` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `site_link_type`
--

INSERT INTO `site_link_type` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelinfo`, `lft`, `name`, `rgt`, `sortnum`, `pid`) VALUES
(1, '2017-11-02 09:00:51', '', '1', '2017-11-02 09:00:51', 1, 1, '根节点', 6, 0, NULL),
(2, '2017-12-05 16:19:28', '001', '1,2', '2017-12-05 16:19:28', 2, 2, '合作公司', 3, NULL, 1),
(3, '2017-12-05 16:19:37', '002', '1,3', '2017-12-05 16:19:37', 2, 4, '合作网站', 5, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `site_log`
--

CREATE TABLE IF NOT EXISTS `site_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `level_info` int(11) DEFAULT NULL,
  `messages` varchar(5000) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `site_template_noticec`
--

CREATE TABLE IF NOT EXISTS `site_template_noticec` (
  `id` varchar(255) NOT NULL,
  `catalog` int(11) DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `site_template_push`
--

CREATE TABLE IF NOT EXISTS `site_template_push` (
  `id` varchar(255) NOT NULL,
  `catalog` int(11) DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `site_template_web`
--

CREATE TABLE IF NOT EXISTS `site_template_web` (
  `id` varchar(255) NOT NULL,
  `catalog` int(11) DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `site_theme_config`
--

CREATE TABLE IF NOT EXISTS `site_theme_config` (
  `id` varchar(255) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `path` varchar(20) DEFAULT NULL,
  `screenShot` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `site_theme_config`
--

INSERT INTO `site_theme_config` (`id`, `name`, `path`, `screenShot`) VALUES
('adminlte', 'adminlte', 'adminlte', 'dist/theme/b.jpg'),
('default', '默认', 'adminlte', 'dist/theme/a.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `stock`
--

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
  KEY `FKrg26e7f0ce0ha3393rmsypakq` (`catalog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3640 ;

--
-- 转存表中的数据 `stock`
--

INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '宁夏', 0.21, '000557', 0, 1843.7, '红黄药酒', 24440.8, '*ST广夏', 66800.5, 27.85, 32757.7, '*STguangxia', '*STgx', '5.66', 101737, 1.48, NULL, 27413.4, 68613.4, NULL),
(2, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '浙江', 1.86, '000558', -0.03, 26677.6, '区域地产', 368702, '莱茵体育', 62979.5, 8.77, 0, 'laiyintiyu', 'lyty', '16.98', 49979, 0.58, NULL, 433729, 85948.3, NULL),
(3, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '浙江', 1.68, '000559', 0.196, 273494, '汽车配件', 631373, '万向钱潮', 228990, 9.34, 40.14, 'wanxiangqianchao', 'wxqc', '15.01', 30079.8, 0.13, NULL, 1037400, 229430, NULL),
(4, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '云南', 7.63, '000560', 0.02, 58739.1, '百货', 358242, '昆百大Ａ', 16542.4, 2.17, 895.78, 'kunbaidaＡ', 'kbdＡ', '9.36', 225960, 4.85, NULL, 589364, 46542.8, NULL),
(5, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '陕西', 1.59, '000561', 0.01, 13983.8, '通信设备', 158595, '烽火电子', 59399.2, 5.2, 414.48, 'fenghuodianzi', 'fhdz', '11.09', 4866.97, 0.08, NULL, 186613, 59584.5, NULL),
(6, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '陕西', 3.6, '000563', 0.238, 5872.45, '多元金融', 0, '陕国投Ａ', 121467, 2.56, 19.38, 'shanguotouＡ', 'sgtＡ', '5.63', 145324, 1.2, NULL, 577893, 121467, NULL),
(7, '2016-06-05 13:20:45', '2016-06-05 13:20:45', '陕西', 3.67, '000564', 0.049, 170427, '百货', 413818, '西安民生', 33580.9, 2.19, 82.63, 'xianminsheng', 'xams', '9.06', 80082.4, 1.06, NULL, 764132, 75292.6, NULL),
(8, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '重庆', 1.79, '000565', 0.35, 23338.2, '染料涂料', 57480.4, '渝三峡Ａ', 43359.2, 5.38, 13.79, 'yusanxiaＡ', 'ysxＡ', '0.00', 18567.8, 0.43, NULL, 107021, 43359.2, NULL),
(9, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '海南', 4.03, '000566', 0.22, 65993.6, '化学制药', 167511, '海南海药', 49434.3, 12.39, 119.42, 'hainanhaiyao', 'hnhy', '10.55', 112750, 2.07, NULL, 448103, 54534, NULL),
(10, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '海南', 1.38, '000567', 0.094, 491.01, '区域地产', 9092.42, '海德股份', 15036.1, 9.13, 67, 'haidegufen', 'hdgf', '31.76', 11672.8, 0.77, NULL, 21852.4, 15120, NULL),
(11, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '四川', 7.08, '000568', 0.728, 101799, '白酒', 978451, '泸州老窖', 140053, 3.08, 14.94, 'luzhoulaojiao', 'lzlj', '25.58', 65207.9, 0.47, NULL, 1359020, 140225, NULL),
(12, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '江苏', 3.78, '000570', 0.067, 56947.1, '农用机械', 183869, '苏常柴Ａ', 41137.4, 2, 56.49, 'suchangchaiＡ', 'sccＡ', '9.66', 16432.8, 0.29, NULL, 339373, 56137.4, NULL),
(13, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '海南', 2.73, '000571', 0.062, 61871.9, '煤炭开采', 123701, '新大洲Ａ', 73575, 1.84, 40.79, 'xindazhouＡ', 'xdzＡ', '0.00', 64534.9, 0.79, NULL, 488856, 81406.4, NULL),
(14, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '海南', 4.5, '000572', 0.118, 324195, '汽车整车', 616602, '海马汽车', 164210, 1.3, 24.81, 'haimaqiche', 'hmqc', '5.13', 378793, 2.3, NULL, 1513220, 164464, NULL),
(15, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '广东', 2.52, '000573', -0.04, 8696.95, '区域地产', 205155, '粤宏远Ａ', 62228.6, 1.73, 0, 'yuehongyuanＡ', 'yhyＡ', '8.06', 55487.4, 0.89, NULL, 321474, 62275.6, NULL),
(16, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '广东', 2.25, '000576', -0.055, 61201.7, '综合类', 41916.4, '广东甘化', 25617.6, 4.14, 0, 'guangdongganhua', 'gdgh', '13.78', 84164.2, 1.9, NULL, 155411, 44286.1, NULL),
(17, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '江苏', 11.39, '000581', 1.025, 136519, '汽车配件', 869497, '威孚高科', 84775.6, 2.04, 11.32, 'weifugaoke', 'wfgk', '19.41', 363568, 3.56, NULL, 1545260, 102020, NULL),
(18, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '广西', 5.98, '000582', 0.29, 708781, '港口', 265799, '北部湾港', 14205.9, 2.72, 31.49, 'beibuwangang', 'bbwg', '0.00', 267984, 2.81, NULL, 1203190, 95404.6, NULL),
(19, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '江苏', 3.18, '000584', 0.069, 102502, '化纤', 205334, '友利控股', 61061.5, 3.04, 69.62, 'youlikonggu', 'ylkg', '10.27', 67523.7, 1.1, NULL, 318832, 61332.4, NULL),
(20, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '辽宁', 0.33, '000585', -0.002, 5915.02, '电气设备', 31379.7, '东北电气', 60942.1, 15.56, 0, 'dongbeidianqi', 'dbdq', '6.07', 88342.2, 1.01, NULL, 49261.8, 87337, NULL),
(21, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '四川', 1.1, '000586', 0.005, 3529.78, '通信设备', 37830, '汇源通信', 19344, 17.89, 2002.54, 'huiyuantongxin', 'hytx', '22.56', 6064.65, 0.31, NULL, 46485.9, 19344, NULL),
(22, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '黑龙江', 2.47, '000587', 0.129, 6689.72, '批发业', 326879, '金叶珠宝', 55713.5, 7.93, 76.09, 'jinyezhubao', 'jyzb', '14.50', 39732.4, 0.71, NULL, 334600, 55713.5, NULL),
(23, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '贵州', 4.95, '000589', 0.084, 295760, '汽车配件', 674365, '黔轮胎Ａ', 74540.7, 1.14, 33.5, 'qianluntaiＡ', 'qltＡ', '5.23', 183544, 2.37, NULL, 1128800, 77546.4, NULL),
(24, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '湖南', 0.88, '000590', 0.051, 14096.6, '中成药', 23991.2, '*ST古汉', 22323.6, 23.2, 201.65, '*STguhan', '*STgh', '21.64', 15244.8, 0.68, NULL, 57575.3, 22333.1, NULL),
(25, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '重庆', 1.51, '000591', 0.069, 45105.6, '医药商业', 228770, '桐 君 阁', 27463.1, 8.4, 91.98, 'tong jun ge', 't j g', '14.48', 3442.65, 0.13, NULL, 328310, 27463.1, NULL),
(26, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '福建', 1.38, '000592', 0.036, 23286.5, '林业', 189664, '平潭发展', 83770.5, 8.9, 168.36, 'pingtanfazhan', 'ptfz', '14.13', 54656.3, 0.64, NULL, 239807, 84740.7, NULL),
(27, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '四川', 2.36, '000593', 0.025, 35281.9, '供气供热', 22940.2, '大通燃气', 22317.5, 3.43, 163.9, 'datongranqi', 'dtrq', '11.90', 27011.4, 0.96, NULL, 74654.7, 27994, NULL),
(28, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '宁夏', 2.25, '000595', -0.13, 22577.6, '机械基件', 90518.9, '宝塔实业', 21681, 5.01, 0, 'baotashiye', 'btsy', '11.84', 80877.7, 2.17, NULL, 131186, 37244, NULL),
(29, '2016-06-05 13:20:46', '2016-06-05 13:20:46', '安徽', 8.97, '000596', 0.756, 172305, '白酒', 448317, '古井贡酒', 38359.9, 3.32, 19.73, 'gujinggongjiu', 'gjgj', '46.50', 129494, 2.57, NULL, 703417, 50360, NULL),
(30, '2016-06-05 13:20:46', '2016-06-05 13:20:47', '辽宁', 5.43, '000597', -0.181, 171653, '化学制药', 414121, '东北制药', 43854.9, 1.28, 0, 'dongbeizhiyao', 'dbzy', '8.95', 176992, 3.73, NULL, 873394, 47465.5, NULL),
(31, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '四川', 2.62, '000598', 0.146, 542901, '水务', 246096, '兴蓉环境', 298622, 2.44, 21.85, 'xingronghuanjing', 'xrhj', '5.39', 177916, 0.6, NULL, 1270080, 298622, NULL),
(32, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '山东', 3.73, '000599', 0.039, 129804, '汽车配件', 320737, '青岛双星', 52481.1, 1.71, 82, 'qingdaoshuangxing', 'qdsx', '6.77', 119546, 1.77, NULL, 555444, 67457.9, NULL),
(33, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '河北', 5.38, '000600', 0.611, 1419080, '火力发电', 315336, '建投能源', 109005, 1.69, 7.46, 'jiantounengyuan', 'jtny', '9.21', 440559, 2.46, NULL, 2466040, 179163, NULL),
(34, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '广东', 3.52, '000601', 0.129, 692432, '火力发电', 120428, '韶能股份', 99395.4, 3.58, 48.71, 'shaonenggufen', 'sngf', '9.40', 158532, 1.47, NULL, 854992, 108055, NULL),
(35, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '北京', 1.65, '000603', 0.267, 13096.4, '铅锌', 80520.7, '盛达矿业', 44077.1, 8.24, 25.45, 'shengdakuangye', 'sdky', '15.52', 0, 0, NULL, 139277, 50498.9, NULL),
(36, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '北京', 4.97, '000605', 0.057, 112418, '水务', 36870, '渤海股份', 11843.5, 2.7, 118.81, 'bohaigufen', 'bhgf', '17.96', 49125.1, 2.52, NULL, 234641, 19499.1, NULL),
(37, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '青海', 1.66, '000606', -0.09, 49683.1, '化学制药', 39404.7, '青海明胶', 40596.4, 3.87, 0, 'qinghaimingjiao', 'qhmj', '9.87', 38605.1, 0.82, NULL, 127766, 47211.4, NULL),
(38, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '浙江', 1.31, '000607', 0.07, 22881.7, '广告包装', 136020, '华媒控股', 48773.2, 5.85, 54.66, 'huameikonggu', 'hmkg', '8.78', -23476.3, -0.23, NULL, 210893, 101770, NULL),
(39, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '广西', 4.37, '000608', -0.022, 3258, '区域地产', 430308, '阳光股份', 74991.3, 0.98, 0, 'yangguanggufen', 'yggf', '0.00', 51115.2, 0.68, NULL, 1047800, 74991.3, NULL),
(40, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '北京', 4.28, '000609', -0.013, 3929.51, '区域地产', 167793, '绵世股份', 27411.9, 2.38, 0, 'mianshigufen', 'msgf', '11.61', 1206, 0.04, NULL, 195882, 29809.6, NULL),
(41, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '陕西', 3.24, '000610', -0.037, 22825.6, '旅游服务', 61289.6, '西安旅游', 19508.2, 3.09, 0, 'xianlvyou', 'xaly', '0.00', 39470.6, 1.67, NULL, 103980, 23674.8, NULL),
(42, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '内蒙', 1.62, '000611', -0.068, 4185.85, '纺织', 47687.6, '*ST蒙发', 31906.4, 5.07, 0, '*STmengfa', '*STmf', '8.74', 13855.4, 0.43, NULL, 69138.1, 32182.2, NULL),
(43, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '河南', 4.05, '000612', 0.04, 309106, '铝', 114864, '焦作万方', 95778.1, 1.48, 74.51, 'jiaozuowanfang', 'jzwf', '0.00', 160309, 1.33, NULL, 912948, 120284, NULL),
(44, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '海南', 0.22, '000613', -0.009, 5412.3, '旅游服务', 2451.15, '大东海A', 26102.7, 48.89, 0, 'dadonghaiA', 'ddhA', '13.25', 5414.27, 0.15, NULL, 10992, 36410, NULL),
(45, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '湖北', 3.56, '000615', 0.497, 33169.2, '化纤', 36238, '湖北金环', 21167.2, 2.53, 9.06, 'hubeijinhuan', 'hbjh', '16.83', 8866.91, 0.42, NULL, 123468, 21167.7, NULL),
(46, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '辽宁', 3.01, '000616', 0.06, 14239.9, '全国地产', 760934, '海航投资', 143013, 2.06, 51.6, 'haihangtouzi', 'hhtz', '5.42', 20155.4, 0.14, NULL, 844183, 143023, NULL),
(47, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '山东', 2.11, '000617', 0.021, 55079.3, '机械基件', 149621, '石油济柴', 28753.9, 4.51, 226.6, 'shiyoujichai', 'syjc', '0.00', 3812.12, 0.13, NULL, 224531, 28753.9, NULL),
(48, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '安徽', 6.6, '000619', 0.122, 165767, '其他建材', 229937, '海螺型材', 36000, 1.3, 35.1, 'hailuoxingcai', 'hlxc', '0.00', 43699.9, 1.21, NULL, 421057, 36000, NULL),
(49, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '北京', 2.97, '000620', 0.039, 104265, '区域地产', 2220660, '新华联', 159797, 3.2, 122.36, 'xinhualian', 'xhl', '7.36', 205128, 1.08, NULL, 2886590, 189669, NULL),
(50, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '湖南', 0.44, '000622', -0.036, 4237.12, '汽车配件', 20699.8, '恒立实业', 28297.6, 26, 0, 'henglishiye', 'hlsy', '9.71', 18291.4, 0.43, NULL, 34476.6, 42522.6, NULL),
(51, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '吉林', 19.21, '000623', 1.856, 159684, '中成药', 288776, '吉林敖东', 78904.1, 1.27, 6.56, 'jilinaodong', 'jlad', '25.17', 403496, 4.51, NULL, 1902120, 89443.8, NULL),
(52, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '重庆', 6.33, '000625', 1.091, 1384680, '汽车整车', 4433490, '长安汽车', 338752, 2.32, 6.73, 'zhanganqiche', 'zaqc', '14.50', 322749, 0.69, NULL, 7989880, 466289, NULL),
(53, '2016-06-05 13:20:47', '2016-06-05 13:20:47', '江苏', 4.19, '000626', 1.012, 6717.55, '商贸代理', 1263990, '如意集团', 20229.8, 10.32, 21.35, 'ruyijituan', 'ryjt', '57.82', 3265.54, 0.16, NULL, 1318330, 20250, NULL),
(54, '2016-06-05 13:20:47', '2016-06-05 13:20:48', '湖北', 1.04, '000627', -0.028, 43633.4, '化工原料', 42443.8, '天茂集团', 135359, 5.79, 0, 'tianmaojituan', 'tmjt', '7.75', 3015.37, 0.02, NULL, 213387, 135359, NULL),
(55, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '四川', 2.06, '000628', -0.06, 13683.2, '园区开发', 340170, '高新发展', 18775.2, 4.9, 0, 'gaoxinfazhan', 'gxfz', '12.31', 73173.1, 2.35, NULL, 406093, 31148, NULL),
(56, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '四川', 1.17, '000629', -0.062, 867995, '普钢', 996633, '攀钢钒钛', 476730, 2.7, 0, 'pangangfantai', 'pgft', '0.00', 557194, 0.65, NULL, 5608930, 858975, NULL),
(57, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '安徽', 3.92, '000630', 0.069, 1482340, '铜', 2979270, '铜陵有色', 284314, 2.15, 61.16, 'tonglingyouse', 'tlys', '2.61', 454856, 1.19, NULL, 5133580, 382426, NULL),
(58, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '吉林', 2.49, '000631', 0.147, 1380.89, '区域地产', 1064240, '顺发恒业', 146371, 2.84, 24.02, 'shunfahengye', 'sfhy', '5.19', 21622.9, 0.15, NULL, 1218720, 146371, NULL),
(59, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '福建', 2.71, '000632', 0.006, 28856.4, '综合类', 549473, '三木集团', 46548.5, 2.46, 554.67, 'sanmujituan', 'smjt', '9.05', 273.17, 0.01, NULL, 807356, 46552, NULL),
(60, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '辽宁', 0.48, '000633', -0.036, 11443.4, '综合类', 10887.1, '合金投资', 38510.6, 26.92, 0, 'hejintouzi', 'hjtz', '0.00', 4787.01, 0.12, NULL, 23916.7, 38510.6, NULL),
(61, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '宁夏', 9.21, '000635', 0.092, 237548, '化工原料', 67426.8, '英 力 特', 30308.8, 1.02, 51.01, 'ying li te', 'y l t', '0.00', 187857, 6.2, NULL, 318195, 30308.8, NULL),
(62, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '广东', 4.95, '000636', 0.052, 119876, '元器件', 253086, '风华高科', 67093.6, 1.49, 71.03, 'fenghuagaoke', 'fhgk', '0.00', 177504, 2.2, NULL, 544470, 80733, NULL),
(63, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '广东', 1.57, '000637', 0.093, 38968.9, '石油加工', 83422.3, '茂化实华', 36648.6, 3.74, 31.55, 'maohuashihua', 'mhsh', '6.57', 694.55, 0.01, NULL, 134281, 51987.5, NULL),
(64, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '辽宁', 0.73, '000638', -0.023, 153.14, '批发业', 254716, '万方发展', 30940, 12.37, 0, 'wanfangfazhan', 'wffz', '0.00', 8066.1, 0.26, NULL, 271365, 30940, NULL),
(65, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '山东', 3.41, '000639', 0.192, 59709.9, '食品', 102869, '西王食品', 37664.6, 3.31, 29.44, 'xiwangshipin', 'xwsp', '0.00', 24172.5, 0.64, NULL, 172708, 37664.6, NULL),
(66, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '江西', 1.75, '000650', 0.134, 50354.5, '中成药', 165545, '仁和药业', 123801, 9.8, 64.26, 'renheyaoye', 'rhyy', '7.59', 30951.4, 0.25, NULL, 280962, 123834, NULL),
(67, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '广东', 6.83, '000651', 0.951, 1509210, '家用电器', 12500700, '格力电器', 597318, 2.61, 9.39, 'gelidianqi', 'gldq', '0.00', 319127, 0.53, NULL, 16397500, 601573, NULL),
(68, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '天津', 1.62, '000652', 0.012, 27616.6, '综合类', 1911330, '泰达股份', 146567, 3.42, 224.37, 'taidagufen', 'tdgf', '4.69', 7214.68, 0.05, NULL, 2594620, 147557, NULL),
(69, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '山东', 5.24, '000655', -0.069, 55518.2, '普钢', 115274, '金岭矿业', 59534, 1.72, 0, 'jinlingkuangye', 'jlky', '7.36', 48799.8, 0.82, NULL, 357803, 59534, NULL),
(70, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '重庆', 2.6, '000656', 0.1, 170553, '区域地产', 8749560, '金科股份', 298439, 2.01, 23.04, 'jinkegufen', 'jkgf', '3.66', 17236.3, 0.04, NULL, 9467170, 413562, NULL),
(71, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '海南', 5.3, '000657', -0.213, 256538, '小金属', 428338, '中钨高新', 24557.1, 3.02, 0, 'zhongwugaoxin', 'zwgx', '15.77', 273344, 4.35, NULL, 776552, 62865.5, NULL),
(72, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '广东', 0.87, '000659', 0.003, 203676, '广告包装', 103128, '*ST中富', 128570, 5.16, 740.73, '*STzhongfu', '*STzf', '4.22', 26524.8, 0.21, NULL, 345092, 128570, NULL),
(73, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '吉林', 12.07, '000661', 1.339, 69813, '生物制药', 192968, '长春高新', 13132.4, 7.55, 34.04, 'zhangchungaoxin', 'zcgx', '96.10', 26456.7, 2.01, NULL, 329254, 13132.7, NULL),
(74, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '广西', 1.99, '000662', -0.001, 23093.6, '日用化工', 38732.1, '索芙特', 28798.5, 4.42, 0, 'suofute', 'sft', '19.62', 26786.8, 0.93, NULL, 74128.7, 28798.9, NULL),
(75, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '福建', 1.58, '000663', 0.013, 33378.4, '林业', 77524.5, '永安林业', 17031.8, 7.82, 482.17, 'yonganlinye', 'yaly', '12.44', 9199.26, 0.45, NULL, 134943, 20276, NULL),
(76, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '湖北', 8.16, '000665', 0.334, 402327, '影视音像', 96159.5, '湖北广电', 18996, 3.41, 41.61, 'hubeiguangdian', 'hbgd', '15.00', 346743, 5.45, NULL, 735114, 63621.8, NULL),
(77, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '北京', 8.38, '000666', 0.442, 179568, '纺织机械', 1843420, '经纬纺机', 29348.9, 1.78, 16.86, 'jingweifangji', 'jwfj', '18.48', 192239, 2.73, NULL, 2556280, 70413, NULL),
(78, '2016-06-05 13:20:48', '2016-06-05 13:20:48', '云南', 2.14, '000667', 0.014, 36973.1, '全国地产', 1665390, '美好集团', 255959, 2.05, 154.3, 'meihaojituan', 'mhjt', '3.63', 154742, 0.6, NULL, 1763390, 255959, NULL),
(79, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '上海', 4.22, '000668', -0.021, 483.01, '区域地产', 149843, '荣丰控股', 14668.8, 8.25, 0, 'rongfengkonggu', 'rfkg', '21.71', 8046.56, 0.55, NULL, 157014, 14684.2, NULL),
(80, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '吉林', 8.37, '000669', 0.294, 358876, '供气供热', 199503, '金鸿能源', 22330.9, 2, 28.56, 'jinhongnengyuan', 'jhny', '17.00', 215215, 4.43, NULL, 905698, 48600.6, NULL),
(81, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '湖北', 0.63, '000670', -0.035, 1144.66, '元器件', 54280.6, '盈方微', 56098.8, 14.92, 0, 'yingfangwei', 'yfw', '0.00', 18256.4, 0.22, NULL, 67781.9, 81662.7, NULL),
(82, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '福建', 5.09, '000671', 0.246, 1970.93, '区域地产', 5096970, '阳 光 城', 103919, 2.71, 27.98, 'yang guang cheng', 'y g c', '6.01', 242669, 1.88, NULL, 5163900, 129367, NULL),
(83, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '甘肃', 2.2, '000672', 0.066, 191980, '水泥', 136579, '上峰水泥', 21547.1, 5.45, 90.44, 'shangfengshuini', 'sfsn', '6.07', -48179.5, -0.59, NULL, 408560, 81362, NULL),
(84, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '山西', 5.09, '000673', 0.11, 425.56, '广告包装', 169908, '当代东方', 20808, 3.6, 139.47, 'dangdaidongfang', 'dddf', '12.89', 181371, 4.61, NULL, 259581, 39308, NULL),
(85, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '河南', 0.38, '000676', -0.067, 15196.9, '电器仪表', 26447.1, '智度投资', 25100.9, 21.22, 0, 'zhidutouzi', 'zdtz', '0.00', 6690.82, 0.21, NULL, 52066.8, 31458.7, NULL),
(86, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '山东', 0.04, '000677', -0.207, 179191, '化纤', 68812.5, '*ST海龙', 86397.3, 162.93, 0, '*SThailong', '*SThl', '0.00', 69999.2, 0.81, NULL, 287595, 86397.8, NULL),
(87, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '湖北', 2.46, '000678', -0.028, 79530.1, '机械基件', 108690, '襄阳轴承', 30107.6, 2.43, 0, 'xiangyangzhoucheng', 'xyzc', '8.21', 57408.3, 1.34, NULL, 241867, 42908, NULL),
(88, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '辽宁', 4.49, '000679', 0.35, 81206.4, '百货', 600783, '大连友谊', 35634.2, 3.66, 23.45, 'dalianyouyi', 'dlyy', '11.98', 7087.68, 0.2, NULL, 805694, 35640, NULL),
(89, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '山东', 3.03, '000680', -0.246, 230706, '工程机械', 614779, '山推股份', 95483.1, 1.59, 0, 'shantuigufen', 'stgf', '5.10', 119114, 0.96, NULL, 1065060, 124079, NULL),
(90, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '江苏', 2.1, '000681', 0.07, 811.82, '软件服务', 43662, '视觉中国', 19667.6, 8.89, 136.52, 'shijuezhongguo', 'sjzg', '23.34', 106663, 1.52, NULL, 157195, 70057.7, NULL),
(91, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '山东', 1.52, '000682', 0.02, 46928.2, '电气设备', 214214, '东方电子', 97802.3, 3.19, 119.99, 'dongfangdianzi', 'dfdz', '5.09', 34722.2, 0.35, NULL, 303567, 97816.3, NULL),
(92, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '内蒙', 3.76, '000683', 0.046, 979858, '化工原料', 359749, '远兴能源', 76781.2, 1.29, 52.04, 'yuanxingnengyuan', 'yxny', '2.76', 142012, 0.88, NULL, 1894680, 161889, NULL),
(93, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '广东', 6.74, '000685', 0.67, 161551, '水务', 188838, '中山公用', 99745.1, 1.74, 8.74, 'zhongshangongyong', 'zsgy', '10.63', 78882.1, 0.56, NULL, 1214990, 140163, NULL),
(94, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '吉林', 5.34, '000686', 0.935, 70068.8, '证券', 0, '东北证券', 168948, 2.17, 6.18, 'dongbeizhengquan', 'dbzq', '12.54', 271571, 1.39, NULL, 8119410, 195717, NULL),
(95, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '河北', 1.84, '000687', 0.005, 5868.66, '化纤', 93479.8, '恒天天鹅', 53166.6, 5.98, 1101.56, 'hengtiantiane', 'htte', '20.08', 76522.3, 1.01, NULL, 248309, 75736.8, NULL),
(96, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '重庆', 1.15, '000688', 0.084, 57512.1, '铅锌', 43343.1, '建新矿业', 29603.4, 14.85, 102.14, 'jianxinkuangye', 'jxky', '0.00', 18883.2, 0.17, NULL, 162399, 113730, NULL),
(97, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '广东', 2.85, '000690', 0.22, 421724, '火力发电', 261134, '宝新能源', 171080, 2.78, 18.34, 'baoxinnengyuan', 'bxny', '6.89', 32908.7, 0.19, NULL, 1038090, 172661, NULL),
(98, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '海南', 0.39, '000691', -0.008, 2857.62, '区域地产', 21083.2, '亚太实业', 29048.6, 13.69, 0, 'yataishiye', 'ytsy', '9.05', 11953, 0.37, NULL, 30227.3, 32327, NULL),
(99, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '辽宁', 2.51, '000692', 0.099, 187686, '供气供热', 139554, '惠天热电', 53278.9, 2.29, 29.03, 'huitianredian', 'htrd', '5.56', 38082.6, 0.71, NULL, 397840, 53283.3, NULL),
(100, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '四川', 2.74, '000693', 0.167, 39875.5, '小金属', 571468, '华泽钴镍', 25527.9, 5.1, 41.87, 'huazegunie', 'hzgn', '0.00', -3052.87, -0.06, NULL, 632832, 54349.2, NULL),
(101, '2016-06-05 13:20:49', '2016-06-05 13:20:49', '天津', 1.42, '000695', -0.015, 69100, '供气供热', 28644.3, '滨海能源', 22172.1, 8.02, 0, 'binhainengyuan', 'bhny', '16.14', 7612.75, 0.34, NULL, 104301, 22214.8, NULL),
(102, '2016-06-05 13:20:49', '2016-06-05 13:20:50', '陕西', 2.56, '000697', 0.043, 36297.1, '小金属', 92634.6, '炼石有色', 43130, 13.19, 395.12, 'lianshiyouse', 'lsys', '21.87', 56684.8, 1.01, NULL, 158383, 55968, NULL),
(103, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '辽宁', 4.66, '000698', -0.068, 426655, '化工原料', 181977, '沈阳化工', 62708.2, 1.08, 0, 'shenyanghuagong', 'syhg', '6.61', 135224, 2.05, NULL, 831735, 66092.9, NULL),
(104, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '江苏', 6.41, '000700', 0.62, 84313.4, '汽车配件', 164799, '模塑科技', 30904.3, 2.15, 11.56, 'mosukeji', 'mskj', '21.91', 55044, 1.53, NULL, 436528, 35860.4, NULL),
(105, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '福建', 5.95, '000701', 0.219, 51935.1, '综合类', 1046990, '厦门信达', 28969.4, 1.91, 25.96, 'shamenxinda', 'smxd', '16.83', 79863, 2.57, NULL, 1271150, 31088.4, NULL),
(106, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '湖南', 1.76, '000702', 0.014, 29403.6, '饲料', 28586, '正虹科技', 26663.3, 6.2, 380.45, 'zhenghongkeji', 'zhkj', '13.38', 18257.7, 0.68, NULL, 70507.1, 26663.5, NULL),
(107, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '广西', 4.45, '000703', 0.096, 1004670, '化纤', 1198370, '恒逸石化', 115359, 1.64, 38.26, 'hengyishihua', 'hysh', '9.87', 4067.18, 0.04, NULL, 2660970, 115359, NULL),
(108, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '浙江', 3.68, '000705', 0.022, 39171, '医药商业', 112344, '浙江震元', 27272.4, 2.57, 215.45, 'zhejiangzhenyuan', 'zjzy', '12.21', 53715.5, 1.61, NULL, 183768, 33412.3, NULL),
(109, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '湖北', 3.09, '000707', 0.021, 335574, '化工原料', 572896, '双环科技', 46414.3, 3.76, 280.04, 'shuanghuankeji', 'shkj', '7.17', 73362.2, 1.58, NULL, 1052760, 46414.6, NULL),
(110, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '湖北', 7.49, '000708', 0.309, 221542, '特种钢', 229297, '大冶特钢', 44712.9, 1.86, 22.54, 'dayetegang', 'dytg', '11.18', 48565.3, 1.08, NULL, 504280, 44940.9, NULL),
(111, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '河北', 4.09, '000709', 0.034, 7726910, '普钢', 5536380, '河北钢铁', 1061690, 1.02, 62.02, 'hebeigangtie', 'hbgt', '2.79', 2320580, 2.19, NULL, 17164000, 1061860, NULL),
(112, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '四川', 0.83, '000710', -0.032, 6878.67, '汽车配件', 25509.9, '天兴仪表', 15120, 23.22, 0, 'tianxingyibiao', 'txyb', '24.62', 4631.55, 0.31, NULL, 47220.6, 15120, NULL),
(113, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '黑龙江', -1.72, '000711', -3.296, 5470.1, '软件服务', 7121.91, '*ST京蓝', 16089.8, -13.17, 0, '*STjinglan', '*STjl', '18.17', 1507.57, 0.09, NULL, 71444.1, 16089.8, NULL),
(114, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '广东', 3.44, '000712', 0.653, 6397.43, '多元金融', 1791190, '锦龙股份', 84650, 6.32, 16.66, 'jinlonggufen', 'jlgf', '19.41', 71395.2, 0.8, NULL, 2225240, 89600, NULL),
(115, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '安徽', 4.53, '000713', 0.027, 35057.4, '种植业', 89675.9, '丰乐种业', 29887.3, 1.85, 154.36, 'fenglezhongye', 'flzy', '10.17', 50491, 1.69, NULL, 176890, 29887.6, NULL),
(116, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '辽宁', 4.03, '000715', 0.091, 75784.4, '百货', 97043, '中兴商业', 27854.6, 2.14, 47.3, 'zhongxingshangye', 'zxsy', '14.62', 31671.7, 1.14, NULL, 220809, 27900.6, NULL),
(117, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '广西', 5.32, '000716', 0.126, 71007, '食品', 134054, '黑芝麻', 17126.5, 1.88, 39.49, 'heizhima', 'hzm', '14.11', 119443, 3.75, NULL, 260173, 31854.2, NULL),
(118, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '广东', 0.85, '000717', -0.364, 1339900, '钢加工', 403874, '韶钢松山', 166952, 6.71, 0, 'shaogangsongshan', 'sgss', '0.00', 322708, 1.33, NULL, 1818590, 241952, NULL),
(119, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '吉林', 1.8, '000718', 0.121, 17850.9, '区域地产', 1937150, '苏宁环球', 191049, 3.68, 27.49, 'suninghuanqiu', 'snhq', '0.00', 0, 0, NULL, 2000840, 265615, NULL),
(120, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '河南', 7.35, '000719', 0.426, 117009, '出版业', 562480, '大地传媒', 10650.6, 2.55, 22.04, 'dadichuanmei', 'ddcm', '10.81', 298631, 3.79, NULL, 874524, 78708, NULL),
(121, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '山东', 1.07, '000720', 0.073, 361359, '火力发电', 99630.2, '新能泰山', 86345.9, 15.9, 117.29, 'xinnengtaishan', 'xnts', '0.00', 29602.6, 0.34, NULL, 536856, 86346, NULL),
(122, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '陕西', 1.38, '000721', -0.007, 19729, '酒店餐饮', 45484.7, '西安饮食', 43562.4, 5.33, 0, 'xianyinshi', 'xays', '7.25', 5529.6, 0.11, NULL, 109664, 49905.6, NULL),
(123, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '湖南', 5.42, '000722', 0.144, 173238, '水力发电', 55011.8, '湖南发展', 46415.5, 2.17, 40.81, 'hunanfazhan', 'hnfz', '14.26', 213774, 4.61, NULL, 297113, 46415.8, NULL),
(124, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '山西', 1.56, '000723', -0.091, 14414, '焦炭加工', 69664.2, '美锦能源', 19486.4, 5.32, 0, 'meijinnengyuan', 'mjny', '11.90', 4537.22, 0.16, NULL, 86214.1, 27919.8, NULL),
(125, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '北京', 2.21, '000725', 0.056, 4818450, '元器件', 5832280, '京东方Ａ', 2335350, 1.42, 28.29, 'jingdongfangＡ', 'jdfＡ', '2.38', 3908260, 1.11, NULL, 14085600, 3515310, NULL),
(126, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '山东', 6.75, '000726', 0.36, 482104, '纺织', 296947, '鲁  泰Ａ', 56079.9, 1.7, 15.95, 'lu  taiＡ', 'l  tＡ', '11.35', 100708, 1.05, NULL, 858563, 95575.9, NULL),
(127, '2016-06-05 13:20:50', '2016-06-05 13:20:50', '江苏', 4.74, '000727', -0.003, 29387.1, '元器件', 1406750, '华东科技', 35814.6, 1.68, 0, 'huadongkeji', 'hdkj', '6.81', 883920, 3.9, NULL, 2936170, 226478, NULL),
(128, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '安徽', 9.73, '000728', 0.961, 146528, '证券', 0, '国元证券', 196410, 1.65, 8.34, 'guoyuanzhengquan', 'gyzq', '16.84', 987550, 5.03, NULL, 9240120, 196410, NULL),
(129, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '北京', 4.52, '000729', 0.212, 1070360, '啤酒', 768026, '燕京啤酒', 250934, 1.74, 18.5, 'yanjingpijiu', 'yjpj', '8.12', 464057, 1.65, NULL, 2004120, 281854, NULL),
(130, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '四川', 4.58, '000731', 0.077, 227789, '农药化肥', 164839, '四川美丰', 59129.7, 1.49, 44.15, 'sichuanmeifeng', 'scmf', '7.17', 64085.7, 1.08, NULL, 466301, 59148.4, NULL),
(131, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '福建', 5.63, '000732', 0.557, 36812.7, '区域地产', 6797900, '泰禾集团', 101577, 4.25, 21.53, 'taihejituan', 'thjt', '19.28', 55850.8, 0.55, NULL, 7148030, 101718, NULL),
(132, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '贵州', 7.28, '000733', 0.17, 94508.5, '元器件', 415888, '振华科技', 42915.9, 2.04, 43.82, 'zhenhuakeji', 'zhkj', '21.48', 229118, 4.88, NULL, 603240, 46934.2, NULL),
(133, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '海南', 1.89, '000735', 0.003, 93672.9, '农业综合', 125190, '罗 牛 山', 88008.2, 2.9, 908.73, 'luo niu shan', 'l n s', '6.61', 19978.8, 0.23, NULL, 416426, 88013.2, NULL),
(134, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '重庆', 5.73, '000736', 0.076, 4173.85, '全国地产', 671631, '中房地产', 13873.4, 2.55, 96.26, 'zhongfangdichan', 'zfdc', '0.00', 50896.9, 1.71, NULL, 691516, 29719.4, NULL),
(135, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '山西', 0.49, '000737', -0.184, 100692, '日用化工', 168810, '南风化工', 54874.4, 9.07, 0, 'nanfenghuagong', 'nfhg', '5.64', 62495, 1.14, NULL, 307103, 54876, NULL),
(136, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '江苏', 4.06, '000738', 0.084, 158669, '航空', 431526, '中航动控', 114564, 6.13, 148.05, 'zhonghangdongkong', 'zhdk', '25.64', 266720, 2.33, NULL, 687807, 114564, NULL),
(137, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '浙江', 2.13, '000739', 0.116, 174301, '化学制药', 256893, '普洛药业', 75394.2, 3.02, 27.71, 'puluoyaoye', 'plyy', '6.23', 20919.5, 0.18, NULL, 533207, 114687, NULL),
(138, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '湖南', 3.98, '000748', 0.049, 19158.6, '电脑设备', 236627, '长城信息', 75112.4, 8.76, 354.42, 'zhangchengxinxi', 'zcxx', '17.71', 96867.9, 1.19, NULL, 490263, 81481.9, NULL),
(139, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '广西', 3.26, '000750', 0.48, 16864.3, '证券', 0, '国海证券', 231036, 2.99, 12.44, 'guohaizhengquan', 'ghzq', '7.75', 274599, 0.98, NULL, 6112910, 281036, NULL),
(140, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '辽宁', 1.41, '000751', 0.034, 89641.3, '铅锌', 145424, '锌业股份', 140984, 3.62, 75.49, 'xinyegufen', 'xygf', '5.36', 131577, 0.93, NULL, 324097, 140987, NULL),
(141, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '西藏', 2.99, '000752', 0.044, 18865.4, '啤酒', 88678.5, '西藏发展', 26375.1, 3.88, 131.92, 'xizangfazhan', 'xzfz', '15.71', 2405.82, 0.09, NULL, 139561, 26375.8, NULL),
(142, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '福建', 1.62, '000753', -0.05, 24344.1, '汽车服务', 309243, '漳州发展', 69902.9, 3.97, 0, 'zhangzhoufazhan', 'zzfz', '4.45', 23949, 0.27, NULL, 381076, 88414.6, NULL),
(143, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '山西', 3.16, '000755', -0.507, 372432, '化工原料', 172874, '山西三维', 46925.6, 2.75, 0, 'shanxisanwei', 'sxsw', '0.00', 112936, 2.41, NULL, 586592, 46926.5, NULL),
(144, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '山东', 4.02, '000756', 0.057, 188699, '化学制药', 174457, '新华制药', 30731.3, 3.02, 107.26, 'xinhuazhiyao', 'xhzy', '10.71', 51309.2, 1.12, NULL, 448917, 45731.3, NULL),
(145, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '四川', 1.21, '000757', 0.04, 8183.62, '汽车配件', 51672.3, '浩物股份', 31280.3, 6.64, 100.55, 'haowugufen', 'hwgf', '0.00', 83365.1, 1.85, NULL, 85367.8, 45162.1, NULL),
(146, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '北京', 4.78, '000758', 0.198, 272596, '铅锌', 1313220, '中色股份', 90156.1, 2.94, 35.45, 'zhongsegufen', 'zsgf', '16.51', 189101, 1.92, NULL, 2064570, 98468.9, NULL),
(147, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '湖北', 4.39, '000759', 0.032, 405434, '超市连锁', 343793, '中百集团', 68067.2, 1.44, 99.04, 'zhongbaijituan', 'zbjt', '7.27', 107633, 1.58, NULL, 883615, 68102.1, NULL),
(148, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '江苏', 1.98, '000760', -0.06, 13588.4, '汽车配件', 76800.4, '斯太尔', 33159.3, 3.8, 0, 'sitaier', 'ste', '13.75', 89666.2, 1.16, NULL, 173682, 77184.5, NULL),
(149, '2016-06-05 13:20:51', '2016-06-05 13:20:51', '辽宁', 4.9, '000761', 0.041, 1702240, '钢加工', 2110740, '本钢板材', 273594, 0.99, 59.53, 'bengangbancai', 'bgbc', '7.02', 911485, 2.91, NULL, 4552170, 313600, NULL),
(150, '2016-06-05 13:20:51', '2016-06-05 13:20:52', '西藏', 3.43, '000762', 0.024, 41324.7, '小金属', 165100, '西藏矿业', 47595.4, 2.89, 208.64, 'xizangkuangye', 'xzky', '25.86', 117543, 2.47, NULL, 259686, 47597.5, NULL),
(151, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '吉林', 2.18, '000766', 0.015, 12496.6, '中成药', 51278.2, '通化金马', 44901.4, 3.43, 254.59, 'tonghuajinma', 'thjm', '13.64', 137113, 2.39, NULL, 175124, 57348.9, NULL),
(152, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '山西', 2.57, '000767', 0.185, 1811330, '火力发电', 487126, '漳泽电力', 157372, 2.1, 14.55, 'zhangzedianli', 'zzdl', '3.84', 226364, 1, NULL, 3145360, 225374, NULL),
(153, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '陕西', 4.47, '000768', -0.038, 484572, '航空', 2956170, '中航飞机', 247760, 5.2, 0, 'zhonghangfeiji', 'zhfj', '17.53', 724830, 2.62, NULL, 3661290, 276864, NULL),
(154, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '广东', 9.52, '000776', 1.3, 86338.2, '证券', 0, '广发证券', 591929, 1.48, 6.39, 'guangfazhengquan', 'gfzq', '16.39', 3167910, 4.16, NULL, 51712600, 762109, NULL),
(155, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '江苏', 2.84, '000777', 0.091, 42385.2, '机械基件', 111278, '中核科技', 38336, 7.05, 109.74, 'zhonghekeji', 'zhkj', '22.97', 24948.7, 0.65, NULL, 181575, 38341.8, NULL),
(156, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '河北', 4.64, '000778', 0.096, 1636940, '钢加工', 2378450, '新兴铸管', 364181, 2.78, 67.45, 'xinxingzhuguan', 'xxzg', '4.97', 726816, 1.99, NULL, 5144690, 364331, NULL),
(157, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '甘肃', 1.43, '000779', -0.093, 6025.77, '纺织', 21047.8, '三毛派神', 18644.1, 8.82, 0, 'sanmaopaishen', 'smps', '23.98', 32181.2, 1.73, NULL, 68501.4, 18644.1, NULL),
(158, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '内蒙', 4.62, '000780', -0.049, 96273, '煤炭开采', 434476, '平庄能源', 101431, 1.03, 0, 'pingzhuangnengyuan', 'pzny', '4.85', 144955, 1.43, NULL, 610157, 101431, NULL),
(159, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '广东', 2.48, '000782', 0.182, 70348, '化纤', 128549, '美达股份', 40450.9, 11.42, 77.82, 'meidagufen', 'mdgf', '8.95', 63823.1, 1.21, NULL, 251158, 52814, NULL),
(160, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '湖北', 3.35, '000783', 0.516, 29973.1, '证券', 0, '长江证券', 474237, 3, 9.73, 'zhangjiangzhengquan', 'zjzq', '10.35', 295258, 0.62, NULL, 13343300, 474247, NULL),
(161, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '湖北', 3.36, '000785', 0.094, 81121, '百货', 91783.5, '武汉中商', 25109.4, 2.3, 41.13, 'wuhanzhongshang', 'whzs', '11.08', 7361.7, 0.29, NULL, 276157, 25122.2, NULL),
(162, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '北京', 5.16, '000786', 0.271, 623156, '其他建材', 533346, '北新建材', 115030, 3.6, 34.33, 'beixinjiancai', 'bxjc', '8.90', 176935, 1.25, NULL, 1411340, 141398, NULL),
(163, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '重庆', 1.66, '000788', -0.205, 179220, '化学制药', 190491, '北大医药', 55877.4, 5.89, 0, 'beidayiyao', 'bdyy', '12.85', 19917.3, 0.33, NULL, 430845, 59598.7, NULL),
(164, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '江西', 4.05, '000789', 0.159, 436834, '水泥', 305012, '万年青', 61335, 1.48, 18.81, 'wannianqing', 'wnq', '6.25', 27790.7, 0.45, NULL, 885319, 61336.4, NULL),
(165, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '四川', 1.45, '000790', 0.01, 31877.5, '中成药', 62412, '华神集团', 42840, 7.01, 514.65, 'huashenjituan', 'hsjt', '10.75', 3823.15, 0.09, NULL, 102485, 43102.1, NULL),
(166, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '甘肃', 4.9, '000791', -0.094, 1168450, '水力发电', 47474, '甘肃电投', 11477.8, 1.89, 0, 'gansudiantou', 'gsdt', '9.85', 206969, 2.87, NULL, 1336250, 72215.8, NULL),
(167, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '青海', 11.23, '000792', 0.227, 2110700, '农药化肥', 1372350, '盐湖股份', 156638, 1.74, 43, 'yanhugufen', 'yhgf', '18.96', 591509, 3.72, NULL, 7364070, 159051, NULL),
(168, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '海南', 4, '000793', 0.2, 111322, '出版业', 449000, '华闻传媒', 167404, 3.78, 38.26, 'huawenchuanmei', 'hwcm', '10.27', 345077, 1.68, NULL, 1174520, 205123, NULL),
(169, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '山西', 2.12, '000795', -0.13, 27616.4, '矿物制品', 79056.6, '太原刚玉', 27680, 5.65, 0, 'taiyuangangyu', 'tygy', '9.69', 88193.7, 1.98, NULL, 130322, 44448.7, NULL),
(170, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '陕西', 2.26, '000796', 0.059, 18637.4, '食品', 94537, '易食股份', 24652.3, 7.74, 148.93, 'yishigufen', 'ysgf', '17.56', 33455.8, 1.36, NULL, 134925, 24654.2, NULL),
(171, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '福建', 2.89, '000797', 0.184, 15968.7, '全国地产', 807716, '中国武夷', 33436.2, 5.3, 41.77, 'zhongguowuyi', 'zgwy', '14.90', 7310, 0.19, NULL, 878798, 38945.2, NULL),
(172, '2016-06-05 13:20:52', '2016-06-05 13:20:52', '北京', 2.65, '000798', 0.062, 27785.6, '渔业', 67680.3, '中水渔业', 31944.9, 3.15, 67.63, 'zhongshuiyuye', 'zsyy', '13.16', 33222.1, 1.04, NULL, 122572, 31945.5, NULL),
(173, '2016-06-05 13:20:52', '2016-06-05 13:20:53', '湖南', 5.26, '000799', 0.122, 41945.1, '白酒', 128574, '*ST酒鬼', 22420.2, 3.95, 85.44, '*STjiugui', '*STjg', '21.34', 116126, 3.57, NULL, 212467, 32492.9, NULL),
(174, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '吉林', 5.47, '000800', 0.101, 553645, '汽车整车', 1012570, '一汽轿车', 141175, 2.6, 70.37, 'yiqijiaoche', 'yqjc', '13.19', 248890, 1.53, NULL, 1925670, 162750, NULL),
(175, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '四川', 4.03, '000801', 0.133, 36453.2, '通信设备', 359286, '四川九洲', 45988.4, 4.63, 69.88, 'sichuanjiuzhou', 'scjz', '23.88', 79490.4, 1.55, NULL, 422980, 51140.3, NULL),
(176, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '北京', 2.37, '000802', 0.009, 22961.3, '旅游服务', 70062.1, '北京文化', 37478.6, 7.27, 995.34, 'beijingwenhua', 'bjwh', '0.00', 54833.7, 1.41, NULL, 145674, 38860, NULL),
(177, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '四川', 1.13, '000803', -0.056, 395.38, '纺织', 39567.3, '金宇车城', 9769.28, 12.6, 0, 'jinyuchecheng', 'jycc', '22.72', 2009.93, 0.16, NULL, 45659.7, 12773.1, NULL),
(178, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '广西', 1.84, '000806', 0.11, 37691.1, '电气设备', 161834, '银河投资', 59533.2, 14.64, 147.45, 'yinhetouzi', 'yhtz', '0.00', 104469, 0.95, NULL, 255769, 109991, NULL),
(179, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '云南', 2.97, '000807', -0.05, 1435860, '铝', 781698, '云铝股份', 153908, 1.5, 0, 'yunlvgufen', 'ylgf', '6.93', 375982, 1.98, NULL, 2862430, 189861, NULL),
(180, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '辽宁', 6.25, '000809', -0.081, 29746.7, '区域地产', 579618, '铁岭新城', 54986.1, 1.01, 0, 'tielingxincheng', 'tlxc', '4.55', 3199.37, 0.06, NULL, 619870, 54986.1, NULL),
(181, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '四川', 2.04, '000810', 0.151, 3649.53, '元器件', 359721, '创维数字', 25933.1, 6.02, 40.85, 'chuangweishuzi', 'cwsz', '18.51', 24.08, 0, NULL, 386137, 99850.3, NULL),
(182, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '山东', 4.14, '000811', 0.484, 28677.9, '工程机械', 115418, '烟台冰轮', 39458.9, 2.39, 10.21, 'yantaibinglun', 'ytbl', '11.03', 5728.76, 0.15, NULL, 282547, 39459.7, NULL),
(183, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '陕西', 1.95, '000812', 0.048, 51358.5, '广告包装', 99114.2, '陕西金叶', 44626.9, 9.75, 196.45, 'shanxijinye', 'sxjy', '9.51', 1530.93, 0.03, NULL, 181237, 44737.6, NULL),
(184, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '新疆', 2.27, '000813', 0.012, 52422.6, '纺织', 38311.9, '天山纺织', 36345.1, 4.95, 470.72, 'tianshanfangzhi', 'tsfz', '11.18', 107594, 2.3, NULL, 196856, 46749.5, NULL),
(185, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '宁夏', -1, '000815', -0.471, 53950.1, '造纸', 70327.2, '*ST美利', 31678, -16.09, 0, '*STmeili', '*STml', '21.86', 35512.9, 1.12, NULL, 146491, 31680, NULL),
(186, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '江苏', 2.39, '000816', 0.02, 116213, '机械基件', 353153, '智慧农业', 108878, 2.33, 138.5, 'zhihuinongye', 'zhny', '5.90', 130398, 0.92, NULL, 700178, 141880, NULL),
(187, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '辽宁', 2.97, '000818', 0.059, 140340, '化工原料', 44652, '方大化工', 68000, 4.77, 119.8, 'fangdahuagong', 'fdhg', '0.00', 124593, 1.83, NULL, 254046, 68000, NULL),
(188, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '湖南', 2.65, '000819', 0.106, 20139.6, '石油加工', 48692.7, '岳阳兴长', 24609.4, 7.26, 90.84, 'yueyangxingzhang', 'yyxz', '28.30', 8271.12, 0.34, NULL, 80147.6, 24611.2, NULL),
(189, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '辽宁', 0.86, '000820', -0.013, 27621.8, '造纸', 25174.4, '金城股份', 22087.7, 19.67, 0, 'jinchenggufen', 'jcgf', '15.99', 47487.5, 1.65, NULL, 70336.6, 28783.5, NULL),
(190, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '湖北', 3.42, '000821', 0.08, 55587.2, '轻工机械', 119116, '京山轻机', 34521.9, 2.58, 74.15, 'jingshanqingji', 'jsqj', '14.21', 86243.2, 1.81, NULL, 261088, 47773.3, NULL),
(191, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '山东', 2.49, '000822', 0.096, 168544, '化工原料', 140034, '山东海化', 89508.3, 2.24, 29.06, 'shandonghaihua', 'sdhh', '5.01', 150480, 1.68, NULL, 355074, 89509.2, NULL),
(192, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '广东', 5.31, '000823', 0.106, 162643, '元器件', 275321, '超声电子', 53687.3, 1.54, 38.66, 'chaoshengdianzi', 'csdz', '9.57', 142464, 2.65, NULL, 475823, 53696.6, NULL),
(193, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '山西', 4.4, '000825', 0.011, 4135450, '特种钢', 1873690, '太钢不锈', 569595, 0.98, 191.59, 'taigangbuxiu', 'tgbx', '3.19', 680105, 1.19, NULL, 7622210, 569625, NULL),
(194, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '湖北', 6.57, '000826', 0.448, 73837.8, '环境保护', 535035, '桑德环境', 84167.6, 5.08, 37.2, 'sangdehuanjing', 'sdhj', '30.68', 202741, 2.4, NULL, 1235860, 84624.1, NULL),
(195, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '广东', 4.02, '000828', 0.398, 215482, '路桥', 90053.4, '东莞控股', 103952, 2.34, 11.82, 'dongguankonggu', 'dgkg', '9.36', 113930, 1.1, NULL, 682138, 103952, NULL),
(196, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '江西', 2.24, '000829', -0.086, 35513.6, '其他商业', 901868, '天音控股', 94679.2, 3.38, 0, 'tianyinkonggu', 'tykg', '13.48', 23964.1, 0.25, NULL, 1011580, 94690.1, NULL),
(197, '2016-06-05 13:20:53', '2016-06-05 13:20:53', '山东', 4.27, '000830', 0.19, 1353060, '农药化肥', 350145, '鲁西化工', 146398, 1.46, 16.47, 'luxihuagong', 'lxhg', '4.61', 218399, 1.49, NULL, 2077740, 146486, NULL),
(198, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '山西', 2.54, '000831', 0.001, 16292.8, '小金属', 208903, '五矿稀土', 74521.9, 5.81, 4964.35, 'wukuangxitu', 'wkxt', '15.97', 75535.7, 0.77, NULL, 258916, 98088.9, NULL),
(199, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '广西', 2.88, '000833', 0.006, 44106.1, '造纸', 57100.3, '贵糖股份', 29606.5, 3.17, 767.26, 'guitanggufen', 'gtgf', '14.11', 22347.1, 0.38, NULL, 114580, 58638.1, NULL),
(200, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '四川', 1.04, '000835', 0.009, 5669.35, '影视音像', 51860.4, '长城动漫', 30537, 8.64, 515.58, 'zhangchengdongman', 'zcdm', '0.00', 1149.02, 0.04, NULL, 149840, 30537, NULL),
(201, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '天津', 3.56, '000836', -0.16, 53837.4, '软件服务', 234749, '鑫茂科技', 29249, 3.94, 0, 'xinmaokeji', 'xmkj', '0.00', 100259, 2.49, NULL, 315034, 40281.8, NULL),
(202, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '陕西', 4.28, '000837', -0.085, 195409, '机床制造', 394938, '秦川机床', 25562.4, 2.82, 0, 'qinchuanjichuang', 'qcjc', '8.46', 144266, 2.08, NULL, 674022, 69337.1, NULL),
(203, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '北京', 2.66, '000838', 0.377, 6808.36, '区域地产', 283499, '国兴地产', 18100, 5.85, 20.61, 'guoxingdichan', 'gxdc', '11.86', 12079.1, 0.67, NULL, 312149, 18100, NULL),
(204, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '北京', 4.49, '000839', 0.115, 15857.1, '综合类', 640253, '中信国安', 156760, 5.2, 101.89, 'zhongxinguoan', 'zxga', '18.91', 257526, 1.64, NULL, 1167330, 156793, NULL),
(205, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '河北', 1.95, '000848', 0.342, 26413.7, '软饮料', 113879, '承德露露', 75246.2, 6.44, 18.4, 'chengdelulu', 'cdll', '10.54', 1730.84, 0.02, NULL, 177320, 75274, NULL),
(206, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '安徽', 6.27, '000850', 0.142, 202782, '纺织', 117837, '华茂股份', 94320, 1.74, 38.43, 'huamaogufen', 'hmgf', '5.60', 6280.37, 0.07, NULL, 989042, 94366.5, NULL),
(207, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '贵州', 4.38, '000851', 0.043, 17731.8, '软件服务', 516565, '高鸿股份', 48491.6, 3.05, 154.65, 'gaohonggufen', 'ghgf', '12.44', 178296, 3.01, NULL, 656418, 59136.4, NULL),
(208, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '湖北', 5.53, '000852', 0.006, 140730, '化工机械', 741879, '石化机械', 13012, 2.61, 1123.29, 'shihuajixie', 'shjx', '15.25', 108522, 2.36, NULL, 906423, 46012.1, NULL),
(209, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '河北', 1.6, '000856', -0.318, 22107.1, '机械基件', 186131, '冀东装备', 22700, 5.13, 0, 'jidongzhuangbei', 'jdzb', '11.93', 35263.4, 1.55, NULL, 245373, 22700, NULL),
(210, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '四川', 10.66, '000858', 0.869, 556949, '白酒', 3952390, '五 粮 液', 379568, 2.41, 14.81, 'wu liang ye', 'w l y', '31.33', 95320.3, 0.25, NULL, 4739030, 379597, NULL),
(211, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '安徽', 1.87, '000859', -0.013, 67585.8, '塑料', 102066, '国风塑业', 73944.8, 2.47, 0, 'guofengsuye', 'gfsy', '5.08', 58966.2, 0.8, NULL, 203055, 73945, NULL),
(212, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '北京', 9.24, '000860', 0.434, 259769, '白酒', 1144670, '顺鑫农业', 56299.9, 1.74, 18.49, 'shunxinnongye', 'sxny', '23.06', 279850, 4.9, NULL, 1635060, 57059, NULL),
(213, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '广东', 1.33, '000861', 0.04, 10909.9, '房产服务', 376325, '海印股份', 186047, 3.87, 63.69, 'haiyingufen', 'hygf', '5.25', 12351.6, 0.05, NULL, 652686, 224986, NULL),
(214, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '宁夏', 3.14, '000862', 0.018, 722707, '新型电力', 115834, '银星能源', 28306.8, 2.01, 179.64, 'yinxingnengyuan', 'yxny', '6.98', 167869, 3.1, NULL, 939148, 54163.3, NULL),
(215, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '上海', 3.22, '000863', 0.1, 5339.81, '区域地产', 1157510, '三湘股份', 73869.1, 2.9, 50.5, 'sanxianggufen', 'sxgf', '10.02', 88276, 0.92, NULL, 1274590, 95648.2, NULL),
(216, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '安徽', 1.82, '000868', 0.044, 100266, '汽车整车', 370366, '安凯客车', 69556, 3.06, 64.07, 'ankaikeche', 'akkc', '6.67', 38508.6, 0.55, NULL, 542524, 69556.6, NULL),
(217, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '山东', 11.06, '000869', 1.088, 250299, '红黄药酒', 363478, '张  裕Ａ', 45346.1, 3.39, 17.21, 'zhang  yuＡ', 'z  yＡ', '39.21', 56313.9, 0.82, NULL, 937991, 68546.4, NULL),
(218, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '吉林', 2.61, '000875', 0.054, 1572670, '火力发电', 218096, '吉电股份', 111559, 3.85, 93.68, 'jidiangufen', 'jdgf', '5.71', 261555, 1.79, NULL, 2083260, 146061, NULL),
(219, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '四川', 8.99, '000876', 0.556, 637378, '饲料', 1006390, '新 希 望', 172831, 2.11, 17.09, 'xin xi wang', 'x x w', '17.63', 434037, 2.08, NULL, 3409290, 208412, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(220, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '新疆', 7.7, '000877', -0.288, 1487570, '水泥', 525099, '天山股份', 88001, 1, 0, 'tianshangufen', 'tsgf', '6.19', 361924, 4.11, NULL, 2197980, 88010.1, NULL),
(221, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '云南', 3.81, '000878', 0.011, 766251, '铜', 1239130, '云南铜业', 141639, 6.42, 1112.09, 'yunnantongye', 'ynty', '10.23', 439945, 3.11, NULL, 2478460, 141640, NULL),
(222, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '山东', 4.62, '000880', 0.08, 129641, '机械基件', 120045, '潍柴重机', 13513.5, 2.33, 67.37, 'weichaizhongji', 'wczj', '14.18', 58911.3, 2.13, NULL, 338879, 27610.1, NULL),
(223, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '辽宁', 2.65, '000881', -2.651, 183780, '综合类', 319044, '大连国际', 30796.4, 4.95, 0, 'dalianguoji', 'dlgj', '20.04', 25373.4, 0.82, NULL, 509602, 30891.8, NULL),
(224, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '北京', 2.67, '000882', 0.016, 14125.1, '百货', 288031, '华联股份', 188469, 3.28, 272.85, 'hualiangufen', 'hlgf', '4.26', 346308, 1.56, NULL, 1396860, 222609, NULL),
(225, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '湖北', 2.93, '000883', 0.259, 2204040, '火力发电', 328410, '湖北能源', 534607, 2.46, 13.92, 'hubeinengyuan', 'hbny', '4.71', 507576, 0.95, NULL, 3651870, 534875, NULL),
(226, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '深圳', 10.54, '000001', 0.84, 369000, '银行', 0, '平安银行', 1180410, 1.12, 7.31, 'pinganyinxing', 'payx', '10.50', 5932600, 4.15, NULL, 257051000, 1430870, NULL),
(227, '2016-06-05 13:20:54', '2016-06-05 13:20:54', '深圳', 7.9, '000002', 0.439, 376759, '全国地产', 48999200, '万  科Ａ', 971772, 1.8, 16.21, 'wan  keＡ', 'w  kＡ', '0.00', 832911, 0.75, NULL, 53693800, 1104810, NULL),
(228, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 0.97, '000004', 0.014, 3879.12, '生物制药', 27242.5, '国农科技', 8387.54, 26.93, 905.17, 'guonongkeji', 'gnkj', '0.00', 66.45, 0.01, NULL, 34866, 8397.66, NULL),
(229, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 0.71, '000005', -0.025, 2536.1, '区域地产', 22245.8, '世纪星源', 91374.3, 8.32, 0, 'shijixingyuan', 'sjxy', '7.12', 26977, 0.3, NULL, 134160, 91433.4, NULL),
(230, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.14, '000006', 0.191, 368.26, '区域地产', 953584, '深振业Ａ', 134149, 3.01, 24.66, 'shenzhenyeＡ', 'szyＡ', '7.51', 48432.1, 0.36, NULL, 1177060, 135000, NULL),
(231, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 1.51, '000007', -0.032, 7468.37, '酒店餐饮', 31310.5, '零七股份', 20588.7, 19.36, 0, 'lingqigufen', 'lqgf', '0.00', 42324.1, 1.83, NULL, 52609.1, 23096.5, NULL),
(232, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.47, '000008', 0.087, 42377.5, '综合类', 136492, '神州高铁', 21359.4, 5.9, 117.66, 'shenzhougaotie', 'szgt', '11.51', 192501, 2.4, NULL, 327847, 80314.4, NULL),
(233, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 2.35, '000009', 0.074, 168079, '全国地产', 1017440, '中国宝安', 148967, 4.18, 65.87, 'zhongguobaoan', 'zgba', '13.20', 51620.2, 0.32, NULL, 1534310, 159211, NULL),
(234, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '北京', 0.93, '000010', 0.003, 4401.43, '建筑施工', 67797.9, '深华新', 35815.8, 6.47, 1090.76, 'shenhuaxin', 'shx', '7.81', 12939, 0.22, NULL, 188771, 58807, NULL),
(235, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.31, '000011', 0.052, 7110.31, '区域地产', 305900, '深物业A', 17586.2, 2.59, 82.04, 'shenwuyeA', 'swyA', '12.84', 11995.2, 0.2, NULL, 375657, 59597.9, NULL),
(236, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.62, '000012', 0.099, 986040, '玻璃', 167879, '南  玻Ａ', 130255, 2.44, 44.53, 'nan  boＡ', 'n  bＡ', '11.72', 126096, 0.61, NULL, 1532180, 207534, NULL),
(237, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.35, '000014', 0.072, 2156.65, '全国地产', 192287, '沙河股份', 20170.5, 4.71, 109.17, 'shahegufen', 'shgf', '18.60', 996.57, 0.05, NULL, 212903, 20170.5, NULL),
(238, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.15, '000016', -0.247, 175997, '家用电器', 1254660, '深康佳Ａ', 59991.5, 9.56, 0, 'shenkangjiaＡ', 'skjＡ', '4.89', 129188, 1.07, NULL, 1613280, 120397, NULL),
(239, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 0.02, '000017', 0.001, 105.18, '文教休闲', 5110.05, '深中华A', 30297.9, 385.33, 5704.28, 'shenzhonghuaA', 'szhA', '10.67', 62783.4, 1.14, NULL, 5630.58, 55134.8, NULL),
(240, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 0.77, '000018', -0.004, 114.51, '纺织', 6445.16, '中冠A', 9972.04, 24.59, 0, 'zhongguanA', 'zgA', '46.70', 3939.15, 0.23, NULL, 17323.3, 16914.2, NULL),
(241, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.24, '000019', 0.018, 38728.6, '软饮料', 50343.4, '深深宝Ａ', 25225.2, 2.53, 232.43, 'shenshenbaoＡ', 'ssbＡ', '17.14', 51818.6, 1.72, NULL, 110760, 30108, NULL),
(242, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 1.04, '000020', 0.05, 19419.3, '元器件', 89046.5, '深华发Ａ', 6467.54, 12.32, 128.43, 'shenhuafaＡ', 'shfＡ', '20.46', 10949.7, 0.39, NULL, 117278, 28316.1, NULL),
(243, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 3.56, '000021', 0.094, 142943, '电脑设备', 1084880, '深科技', 146981, 2.25, 42.46, 'shenkeji', 'skj', '8.88', 69671.3, 0.47, NULL, 1431810, 147126, NULL),
(244, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 6.44, '000022', 0.375, 322338, '港口', 61413.2, '深赤湾Ａ', 46486.7, 4.1, 35.13, 'shenchiwanＡ', 'scwＡ', '15.62', 16269.8, 0.25, NULL, 671161, 64476.4, NULL),
(245, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 2.65, '000023', 0.078, 11728.4, '建筑施工', 130420, '深天地Ａ', 13875.6, 11.52, 196.34, 'shentiandiＡ', 'stdＡ', '31.95', 10252.6, 0.74, NULL, 145999, 13875.6, NULL),
(246, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 12.72, '000024', 0.833, 178590, '全国地产', 15599500, '招商地产', 102642, 2.49, 18.99, 'zhaoshangdichan', 'zsdc', '0.00', 889170, 3.45, NULL, 16880900, 257595, NULL),
(247, '2016-06-05 13:20:55', '2016-06-05 13:20:55', '深圳', 2.8, '000025', 0.026, 13973.1, '汽车服务', 43726.6, '特  力Ａ', 17929.5, 7.64, 415.79, 'te  liＡ', 't  lＡ', '58.83', 56419.3, 1.9, NULL, 114397, 29728.2, NULL),
(248, '2016-06-05 13:20:55', '2016-06-05 13:20:56', '深圳', 4.26, '000026', 0.186, 36787, '其他商业', 280158, '飞亚达Ａ', 31107, 2.08, 23.77, 'feiyadaＡ', 'fydＡ', '11.00', 52550.8, 1.34, NULL, 382085, 39276.8, NULL),
(249, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 5.58, '000027', 0.259, 1530530, '火力发电', 1519720, '深圳能源', 143752, 1.75, 18.89, 'shenzhennengyuan', 'szny', '6.58', 431470, 1.09, NULL, 4877650, 396449, NULL),
(250, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 14.01, '000028', 1.068, 71104, '医药商业', 1196420, '国药一致', 23326.2, 4.23, 27.76, 'guoyaoyizhi', 'gyyz', '63.76', 186389, 5.14, NULL, 1381270, 36263.2, NULL),
(251, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 2.32, '000029', 0.184, 5078.18, '区域地产', 386677, '深深房Ａ', 89166, 4.43, 27.92, 'shenshenfangＡ', 'ssfＡ', '10.48', 97824.5, 0.97, NULL, 446256, 101166, NULL),
(252, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '吉林', 3.44, '000030', 0.223, 132692, '汽车配件', 338261, '富奥股份', 56056.2, 2.51, 19.35, 'fuaogufen', 'fagf', '7.21', 52170.2, 0.4, NULL, 733050, 129325, NULL),
(253, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 3.15, '000031', 0.108, 57702, '全国地产', 4418430, '中粮地产', 181372, 5.07, 73.74, 'zhongliangdichan', 'zldc', '9.76', 27988.3, 0.15, NULL, 4955410, 181373, NULL),
(254, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 3.76, '000032', -0.015, 5722.49, '元器件', 76735.8, '深桑达Ａ', 23286.3, 3.3, 0, 'shensangdaＡ', 'ssdＡ', '18.30', 20723.8, 0.89, NULL, 129098, 23286.4, NULL),
(255, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 0.53, '000034', 0.064, 5695.68, '综合类', 24746.4, '深信泰丰', 34006.4, 18.05, 74.67, 'shenxintaifeng', 'sxtf', '18.20', 64072.7, 1.79, NULL, 44637.6, 35797.4, NULL),
(256, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '江苏', 4.74, '000035', 0.108, 71891.2, '通信设备', 68817.9, '中国天楹', 35362.7, 2.44, 53.77, 'zhongguotianying', 'zgty', '6.87', 94385.4, 1.52, NULL, 397917, 61927.9, NULL),
(257, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.7, '000036', -0.014, 28780.1, '全国地产', 441307, '华联控股', 112388, 3.5, 0, 'hualiankonggu', 'hlkg', '8.46', 15546.5, 0.14, NULL, 543446, 114049, NULL),
(258, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.94, '000037', -0.17, 180716, '火力发电', 314164, '深南电Ａ', 33889.5, 3.49, 0, 'shennandianＡ', 'sndＡ', '0.00', 36275.1, 0.6, NULL, 514828, 60276.3, NULL),
(259, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.13, '000038', -0.009, 6.17, '区域地产', 62300, '深大通', 2803.19, 22.83, 0, 'shendatong', 'sdt', '0.00', 2234.82, 0.23, NULL, 63186.7, 9622.79, NULL),
(260, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 9.34, '000039', 0.565, 1900930, '轻工机械', 4754010, '中集集团', 125597, 2.2, 18.2, 'zhongjijituan', 'zjjt', '14.26', 86361.6, 0.32, NULL, 9559350, 268708, NULL),
(261, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 2.74, '000040', 0.044, 6924.57, '全国地产', 389969, '宝安地产', 46458.8, 3.53, 110.19, 'baoandichan', 'badc', '11.43', 27375.2, 0.58, NULL, 421362, 46959.3, NULL),
(262, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 7.61, '000042', 0.874, 17929.8, '全国地产', 1657580, '中洲控股', 47879.1, 1.75, 7.64, 'zhongzhoukonggu', 'zzkg', '15.98', 58488.8, 1.22, NULL, 2052830, 47892.6, NULL),
(263, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 4.99, '000043', -0.167, 14395.6, '全国地产', 1672100, '中航地产', 66696.1, 1.6, 0, 'zhonghangdichan', 'zhdc', '7.90', 44666.5, 0.67, NULL, 2230940, 66696.1, NULL),
(264, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 4.29, '000045', 0.015, 79165.5, '纺织', 167494, '深纺织Ａ', 40556.4, 2.07, 292.96, 'shenfangzhiＡ', 'sfzＡ', '12.81', 158513, 3.13, NULL, 281182, 50652.2, NULL),
(265, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 2.18, '000046', 0.145, 56080.7, '全国地产', 8792320, '泛海控股', 454933, 5.52, 41.51, 'fanhaikonggu', 'fhkg', '9.99', 204942, 0.45, NULL, 10111900, 455731, NULL),
(266, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.69, '000048', 0.369, 34974.2, '饲料', 140159, '康达尔', 38606.8, 13.78, 31.63, 'kangdaer', 'kde', '37.41', 4269.85, 0.11, NULL, 208751, 39076.9, NULL),
(267, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 3.98, '000049', 0.56, 16308, '电气设备', 297849, '德赛电池', 20524.4, 9.25, 32.82, 'desaidianchi', 'dsdc', '39.92', 816.93, 0.04, NULL, 326853, 20524.4, NULL),
(268, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 7.32, '000050', 0.227, 730091, '元器件', 744937, '深天马Ａ', 57422.1, 1.86, 29.91, 'shentianmaＡ', 'stmＡ', '21.75', 696756, 6.16, NULL, 1788470, 113174, NULL),
(269, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.67, '000055', 0.068, 48320.9, '其他建材', 305816, '方大集团', 42017.9, 3.55, 43.66, 'fangdajituan', 'fdjt', '17.24', 7909.92, 0.1, NULL, 404476, 75691, NULL),
(270, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 7.2, '000056', 0.03, 5848.73, '房产服务', 13228.8, '深国商', 14305.5, 2.89, 349.3, 'shenguoshang', 'sgs', '25.35', 2430.87, 0.09, NULL, 789205, 26508.1, NULL),
(271, '2016-06-05 13:20:56', '2016-06-05 13:20:56', '深圳', 1.83, '000058', 0.044, 3882.9, '元器件', 122359, '深 赛 格', 53831.1, 4.6, 94.65, 'shen sai ge', 's s g', '11.15', 50654.3, 0.65, NULL, 249595, 78479.9, NULL),
(272, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '辽宁', 5.5, '000059', 0.148, 1518020, '石油加工', 986052, '*ST华锦', 120050, 1.17, 21.58, '*SThuajin', '*SThj', '9.35', 635282, 3.97, NULL, 3039680, 159944, NULL),
(273, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 3.33, '000060', 0.072, 451256, '铅锌', 415423, '中金岭南', 206142, 3.23, 74.45, 'zhongjinlingnan', 'zjln', '10.15', 147468, 0.67, NULL, 1546200, 221263, NULL),
(274, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 2.86, '000061', 0.026, 364480, '农业综合', 232306, '农 产 品', 160768, 5, 273.24, 'nong chan pin', 'n c p', '12.58', 260959, 1.54, NULL, 1469860, 169696, NULL),
(275, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 3.81, '000062', 0.25, 38896.3, '商贸代理', 144264, '深圳华强', 66695, 7.77, 59.26, 'shenzhenhuaqiang', 'szhq', '26.42', 68.14, 0, NULL, 413841, 66695, NULL),
(276, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 8.32, '000063', 0.392, 712322, '通信设备', 8817710, '中兴通讯', 336230, 2, 21.24, 'zhongxingtongxun', 'zxtx', '13.95', 881223, 2.14, NULL, 11314400, 412505, NULL),
(277, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 6.53, '000065', 0.23, 13673, '建筑施工', 512061, '北方国际', 25340.2, 3.61, 54.1, 'beifangguoji', 'bfgj', '28.87', 91439.5, 3.33, NULL, 605141, 27437.2, NULL),
(278, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 1.87, '000066', -0.079, 334271, '电脑设备', 2914860, '长城电脑', 132357, 11.5, 0, 'zhangchengdiannao', 'zcdn', '10.95', 62200.5, 0.47, NULL, 3815050, 132359, NULL),
(279, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 0.58, '000068', -0.022, 20068.8, '元器件', 33784.3, '*ST华赛', 89667.1, 16.35, 0, '*SThuasai', '*SThs', '10.12', 119427, 1.19, NULL, 63707.6, 100667, NULL),
(280, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 3.98, '000069', 0.195, 1529800, '旅游景点', 6716090, '华侨城Ａ', 311246, 2.05, 21.03, 'huaqiaochengＡ', 'hqcＡ', '6.63', 61811.6, 0.09, NULL, 9666570, 727134, NULL),
(281, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 4.06, '000070', 0.14, 46928.1, '通信设备', 180341, '特发信息', 25857.6, 4.08, 59, 'tefaxinxi', 'tfxx', '24.74', 60129.3, 2.22, NULL, 275059, 27100, NULL),
(282, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 2.22, '000078', 0.073, 65510.9, '生物制药', 963949, '海王生物', 73076.8, 5.16, 78.34, 'haiwangshengwu', 'hwsw', '7.63', 159375, 2.12, NULL, 1141510, 75251.4, NULL),
(283, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 2.67, '000088', 0.08, 15724.6, '港口', 162334, '盐 田 港', 194215, 2.65, 44.07, 'yan tian gang', 'y t g', '6.50', 71086.1, 0.37, NULL, 732046, 194220, NULL),
(284, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 4.84, '000089', 0.12, 781288, '机场', 255175, '深圳机场', 205067, 1.32, 30.32, 'shenzhenjichang', 'szjc', '8.48', 280275, 1.37, NULL, 1257050, 205077, NULL),
(285, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 7.2, '000090', 0.4, 15918.9, '建筑施工', 808862, '天健集团', 55253.1, 1.83, 16.53, 'tianjianjituan', 'tjjt', '13.01', 75115, 1.36, NULL, 1093170, 55253.1, NULL),
(286, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 3.86, '000096', 0.355, 8362.58, '石油贸易', 138495, '广聚能源', 51084.8, 3.56, 19.37, 'guangjunengyuan', 'gjny', '12.27', 35111.4, 0.66, NULL, 234573, 52800, NULL),
(287, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '深圳', 4.51, '000099', 0.136, 278370, '空运', 122773, '中信海直', 60607, 2.88, 47.59, 'zhongxinhaizhi', 'zxhz', '13.72', 103327, 1.7, NULL, 452754, 60607, NULL),
(288, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '广东', 2, '000100', 0.14, 2180810, '家用电器', 6474780, 'TCL 集团', 899542, 2.11, 15.91, 'TCL jituan', 'TCL jt', '3.39', 527703, 0.43, NULL, 11230900, 1222450, NULL),
(289, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '广东', 3.66, '000150', 0.003, 5843.93, '医疗保健', 306332, '宜华健康', 32400, 14.41, 10428.3, 'yihuajiankang', 'yhjk', '27.55', 98907.4, 2.21, NULL, 387027, 44780.5, NULL),
(290, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '北京', 3.19, '000151', 0.238, 3436.16, '商贸代理', 255443, '中成股份', 26654.4, 5.66, 37.91, 'zhongchenggufen', 'zcgf', '17.23', 44202.6, 1.49, NULL, 277934, 29598, NULL),
(291, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '安徽', 3.67, '000153', 0.06, 59356.6, '化学制药', 88645.4, '丰原药业', 29664.5, 2.3, 70.73, 'fengyuanyaoye', 'fyyy', '10.05', 49104.1, 1.57, NULL, 222951, 31214.1, NULL),
(292, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '四川', -1.98, '000155', -0.239, 46122.1, '农药化肥', 40220.5, '*ST川化', 47000, -3.12, 0, '*STchuanhua', '*STch', '0.00', 81028.6, 1.72, NULL, 125314, 47000, NULL),
(293, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '浙江', 6.25, '000156', 0.2, 219494, '影视音像', 778128, '华数传媒', 11832.8, 4.89, 87.36, 'huashuchuanmei', 'hscm', '19.29', 620240, 4.33, NULL, 1213180, 143335, NULL),
(294, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '湖南', 5.21, '000157', -0.04, 752280, '工程机械', 8076360, '中联重科', 626189, 1.03, 0, 'zhonglianzhongke', 'zlzk', '4.14', 1315250, 1.71, NULL, 10078800, 770595, NULL),
(295, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '河北', 3.98, '000158', -0.04, 109237, '纺织', 415165, '常山股份', 71886.1, 2.56, 0, 'changshangufen', 'csgf', '14.39', 284010, 2.23, NULL, 875708, 127144, NULL),
(296, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '新疆', 4.51, '000159', 0.105, 22706.9, '石油贸易', 204351, '国际实业', 48113.9, 1.53, 32.93, 'guojishiye', 'gjsy', '0.00', 37429.9, 0.78, NULL, 307059, 48113.9, NULL),
(297, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '新疆', 3.11, '000166', 0.495, 127589, '证券', 0, '申万宏源', 327825, 2.9, 9.11, 'shenwanhongyuan', 'swhy', '8.45', 445381, 0.3, NULL, 43512800, 1485670, NULL),
(298, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '江苏', 2.64, '000301', 0.074, 25029.9, '综合类', 119040, '东方市场', 121824, 1.67, 29.88, 'dongfangshichang', 'dfsc', '4.36', 63657.8, 0.52, NULL, 411942, 121824, NULL),
(299, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '广东', 10.76, '000333', 1.97, 1885750, '家用电器', 10761000, '美的集团', 223937, 2.67, 7.37, 'meidejituan', 'mdjt', '23.08', 1531170, 3.59, NULL, 14178300, 426571, NULL),
(300, '2016-06-05 13:20:57', '2016-06-05 13:20:57', '山东', 7.99, '000338', 0.242, 2269850, '汽车配件', 5972600, '潍柴动力', 209217, 1.25, 20.63, 'weichaidongli', 'wcdl', '7.93', 20990, 0.05, NULL, 11517100, 399862, NULL),
(301, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '河南', 5.7, '000400', 0.075, 98529.7, '电气设备', 925166, '许继电气', 73749.9, 3.16, 120.34, 'xujidianqi', 'xjdq', '15.27', 82976.4, 0.82, NULL, 1055210, 100833, NULL),
(302, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '河北', 9.21, '000401', 0.147, 2467900, '水泥', 1167640, '冀东水泥', 134709, 1, 31.54, 'jidongshuini', 'jdsn', '0.00', 491189, 3.65, NULL, 4582180, 134752, NULL),
(303, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '北京', 8.14, '000402', 0.287, 283034, '全国地产', 7042220, '金 融 街', 298700, 1.12, 15.84, 'jin rong jie', 'j r j', '10.16', 710336, 2.38, NULL, 9168220, 298893, NULL),
(304, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '江西', 1.75, '000403', 0.196, 60286.5, '生物制药', 39116.7, 'ST生化', 18176.3, 11.2, 49.87, 'STshenghua', 'STsh', '29.40', 11393, 0.42, NULL, 123484, 27257.8, NULL),
(305, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '江西', 3.83, '000404', 0.218, 123593, '专用机械', 540285, '华意压缩', 39762.2, 1.59, 13.92, 'huayiyasuo', 'hyys', '8.00', 110348, 1.97, NULL, 719476, 55962.4, NULL),
(306, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 2.3, '000407', 0.022, 46795.2, '塑料', 211159, '胜利股份', 64490.4, 2.39, 124.16, 'shengligufen', 'slgf', '0.00', 49380.1, 0.64, NULL, 451493, 77404.9, NULL),
(307, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '河北', 0.52, '000408', -0.017, 2081.08, '商贸代理', 42464.9, '金谷源', 25230.1, 20.46, 0, 'jinguyuan', 'jgy', '14.14', 14367.8, 0.57, NULL, 52219.7, 25230.2, NULL),
(308, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 2.08, '000409', -0.1, 75827.3, '普钢', 60148, '山东地矿', 35758.9, 3.05, 0, 'shandongdikuang', 'sddk', '0.00', 46365.1, 0.98, NULL, 362142, 47270.9, NULL),
(309, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '辽宁', 3.17, '000410', -0.348, 185016, '机床制造', 1781660, '沈阳机床', 73982.4, 5.2, 0, 'shenyangjichuang', 'syjc', '16.37', 124626, 1.63, NULL, 2123540, 76547.1, NULL),
(310, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '浙江', 3.11, '000411', 0.169, 27280.1, '医药商业', 561919, '英特集团', 20363.8, 4.67, 42.86, 'yingtejituan', 'ytjt', '19.08', 3631.68, 0.18, NULL, 618828, 20745, NULL),
(311, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '河北', 2.48, '000413', 0.163, 272944, '元器件', 1029660, '东旭光电', 201871, 3.19, 24.31, 'dongxuguangdian', 'dxgd', '8.48', 292343, 1.1, NULL, 1583380, 266208, NULL),
(312, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '新疆', 2.9, '000415', 0.178, 3850170, '多元金融', 1605310, '渤海租赁', 311554, 2.35, 19.2, 'bohaizulin', 'bhzl', '0.00', 391942, 1.1, NULL, 9073620, 354861, NULL),
(313, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 1.64, '000416', 0.048, 4631.62, '百货', 70877.4, '民生控股', 53161, 7, 118.67, 'minshengkonggu', 'mskg', '7.81', 1330.87, 0.03, NULL, 102137, 53187.1, NULL),
(314, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '安徽', 4.22, '000417', 0.225, 105196, '百货', 443929, '合肥百货', 77861.1, 1.89, 17.73, 'hefeibaihuo', 'hfbh', '7.90', 30882.3, 0.4, NULL, 764885, 77988.4, NULL),
(315, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '江苏', 7.24, '000418', 0.681, 102604, '家用电器', 968268, '小天鹅Ａ', 43774.7, 2.77, 14.75, 'xiaotianeＡ', 'xteＡ', '29.63', 114681, 1.81, NULL, 1123020, 63248.8, NULL),
(316, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '湖南', 3.46, '000419', 0.152, 110281, '百货', 182408, '通程控股', 54329, 1.84, 20.89, 'tongchengkonggu', 'tckg', '6.97', 41739.5, 0.77, NULL, 364130, 54358.3, NULL),
(317, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '吉林', 1.39, '000420', 0.008, 87304.6, '化纤', 99623.4, '吉林化纤', 31830.7, 4.18, 375.85, 'jilinhuaxian', 'jlhx', '6.79', 97236.2, 1.36, NULL, 240198, 71660.3, NULL),
(318, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '江苏', 3.79, '000421', 0.171, 257141, '公共交通', 191267, '南京中北', 35166.7, 2.08, 23.07, 'nanjingzhongbei', 'njzb', '9.72', 40502.2, 0.71, NULL, 568843, 57264.7, NULL),
(319, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '湖北', 7.5, '000422', 0.028, 1855820, '农药化肥', 1268870, '湖北宜化', 87403, 0.85, 113.93, 'hubeiyihua', 'hbyh', '6.11', 179477, 2, NULL, 3854490, 89786.7, NULL),
(320, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 10.24, '000423', 1.181, 129794, '中成药', 592131, '东阿阿胶', 65371.9, 4.22, 18.29, 'dongaajiao', 'daaj', '47.10', 71411.2, 1.09, NULL, 798110, 65402.1, NULL),
(321, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '江苏', 8.99, '000425', 0.003, 741949, '工程机械', 3661960, '徐工机械', 235650, 1.18, 1552.53, 'xugongjixie', 'xgjx', '3.18', 890519, 3.77, NULL, 4844570, 236143, NULL),
(322, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '内蒙', 4.61, '000426', 0.034, 137392, '小金属', 46721.8, '兴业矿业', 48163.3, 2.11, 143.77, 'xingyekuangye', 'xyky', '6.31', 143627, 2.41, NULL, 383186, 59694.4, NULL),
(323, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '湖南', 2.21, '000428', 0.063, 353235, '酒店餐饮', 314377, '华天酒店', 71876, 2.67, 46.65, 'huatianjiudian', 'htjd', '6.49', 11671.8, 0.16, NULL, 911480, 71892.6, NULL),
(324, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '广东', 4.16, '000429', 0.184, 690856, '路桥', 70778, '粤高速Ａ', 46865.1, 1.38, 15.62, 'yuegaosuＡ', 'ygsＡ', '5.58', 153477, 1.22, NULL, 1240020, 125712, NULL),
(325, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '湖南', 1.69, '000430', 0.152, 46791.9, '旅游景点', 10594.4, '张家界', 20903, 5.34, 29.53, 'zhangjiajie', 'zjj', '11.31', 9469.1, 0.3, NULL, 76117.4, 32083.5, NULL),
(326, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 7.2, '000488', 0.143, 2469840, '造纸', 2563930, '晨鸣纸业', 110504, 0.95, 24, 'chenmingzhiye', 'cmzy', '8.20', 614914, 3.18, NULL, 6374980, 193641, NULL),
(327, '2016-06-05 13:20:58', '2016-06-05 13:20:58', '山东', 2.47, '000498', 0.106, 39556.1, '建筑施工', 866189, '山东路桥', 35417, 2.31, 26.88, 'shandongluqiao', 'sdlq', '6.08', -55661.3, -0.5, NULL, 971191, 112014, NULL),
(328, '2016-06-05 13:20:58', '2016-06-05 13:20:59', '湖北', 7.2, '000501', 0.86, 718457, '百货', 503840, '鄂武商Ａ', 50718.4, 2.3, 10.03, 'ewushangＡ', 'ewsＡ', '15.85', 67141.5, 1.27, NULL, 1614820, 52902.6, NULL),
(329, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 1.07, '000502', -0.029, 2527.08, '区域地产', 27005.5, '绿景控股', 18332.9, 13.42, 0, 'lvjingkonggu', 'ljkg', '20.80', 2282.03, 0.12, NULL, 29617.6, 18482, NULL),
(330, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '海南', 1.43, '000503', -0.049, 10659.6, '互联网', 105039, '海虹控股', 89796.7, 13.99, 0, 'haihongkonggu', 'hhkg', '40.91', 2317.08, 0.03, NULL, 136027, 89882.2, NULL),
(331, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '湖南', -0.01, '000504', -0.024, 4972.93, '出版业', 2404.15, '南华生物', 30997.2, -1331.36, 0, 'nanhuashengwu', 'nhsw', '15.11', 8512.57, 0.27, NULL, 9250.74, 31157.4, NULL),
(332, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '海南', -0.21, '000505', 0.05, 42578, '全国地产', 99107.8, '珠江控股', 36044.5, -34.65, 70.98, 'zhujiangkonggu', 'zjkg', '0.00', 33469.1, 0.78, NULL, 158808, 42674.5, NULL),
(333, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '山东', 1.51, '000506', 0.006, 31361.3, '区域地产', 303595, '中润资源', 92831.1, 4.24, 580.05, 'zhongrunziyuan', 'zrzy', '8.10', 3111.7, 0.03, NULL, 386505, 92901.8, NULL),
(334, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 3.15, '000507', 0.063, 182200, '港口', 113922, '珠海港', 77214.4, 1.81, 45.19, 'zhuhaigang', 'zhg', '5.46', 76403.5, 0.97, NULL, 553999, 78954.1, NULL),
(335, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '四川', 0.03, '000509', -0.026, 12409.9, '其他建材', 33032, '华塑控股', 60563.2, 161.51, 0, 'huasukonggu', 'hskg', '0.00', 16357.4, 0.2, NULL, 55616.7, 82548.3, NULL),
(336, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '四川', 1.09, '000510', -0.119, 106980, '化工原料', 35374.7, '*ST金路', 60912.3, 9.83, 0, '*STjinlu', '*STjl', '6.88', 4521.18, 0.07, NULL, 156534, 60918.2, NULL),
(337, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '辽宁', 1.24, '000511', 0.01, 264.35, '矿物制品', 264029, '烯碳新材', 115482, 7.16, 450.58, 'xitanxincai', 'xtxc', '0.00', 8509.15, 0.07, NULL, 356116, 115483, NULL),
(338, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 10.71, '000513', 0.861, 293180, '中成药', 363951, '丽珠集团', 25010.6, 4.98, 30.97, 'lizhujituan', 'lzjt', '43.89', 43401.1, 1.1, NULL, 793924, 39569.7, NULL),
(339, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '重庆', 3.27, '000514', -0.068, 153058, '区域地产', 535427, '渝 开 发', 84377.1, 1.84, 0, 'yu kai fa', 'y k f', '7.56', 118618, 1.41, NULL, 772408, 84377.1, NULL),
(340, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '陕西', 4.09, '000516', 0.21, 147552, '百货', 259178, '国际医学', 70428.4, 3.16, 32.44, 'guojiyixue', 'gjyx', '6.14', 144866, 1.84, NULL, 498931, 78842, NULL),
(341, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '浙江', 3.38, '000517', 0.021, 617, '区域地产', 582401, '荣安地产', 101182, 3.47, 285.2, 'rongandichan', 'radc', '5.03', 21895, 0.21, NULL, 655976, 106131, NULL),
(342, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '江苏', 0.67, '000518', 0.004, 23496.5, '生物制药', 39677.6, '四环生物', 102954, 6.43, 537.81, 'sihuanshengwu', 'shsw', '6.93', 2531.88, 0.02, NULL, 84789.2, 102956, NULL),
(343, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '湖南', 3.95, '000519', 0.139, 150166, '机械基件', 239884, '江南红箭', 45795.9, 4.7, 66.67, 'jiangnanhongjian', 'jnhj', '11.51', 131657, 1.27, NULL, 494319, 103322, NULL),
(344, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '湖北', 0.24, '000520', 0.107, 11391.7, '水运', 45803, '长航凤凰', 101208, 10.54, 11.79, 'zhanghangfenghuang', 'zhfh', '9.26', 195887, 1.94, NULL, 59625.9, 101208, NULL),
(345, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '安徽', 4.62, '000521', 0.207, 125095, '家用电器', 827131, '美菱电器', 59296.6, 1.29, 14.35, 'meilingdianqi', 'mldq', '5.80', 145900, 1.91, NULL, 1046730, 76373.9, NULL),
(346, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 2.41, '000523', 0.03, 44396.9, '日用化工', 238214, '广州浪奇', 44496.2, 4.89, 193.06, 'guangzhoulangqi', 'gzlq', '10.72', 44417.7, 1, NULL, 324205, 44516.4, NULL),
(347, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 2.28, '000524', 0.087, 34846.3, '酒店餐饮', 10882.2, '岭南控股', 26967.2, 6.03, 78.73, 'lingnankonggu', 'lnkg', '0.00', 20165, 0.75, NULL, 84377.4, 26967.4, NULL),
(348, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '江苏', 7.69, '000525', 0.346, 259126, '农药化肥', 347880, '红 太 阳', 50698.3, 1.81, 20.09, 'hong tai yang', 'h t y', '12.93', 197917, 3.9, NULL, 824671, 50724.7, NULL),
(349, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '福建', 1.65, '000526', 0.022, 8100.97, '房产服务', 1553.54, '银润投资', 9619.5, 21.84, 801.77, 'yinruntouzi', 'yrtz', '49.00', 5808.39, 0.6, NULL, 20077.4, 9619.5, NULL),
(350, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广西', 7.98, '000528', 0.077, 247018, '工程机械', 1332250, '柳    工', 112509, 1, 51.91, 'liu    gong', 'l    g', '6.64', 352071, 3.13, NULL, 1965530, 112524, NULL),
(351, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 1.89, '000529', 0.073, 17595.8, '食品', 105428, '广弘控股', 56719.8, 7.45, 96.06, 'guanghongkonggu', 'ghkg', '8.46', 57475, 0.98, NULL, 162672, 58379, NULL),
(352, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '辽宁', 8.03, '000530', 0.182, 39918, '机械基件', 139885, '大冷股份', 21579.1, 1.58, 34.93, 'dalenggufen', 'dlgf', '10.59', 63344.8, 1.76, NULL, 412211, 36016.5, NULL),
(353, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 4.88, '000531', 0.404, 305551, '火力发电', 227262, '穗恒运Ａ', 68508.1, 1.56, 9.4, 'suihengyunＡ', 'shyＡ', '10.13', 89953.6, 1.31, NULL, 764432, 68508.3, NULL),
(354, '2016-06-05 13:20:59', '2016-06-05 13:20:59', '广东', 2.01, '000532', 0.049, 16914.2, '元器件', 47798.7, '力合股份', 34293.1, 5.85, 120.77, 'lihegufen', 'lhgf', '15.22', 2717.67, 0.08, NULL, 117317, 34470.8, NULL),
(355, '2016-06-05 13:20:59', '2016-06-05 13:21:00', '广东', 1.95, '000533', 0.127, 18243.8, '家用电器', 286728, '万 家 乐', 68490.2, 3.04, 23.32, 'wan jia le', 'w j l', '10.13', 5828.1, 0.08, NULL, 385148, 69081.6, NULL),
(356, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '深圳', 2.6, '000534', 0.081, 29225.6, '区域地产', 338468, '万泽股份', 49104.1, 3.64, 58.05, 'wanzegufen', 'wzgf', '14.97', 34207.1, 0.7, NULL, 374486, 49178.5, NULL),
(357, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '福建', 3.6, '000536', 0.045, 198769, '元器件', 633725, '华映科技', 25086.6, 2.74, 109.93, 'huayingkeji', 'hykj', '15.85', 81311.7, 1.04, NULL, 1015180, 77910.3, NULL),
(358, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '天津', 3.7, '000537', 0.173, 126.55, '区域地产', 460979, '广宇发展', 51271.3, 1.75, 18.73, 'guangyufazhan', 'gyfz', '0.00', 8667.42, 0.17, NULL, 508789, 51271.8, NULL),
(359, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '云南', 11.94, '000538', 1.205, 161444, '中成药', 1535740, '云南白药', 104135, 5.98, 29.61, 'yunnanbaiyao', 'ynby', '64.26', 124722, 1.2, NULL, 1768390, 104140, NULL),
(360, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '广东', 4.26, '000539', 0.328, 3772920, '火力发电', 1289260, '粤电力Ａ', 255391, 1.9, 12.34, 'yuedianliＡ', 'ydlＡ', '5.28', 499843, 0.95, NULL, 7251980, 525028, NULL),
(361, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '贵州', 1.96, '000540', 0.332, 341914, '区域地产', 3791630, '中天城投', 321362, 3.75, 11.06, 'zhongtianchengtou', 'ztct', '6.41', 68413.5, 0.16, NULL, 4324830, 430569, NULL),
(362, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '广东', 3.4, '000541', 0.079, 40453.3, '家用电器', 228754, '佛山照明', 97493.5, 3.4, 73.4, 'foshanzhaoming', 'fszm', '10.23', 29632.3, 0.23, NULL, 531443, 127213, NULL),
(363, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '安徽', 9.3, '000543', 0.678, 1348500, '火力发电', 312005, '皖能电力', 102516, 1.34, 9.19, 'wannengdianli', 'wndl', '6.96', 253237, 2.4, NULL, 2364900, 105317, NULL),
(364, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '河南', 3.4, '000544', 0.137, 65597.5, '环境保护', 61708.7, '中原环保', 26946, 3.7, 45.79, 'zhongyuanhuanbao', 'zyhb', '13.56', 47222.6, 1.75, NULL, 233506, 26946, NULL),
(365, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '吉林', 1.71, '000545', 0.066, 54183.5, '化工原料', 122258, '金浦钛业', 40657.1, 6.23, 80.88, 'jinputaiye', 'jpty', '6.81', 41460.8, 0.42, NULL, 239651, 98683.3, NULL),
(366, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '吉林', 2.74, '000546', 0.019, 296944, '水泥', 59568.1, '金圆股份', 16937.4, 2.66, 190.5, 'jinyuangufen', 'jygf', '9.74', 61758.4, 1.03, NULL, 407614, 59843.9, NULL),
(367, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '福建', 2.51, '000547', 0.109, 18404.8, '通信设备', 328291, '航天发展', 83483.9, 5.89, 68.11, 'hangtianfazhan', 'htfz', '0.00', 50315.6, 0.35, NULL, 419928, 142963, NULL),
(368, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '湖南', 2.94, '000548', 0.009, 24544.4, '路桥', 133145, '湖南投资', 49920.1, 2.58, 434.32, 'hunantouzi', 'hntz', '7.76', 47826.8, 0.96, NULL, 201882, 49921.6, NULL),
(369, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '江西', 12.56, '000550', 1.253, 443645, '汽车整车', 1251590, '江铃汽车', 51742.8, 2, 10.04, 'jianglingqiche', 'jlqc', '23.95', 83944.2, 0.97, NULL, 1955980, 86321.4, NULL),
(370, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '江苏', 3.27, '000551', 0.054, 92070.4, '专用机械', 178788, '创元科技', 40008, 2.31, 70.39, 'chuangyuankeji', 'cykj', '9.16', 30848.1, 0.77, NULL, 323627, 40008, NULL),
(371, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '甘肃', 5.37, '000552', 0.109, 68965, '煤炭开采', 376766, '靖远煤电', 35412.5, 1.51, 37.27, 'jingyuanmeidian', 'jymd', '3.55', 286983, 2.51, NULL, 860987, 114349, NULL),
(372, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '湖北', 3.49, '000553', 0.198, 174745, '农药化肥', 122830, '沙隆达Ａ', 36389.1, 3.07, 27, 'shalongdaＡ', 'sldＡ', '0.00', 26318.4, 0.44, NULL, 323290, 59392.3, NULL),
(373, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '山东', 1.91, '000554', 0.004, 38593.9, '石油贸易', 12738.5, '泰山石油', 36265, 4.39, 1041.47, 'taishanshiyou', 'tssy', '8.73', 18976.3, 0.39, NULL, 104313, 48079.3, NULL),
(374, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '深圳', 6.57, '000555', 0.243, 15784.5, '通信设备', 547518, '神州信息', 11710.6, 4.75, 64.22, 'shenzhouxinxi', 'szxx', '0.00', 157633, 3.43, NULL, 697557, 45890.6, NULL),
(375, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '安徽', 3.87, '000980', 0.049, 47172.4, '电器仪表', 234048, '金马股份', 52814, 1.43, 55.99, 'jinmagufen', 'jmgf', '9.30', 126700, 2.4, NULL, 305735, 52814, NULL),
(376, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '甘肃', 5.71, '000981', 0.316, 116997, '区域地产', 2297040, '银亿股份', 85810.5, 3.98, 35.92, 'yinyigufen', 'yygf', '10.07', 58739.6, 0.68, NULL, 2638330, 85900.5, NULL),
(377, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '宁夏', 2.35, '000982', 0.008, 274290, '纺织', 848390, '中银绒业', 129393, 1.98, 307.17, 'zhongyinrongye', 'zyry', '5.91', 202861, 1.12, NULL, 1462180, 180504, NULL),
(378, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '山西', 5.19, '000983', 0.064, 2077600, '煤炭开采', 1486530, '西山煤电', 315117, 1.07, 42.99, 'xishanmeidian', 'xsmd', '7.51', 93211.7, 0.3, NULL, 5037000, 315120, NULL),
(379, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '黑龙江', 3.78, '000985', -0.055, 39424.5, '化工原料', 12050.7, '大庆华科', 12964, 4.25, 0, 'daqinghuake', 'dqhk', '25.70', 25894.6, 2, NULL, 57838.6, 12964, NULL),
(380, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '广东', 5.86, '000987', 0.309, 14032.8, '百货', 233966, '广州友谊', 35871.2, 2.83, 26.88, 'guangzhouyouyi', 'gzyy', '20.13', 6014.41, 0.17, NULL, 311281, 35895.8, NULL),
(381, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '湖北', 3.25, '000988', 0.1, 104552, '电器仪表', 302353, '华工科技', 89111.6, 3.63, 59.01, 'huagongkeji', 'hgkj', '18.45', 92107, 1.03, NULL, 484207, 89111.6, NULL),
(382, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '湖南', 5.67, '000989', 0.268, 75747.7, '中成药', 123169, '九 芝 堂', 29760.5, 3.74, 39.59, 'jiu zhi tang', 'j z t', '21.49', 58767.9, 1.97, NULL, 221288, 29760.5, NULL),
(383, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '江西', 5.98, '000990', 0.028, 113277, '化工原料', 260014, '诚志股份', 29702.8, 3.13, 339.81, 'chengzhigufen', 'czgf', '17.99', 147462, 3.8, NULL, 473792, 38768.4, NULL),
(384, '2016-06-05 13:21:00', '2016-06-05 13:21:00', '福建', 4.04, '000993', 0.075, 115385, '水力发电', 111968, '闽东电力', 37300, 1.89, 50.7, 'mindongdianli', 'mddl', '9.13', 104068, 2.79, NULL, 343581, 37300, NULL),
(385, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '甘肃', 0.61, '000995', -0.052, 11333.2, '白酒', 27273.7, '*ST皇台', 17740.4, 15.72, 0, '*SThuangtai', '*STht', '16.20', 25341.8, 1.43, NULL, 49826.9, 17740.8, NULL),
(386, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '北京', 2.56, '000996', 0.047, 6202.06, '公路', 5517.43, '中国中期', 23000, 11.18, 304.76, 'zhongguozhongqi', 'zgzq', '22.34', 25696.5, 1.12, NULL, 64997.6, 23000, NULL),
(387, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '福建', 2.2, '000997', 0.2, 15333.6, '软件服务', 321966, '新 大 陆', 91465.1, 7.95, 43.72, 'xin da lu', 'x d l', '18.67', 5691.75, 0.06, NULL, 379449, 93660.6, NULL),
(388, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '湖南', 2.05, '000998', 0.184, 62169.3, '种植业', 219839, '隆平高科', 83160, 9.1, 50.92, 'longpinggaoke', 'lpgk', '19.02', 3867.35, 0.04, NULL, 404136, 99610, NULL),
(389, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '深圳', 7.55, '000999', 0.641, 223264, '中成药', 549692, '华润三九', 97774.2, 3.46, 20.4, 'huarunsanjiu', 'hrsj', '23.28', 114668, 1.17, NULL, 1108510, 97890, NULL),
(390, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '重庆', 3.02, '001696', 0.172, 63545.6, '摩托车', 427469, '宗申动力', 88823.4, 3.64, 32, 'zongshendongli', 'zsdl', '10.52', 54553.7, 0.48, NULL, 653402, 114503, NULL),
(391, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '河南', 4.11, '001896', 0.229, 665745, '火力发电', 173116, '豫能控股', 42999.2, 3.28, 29.38, 'yunengkonggu', 'ynkg', '0.00', 307556, 3.6, NULL, 1187550, 85527.6, NULL),
(392, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 6.26, '002001', 0.17, 271395, '化学制药', 492277, '新 和 成', 107303, 2.49, 45.67, 'xin he cheng', 'x h c', '21.10', 71803.3, 0.66, NULL, 893742, 108892, NULL),
(393, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '江苏', 3.33, '002002', 0.24, 371102, '塑料', 316159, '鸿达兴业', 38744.9, 11.81, 95.57, 'hongdaxingye', 'hdxy', '18.20', 118204, 1.19, NULL, 1107130, 98961.1, NULL),
(394, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 4.19, '002003', 0.279, 93939.2, '服饰', 97547.3, '伟星股份', 35193.8, 3.86, 29.02, 'weixinggufen', 'wxgf', '13.00', 65289.3, 1.6, NULL, 217926, 40776.5, NULL),
(395, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '重庆', 3.86, '002004', 0.211, 216669, '农药化肥', 713921, '华邦颖泰', 126332, 2.49, 22.75, 'huabangyingtai', 'hbyt', '9.22', 360732, 1.92, NULL, 1650490, 188348, NULL),
(396, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '广东', 3.99, '002005', 0.011, 369157, '家用电器', 528521, '德豪润达', 116555, 1.74, 325.01, 'dehaorunda', 'dhrd', '5.82', 340851, 2.44, NULL, 1314840, 139640, NULL),
(397, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 1.88, '002006', 0.01, 27629.7, '工程机械', 104838, '精功科技', 29411.1, 3.57, 321.28, 'jinggongkeji', 'jgkj', '12.31', 26949.2, 0.59, NULL, 158075, 45516, NULL),
(398, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '河南', 5.79, '002007', 0.533, 74874.5, '生物制药', 252155, '华兰生物', 50038.5, 6.52, 35.37, 'hualanshengwu', 'hlsw', '49.93', 36711, 0.63, NULL, 382053, 58130.5, NULL),
(399, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '深圳', 4.02, '002008', 0.3, 128487, '电器仪表', 461451, '大族激光', 98120.7, 4.84, 32.45, 'dazujiguang', 'dzjg', '22.80', 70999.6, 0.67, NULL, 731879, 105597, NULL),
(400, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '江苏', 4.52, '002009', 0.127, 64970.3, '工程机械', 263519, '天奇股份', 25991.2, 2.94, 52.54, 'tianqigufen', 'tqgf', '14.78', 62973.9, 1.96, NULL, 392894, 32101.1, NULL),
(401, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 3.99, '002010', 0.215, 85444.2, '染料涂料', 311554, '传化股份', 41283.3, 3.56, 33.09, 'chuanhuagufen', 'chgf', '19.11', 17851, 0.37, NULL, 455396, 48798, NULL),
(402, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 4.35, '002011', 0.085, 151477, '工程机械', 497972, '盾安环境', 83981.6, 2.15, 54.99, 'dunanhuanjing', 'dahj', '10.51', 137088, 1.63, NULL, 1125260, 84342.7, NULL),
(403, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '浙江', 2.52, '002012', 0.038, 69058.5, '造纸', 75889, '凯恩股份', 46762.6, 2.23, 73.71, 'kaiengufen', 'kegf', '0.00', 27222.8, 0.58, NULL, 157108, 46762.6, NULL),
(404, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '湖北', 4.97, '002013', 0.021, 273041, '汽车配件', 1174070, '中航机电', 38071.6, 4.17, 484.79, 'zhonghangjidian', 'zhjd', '18.62', 172516, 1.85, NULL, 1737940, 93117.2, NULL),
(405, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '安徽', 4.67, '002014', 0.242, 52848.3, '塑料', 112341, '永新股份', 32323.2, 2.96, 28.62, 'yongxingufen', 'yxgf', '14.65', 59787.9, 1.84, NULL, 189387, 32575.8, NULL),
(406, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '江苏', 0.88, '002015', 0.33, 15845.3, '化纤', 42499, '*ST霞客', 38236.5, 8.22, 11.07, '*STxiake', '*STxk', '9.58', 100653, 2.51, NULL, 70717.2, 40070.4, NULL),
(407, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '广东', 2.05, '002016', 0.042, 11278, '区域地产', 440759, '世荣兆业', 64609.6, 3.07, 75.34, 'shirongzhaoye', 'srzy', '8.89', 4792.68, 0.06, NULL, 499306, 80909.6, NULL),
(408, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '广东', 2.24, '002017', 0.078, 23971.8, '通信设备', 119983, '东信和平', 33980.7, 4.94, 71.2, 'dongxinheping', 'dxhp', '13.40', 18097.6, 0.52, NULL, 157431, 34654.9, NULL),
(409, '2016-06-05 13:21:01', '2016-06-05 13:21:01', '安徽', 2.27, '002018', 0.033, 75005, '农药化肥', 179161, '华信国际', 47017.1, 19.39, 676.59, 'huaxinguoji', 'hxgj', '10.05', 117461, 0.98, NULL, 437074, 119886, NULL),
(410, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 6.17, '002019', 0.388, 51287.6, '化学制药', 157658, '亿帆鑫富', 18321.4, 3.84, 30.52, 'yifanxinfu', 'yfxf', '16.77', 182684, 4.15, NULL, 375270, 44031.9, NULL),
(411, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 5.21, '002020', 0.332, 58616.4, '化学制药', 110992, '京新药业', 23164.5, 4.51, 35.43, 'jingxinyaoye', 'jxyy', '12.33', 86587.4, 3.02, NULL, 205240, 28645.1, NULL),
(412, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 2, '002021', -0.071, 46079.2, '纺织机械', 80797.5, '中捷资源', 56781.5, 3.43, 0, 'zhongjieziyuan', 'zjzy', '8.62', 50035.3, 0.73, NULL, 174106, 68781.5, NULL),
(413, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '上海', 2.66, '002022', 0.25, 25276, '生物制药', 133347, '科华生物', 38011.6, 7.08, 38.63, 'kehuashengwu', 'khsw', '19.89', 29159.1, 0.57, NULL, 182574, 51256.9, NULL),
(414, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '四川', 2.49, '002023', 0.061, 107016, '航空', 137444, '海特高新', 54558.2, 5.67, 115.17, 'haitegaoxin', 'htgx', '15.40', 39232.5, 0.52, NULL, 384148, 75679.1, NULL),
(415, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '江苏', 4.05, '002024', 0.047, 1052220, '电器连锁', 5419140, '苏宁云商', 501782, 3.3, 141.28, 'suningyunshang', 'snys', '11.75', 524063, 0.71, NULL, 8739560, 738304, NULL),
(416, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '贵州', 4.27, '002025', 0.262, 51810.8, '元器件', 236467, '航天电器', 42878.5, 5.02, 40.91, 'hangtiandianqi', 'htdq', '21.40', 42221.8, 0.98, NULL, 308821, 42900, NULL),
(417, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '山东', 4.49, '002026', 0.105, 42208.4, '机械基件', 125090, '山东威达', 35413.4, 2.42, 51.5, 'shandongweida', 'sdwd', '11.68', 79930.2, 2.26, NULL, 194217, 35413.4, NULL),
(418, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '广东', 1.64, '002027', 0.001, 9489.07, '电脑设备', 14171.4, '七喜控股', 20489.3, 9.18, 8995.93, 'qixikonggu', 'qxkg', '31.05', 6609.21, 0.22, NULL, 59967.7, 30233.5, NULL),
(419, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '上海', 5.89, '002028', 0.226, 60066.9, '电气设备', 436874, '思源电气', 47457.9, 2.05, 26.76, 'siyuandianqi', 'sydq', '10.60', 14238.2, 0.23, NULL, 537459, 62498.1, NULL),
(420, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '福建', 6.43, '002029', 0.148, 43351.6, '服饰', 527522, '七 匹 狼', 75538.7, 1.43, 31.11, 'qi pi lang', 'q p l', '9.88', 187980, 2.49, NULL, 706043, 75567, NULL),
(421, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '广东', 1.36, '002030', 0.091, 23382.6, '生物制药', 163108, '达安基因', 63653.1, 32.27, 240.01, 'daanjiyin', 'dajy', '29.60', 3826.61, 0.06, NULL, 222506, 65901.9, NULL),
(422, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '广东', 3.99, '002031', 0.096, 96791.6, '汽车配件', 287612, '巨轮股份', 57163.9, 2.17, 45.22, 'julungufen', 'jlgf', '14.36', 121281, 1.65, NULL, 414494, 73313.2, NULL),
(423, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 6.18, '002032', 0.624, 92920.4, '家用电器', 510686, '苏 泊 尔', 46645.6, 3.47, 17.18, 'su bo er', 's b e', '34.09', 55157.4, 0.87, NULL, 652453, 63287.5, NULL),
(424, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '云南', 4.67, '002033', 0.258, 87783.7, '旅游景点', 131444, '丽江旅游', 42268.5, 2.47, 22.43, 'lijianglvyou', 'ljly', '12.31', 76805.6, 1.82, NULL, 260986, 42268.5, NULL),
(425, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 5.22, '002034', 0.076, 22113.3, '纺织', 37429.9, '美 欣 达', 6081.87, 4.92, 168.43, 'mei xin da', 'm x d', '36.23', 24365.9, 2.86, NULL, 78285.4, 8512, NULL),
(426, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '广东', 3.98, '002035', 0.31, 60329.5, '家用电器', 152105, '华帝股份', 28440.2, 2.42, 15.58, 'huadigufen', 'hdgf', '22.12', 37049.8, 1.03, NULL, 255434, 35886.1, NULL),
(427, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '浙江', 2.75, '002036', 0.424, 23024.6, '服饰', 65381.1, '汉麻产业', 25587.3, 4.5, 14.64, 'hanmachanye', 'hmcy', '20.09', 23375.3, 0.9, NULL, 115494, 26078.2, NULL),
(428, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '贵州', 6.1, '002037', 0.28, 110489, '化工原料', 417084, '久联发展', 32736.8, 3.88, 42.26, 'jiulianfazhan', 'jlfz', '16.02', 61632.5, 1.88, NULL, 830978, 32736.8, NULL),
(429, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '北京', 5.11, '002038', 0.554, 30325.4, '生物制药', 265199, '双鹭药业', 56701.9, 5.1, 23.51, 'shuangluyaoye', 'slyy', '29.55', 739.4, 0.01, NULL, 366014, 68490, NULL),
(430, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '贵州', 6.17, '002039', 0.303, 1709010, '水力发电', 81003.9, '黔源电力', 30537.4, 2.3, 23.5, 'qianyuandianli', 'qydl', '19.98', 114499, 3.75, NULL, 1809200, 30539.9, NULL),
(431, '2016-06-05 13:21:02', '2016-06-05 13:21:02', '江苏', 2.63, '002040', 0.043, 35471.7, '港口', 8919.15, '南 京 港', 24587.2, 5.77, 174.36, 'nan jing gang', 'n j g', '12.46', 19373.4, 0.79, NULL, 106959, 24587.2, NULL),
(432, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '山东', 2.34, '002041', 0.204, 55753.6, '种植业', 304238, '登海种业', 87386.2, 6.67, 38.23, 'denghaizhongye', 'dhzy', '15.37', 2931.68, 0.03, NULL, 370266, 88000, NULL),
(433, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '安徽', 4.33, '002042', 0.272, 308426, '纺织', 529019, '华孚色纺', 83148.3, 1.75, 13.93, 'huafusefang', 'hfsf', '9.97', 100263, 1.2, NULL, 902385, 83299.2, NULL),
(434, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '浙江', 1.69, '002043', 0.054, 20736, '其他建材', 73945.5, '兔 宝 宝', 46952.9, 7.59, 119.18, 'tu bao bao', 't b b', '8.58', 9515.2, 0.2, NULL, 106111, 48425, NULL),
(435, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '江苏', 1.36, '002044', 0.03, 10573.9, '服饰', 32138.3, '江苏三友', 27788.4, 22.67, 2001.74, 'jiangsusanyou', 'jssy', '30.03', 77.97, 0, NULL, 66361.7, 119741, NULL),
(436, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '广东', 3.03, '002045', 0.012, 57827.6, '元器件', 114744, '国光电器', 41523.9, 2.11, 260.19, 'guoguangdianqi', 'ggdq', '13.16', 41130.7, 0.99, NULL, 232611, 41690.4, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(437, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '河南', 3.95, '002046', -0.073, 55270.2, '机械基件', 99296, '轴研科技', 34056.6, 1.93, 0, 'zhouyankeji', 'zykj', '0.00', 66944.4, 1.97, NULL, 228569, 34056.6, NULL),
(438, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '深圳', 1.78, '002047', 0.125, 14382.1, '装修装饰', 481662, '宝鹰股份', 68245.6, 5.13, 36.44, 'baoyinggufen', 'bygf', '10.00', 105447, 0.83, NULL, 569770, 126310, NULL),
(439, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '浙江', 9.16, '002048', 0.326, 163813, '汽车配件', 527520, '宁波华翔', 46039.2, 1.31, 18.35, 'ningbohuaxiang', 'nbhx', '21.00', 66258.7, 1.25, NULL, 1027910, 53004.7, NULL),
(440, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '河北', 4.43, '002049', 0.22, 29932.1, '元器件', 192902, '同方国芯', 48101.5, 7.23, 72.9, 'tongfangguoxin', 'tfgx', '41.77', 62340.3, 1.03, NULL, 370302, 60681.8, NULL),
(441, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '浙江', 2.41, '002050', 0.18, 190400, '机械基件', 471043, '三花股份', 151744, 2.76, 21.41, 'sanhuagufen', 'shgf', '8.99', 18859.1, 0.11, NULL, 723476, 175513, NULL),
(442, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '北京', 6.97, '002051', 0.435, 109938, '建筑施工', 1416870, '中工国际', 76453.5, 2.79, 22.35, 'zhonggongguoji', 'zggj', '22.50', 180218, 2.33, NULL, 1777210, 77341.8, NULL),
(443, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '深圳', 1.26, '002052', 0.017, 34577.9, '通信设备', 179061, '同洲电子', 55758, 8.94, 334.72, 'tongzhoudianzi', 'tzdz', '0.00', 32965.7, 0.48, NULL, 270159, 68296, NULL),
(444, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '云南', 4.92, '002053', 0.119, 157636, '化工原料', 63920.1, '云南盐化', 18585.1, 3.9, 80.35, 'yunnanyanhua', 'ynyh', '26.33', 53690, 2.89, NULL, 381434, 18585.1, NULL),
(445, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '广东', 4.18, '002054', 0.6, 52426.8, '化工原料', 129053, '德美化工', 31571.5, 2.06, 7.17, 'demeihuagong', 'dmhg', '10.77', 19568.7, 0.47, NULL, 263252, 41980.9, NULL),
(446, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '深圳', 3.72, '002055', 0.12, 70967.2, '元器件', 309725, '得润电子', 40297.6, 4.75, 75.32, 'derundianzi', 'drdz', '30.07', 64644.7, 1.43, NULL, 414189, 45051.2, NULL),
(447, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '浙江', 8.1, '002056', 0.361, 164784, '元器件', 268153, '横店东磁', 20476.5, 2.21, 24.85, 'hengdiandongci', 'hddc', '15.00', 139209, 3.39, NULL, 482064, 41090, NULL),
(448, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '安徽', 2.51, '002057', 0.02, 13988.8, '元器件', 35730.4, '中钢天源', 19938.2, 5.61, 350.35, 'zhonggangtianyuan', 'zgty', '16.05', 22453.2, 1.13, NULL, 60283.3, 19938.2, NULL),
(449, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '上海', 1.3, '002058', -0.045, 3587.18, '电器仪表', 16488.3, '威 尔 泰', 14340.8, 13.42, 0, 'wei er tai', 'w e t', '22.78', 37.47, 0, NULL, 22523.2, 14344.8, NULL),
(450, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '云南', 2.19, '002059', 0.015, 59454.2, '旅游景点', 228566, '云南旅游', 43000, 3.47, 250.8, 'yunnanlvyou', 'ynly', '0.00', 57075.5, 0.78, NULL, 396116, 73079.2, NULL),
(451, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '安徽', 3.23, '002361', 0.136, 30636.8, '化工原料', 142194, '神剑股份', 19688.7, 3.88, 46.08, 'shenjiangufen', 'sjgf', '15.26', 54003.8, 1.41, NULL, 189285, 38205.1, NULL),
(452, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '北京', 3.43, '002362', 0.002, 20516.2, '电脑设备', 51767.8, '汉王科技', 17616.2, 4.41, 3175.07, 'hanwangkeji', 'hwkj', '24.28', 97684.5, 4.56, NULL, 86399.3, 21410.3, NULL),
(453, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '山东', 4.45, '002363', 0.125, 88044.4, '汽车配件', 129622, '隆基机械', 29866.9, 2.72, 48.56, 'longjijixie', 'ljjx', '12.68', 71177.7, 2.38, NULL, 240134, 29880, NULL),
(454, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '浙江', 2.01, '002364', 0.124, 25565, '电气设备', 86596.8, '中恒电气', 42400.8, 7.32, 59.42, 'zhonghengdianqi', 'zhdq', '25.60', 2616.45, 0.05, NULL, 128829, 52324.2, NULL),
(455, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '湖北', 5.93, '002365', 0.066, 59632.3, '生物制药', 49503.2, '永安药业', 14630.2, 1.98, 89.09, 'yonganyaoye', 'yayy', '16.82', 60456.6, 3.23, NULL, 119691, 18700, NULL),
(456, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '四川', 5.58, '002366', 0.09, 14886.9, '工程机械', 75469.1, '丹甫股份', 10923.3, 7.98, 840.61, 'danfugufen', 'dfgf', '48.58', 47290.3, 1.09, NULL, 93029.7, 43352.9, NULL),
(457, '2016-06-05 13:21:03', '2016-06-05 13:21:03', '江苏', 2.77, '002367', 0.271, 75875.3, '运输设备', 212610, '康力电梯', 45990.6, 8.32, 42.56, 'kanglidianti', 'kldt', '15.18', 34841.6, 0.47, NULL, 368181, 73860, NULL),
(458, '2016-06-05 13:21:03', '2016-06-05 13:21:04', '北京', 4.81, '002368', 0.06, 3244.93, '软件服务', 301993, '太极股份', 36140.7, 13.63, 830.24, 'taijigufen', 'tjgf', '34.22', 95026.2, 2.29, NULL, 422311, 41559.7, NULL),
(459, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '深圳', 2.8, '002369', -0.049, 90932.5, '通信设备', 155020, '卓翼科技', 41492.8, 7.14, 0, 'zhuoyikeji', 'zykj', '10.08', 64243.6, 1.31, NULL, 288069, 48863.8, NULL),
(460, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '浙江', 3.73, '002370', 0.155, 27250.3, '化学制药', 52976.8, '亚太药业', 17389.9, 6.55, 79.01, 'yataiyaoye', 'ytyy', '28.40', 34231.5, 1.68, NULL, 89789.3, 20400, NULL),
(461, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '北京', 5.26, '002371', 0.057, 60420.1, '半导体', 157785, '七星电子', 33744.3, 3.62, 167.4, 'qixingdianzi', 'qxdz', '31.92', 83678.5, 2.38, NULL, 409170, 35220, NULL),
(462, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '浙江', 3.63, '002372', 0.329, 65066.6, '其他建材', 150858, '伟星新材', 50750.7, 3.96, 21.85, 'weixingxincai', 'wxxc', '18.14', 91417.7, 1.58, NULL, 259641, 57869, NULL),
(463, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '北京', 2.01, '002373', 0.217, 23459.6, '软件服务', 163661, '千方科技', 21767.9, 12.01, 55.67, 'qianfangkeji', 'qfkj', '0.00', -13732.7, -0.27, NULL, 231060, 50550.8, NULL),
(464, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '山东', 5.82, '002374', 0.154, 73209.6, '广告包装', 148920, '丽鹏股份', 18472.3, 1.79, 33.92, 'lipenggufen', 'lpgf', '6.28', 135930, 4.12, NULL, 313690, 32965.3, NULL),
(465, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '浙江', 5.11, '002375', 0.361, 43358.9, '装修装饰', 1594020, '亚厦股份', 112992, 2.75, 19.46, 'yashagufen', 'ysgf', '11.49', 181991, 1.36, NULL, 1861760, 133814, NULL),
(466, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '山东', 3.04, '002376', 0.102, 73878.5, '电脑设备', 138874, '新北洋', 54876.4, 3.52, 52.62, 'xinbeiyang', 'xby', '12.71', 31724.8, 0.53, NULL, 288612, 60000, NULL),
(467, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '湖北', 1.72, '002377', 0.01, 15162.2, '化工原料', 134931, '国创高新', 43097.5, 3.35, 284.37, 'guochuanggaoxin', 'gcgx', '8.80', 17824.7, 0.41, NULL, 205519, 43814, NULL),
(468, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '江西', 2.2, '002378', -0.031, 105085, '小金属', 142519, '章源钨业', 85642.7, 3.62, 0, 'zhangyuanwuye', 'zywy', '10.34', 57515.3, 0.62, NULL, 318931, 92416.7, NULL),
(469, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '山东', 1.34, '002379', -0.07, 156067, '铝', 208357, '鲁丰环保', 66745.1, 2.98, 0, 'lufenghuanbao', 'lfhb', '0.00', 56694, 0.61, NULL, 428536, 92640, NULL),
(470, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '江苏', 9.35, '002380', 0.243, 19758.2, '电气设备', 78250.9, '科远股份', 5134.58, 3.19, 61.39, 'keyuangufen', 'kygf', '34.44', 61708.9, 6.05, NULL, 115821, 10200, NULL),
(471, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '浙江', 3.25, '002381', 0.149, 42949.1, '橡胶', 96434.3, '双箭股份', 21691.3, 2.57, 27.99, 'shuangjiangufen', 'sjgf', '13.74', 28432.2, 0.81, NULL, 151730, 35100, NULL),
(472, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '山东', 4.38, '002382', 0.34, 52655.3, '医疗保健', 72484.4, '蓝帆医疗', 23897.2, 4.08, 26.93, 'lanfanyiliao', 'lfyl', '11.40', 50769.4, 2.05, NULL, 145877, 24720, NULL),
(473, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '北京', 8.76, '002383', 0.019, 11142.9, '通信设备', 95931.1, '合众思壮', 13893.1, 2.98, 692.99, 'hezhongsizhuang', 'hzsz', '30.71', 129083, 6.54, NULL, 227805, 19732.9, NULL),
(474, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '江苏', 3.19, '002384', 0.063, 151537, '通信设备', 382033, '东山精密', 47229.6, 6.95, 175.92, 'dongshanjingmi', 'dsjm', '18.42', 164444, 1.94, NULL, 620526, 84739, NULL),
(475, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '北京', 2.37, '002385', 0.083, 314717, '饲料', 504734, '大北农', 153937, 5.14, 73.88, 'dabeinong', 'dbn', '8.21', 51431.7, 0.21, NULL, 1048480, 249747, NULL),
(476, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '四川', 5.82, '002386', -0.126, 657768, '化工原料', 441191, '天原集团', 67165.2, 0.93, 0, 'tianyuanjituan', 'tyjt', '6.89', 185366, 2.76, NULL, 1435270, 67168, NULL),
(477, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '广东', 2.76, '002387', -0.16, 66052.2, '软饮料', 35081.1, '黑牛食品', 28861.5, 3.6, 0, 'heiniushipin', 'hnsp', '0.00', 54483.9, 1.16, NULL, 201361, 46945.9, NULL),
(478, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '深圳', 1.41, '002388', 0.004, 7319.41, '元器件', 35214.2, '新亚制程', 36402.3, 4.27, 854.28, 'xinyazhicheng', 'xyzc', '11.94', 27985.9, 0.7, NULL, 81037.6, 39960, NULL),
(479, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '浙江', 3.71, '002389', 0.076, 69659.1, '元器件', 87197.4, '南洋科技', 38657, 2.8, 68.38, 'nanyangkeji', 'nykj', '0.00', 121700, 2.09, NULL, 300754, 58135.8, NULL),
(480, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '贵州', 1.96, '002390', 0.065, 90825, '中成药', 374570, '信邦制药', 73385.9, 5.4, 81.14, 'xinbangzhiyao', 'xbzy', '9.04', 73406.5, 0.59, NULL, 604962, 125114, NULL),
(481, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '江苏', 7.73, '002391', 0.39, 120663, '农药化肥', 138597, '长青股份', 21330.9, 1.6, 17.07, 'zhangqinggufen', 'zqgf', '14.34', 165843, 4.58, NULL, 323478, 36213.8, NULL),
(482, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '北京', 2.5, '002392', 0.081, 36542, '其他建材', 286186, '北京利尔', 56124.7, 2.89, 44.6, 'beijinglier', 'bjle', '5.03', 99308.5, 0.83, NULL, 429939, 119856, NULL),
(483, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '天津', 16.22, '002393', 0.584, 21028.3, '化学制药', 158532, '力生制药', 18178.4, 1.96, 27.25, 'lishengzhiyao', 'lszy', '35.38', 169244, 9.28, NULL, 332632, 18245.5, NULL),
(484, '2016-06-05 13:21:04', '2016-06-05 13:21:04', '江苏', 8.27, '002394', 0.362, 137522, '纺织', 278217, '联发股份', 32370, 1.39, 15.86, 'lianfagufen', 'lfgf', '14.58', 107700, 3.33, NULL, 442741, 32370, NULL),
(485, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '江苏', 4.41, '002395', 0.035, 32757.5, '塑料', 77960.7, '双象股份', 17880.6, 3.23, 203.14, 'shuangxianggufen', 'sxgf', '26.25', 42231.5, 2.36, NULL, 119358, 17880.6, NULL),
(486, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '福建', 4.05, '002396', 0.04, 42264.3, '通信设备', 250436, '星网锐捷', 52659, 3.7, 186.73, 'xingwangruijie', 'xwrj', '19.17', 61744.7, 1.15, NULL, 346131, 53911.1, NULL),
(487, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '湖南', 1.92, '002397', 0.084, 50366.5, '服饰', 107943, '梦洁家纺', 32810.9, 3.71, 42.42, 'mengjiejiafang', 'mjjf', '7.59', 23297.3, 0.35, NULL, 177229, 67240, NULL),
(488, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '福建', 5.56, '002398', 0.319, 42651.3, '建筑施工', 155968, '建研集团', 25289.6, 2.04, 17.78, 'jianyanjituan', 'jyjt', '12.32', 57738.4, 1.68, NULL, 247659, 34273.2, NULL),
(489, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '深圳', 10.48, '002399', 0.344, 74718.7, '化学制药', 669551, '海普瑞', 80020, 2.55, 38.86, 'haipurui', 'hpr', '28.74', 527738, 6.6, NULL, 1017980, 80020, NULL),
(490, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '广东', 2.47, '002400', 0.219, 3072.62, '广告包装', 435891, '省广股份', 80617, 9.25, 52.33, 'shengguanggufen', 'sggf', '14.02', 18287.6, 0.2, NULL, 606027, 90471.9, NULL),
(491, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '上海', 2.26, '002401', 0.102, 6154.24, '软件服务', 70935.8, '中海科技', 29865.3, 8.36, 92.58, 'zhonghaikeji', 'zhkj', '15.84', 8605.19, 0.28, NULL, 109586, 30324, NULL),
(492, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '深圳', 2.88, '002402', 0.103, 24122.7, '元器件', 96088.9, '和而泰', 24135.8, 4.08, 56.92, 'heertai', 'het', '18.97', 43802.5, 1.32, NULL, 131486, 33218.2, NULL),
(493, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '浙江', 6.92, '002403', 0.24, 47414.1, '家用电器', 165288, '爱仕达', 22238.2, 1.82, 26.23, 'aishida', 'asd', '15.19', 105442, 4.39, NULL, 273181, 24000, NULL),
(494, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '浙江', 2.39, '002404', 0.07, 36911, '纺织', 111454, '嘉欣丝绸', 39306.5, 2.41, 40.9, 'jiaxinsichou', 'jxsc', '7.62', 32207.1, 0.62, NULL, 206759, 52065, NULL),
(495, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '北京', 3.6, '002405', 0.103, 14764.9, '软件服务', 171747, '四维图新', 65898.2, 5.83, 102.11, 'siweituxin', 'swtx', '33.92', 98281.3, 1.42, NULL, 326531, 69159.7, NULL),
(496, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '河南', 3.84, '002406', 0.114, 40658.7, '汽车配件', 155275, '远东传动', 35177.1, 1.8, 30.44, 'yuandongchuandong', 'ydcd', '8.14', 89304.5, 1.59, NULL, 245036, 56100, NULL),
(497, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '河南', 6.23, '002407', 0.041, 118828, '化工原料', 137490, '多氟多', 18694.6, 3.48, 263.67, 'duofuduo', 'dfd', '39.85', 93557.6, 4.05, NULL, 322667, 23112, NULL),
(498, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '山东', 6.38, '002408', 0.23, 255104, '化工原料', 259720, '齐翔腾达', 74513.5, 1.71, 33.86, 'qixiangtengda', 'qxtd', '12.88', 254321, 3.22, NULL, 718799, 79019.6, NULL),
(499, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '江苏', 7.79, '002409', 0.233, 23133.6, '化工原料', 116975, '雅克科技', 8253, 2.82, 47.18, 'yakekeji', 'ykkj', '17.03', 75144.2, 4.52, NULL, 164722, 16632, NULL),
(500, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '北京', 2.27, '002410', 0.049, 39439.4, '软件服务', 151589, '广联达', 71591.8, 11.05, 255.54, 'guanglianda', 'gld', '13.25', 46764, 0.41, NULL, 269779, 112839, NULL),
(501, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '江苏', 2.43, '002411', 0.015, 71469.4, '化工原料', 83369.2, '九九久', 25853.6, 3.91, 313.98, 'jiujiujiu', 'jjj', '18.21', 24742.8, 0.71, NULL, 167209, 34830, NULL),
(502, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '湖南', 3.96, '002412', 0.182, 45711.5, '中成药', 62400.5, '汉森制药', 28677.5, 6.07, 65.93, 'hansenzhiyao', 'hszy', '17.41', 44247.9, 1.49, NULL, 137392, 29600, NULL),
(503, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '江苏', 6.35, '002413', 0.14, 43612.2, '机械基件', 137547, '常发股份', 22050, 8.19, 259.72, 'changfagufen', 'cfgf', '12.41', 126864, 4, NULL, 259915, 31740, NULL),
(504, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '湖北', 4.1, '002414', 0.061, 58914.5, '电器仪表', 165700, '高德红外', 46459.6, 9.6, 323.1, 'gaodehongwai', 'gdhw', '22.13', 148726, 2.48, NULL, 257667, 60000, NULL),
(505, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '浙江', 3.81, '002415', 0.55, 166530, '电器仪表', 2051640, '海康威视', 315047, 8.51, 29.87, 'haikangweishi', 'hkws', '21.38', 156328, 0.38, NULL, 2320240, 406913, NULL),
(506, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '深圳', 4.4, '002416', 0.08, 3419.62, '电器连锁', 976376, '爱施德', 97023, 1.73, 47.38, 'aishide', 'asd', '21.65', 153022, 1.52, NULL, 1051860, 100388, NULL),
(507, '2016-06-05 13:21:05', '2016-06-05 13:21:05', '福建', 1.3, '002417', -0.243, 2147.99, '通信设备', 84357.6, '*ST元达', 21598.1, 9.38, 0, '*STyuanda', '*STyd', '14.33', 40803, 1.51, NULL, 90983.4, 27000, NULL),
(508, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '浙江', 5.6, '002418', 0.05, 98268.2, '机械基件', 199774, '康盛股份', 18453.6, 5.13, 330.67, 'kangshenggufen', 'ksgf', '7.94', 138695, 3.66, NULL, 317888, 37880, NULL),
(509, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '深圳', 5.64, '002419', 0.263, 180420, '百货', 645582, '天虹商场', 80020, 1.95, 20.88, 'tianhongshangchang', 'thsc', '12.53', 171162, 2.14, NULL, 1063100, 80020, NULL),
(510, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '广东', 4.01, '002420', 0.028, 83737.2, '塑料', 253266, '毅昌股份', 38724.5, 1.66, 119.75, 'yichanggufen', 'ycgf', '8.70', 80793.8, 2.01, NULL, 381409, 40100, NULL),
(511, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '深圳', 3.01, '002421', 0.076, 10495.2, '软件服务', 189721, '达实智能', 45452.3, 4.24, 83.59, 'dashizhineng', 'dszn', '15.63', 77430.2, 1.35, NULL, 279039, 57552, NULL),
(512, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '四川', 7.69, '002422', 0.284, 598575, '化学制药', 844279, '科伦药业', 71104.2, 2.1, 28.47, 'kelunyaoye', 'klyy', '14.88', 442990, 3.08, NULL, 2157070, 144000, NULL),
(513, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '河南', 4, '002423', -0.048, 115575, '特种钢', 130428, '中原特钢', 46551, 2.15, 0, 'zhongyuantegang', 'zytg', '10.68', 106786, 2.12, NULL, 343435, 50298.7, NULL),
(514, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '贵州', 5.12, '002424', 0.382, 56204, '中成药', 261424, '贵州百灵', 22584.8, 10.54, 70.61, 'guizhoubailing', 'gzbl', '17.16', 107868, 2.29, NULL, 352965, 47040, NULL),
(515, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '广东', 4.41, '002425', 0.037, 27898.1, '服饰', 95251.3, '凯撒股份', 37881, 5.31, 319.66, 'kaisagufen', 'ksgf', '22.31', 120891, 2.78, NULL, 285272, 43423.8, NULL),
(516, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '江苏', 3.06, '002426', 0.098, 67618.6, '元器件', 330325, '胜利精密', 59094.8, 5.63, 88.25, 'shenglijingmi', 'sljm', '23.98', 141916, 1.44, NULL, 543618, 98554.9, NULL),
(517, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '浙江', 5.22, '002427', 0.2, 122336, '化纤', 192534, '尤夫股份', 33345.9, 1.84, 29.45, 'youfugufen', 'yfgf', '20.57', 134344, 3.37, NULL, 347662, 39815.5, NULL),
(518, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '云南', 2.43, '002428', 0.086, 74464.9, '小金属', 68205.5, '云南锗业', 63312.4, 4.29, 60.56, 'yunnanzheye', 'ynzy', '15.47', 32370.6, 0.5, NULL, 215988, 65312, NULL),
(519, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '深圳', 2.94, '002429', 0.168, 36873.9, '家用电器', 591292, '兆驰股份', 158602, 2.63, 23, 'zhaochigufen', 'zcgf', '8.57', 48916.3, 0.31, NULL, 844140, 160179, NULL),
(520, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '浙江', 4.32, '002430', 0.074, 394760, '化工机械', 458720, '杭氧股份', 80933.6, 1.85, 54.12, 'hangyanggufen', 'hygf', '7.38', 88342, 1.06, NULL, 979452, 83177.6, NULL),
(521, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '广东', 8.15, '002431', 0.25, 51334.7, '建筑施工', 898913, '棕榈园林', 30321, 2.06, 36.07, 'zonglvyuanlin', 'zlyl', '11.61', 231931, 4.21, NULL, 1081170, 55079.9, NULL),
(522, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '天津', 1.91, '002432', -0.107, 17010.5, '医疗保健', 61192.2, '九安医疗', 37200, 6.51, 0, 'jiuanyiliao', 'jayl', '18.19', 30052.2, 0.81, NULL, 95143.6, 37200, NULL),
(523, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '广东', 5.22, '002433', 0.103, 71910.4, '中成药', 268163, '太安堂', 67497.4, 2, 50.79, 'taiantang', 'tat', '9.48', 246009, 3.39, NULL, 451525, 72665.7, NULL),
(524, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '浙江', 4.37, '002434', 0.246, 57468, '汽车配件', 288305, '万里扬', 49679.2, 2.81, 24.93, 'wanliyang', 'wly', '10.25', 90789.1, 1.78, NULL, 427797, 51000, NULL),
(525, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '江苏', 4.32, '002435', 0.089, 40616.6, '机械基件', 84682.5, '长江润发', 17897.3, 2.33, 56.37, 'zhangjiangrunfa', 'zjrf', '16.28', 42608.2, 2.15, NULL, 145630, 19800, NULL),
(526, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '深圳', 4.23, '002436', 0.101, 133389, '元器件', 139912, '兴森科技', 32327.3, 2.95, 61.63, 'xingsenkeji', 'xskj', '19.22', 99975.1, 2.02, NULL, 328092, 49596.9, NULL),
(527, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '黑龙江', 4.47, '002437', 0.442, 150652, '化学制药', 130601, '誉衡药业', 70000, 5.28, 26.68, 'yuhengyaoye', 'yhyy', '9.41', 127033, 1.74, NULL, 736823, 73189, NULL),
(528, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '江苏', 4.54, '002438', 0.083, 15808.2, '机械基件', 88905.1, '江苏神通', 13462, 7.17, 197.23, 'jiangsushentong', 'jsst', '18.69', 40726, 1.96, NULL, 128603, 20800, NULL),
(529, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '北京', 1.8, '002439', 0.021, 16482.2, '软件服务', 139344, '启明星辰', 55186.6, 9.46, 400.21, 'qimingxingchen', 'qmxc', '0.00', 21400.6, 0.26, NULL, 223696, 83024.6, NULL),
(530, '2016-06-05 13:21:06', '2016-06-05 13:21:06', '浙江', 7.68, '002440', 0.782, 223201, '染料涂料', 488262, '闰土股份', 57478.1, 2.05, 10.06, 'runtugufen', 'rtgf', '15.51', 156258, 2.04, NULL, 824815, 76700, NULL),
(531, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '广东', 4.9, '002441', 0.248, 26308.7, '批发业', 329298, '众业达', 31115.5, 2.59, 25.52, 'zhongyeda', 'zyd', '15.60', 93292.1, 2.01, NULL, 400938, 46400, NULL),
(532, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '河北', 2.33, '002442', -0.038, 108425, '化工原料', 134061, '龙星化工', 25143.1, 3.35, 0, 'longxinghuagong', 'lxhg', '15.76', 41171.5, 0.86, NULL, 290833, 48000, NULL),
(533, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '浙江', 3.72, '002443', 0.105, 62636.2, '钢加工', 149437, '金洲管道', 49104.3, 3.08, 54.71, 'jinzhouguandao', 'jzgd', '12.25', 77365.8, 1.49, NULL, 249422, 52053.6, NULL),
(534, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '浙江', 3.83, '002444', 0.2, 68473.8, '轻工机械', 317935, '巨星科技', 90446.4, 3.42, 32.79, 'juxingkeji', 'jxkj', '20.19', 96314.5, 0.95, NULL, 546551, 101400, NULL),
(535, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 2.67, '002445', 0.07, 67018.1, '机械基件', 213209, '中南重工', 50155, 10.8, 206.22, 'zhongnanzhonggong', 'znzg', '21.45', 122077, 1.65, NULL, 355875, 73876.6, NULL),
(536, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '广东', 3.41, '002446', 0.128, 13678.8, '通信设备', 88873, '盛路通信', 16802.8, 4.75, 63.09, 'shenglutongxin', 'sltx', '28.60', 67895.1, 1.81, NULL, 158256, 37418, NULL),
(537, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '辽宁', 2.25, '002447', 0.056, 198974, '渔业', 68828.8, '壹桥海参', 57697.2, 2.99, 60.1, 'yiqiaohaican', 'yqhc', '0.00', 44019.6, 0.46, NULL, 317907, 95245.2, NULL),
(538, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '河南', 3.31, '002448', 0.17, 101799, '运输设备', 110498, '中原内配', 45852.2, 2.3, 22.3, 'zhongyuanneipei', 'zynp', '14.85', 54476.6, 0.93, NULL, 255241, 58810.2, NULL),
(539, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '广东', 6.26, '002449', 0.19, 127704, '半导体', 263174, '国星光电', 33112.1, 1.56, 27.75, 'guoxingguangdian', 'gxgd', '12.50', 160719, 3.38, NULL, 432458, 47575.2, NULL),
(540, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 3.74, '002450', 0.459, 335831, '化工原料', 848263, '康得新', 142904, 7.54, 30.69, 'kangdexin', 'kdx', '17.13', 116070, 0.81, NULL, 1268080, 143555, NULL),
(541, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '上海', 1.55, '002451', 0.037, 42918.6, '电气设备', 68314.5, '摩恩电气', 27627.1, 5.22, 109.14, 'moendianqi', 'medq', '11.24', 6827.16, 0.16, NULL, 170628, 43920, NULL),
(542, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '湖南', 2.26, '002452', 0.063, 19093, '电气设备', 112142, '长高集团', 33283.4, 4.04, 71.97, 'zhanggaojituan', 'zgjt', '11.79', 22422.4, 0.43, NULL, 140733, 52246.4, NULL),
(543, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 2.1, '002453', 0.048, 61695.4, '化工原料', 101307, '天马精化', 53723.7, 2.75, 60.42, 'tianmajinghua', 'tmjh', '8.93', 34060, 0.6, NULL, 212529, 57130, NULL),
(544, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '上海', 5.74, '002454', 0.332, 31183.6, '汽车配件', 266417, '松芝股份', 25319.2, 1.98, 17.12, 'songzhigufen', 'szgf', '0.00', 84242.1, 2.08, NULL, 367578, 40560, NULL),
(545, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 1.64, '002455', 0.058, 78962.1, '化工原料', 108906, '百川股份', 29097.8, 5.07, 71.71, 'baichuangufen', 'bcgf', '9.03', 4024.8, 0.08, NULL, 213447, 47412, NULL),
(546, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '深圳', 5.81, '002456', 0.259, 364117, '元器件', 1012770, '欧菲光', 81996, 3.34, 37.49, 'oufeiguang', 'ofg', '28.91', 318711, 3.09, NULL, 1500460, 103061, NULL),
(547, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '宁夏', 5.21, '002457', 0.048, 36377.4, '塑料', 142132, '青龙管业', 26155.6, 1.62, 87.49, 'qinglongguanye', 'qlgy', '10.11', 82085.9, 2.45, NULL, 233241, 33499.2, NULL),
(548, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '山东', 1.81, '002458', -0.677, 85887.9, '农业综合', 25855.5, '益生股份', 14182.4, 8.87, 0, 'yishenggufen', 'ysgf', '45.18', 43357.8, 1.53, NULL, 178325, 28340, NULL),
(549, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '河北', 3.86, '002459', -0.05, 37213.7, '工程机械', 122274, '天业通联', 19875.3, 3.04, 0, 'tianyetonglian', 'tytl', '16.95', 165435, 4.26, NULL, 169257, 38868.9, NULL),
(550, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江西', 3.94, '002460', 0.137, 54865.9, '小金属', 110337, '赣锋锂业', 25422.3, 4.55, 65.61, 'ganfengliye', 'gfly', '66.13', 76583.1, 2.05, NULL, 206842, 37298.5, NULL),
(551, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '广东', 4.91, '002461', 0.056, 285780, '啤酒', 175883, '珠江啤酒', 68016.2, 1.95, 84.87, 'zhujiangpijiu', 'zjpj', '12.03', 159071, 2.34, NULL, 637134, 68016.2, NULL),
(552, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '北京', 5.62, '002462', 0.374, 31901.5, '医药商业', 425733, '嘉事堂', 19621.4, 4.95, 37.15, 'jiashitang', 'jst', '36.07', 35835.3, 1.49, NULL, 521235, 24000, NULL),
(553, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 1.9, '002463', -0.025, 259501, '元器件', 231966, '沪电股份', 167328, 2.32, 0, 'hudiangufen', 'hdgf', '5.68', 16590.6, 0.1, NULL, 562453, 167416, NULL),
(554, '2016-06-05 13:21:07', '2016-06-05 13:21:07', '江苏', 4.35, '002464', -0.805, 21043.2, '塑料', 32796, '金利科技', 9277.88, 10.82, 0, 'jinlikeji', 'jlkj', '66.80', 60774.4, 4.17, NULL, 70955.6, 14559, NULL),
(555, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '广东', 4.92, '002465', 0.17, 88178.8, '通信设备', 493430, '海格通信', 91631.9, 5.04, 78.72, 'haigetongxin', 'hgtx', '11.75', 259107, 2.42, NULL, 832620, 107288, NULL),
(556, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '四川', 11.13, '002466', 0.158, 163204, '化工原料', 171916, '天齐锂业', 16504.2, 5.1, 179.15, 'tianqiliye', 'tqly', '44.70', 322377, 12.46, NULL, 724529, 25876, NULL),
(557, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '北京', 1.95, '002467', 0.083, 9276.85, '电信运营', 48682.1, '二六三', 60988.4, 4.96, 58.61, 'erliusan', 'els', '14.26', 10943.8, 0.15, NULL, 167693, 72335.8, NULL),
(558, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '浙江', 2.2, '002468', 0.017, 45731.9, '其他建材', 113120, '艾迪西', 33177.6, 6.23, 400.94, 'aidixi', 'adx', '27.67', 26216.8, 0.79, NULL, 170592, 33177.6, NULL),
(559, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '山东', 3.41, '002469', 0.194, 13076, '建筑施工', 123467, '三维工程', 25269.7, 3.3, 28.95, 'sanweigongcheng', 'swgc', '0.00', 29854.3, 0.9, NULL, 142858, 33300.6, NULL),
(560, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '山东', 4.78, '002470', 0.413, 353410, '农药化肥', 644171, '金正大', 118508, 3.93, 22.73, 'jinzhengda', 'jzd', '8.00', 253542, 1.62, NULL, 1164650, 156285, NULL),
(561, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '江苏', 3.29, '002471', 0.121, 72252, '电气设备', 487386, '中超电缆', 48052.4, 6.64, 90.18, 'zhongchaodianlan', 'zcdl', '6.19', 77440.9, 1.53, NULL, 602761, 50720, NULL),
(562, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '浙江', 5.52, '002472', 0.22, 96561.7, '机械基件', 119553, '双环传动', 18566.6, 2.62, 33.9, 'shuanghuanchuandong', 'shcd', '21.79', 65524.5, 2.27, NULL, 249660, 28837.2, NULL),
(563, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '浙江', 2.39, '002473', -0.05, 13284, '家用电器', 22447.4, '圣莱达', 16000, 13.84, 0, 'shenglaida', 'sld', '26.34', 22195.4, 1.39, NULL, 42538.8, 16000, NULL),
(564, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '福建', 2.2, '002474', 0.032, 3918.53, '软件服务', 113954, '榕基软件', 43849.1, 5.23, 181.4, 'rongjiruanjian', 'rjrj', '13.00', 36364.3, 0.58, NULL, 167283, 62220, NULL),
(565, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '深圳', 3.93, '002475', 0.306, 226269, '元器件', 609435, '立讯精密', 114969, 7.37, 47.37, 'lixunjingmi', 'lxjm', '30.04', 183485, 1.47, NULL, 1028030, 124790, NULL),
(566, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '山东', 1.66, '002476', 0.031, 36001, '化工原料', 70335.3, '宝莫股份', 60431.5, 4.11, 109.02, 'baomogufen', 'bmgf', '7.81', 20521.8, 0.34, NULL, 146438, 61200, NULL),
(567, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '河南', 3.99, '002477', 0.005, 243097, '农业综合', 413841, '雏鹰农牧', 52757.3, 2.63, 1062.23, 'chuyingnongmu', 'cynm', '19.17', 264199, 2.53, NULL, 922998, 104505, NULL),
(568, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '江苏', 7.17, '002478', 0.228, 115423, '普钢', 211639, '常宝股份', 28217.8, 1.44, 22.69, 'changbaogufen', 'cbgf', '10.70', 110997, 2.77, NULL, 383143, 40010, NULL),
(569, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '浙江', 2.99, '002479', 0.14, 145950, '火力发电', 104205, '富春环保', 73167, 3.47, 41.64, 'fuchunhuanbao', 'fchb', '10.84', 85284.5, 1.07, NULL, 371551, 79635, NULL),
(570, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '四川', 3.79, '002480', -0.036, 144683, '机械基件', 263881, '新筑股份', 62486.8, 2.36, 0, 'xinzhugufen', 'xzgf', '9.62', 144754, 2.24, NULL, 500647, 64536.8, NULL),
(571, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '山东', 4.95, '002481', 0.214, 76274.8, '食品', 246282, '双塔食品', 37455.2, 7.01, 81.2, 'shuangtashipin', 'stsp', '7.25', 137503, 2.72, NULL, 391523, 50535.6, NULL),
(572, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '深圳', 8.39, '002482', 0.32, 40008.8, '装修装饰', 1082510, '广田股份', 47977.7, 2, 27.19, 'guangtiangufen', 'gtgf', '19.93', 218324, 4.06, NULL, 1200000, 53829.4, NULL),
(573, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '江苏', 6.11, '002483', 0.08, 89087.4, '工程机械', 249218, '润邦股份', 36000, 1.47, 73.8, 'runbanggufen', 'rbgf', '10.53', 138286, 3.12, NULL, 394356, 44373.8, NULL),
(574, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '江苏', 4.86, '002484', 0.202, 50161.2, '元器件', 116616, '江海股份', 30597.3, 2.93, 35.3, 'jianghaigufen', 'jhgf', '13.91', 68007.1, 2.04, NULL, 198069, 33280, NULL),
(575, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '山东', 6.1, '002485', 0.016, 107637, '服饰', 102203, '希努尔', 32000, 2.28, 425.61, 'xinuer', 'xne', '16.90', 126203, 3.94, NULL, 262546, 32000, NULL),
(576, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '上海', 1.19, '002486', -0.037, 47354, '服饰', 63434, '嘉麟杰', 80050, 3.62, 0, 'jialinjie', 'jlj', '4.87', 201.46, 0, NULL, 172523, 83200, NULL),
(577, '2016-06-05 13:21:08', '2016-06-05 13:21:08', '辽宁', 2.93, '002487', 0.061, 24304.3, '钢加工', 141822, '大金重工', 54000, 2.12, 50.9, 'dajinzhonggong', 'djzg', '8.78', 76019.8, 1.41, NULL, 224577, 54000, NULL),
(578, '2016-06-05 13:21:08', '2016-06-05 13:21:09', '浙江', 3.1, '002488', 0.081, 86956.4, '汽车配件', 215781, '金固股份', 32644.5, 4.39, 84.17, 'jingugufen', 'jggf', '23.68', 84037.6, 1.65, NULL, 368432, 50848.3, NULL),
(579, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '浙江', 5.73, '002489', 0.733, 102638, '家居用品', 351137, '浙江永强', 53378.2, 3.63, 14.17, 'zhejiangyongqiang', 'zjyq', '7.65', 180315, 2.9, NULL, 549155, 62163.9, NULL),
(580, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '山东', 3.39, '002490', 0.013, 173366, '化工机械', 232345, '山东墨龙', 29993.2, 2.08, 272.7, 'shandongmolong', 'sdml', '8.22', 84950.1, 1.06, NULL, 592698, 79784.8, NULL),
(581, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '江苏', 2.23, '002491', 0.066, 89439.1, '通信设备', 324152, '通鼎互联', 107928, 3.93, 66.13, 'tongdinghulian', 'tdhl', '0.00', 70488.3, 0.59, NULL, 517873, 119912, NULL),
(582, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '广东', 4.09, '002492', 0.049, 70829.1, '仓储物流', 43594.3, '恒基达鑫', 23549.3, 2.01, 84.37, 'hengjidaxin', 'hjdx', '0.00', 55484.1, 2.05, NULL, 149150, 27000, NULL),
(583, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '浙江', 6.01, '002493', 0.15, 1088770, '化纤', 1093150, '荣盛石化', 101908, 2.49, 49.96, 'rongshengshihua', 'rssh', '12.19', 244227, 2.2, NULL, 3473620, 111200, NULL),
(584, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '河北', 4.02, '002494', 0.029, 29401.5, '服饰', 106677, '华斯股份', 24913, 2.09, 145.12, 'huasigufen', 'hsgf', '16.19', 70839.8, 2.03, NULL, 218011, 34847.8, NULL),
(585, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '广东', 1.62, '002495', 0.046, 39659.3, '食品', 54800.4, '佳隆股份', 37369.6, 3.09, 53.86, 'jialonggufen', 'jlgf', '6.53', 32227.4, 0.48, NULL, 115119, 66830.4, NULL),
(586, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '江苏', 7.78, '002496', 0.3, 158441, '农药化肥', 300066, '辉丰股份', 22939.6, 1.77, 24.33, 'huifenggufen', 'hfgf', '6.82', 190945, 4.81, NULL, 594981, 39670.4, NULL),
(587, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '四川', 2.28, '002497', 0.076, 54074.1, '化工原料', 86376.8, '雅化集团', 70846.9, 2.29, 34.47, 'yahuajituan', 'yhjt', '7.70', 37215, 0.39, NULL, 293832, 96000, NULL),
(588, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '山东', 4, '002498', 0.167, 47252.6, '电气设备', 399705, '汉缆股份', 107257, 3.76, 44.98, 'hanlangufen', 'hlgf', '4.48', 122118, 1.14, NULL, 585409, 107316, NULL),
(589, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '江苏', 3.69, '002499', 0.14, 27149.4, '专用机械', 58234.7, '科林环保', 12946, 5.87, 77.1, 'kelinhuanbao', 'klhb', '19.35', 35115.3, 1.86, NULL, 99624.9, 18900, NULL),
(590, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '山西', 3.35, '002500', 0.478, 34520.9, '证券', 0, '山西证券', 248847, 3.16, 11.06, 'shanxizhengquan', 'sxzq', '15.98', 317012, 1.26, NULL, 5820140, 251873, NULL),
(591, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '吉林', 3.85, '002501', 0.265, 356909, '铝', 364642, '利源精制', 67131, 2.37, 17.22, 'liyuanjingzhi', 'lyjz', '9.91', 145404, 1.55, NULL, 760469, 93600, NULL),
(592, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '广东', 4.97, '002502', 0.07, 19496.2, '文教休闲', 77398.7, '骅威股份', 18800.5, 5.13, 182.23, 'huaweigufen', 'hwgf', '22.89', 113514, 3.25, NULL, 189167, 34878.7, NULL),
(593, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '广东', 2.14, '002503', 0.105, 36737.3, '服饰', 205704, '搜于特', 62974.4, 4.7, 47.9, 'souyute', 'syt', '12.34', 47196, 0.46, NULL, 327493, 103680, NULL),
(594, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '北京', 1.83, '002504', 0.269, 1290.21, '半导体', 306659, '弘高创意', 11035.6, 8.25, 28.02, 'honggaochuangyi', 'hgcy', '27.36', 18724.7, 0.45, NULL, 322330, 41273.4, NULL),
(595, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '湖南', 2, '002505', 0.004, 52363.1, '农业综合', 589424, '大康牧业', 69729.8, 2.64, 656.99, 'dakangmuye', 'dkmy', '0.00', 276022, 0.96, NULL, 703982, 288704, NULL),
(596, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '上海', 0.2, '002506', 0.074, 12723, '半导体', 568118, '协鑫集成', 220824, 35.89, 47.74, 'xiexinjicheng', 'xxjc', '6.78', 194675, 0.77, NULL, 613384, 252352, NULL),
(597, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '重庆', 3.75, '002507', 0.282, 51214.6, '食品', 75727.3, '涪陵榨菜', 18537.8, 4.11, 27.34, 'fulingzhacai', 'flzc', '0.00', 51098.6, 1.58, NULL, 146506, 32240, NULL),
(598, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '浙江', 5.55, '002508', 0.631, 32353.6, '家用电器', 338966, '老板电器', 47156.2, 6.24, 27.43, 'laobandianqi', 'lbdq', '33.75', 80821.4, 1.66, NULL, 415108, 48607.5, NULL),
(599, '2016-06-05 13:21:09', '2016-06-05 13:21:09', '福建', 3.37, '002509', 0.146, 28104.9, '专用机械', 114574, '天广消防', 28747.6, 3.26, 37.73, 'tianguangxiaofang', 'tgxf', '10.40', 59807.6, 1.31, NULL, 186734, 45644.1, NULL),
(600, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '广东', 4.22, '002060', 0.085, 417314, '建筑施工', 573373, '粤 水 电', 60106.2, 1.74, 43.44, 'yue shui dian', 'y s d', '6.78', 120188, 2, NULL, 1294290, 60113.1, NULL),
(601, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '浙江', 2.2, '002061', -0.144, 161144, '化工原料', 83405.2, '江山化工', 40887.8, 2.6, 0, 'jiangshanhuagong', 'jshg', '7.10', 54894.9, 1.21, NULL, 276087, 45326, NULL),
(602, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '浙江', 2.89, '002062', 0.121, 116049, '建筑施工', 1177260, '宏润建设', 67038.5, 2.13, 25.44, 'hongrunjianshe', 'hrjs', '5.55', 3934.48, 0.05, NULL, 1409480, 78750, NULL),
(603, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '广东', 2.84, '002063', 0.207, 20898.7, '软件服务', 151706, '远光软件', 50590.4, 4.77, 32.81, 'yuanguangruanjian', 'ygrj', '13.58', 19018.4, 0.32, NULL, 199767, 59656.1, NULL),
(604, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '浙江', 1.96, '002064', 0.22, 168524, '化纤', 175109, '华峰氨纶', 133339, 3.16, 27.79, 'huafenganlun', 'hfal', '4.94', 1968.8, 0.01, NULL, 469355, 167680, NULL),
(605, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '北京', 4.31, '002065', 0.262, 50194.7, '软件服务', 608105, '东华软件', 134843, 4.21, 34.66, 'donghuaruanjian', 'dhrj', '0.00', 158750, 1.01, NULL, 870505, 156449, NULL),
(606, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '北京', 1.96, '002066', 0.017, 77551.9, '其他建材', 237259, '瑞泰科技', 23100, 9.03, 524.13, 'ruitaikeji', 'rtkj', '15.63', 16452.7, 0.71, NULL, 348809, 23100, NULL),
(607, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '浙江', 2.68, '002067', 0.006, 286649, '造纸', 239593, '景兴纸业', 96052.6, 1.91, 444.81, 'jingxingzhiye', 'jxzy', '8.59', 155908, 1.43, NULL, 589473, 109395, NULL),
(608, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江西', 3.26, '002068', 0.07, 296404, '化工原料', 348540, '黑猫股份', 60706, 1.65, 38.57, 'heimaogufen', 'hmgf', '0.00', 84971, 1.4, NULL, 690570, 60706.4, NULL),
(609, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '辽宁', 1.59, '002069', 0.003, 127150, '渔业', 260618, '獐 子 岛', 68079, 12.41, 3459.62, 'zhang zi dao', 'z z d', '0.00', 87482.8, 1.23, NULL, 471482, 71111.2, NULL),
(610, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '福建', 1.26, '002070', -0.071, 68839.3, '纺织', 138338, '众和股份', 56586.6, 12.65, 0, 'zhonghegufen', 'zhgf', '27.59', 0, 0, NULL, 285694, 63525.8, NULL),
(611, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江苏', 1.71, '002071', 0.095, 1568.18, '影视音像', 118808, '长城影视', 31393.6, 6.97, 62.9, 'zhangchengyingshi', 'zcys', '14.27', -28433.4, -0.54, NULL, 195249, 52543, NULL),
(612, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '山东', 0.75, '002072', -0.315, 27832.9, '纺织', 73152.4, '凯瑞德', 17600, 27.36, 0, 'kairuide', 'krd', '0.00', 19168.2, 1.09, NULL, 103849, 17600, NULL),
(613, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '山东', 5.69, '002073', 0.16, 172040, '软件服务', 521898, '软控股份', 62288.6, 1.98, 38.08, 'ruankonggufen', 'rkgf', '11.14', 89357, 1.09, NULL, 826619, 81858.8, NULL),
(614, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江苏', 3.13, '002074', 0.37, 88267.1, '电气设备', 344384, '东源电器', 22328.7, 7.43, 45.34, 'dongyuandianqi', 'dydq', '34.04', 105855, 1.23, NULL, 505540, 86233.2, NULL),
(615, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江苏', 1.48, '002075', -0.04, 343125, '特种钢', 280164, '沙钢股份', 157626, 22.37, 0, 'shaganggufen', 'sggf', '13.99', 2190.45, 0.01, NULL, 706232, 157627, NULL),
(616, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '广东', 2.58, '002076', 0.08, 26784.1, '家用电器', 66703.6, '雪 莱 特', 18208.4, 6.67, 157, 'xue lai te', 'x l t', '13.70', 47009.6, 1.28, NULL, 124238, 36716, NULL),
(617, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江苏', 4.01, '002077', -0.1, 56319.4, '区域地产', 416894, '大港股份', 25200, 2.38, 0, 'daganggufen', 'dggf', '19.05', 97371, 2.37, NULL, 598373, 41000, NULL),
(618, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '山东', 2.62, '002078', 0.099, 786794, '造纸', 648484, '太阳纸业', 197669, 1.69, 22.32, 'taiyangzhiye', 'tyzy', '4.90', 119603, 0.47, NULL, 1886460, 253664, NULL),
(619, '2016-06-05 13:21:10', '2016-06-05 13:21:10', '江苏', 1.74, '002079', 0.01, 45219.8, '半导体', 88887.6, '苏州固锝', 72548.1, 3.71, 329.49, 'suzhougude', 'szgd', '9.05', 22972.7, 0.32, NULL, 148427, 72797.1, NULL),
(620, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '江苏', 6.67, '002080', 0.46, 223849, '化纤', 501964, '中材科技', 40000, 2.77, 20.05, 'zhongcaikeji', 'zckj', '18.47', 139813, 3.5, NULL, 822092, 40000, NULL),
(621, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '江苏', 4.46, '002081', 0.484, 98782.7, '装修装饰', 1970730, '金 螳 螂', 167890, 3.34, 15.39, 'jin tang lang', 'j t l', '10.21', 15883, 0.09, NULL, 2214280, 176221, NULL),
(622, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '浙江', 5.55, '002082', 0.202, 39323.8, '铝', 105661, '栋梁新材', 19223.4, 1.92, 26.42, 'dongliangxincai', 'dlxc', '15.86', 24181.3, 1.02, NULL, 157907, 23800, NULL),
(623, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '山东', 3.12, '002083', 0.174, 291536, '纺织', 327497, '孚日股份', 84472.7, 1.84, 16.49, 'furigufen', 'frgf', '6.11', 126125, 1.39, NULL, 685253, 90800, NULL),
(624, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '广东', 1.97, '002084', 0.04, 49040.7, '家居用品', 105339, '海鸥卫浴', 37005.6, 4.04, 100.95, 'haiouweiyu', 'howy', '10.20', 2716.5, 0.07, NULL, 168615, 40605.6, NULL),
(625, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '浙江', 2.59, '002085', 0.306, 112378, '汽车配件', 259662, '万丰奥威', 82774.1, 5.61, 23.68, 'wanfengaowei', 'wfaw', '16.20', 47381.5, 0.55, NULL, 545153, 85821.8, NULL),
(626, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '山东', 5.92, '002086', 0.164, 132477, '渔业', 158852, '东方海洋', 23780.8, 2.14, 38.67, 'dongfanghaiyang', 'dfhy', '8.85', 68334.7, 2.8, NULL, 301623, 24385, NULL),
(627, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '河南', 3.75, '002087', 0.082, 212055, '纺织', 308766, '新野纺织', 51961.8, 1.51, 34.78, 'xinyefangzhi', 'xyfz', '7.32', 60063.7, 1.16, NULL, 597768, 51975.8, NULL),
(628, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '山东', 6.66, '002088', 0.057, 73568.6, '矿物制品', 101517, '鲁阳股份', 13347.8, 2.09, 122.54, 'luyanggufen', 'lygf', '14.79', 53795.5, 2.3, NULL, 201688, 23397.9, NULL),
(629, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '江苏', 2.67, '002089', 0.124, 79500, '通信设备', 226518, '新 海 宜', 47649.3, 3.9, 41.81, 'xin hai yi', 'x h y', '0.00', 36637.3, 0.53, NULL, 430896, 68733.5, NULL),
(630, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '江苏', 4.73, '002090', 0.39, 20883.7, '软件服务', 139588, '金智科技', 19137.7, 5.78, 38.36, 'jinzhikeji', 'jzkj', '28.03', 32714.1, 1.45, NULL, 204057, 22631.8, NULL),
(631, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '江苏', 4.48, '002091', 0.335, 34939, '商贸代理', 234182, '江苏国泰', 34938.5, 5.85, 39.14, 'jiangsuguotai', 'jsgt', '16.13', 4636.56, 0.13, NULL, 306907, 36000, NULL),
(632, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '新疆', 6.25, '002092', 0.01, 2054510, '化工原料', 724368, '中泰化学', 124247, 1.34, 403.03, 'zhongtaihuaxue', 'zthx', '8.31', 569149, 4.09, NULL, 3400490, 139024, NULL),
(633, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '福建', 1.53, '002093', 0.022, 51703.8, '电信运营', 117562, '国脉科技', 85291.2, 6.4, 218.36, 'guomaikeji', 'gmkj', '11.41', 1221.85, 0.01, NULL, 246718, 86500, NULL),
(634, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '山东', 2.07, '002094', 0.112, 17169.5, '日用化工', 88425.9, '青岛金王', 32184.2, 6.36, 58.91, 'qingdaojinwang', 'qdjw', '26.75', 1582.7, 0.05, NULL, 149419, 32191.7, NULL),
(635, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '浙江', 1.95, '002095', 0.068, 7132.22, '互联网', 47808.2, '生 意 宝', 25136, 20.41, 292.1, 'sheng yi bao', 's y b', '56.60', 1174.25, 0.05, NULL, 59222.9, 25272, NULL),
(636, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '湖南', 5.81, '002096', 0.147, 90235.1, '化工原料', 110855, '南岭民爆', 26386, 2.17, 42.98, 'nanlingminbao', 'nlmb', '16.49', 64816.6, 1.75, NULL, 323356, 37128.7, NULL),
(637, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '湖南', 3.21, '002097', 0.004, 144764, '工程机械', 524712, '山河智能', 62939.2, 4.11, 1630.07, 'shanhezhineng', 'shzn', '9.07', 121971, 1.61, NULL, 763750, 75532.5, NULL),
(638, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '福建', 2.31, '002098', 0.146, 54001.1, '服饰', 65554.6, '浔兴股份', 19894.5, 3.38, 26.73, 'xunxinggufen', 'xxgf', '11.36', 5675.12, 0.18, NULL, 145772, 31000, NULL),
(639, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '浙江', 4.46, '002099', 0.45, 117812, '化学制药', 131471, '海翔药业', 32012.3, 3.82, 19.43, 'haixiangyaoye', 'hxyy', '8.83', 233790, 3.09, NULL, 415520, 75775.9, NULL),
(640, '2016-06-05 13:21:11', '2016-06-05 13:21:11', '新疆', 2.33, '002100', 0.146, 129449, '饲料', 217412, '天康生物', 47317.8, 3.1, 24.78, 'tiankangshengwu', 'tksw', '9.33', 56439.5, 0.59, NULL, 386143, 96338.5, NULL),
(641, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '广东', 7.23, '002101', 0.273, 88793.9, '机械基件', 124644, '广东鸿图', 19169.2, 2.11, 27.94, 'guangdonghongtu', 'gdht', '0.00', 69764.5, 3.64, NULL, 258221, 19170, NULL),
(642, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '福建', 3.63, '002102', 0.04, 69278.5, '陶瓷', 132808, '冠福股份', 25697.9, 2.74, 124.61, 'guanfugufen', 'gfgf', '11.89', 167789, 2.3, NULL, 468730, 72872.8, NULL),
(643, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 5.12, '002103', 0.11, 27689.5, '文教休闲', 84579.5, '广博股份', 17110.5, 3.42, 107.7, 'guangbogufen', 'gbgf', '18.10', 95917.6, 3.14, NULL, 207554, 30511.8, NULL),
(644, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '江苏', 1.84, '002104', 0.173, 33398, '元器件', 132072, '恒宝股份', 54667.9, 7.79, 41.42, 'hengbaogufen', 'hbgf', '16.05', 8033.07, 0.11, NULL, 172492, 71320, NULL),
(645, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '深圳', 1.38, '002105', 0.002, 46670.3, '文教休闲', 79094, '信隆实业', 36850, 4.21, 1245.08, 'xinlongshiye', 'xlsy', '9.30', 6092.15, 0.17, NULL, 139619, 36850, NULL),
(646, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '深圳', 5.59, '002106', -0.132, 187462, '元器件', 241085, '莱宝高科', 69121.5, 2.94, 0, 'laibaogaoke', 'lbgk', '12.71', 207784, 2.94, NULL, 473004, 70581.6, NULL),
(647, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '山东', 1.6, '002107', 0.11, 18743.6, '中成药', 43523.6, '沃华医药', 16757.2, 9.84, 74.44, 'wohuayiyao', 'whyy', '15.78', 6255.37, 0.17, NULL, 70618.3, 36075.6, NULL),
(648, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '河北', 2.7, '002108', 0.145, 67644.6, '塑料', 157175, '沧州明珠', 57826.3, 4.7, 43.55, 'cangzhoumingzhu', 'czmz', '24.34', 45052.4, 0.73, NULL, 262345, 61845.8, NULL),
(649, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '陕西', 3.08, '002109', -0.16, 128029, '化工原料', 42620.6, '兴化股份', 35840, 2.78, 0, 'xinghuagufen', 'xhgf', '0.00', 19684.2, 0.55, NULL, 192350, 35840, NULL),
(650, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '福建', 4.34, '002110', -0.503, 413859, '普钢', 318118, '三钢闽光', 53470, 2.22, 0, 'sangangminguang', 'sgmg', '0.00', 70618.5, 1.32, NULL, 800179, 53470, NULL),
(651, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '山东', 5.22, '002111', 0.19, 54768, '航空', 171356, '威海广泰', 26366.3, 5.69, 92.8, 'weihaiguangtai', 'whgt', '28.74', 96388.3, 2.67, NULL, 302815, 36109, NULL),
(652, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 2.38, '002112', 0.029, 22219, '电气设备', 104742, '三变科技', 18115.8, 8.02, 335.11, 'sanbiankeji', 'sbkj', '0.00', 6915.07, 0.34, NULL, 135559, 20160, NULL),
(653, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '湖南', 0.78, '002113', -0.019, 143.03, '农药化肥', 1278.57, '天润控股', 11839.7, 31.96, 0, 'tianrunkonggu', 'trkg', '26.40', 13726.5, 1.16, NULL, 11232, 11840, NULL),
(654, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '云南', 2.8, '002114', -0.139, 48417.4, '铅锌', 45635.8, '罗平锌电', 8625.38, 3.33, 0, 'luopingxindian', 'lpxd', '24.98', 70135.7, 2.58, NULL, 169209, 27184.1, NULL),
(655, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 2.24, '002115', 0.017, 16762.3, '通信设备', 154838, '三维通信', 34143.8, 3.4, 226.57, 'sanweitongxin', 'swtx', '10.76', 24693.3, 0.6, NULL, 204040, 41068.8, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(656, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '上海', 2.39, '002116', 0.273, 29410.7, '建筑施工', 289072, '中国海诚', 40145.8, 7.21, 31.5, 'zhongguohaicheng', 'zghc', '13.16', 3565.7, 0.09, NULL, 332419, 40372.2, NULL),
(657, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '山东', 3.54, '002117', 0.253, 62005.8, '广告包装', 89038.1, '东港股份', 36220.1, 7.57, 52.93, 'dongganggufen', 'dggf', '32.01', 37776.7, 1.04, NULL, 170204, 36380.6, NULL),
(658, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '吉林', 3.85, '002118', 0.006, 78301.7, '中成药', 288733, '紫鑫药业', 51267.4, 3.52, 1185.63, 'zixinyaoye', 'zxyy', '14.26', 71948.2, 1.4, NULL, 399884, 51299.1, NULL),
(659, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 3.24, '002119', -0.208, 48000.3, '半导体', 71862.9, '康强电子', 19420, 4.57, 0, 'kangqiangdianzi', 'kqdz', '20.09', 24444.6, 1.19, NULL, 148376, 20620, NULL),
(660, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 3.68, '002120', 0.154, 26715.2, '家居用品', 36156.4, '新海股份', 9772.67, 3.23, 38.62, 'xinhaigufen', 'xhgf', '0.00', 4589.51, 0.31, NULL, 83433.6, 15028, NULL),
(661, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '深圳', 4.61, '002121', 0.16, 232561, '电器仪表', 303826, '科陆电子', 26855.2, 3.55, 56.91, 'keludianzi', 'kldz', '25.03', 100061, 2.1, NULL, 636511, 47609.3, NULL),
(662, '2016-06-05 13:21:12', '2016-06-05 13:21:12', '浙江', 3.99, '002122', 0.027, 205473, '机械基件', 471132, '天马股份', 107293, 1.54, 112.1, 'tianmagufen', 'tmgf', '6.37', 102840, 0.87, NULL, 750554, 118800, NULL),
(663, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '辽宁', 3.63, '002123', 0.053, 67622.2, '电气设备', 271417, '荣信股份', 45495.4, 3.45, 118.81, 'rongxingufen', 'rxgf', '18.83', 41398.2, 0.82, NULL, 368365, 50400, NULL),
(664, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 2.58, '002124', -0.102, 66073.4, '饲料', 81355.7, '天邦股份', 14747.7, 6.79, 0, 'tianbanggufen', 'tbgf', '10.50', 3289.76, 0.16, NULL, 185376, 20861, NULL),
(665, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '湖南', 2.56, '002125', 0.009, 86498.4, '化工原料', 69658.1, '湘潭电化', 13913, 5.32, 774.2, 'xiangtandianhua', 'xtdh', '17.38', 26740, 1.65, NULL, 193676, 16184.4, NULL),
(666, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 5.3, '002126', 0.3, 82569.7, '汽车配件', 207119, '银轮股份', 30011.5, 2.19, 20.02, 'yinlungufen', 'ylgf', '16.41', 79367.4, 2.2, NULL, 380976, 36054, NULL),
(667, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '江苏', 1.01, '002127', 0.014, 7084.35, '纺织', 38963.2, '新民科技', 44645.9, 12.44, 453.93, 'xinminkeji', 'xmkj', '0.00', 30304, 0.68, NULL, 54786.9, 44645.9, NULL),
(668, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '内蒙', 5.33, '002128', 0.241, 775494, '煤炭开采', 372281, '露天煤业', 132668, 1.81, 19.99, 'lutianmeiye', 'ltmy', '7.30', 122421, 0.75, NULL, 1387400, 163438, NULL),
(669, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '天津', 2.89, '002129', 0.041, 463307, '半导体', 648041, '中环股份', 159334, 3.73, 132.45, 'zhonghuangufen', 'zhgf', '0.00', 377394, 1.64, NULL, 1620130, 229626, NULL),
(670, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '深圳', 3.04, '002130', 0.638, 74332.8, '电气设备', 116362, '沃尔核材', 38710.9, 4.57, 10.89, 'woerhecai', 'wehc', '15.43', 2595.16, 0.05, NULL, 342282, 56938.8, NULL),
(671, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 1.82, '002131', 0.132, 43961.9, '农用机械', 239182, '利欧股份', 61839.5, 6.3, 43.46, 'liougufen', 'logf', '16.82', 91005.3, 0.77, NULL, 440331, 117427, NULL),
(672, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '河南', 2.56, '002132', 0.037, 109544, '钢加工', 172167, '恒星科技', 47312.5, 1.98, 68.86, 'hengxingkeji', 'hxkj', '4.37', 59346.9, 0.84, NULL, 329801, 70636.3, NULL),
(673, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 3.6, '002133', -0.003, 2006.82, '全国地产', 820514, '广宇集团', 49196.7, 1.65, 0, 'guangyujituan', 'gyjt', '6.46', 82878.6, 1.07, NULL, 872271, 77414.4, NULL),
(674, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '天津', 2.24, '002134', -0.078, 26662.6, '元器件', 36245.2, '天津普林', 24585, 3.27, 0, 'tianjinpulin', 'tjpl', '0.00', 30227.1, 1.23, NULL, 76506.1, 24585, NULL),
(675, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 2.53, '002135', 0.053, 116219, '建筑施工', 662014, '东南网架', 67119.5, 2.81, 67.54, 'dongnanwangjia', 'dnwj', '8.45', 52949.6, 0.71, NULL, 894808, 74860, NULL),
(676, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '安徽', 2.67, '002136', -0.099, 62399, '化工原料', 36785.1, '安 纳 达', 21329.8, 4.46, 0, 'an na da', 'a n d', '14.73', 35026, 1.63, NULL, 107128, 21502, NULL),
(677, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '深圳', 1.09, '002137', 0.004, 11554.5, '元器件', 30845.5, '实 益 达', 25532.8, 10.53, 1507.76, 'shi yi da', 's y d', '13.73', 10952.2, 0.24, NULL, 64152.8, 46127, NULL),
(678, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '深圳', 3.05, '002138', 0.16, 130249, '元器件', 116364, '顺络电子', 72678.6, 3.09, 29.49, 'shunluodianzi', 'sldz', '17.92', 84069.4, 1.13, NULL, 312950, 74093.9, NULL),
(679, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '深圳', 3.66, '002139', 0.16, 16682.4, '元器件', 96480.9, '拓邦股份', 16210.5, 3.66, 43.79, 'tuobanggufen', 'tbgf', '20.33', 36286.9, 1.49, NULL, 138585, 24426.2, NULL),
(680, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '安徽', 4.22, '002140', 0.182, 24337.5, '建筑施工', 631059, '东华科技', 43731.8, 3.86, 44.72, 'donghuakeji', 'dhkj', '17.55', 9062.87, 0.2, NULL, 686564, 44603.4, NULL),
(681, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '广东', 1.65, '002141', -0.01, 19893.7, '元器件', 35607.8, '蓉胜超微', 18188.8, 8.78, 0, 'rongshengchaowei', 'rscw', '26.90', 6128.31, 0.34, NULL, 57559.7, 18188.8, NULL),
(682, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 9.75, '002142', 0.911, 334535, '银行', 0, '宁波银行', 344702, 1.26, 6.74, 'ningboyinxing', 'nbyx', '14.76', 1059820, 2.72, NULL, 65731300, 389979, NULL),
(683, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '四川', 1.1, '002143', 0.194, 1681.56, '影视音像', 231005, '印纪传媒', 11550.6, 23.06, 65.48, 'yinjichuanmei', 'yjcm', '24.09', -2168, -0.02, NULL, 238407, 110615, NULL),
(684, '2016-06-05 13:21:13', '2016-06-05 13:21:13', '浙江', 10.24, '002144', 0.671, 25473.4, '纺织', 60377.5, '宏达高科', 12985, 1.7, 12.98, 'hongdagaoke', 'hdgk', '19.84', 68705.6, 3.89, NULL, 213727, 17676.2, NULL),
(685, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '甘肃', 3.87, '002145', 0.045, 136970, '化工原料', 171189, '中核钛白', 21799.1, 2.29, 99.48, 'zhonghetaibai', 'zhtb', '0.00', 109677, 2.38, NULL, 427316, 46030.3, NULL),
(686, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '河北', 3.76, '002146', 0.271, 102077, '全国地产', 7958560, '荣盛发展', 335541, 2.35, 16.27, 'rongshengfazhan', 'rsfz', '6.87', 29712.6, 0.08, NULL, 8391090, 382408, NULL),
(687, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '安徽', 3.13, '002147', -0.069, 59106.5, '机械基件', 45970.5, '方圆支承', 21880.7, 5.72, 0, 'fangyuanzhicheng', 'fyzc', '16.50', 40143.4, 1.55, NULL, 135689, 25852.2, NULL),
(688, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '北京', 3.99, '002148', -0.02, 4379.96, '互联网', 52264.6, '北纬通信', 20280.1, 2.69, 0, 'beiweitongxin', 'bwtx', '17.41', 51014.5, 1.99, NULL, 110252, 25585.3, NULL),
(689, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '陕西', 4.74, '002149', -0.304, 128252, '小金属', 122405, '西部材料', 17463, 2.83, 0, 'xibucailiao', 'xbcl', '30.05', 55943.4, 3.2, NULL, 292227, 17463, NULL),
(690, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '江苏', 2.34, '002150', 0.122, 26171.6, '机械基件', 60361.1, '通润装备', 25020, 3.76, 36.11, 'tongrunzhuangbei', 'trzb', '13.39', 4534.43, 0.18, NULL, 92814, 25020, NULL),
(691, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '北京', 3.85, '002151', -0.12, 39131.1, '通信设备', 101197, '北斗星通', 13525, 14.08, 0, 'beidouxingtong', 'bdxt', '29.92', 71022.1, 2.42, NULL, 181670, 29370.9, NULL),
(692, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '广东', 4.41, '002152', 0.385, 55028.5, '电脑设备', 517329, '广电运通', 86309.8, 5.24, 30.01, 'guangdianyuntong', 'gdyt', '16.70', 18096.7, 0.2, NULL, 610328, 89668.5, NULL),
(693, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '北京', 6.55, '002153', 0.561, 36662.9, '软件服务', 139183, '石基信息', 16305.4, 14.7, 85.78, 'shijixinxi', 'sjxx', '27.52', 0, 0, NULL, 256707, 30912, NULL),
(694, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '浙江', 2.37, '002154', 0.13, 113474, '服饰', 192831, '报 喜 鸟', 106999, 2.29, 42.16, 'bao xi niao', 'b x n', '4.96', 5389.2, 0.05, NULL, 444722, 117202, NULL),
(695, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '湖南', 2.99, '002155', 0.015, 192282, '黄金', 161348, '湖南黄金', 99605.3, 2.61, 268.56, 'hunanhuangjin', 'hnhj', '11.59', 56817.1, 0.5, NULL, 561217, 113186, NULL),
(696, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '江苏', 4.94, '002156', 0.12, 241970, '半导体', 272566, '通富微电', 64986.7, 3.54, 77.73, 'tongfuweidian', 'tfwd', '11.93', 225065, 3.01, NULL, 551668, 74817.7, NULL),
(697, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '江西', 3.33, '002157', 0.011, 312879, '饲料', 302659, '正邦科技', 38622.8, 4.13, 651.32, 'zhengbangkeji', 'zbkj', '21.68', 103768, 1.72, NULL, 798788, 60495.7, NULL),
(698, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '上海', 5.97, '002158', 0.29, 23528, '工程机械', 173811, '汉钟精机', 26387, 2.34, 26.66, 'hanzhongjingji', 'hzjj', '10.37', 96745.9, 3.28, NULL, 216307, 29465.6, NULL),
(699, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '湖北', 6.39, '002159', -0.211, 78432.1, '旅游景点', 48999.1, '三特索道', 11987.5, 3.07, 0, 'santesuodao', 'stsd', '22.44', 54215.9, 3.91, NULL, 216280, 13866.7, NULL),
(700, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '江苏', 3.59, '002160', 0.09, 105531, '铝', 211415, '常铝股份', 32469.6, 2.11, 50.37, 'changlvgufen', 'clgf', '8.47', 158573, 2.49, NULL, 464797, 63624.6, NULL),
(701, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '深圳', 1.97, '002161', 0.006, 25133.8, '通信设备', 68560.8, '远 望 谷', 69591.4, 4.65, 817.44, 'yuan wang gu', 'y w g', '14.57', 32079.2, 0.43, NULL, 167983, 73975.7, NULL),
(702, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '上海', 1.21, '002162', -0.018, 64461.2, '陶瓷', 76024.1, '斯米克', 62700, 6.16, 0, 'simike', 'smk', '6.74', 25491.2, 0.39, NULL, 219339, 65550, NULL),
(703, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '深圳', 1.11, '002163', -0.086, 242719, '装修装饰', 318820, '中航三鑫', 68108.6, 6.88, 0, 'zhonghangsanxin', 'zhsx', '7.56', 58964.5, 0.73, NULL, 714069, 80355, NULL),
(704, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '浙江', 2.39, '002164', -0.011, 65706, '电气设备', 69739.7, '宁波东力', 40512.5, 2.36, 0, 'ningbodongli', 'nbdl', '0.00', 43837.6, 0.98, NULL, 169953, 44562.5, NULL),
(705, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '江苏', 1.91, '002165', 0.11, 67616.9, '化工原料', 94974, '红 宝 丽', 52747.9, 3.17, 26.26, 'hong bao li', 'h b l', '8.85', 5376.27, 0.1, NULL, 178420, 53927.5, NULL),
(706, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '广西', 5.05, '002166', 0.08, 12907.1, '中成药', 135117, '莱茵生物', 10185.9, 5.31, 183.03, 'laiyinshengwu', 'lysw', '11.22', 55319, 3.8, NULL, 185213, 14576, NULL),
(707, '2016-06-05 13:21:14', '2016-06-05 13:21:14', '广东', 2.04, '002167', -0.069, 100163, '小金属', 87142.1, '东方锆业', 47311, 3.34, 0, 'dongfanggaoye', 'dfgy', '9.22', 59816.3, 0.96, NULL, 285742, 62094.6, NULL),
(708, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '深圳', 1.51, '002168', 0.14, 12719.4, '电气设备', 106445, '深圳惠程', 74283.7, 5.21, 27.42, 'shenzhenhuicheng', 'szhc', '13.93', 875.9, 0.01, NULL, 122293, 75710.5, NULL),
(709, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广东', 2.29, '002169', 0.088, 48370.9, '电气设备', 91868.5, '智光电气', 24941.8, 5.8, 75.07, 'zhiguangdianqi', 'zgdq', '21.80', 16056.4, 0.6, NULL, 169493, 26647.2, NULL),
(710, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '深圳', 2.07, '002170', 0.07, 31674.8, '农药化肥', 100445, '芭田股份', 63274.4, 4.02, 58.48, 'batiangufen', 'btgf', '8.54', 34961.2, 0.4, NULL, 344692, 87678, NULL),
(711, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '安徽', 2.8, '002171', 0.093, 55718.3, '铜', 167961, '楚江新材', 32443.6, 4.59, 69.34, 'chujiangxincai', 'cjxc', '15.46', 41033.2, 1.03, NULL, 241626, 39820.3, NULL),
(712, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '江苏', 1.33, '002172', 0.04, 142660, '化纤', 102254, '澳洋科技', 53755, 5.09, 98.59, 'aoyangkeji', 'aykj', '10.94', 65597.2, 0.94, NULL, 267869, 69488.1, NULL),
(713, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '浙江', 2.25, '002173', -0.082, 7425.75, '农业综合', 85509.6, '千足珍珠', 9639.91, 5.62, 0, 'qianzuzhenzhu', 'qzzz', '19.32', 3912.6, 0.19, NULL, 101304, 20500, NULL),
(714, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '福建', 4.06, '002174', 0.789, 74755.8, '互联网', 73153.8, '游族网络', 8800.3, 22.06, 56.72, 'youzuwangluo', 'yzwl', '31.90', -1088.95, -0.04, NULL, 181800, 27571, NULL),
(715, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广西', 3.55, '002175', 0.066, 14415.3, '电器仪表', 63074.1, '东方网络', 19996.4, 7.42, 199.43, 'dongfangwangluo', 'dfwl', '0.00', 47628.7, 2.07, NULL, 133179, 23056.6, NULL),
(716, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '江西', 3.72, '002176', 0.066, 53750.6, '电气设备', 129330, '江特电机', 41512.1, 6.85, 192.24, 'jiangtedianji', 'jtdj', '14.64', 108298, 2.07, NULL, 242158, 52315.8, NULL),
(717, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广东', 2.19, '002177', 0.072, 30474.4, '电脑设备', 128800, '御银股份', 59784.5, 3.34, 50.5, 'yuyingufen', 'yygf', '9.83', 2967.95, 0.04, NULL, 222000, 76119.1, NULL),
(718, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '上海', 1.19, '002178', 0.052, 11952.7, '建筑施工', 103732, '延华智能', 56616.6, 6.65, 76.62, 'yanhuazhineng', 'yhzn', '9.58', 5370.16, 0.08, NULL, 136163, 67090.1, NULL),
(719, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '河南', 5.1, '002179', 0.424, 115438, '元器件', 497754, '中航光电', 57760.7, 6.37, 38.33, 'zhonghangguangdian', 'zhgd', '41.76', 94045.9, 1.56, NULL, 663445, 60251.5, NULL),
(720, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广东', 1.52, '002180', 0.295, 792.08, '电脑设备', 70762.2, '艾派克', 10819.1, 21.75, 56.16, 'aipaike', 'apk', '48.01', -34073.8, -0.81, NULL, 71813.3, 42273.7, NULL),
(721, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广东', 3.75, '002181', 0.03, 75622.8, '出版业', 264462, '粤 传 媒', 114087, 2.16, 136.12, 'yue chuan mei', 'y c m', '8.69', 127699, 1.1, NULL, 497943, 116106, NULL),
(722, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '江苏', 3.12, '002182', 0.052, 112974, '小金属', 147081, '云海金属', 22064.8, 2.6, 77.51, 'yunhaijinshu', 'yhjs', '16.60', 44955.6, 1.56, NULL, 289299, 28800, NULL),
(723, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '深圳', 4.48, '002183', 0.23, 63661.5, '仓储物流', 2250030, '怡 亚 通', 100069, 16.34, 163.84, 'yi ya tong', 'y y t', '14.05', 206150, 1.99, NULL, 2664250, 103758, NULL),
(724, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '上海', 3.48, '002184', 0.133, 23107.4, '软件服务', 141408, '海得控制', 13364.4, 5.52, 72.13, 'haidekongzhi', 'hdkz', '24.22', 25726.8, 1.17, NULL, 174690, 22000, NULL),
(725, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '甘肃', 3.64, '002185', 0.245, 230354, '半导体', 174074, '华天科技', 69674.9, 3.35, 24.84, 'huatiankeji', 'htkj', '14.83', 68916.9, 0.99, NULL, 470661, 69703.5, NULL),
(726, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '北京', 4.26, '002186', 0.222, 60667.4, '酒店餐饮', 82550.4, '全 聚 德', 28076.5, 4.28, 41.08, 'quan ju de', 'q j d', '19.72', 53977.1, 1.75, NULL, 173637, 30846.4, NULL),
(727, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '广东', 7.03, '002187', 0.364, 104995, '百货', 249937, '广百股份', 33572.5, 1.7, 16.48, 'guangbaigufen', 'gbgf', '12.27', 92804.5, 2.71, NULL, 420816, 34242.3, NULL),
(728, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '浙江', 1.87, '002188', -0.06, 8265.65, '元器件', 22898.1, '新 嘉 联', 15001.5, 12.98, 0, 'xin jia lian', 'x j l', '30.05', 11218.5, 0.72, NULL, 32040.3, 15600, NULL),
(729, '2016-06-05 13:21:15', '2016-06-05 13:21:15', '河南', 2.57, '002189', 0.027, 27112.8, '元器件', 56207.1, '利达光电', 19852.6, 5.56, 268.55, 'lidaguangdian', 'ldgd', '28.54', 18514.5, 0.93, NULL, 85476.3, 19924, NULL),
(730, '2016-06-05 13:21:15', '2016-06-05 13:21:16', '四川', 4.72, '002190', 0.074, 108560, '汽车配件', 181454, '成飞集成', 34518.8, 6.55, 208.58, 'chengfeijicheng', 'cfjc', '0.00', 97443.5, 2.82, NULL, 354719, 34518.8, NULL),
(731, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '深圳', 2.87, '002191', 0.299, 132341, '广告包装', 166641, '劲嘉股份', 128400, 6.7, 32.15, 'jingjiagufen', 'jjgf', '0.00', 18421.8, 0.14, NULL, 498220, 131550, NULL),
(732, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '广东', 4.06, '002192', -0.13, 13073, '化工原料', 24487.6, '*ST融捷', 11442.1, 4.97, 0, '*STrongjie', '*STrj', '39.32', 59713.6, 3.45, NULL, 83461.3, 17310.3, NULL),
(733, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '山东', 4.26, '002193', 0.074, 44145.4, '纺织', 122008, '山东如意', 15993.5, 2.61, 75.11, 'shandongruyi', 'sdry', '15.91', 22275.4, 1.39, NULL, 191512, 16000, NULL),
(734, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '湖北', 3.61, '002194', 0.07, 41198.9, '通信设备', 180252, '武汉凡谷', 35095.2, 2.98, 77.23, 'wuhanfangu', 'whfg', '11.29', 70817.8, 1.27, NULL, 238848, 55588, NULL),
(735, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '上海', 4.83, '002195', 0.21, 17763.7, '软件服务', 183996, '二三四五', 26434.1, 4.95, 56.95, 'ersansiwu', 'essw', '12.90', 282132, 3.24, NULL, 449512, 87173.3, NULL),
(736, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '浙江', 4.95, '002196', 0.052, 27273.7, '纺织机械', 71096, '方正电机', 9547.95, 3.45, 165.45, 'fangzhengdianji', 'fzdj', '29.52', 60443, 3.39, NULL, 127276, 17833.1, NULL),
(737, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '深圳', 2.63, '002197', 0.023, 15340, '电器仪表', 165321, '证通电子', 33685.6, 4.8, 271.64, 'zhengtongdianzi', 'ztdz', '19.61', 42096.6, 0.98, NULL, 242493, 42871.6, NULL),
(738, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '广东', 1.76, '002198', 0.063, 18558.4, '中成药', 27144.1, '嘉应制药', 39223.1, 4.59, 64.53, 'jiayingzhiyao', 'jyzy', '9.82', 12340.7, 0.24, NULL, 100924, 50751, NULL),
(739, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '浙江', 2.71, '002199', -0.232, 101051, '元器件', 52137.2, '东晶电子', 14600.8, 5.5, 0, 'dongjingdianzi', 'djdz', '0.00', 51555.8, 2.12, NULL, 176606, 24344.2, NULL),
(740, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '云南', 4.39, '002200', 0.016, 12383, '环境保护', 201830, '云投生态', 10782.9, 2.73, 378.81, 'yuntoushengtai', 'ytst', '18.38', 77234.5, 4.19, NULL, 253250, 18413.3, NULL),
(741, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '江苏', 1.91, '002201', 0.038, 58784.4, '玻璃', 56163.6, '九鼎新材', 21766.6, 4.71, 116.97, 'jiudingxincai', 'jdxc', '12.57', 3404.38, 0.13, NULL, 170204, 25574.4, NULL),
(742, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '新疆', 5.5, '002202', 0.46, 838253, '电气设备', 2719340, '金风科技', 214796, 2.8, 16.91, 'jinfengkeji', 'jfkj', '15.33', 794211, 2.9, NULL, 4846140, 273554, NULL),
(743, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '浙江', 2.15, '002203', 0.16, 90750.8, '铜', 627765, '海亮股份', 146771, 5.91, 39.68, 'hailianggufen', 'hlgf', '6.97', 16607.9, 0.1, NULL, 977631, 167140, NULL),
(744, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '辽宁', 6.73, '002204', 0.021, 355587, '专用机械', 1311510, '大连重工', 96568.5, 1.11, 175.93, 'dalianzhonggong', 'dlzg', '8.20', 333320, 3.45, NULL, 1755330, 96568.5, NULL),
(745, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '新疆', 8.26, '002205', 0.035, 44039.6, '其他建材', 118701, '国统股份', 11615.2, 2.1, 248.9, 'guotonggufen', 'gtgf', '23.00', 52237.5, 4.5, NULL, 173184, 11615.2, NULL),
(746, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '浙江', 4.52, '002206', 0.257, 103421, '化纤', 192963, '海 利 得', 34289, 2.26, 19.84, 'hai li de', 'h l d', '16.01', 104056, 2.31, NULL, 384352, 44977.1, NULL),
(747, '2016-06-05 13:21:16', '2016-06-05 13:21:16', '新疆', 2.41, '002207', -0.053, 23197.6, '石油开采', 40879.4, '准油股份', 17857.3, 5.71, 0, 'zhunyougufen', 'zygf', '0.00', 22058.7, 0.92, NULL, 99308.8, 23917.7, NULL),
(748, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '安徽', 4.5, '002208', -0.06, 6853.43, '区域地产', 674176, '合肥城建', 31684.5, 2.31, 0, 'hefeichengjian', 'hfcj', '19.30', 29001.1, 0.91, NULL, 686158, 32010, NULL),
(749, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '广东', 3.36, '002209', 0.033, 44054.7, '轻工机械', 98313.2, '达 意 隆', 12933.5, 4.05, 206.58, 'da yi long', 'd y l', '0.00', 22323.7, 1.14, NULL, 153897, 19524.4, NULL),
(750, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '深圳', 1.43, '002210', 0.17, 14148.2, '仓储物流', 1575090, '飞马国际', 58167.4, 20.15, 107.6, 'feimaguoji', 'fmgj', '21.20', 1091.15, 0.01, NULL, 1617860, 74791, NULL),
(751, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '江苏', 1.85, '002211', -0.059, 22021.9, '橡胶', 75812.5, '宏达新材', 26630.3, 3.92, 0, 'hongdaxincai', 'hdxc', '13.92', 103788, 2.4, NULL, 119467, 43247.6, NULL),
(752, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '广东', 3.47, '002212', 0.055, 54666.6, '电气设备', 160027, '南洋股份', 30184.2, 3.43, 107.4, 'nanyanggufen', 'nygf', '0.00', 54541.7, 1.07, NULL, 307417, 51026, NULL),
(753, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '深圳', 1.69, '002213', 0.032, 6007.25, '汽车配件', 25344.2, '特 尔 佳', 14403, 6.6, 172.19, 'te er jia', 't e j', '20.44', 77.23, 0, NULL, 43806, 20600, NULL),
(754, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '浙江', 2.05, '002214', 0.041, 9277.44, '电器仪表', 112722, '大立科技', 34585, 10.18, 254.82, 'dalikeji', 'dlkj', '11.61', 19816.6, 0.43, NULL, 128901, 45866.7, NULL),
(755, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '深圳', 1.9, '002215', 0.247, 24678.2, '农药化肥', 145702, '诺 普 信', 68265.2, 5.64, 21.71, 'nuo pu xin', 'n p x', '10.46', 5749.31, 0.06, NULL, 273388, 91497.4, NULL),
(756, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '河南', 2.37, '002216', 0.077, 120248, '食品', 112101, '三全食品', 56011.1, 4, 61.9, 'sanquanshipin', 'sqsp', '8.23', 24573.4, 0.31, NULL, 306740, 80421.8, NULL),
(757, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '山东', 1.76, '002217', 0.092, 134040, '化工原料', 211006, '合力泰', 36859.4, 7.64, 73.63, 'helitai', 'hlt', '16.34', 41133.1, 0.38, NULL, 390574, 107843, NULL),
(758, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '深圳', 4.16, '002218', 0.02, 167020, '半导体', 156403, '拓日新能', 47959.1, 1.72, 183.22, 'tuorixinneng', 'trxn', '8.54', 192376, 3.11, NULL, 398372, 61817.1, NULL),
(759, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '甘肃', 4.92, '002219', 0.13, 92005.6, '中成药', 364116, '恒康医疗', 60372.1, 7.57, 173.88, 'hengkangyiliao', 'hkyl', '0.00', 257105, 3.4, NULL, 590271, 75650.4, NULL),
(760, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '辽宁', 3.92, '002220', 0.166, 54298.1, '食品', 197653, '天宝股份', 38948.1, 1.91, 22.48, 'tianbaogufen', 'tbgf', '10.32', 50410.8, 1.08, NULL, 436118, 46472.7, NULL),
(761, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '江苏', 4.16, '002221', 0.115, 99167, '石油贸易', 717202, '东华能源', 55336.4, 5.05, 91.17, 'donghuanengyuan', 'dhny', '10.13', 176754, 2.55, NULL, 1387590, 69234.6, NULL),
(762, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '福建', 2.16, '002222', 0.108, 33828.4, '元器件', 25924, '福晶科技', 27833.7, 5.33, 53.27, 'fujingkeji', 'fjkj', '13.64', 21001.5, 0.74, NULL, 68038.9, 28500, NULL),
(763, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '江苏', 3.42, '002223', 0.431, 39156.5, '医疗保健', 220691, '鱼跃医疗', 24871.3, 8.53, 33.88, 'yuyueyiliao', 'yyyl', '32.25', 1609.71, 0.03, NULL, 300767, 58476.7, NULL),
(764, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '浙江', 1.94, '002224', 0.15, 32185, '橡胶', 98289.2, '三 力 士', 46644.5, 6.56, 42.37, 'san li shi', 's l s', '18.11', 10463.5, 0.16, NULL, 143551, 65467, NULL),
(765, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '河南', 2.91, '002225', 0.11, 71297.2, '其他建材', 351647, '濮耐股份', 55193.7, 2.37, 31.32, 'punaigufen', 'pngf', '6.22', 96793.5, 1.09, NULL, 508047, 89006.3, NULL),
(766, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '安徽', 3.61, '002226', 0.064, 88952.2, '化工原料', 116607, '江南化工', 79102.1, 2.66, 75.06, 'jiangnanhuagong', 'jnhg', '8.91', 111946, 1.41, NULL, 435858, 79127.9, NULL),
(767, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '深圳', 3.39, '002227', -0.041, 2160.53, '电气设备', 72684.1, '奥 特 迅', 21811.1, 5.28, 0, 'ao te xun', 'a t x', '31.52', 28834.1, 1.31, NULL, 96812.6, 21946.2, NULL),
(768, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '福建', 4.08, '002228', 0.19, 67083.4, '广告包装', 165760, '合兴包装', 34750, 4.14, 47.55, 'hexingbaozhuang', 'hxbz', '5.77', 68337.8, 1.83, NULL, 286414, 37249, NULL),
(769, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '福建', 2.87, '002229', -0.023, 50197.2, '广告包装', 59690.4, '鸿博股份', 20563.6, 4.03, 0, 'hongbogufen', 'hbgf', '28.23', 33434.1, 1.12, NULL, 138028, 29818.6, NULL),
(770, '2016-06-05 13:21:17', '2016-06-05 13:21:17', '安徽', 3.18, '002230', 0.111, 71019.8, '软件服务', 272164, '科大讯飞', 90724.6, 8.18, 116.74, 'kedaxunfei', 'kdxf', '31.01', 165729, 1.29, NULL, 550486, 128545, NULL),
(771, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '辽宁', 1.79, '002231', -0.025, 4667.66, '通信设备', 80048.9, '奥维通信', 21182.5, 6.03, 0, 'aoweitongxin', 'awtx', '14.42', 15218.3, 0.43, NULL, 89775.7, 35680, NULL),
(772, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '吉林', 2.46, '002232', 0.004, 35882.8, '软件服务', 94728.6, '启明信息', 39970.5, 4.11, 1204.63, 'qimingxinxi', 'qmxx', '14.56', 26188.2, 0.64, NULL, 157304, 40854.8, NULL),
(773, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '广东', 4.66, '002233', 0.208, 239921, '水泥', 178856, '塔牌集团', 75965.6, 1.89, 21.26, 'tapaijituan', 'tpjt', '8.28', 107320, 1.2, NULL, 538981, 89465.6, NULL),
(774, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '山东', 3.5, '002234', -0.446, 76396.6, '农业综合', 78837.3, '民和股份', 20639.6, 2.43, 0, 'minhegufen', 'mhgf', '30.80', 86187.9, 2.85, NULL, 199580, 30204.7, NULL),
(775, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '福建', 1.84, '002235', 0.03, 21633.6, '造纸', 27581.5, '安妮股份', 13650.7, 15.81, 479.74, 'annigufen', 'angf', '19.46', 16991, 0.87, NULL, 69576.5, 19500, NULL),
(776, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '浙江', 4.76, '002236', 0.4, 61388.1, '电器仪表', 713514, '大华股份', 66308.9, 7.53, 44.82, 'dahuagufen', 'dhgf', '13.48', 138657, 1.19, NULL, 841097, 116034, NULL),
(777, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '山东', 3.97, '002237', 0.128, 293229, '黄金', 798202, '恒邦股份', 80410, 2.23, 34.5, 'hengbanggufen', 'hbgf', '11.63', 98227, 1.08, NULL, 1157490, 91040, NULL),
(778, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '深圳', 4.72, '002238', 0.272, 87426.1, '影视音像', 146956, '天威视讯', 41652, 5.03, 43.75, 'tianweishixun', 'twsx', '17.31', 41313, 0.8, NULL, 313812, 51446.1, NULL),
(779, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '江苏', 3.43, '002239', 0.13, 65414.2, '服饰', 275707, '奥特佳', 41949.2, 5.34, 115.9, 'aotejia', 'atj', '13.96', 234663, 2.19, NULL, 538759, 107297, NULL),
(780, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '广东', 3.21, '002240', -0.013, 149957, '家居用品', 100669, '威华股份', 36623.1, 3.86, 0, 'weihuagufen', 'whgf', '12.44', 95303.1, 1.94, NULL, 268655, 49070.4, NULL),
(781, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '山东', 5.72, '002241', 0.34, 539573, '元器件', 938915, '歌尔声学', 122526, 4.26, 35.85, 'geershengxue', 'gesx', '28.60', 208406, 1.37, NULL, 1689810, 152643, NULL),
(782, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '山东', 3.85, '002242', 0.416, 77390.7, '家用电器', 328678, '九阳股份', 76095, 4.84, 22.45, 'jiuyanggufen', 'jygf', '18.81', 93234.5, 1.21, NULL, 466141, 76775.5, NULL),
(783, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '深圳', 3.91, '002243', -0.034, 86839.7, '塑料', 64393.4, '通产丽星', 30990.9, 2.15, 0, 'tongchanlixing', 'tclx', '12.41', 75973.9, 2.08, NULL, 184108, 36494.9, NULL),
(784, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '浙江', 3.06, '002244', 0.192, 32850, '区域地产', 3680270, '滨江集团', 229546, 2.19, 17.48, 'binjiangjituan', 'bjjt', '6.78', 56482.3, 0.21, NULL, 3955710, 270400, NULL),
(785, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '江苏', 1.55, '002245', 0.136, 67560.1, '仓储物流', 159955, '澳洋顺昌', 89518.8, 3.75, 21.41, 'aoyangshunchang', 'aysc', '11.20', 5820.21, 0.06, NULL, 250387, 97375.6, NULL),
(786, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '四川', 2.71, '002246', 0.053, 58169.6, '化工原料', 87985.7, '北化股份', 41368.6, 3.2, 80.96, 'beihuagufen', 'bhgf', '0.00', 30404.7, 0.73, NULL, 168255, 41368.6, NULL),
(787, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '浙江', 3.84, '002247', 0.158, 32273.6, '装修装饰', 80838.4, '帝龙新材', 22198.7, 5.39, 65.7, 'dilongxincai', 'dlxc', '13.66', 43409.7, 1.64, NULL, 127464, 26460.7, NULL),
(788, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '山东', 3.36, '002248', -0.16, 85633.6, '机床制造', 110365, '华东数控', 22162.8, 4.97, 0, 'huadongshukong', 'hdsk', '12.10', 73436.7, 2.39, NULL, 238397, 30749.6, NULL),
(789, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '广东', 2.04, '002249', 0.086, 104344, '电气设备', 439121, '大洋电机', 90536.7, 5.63, 66.77, 'dayangdianji', 'dydj', '11.60', 110813, 0.64, NULL, 674872, 172282, NULL),
(790, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '浙江', 4.75, '002250', 0.362, 228154, '化工原料', 217341, '联化科技', 55054.6, 4.06, 26.61, 'lianhuakeji', 'lhkj', '13.80', 89999.6, 1.08, NULL, 600222, 83511.3, NULL),
(791, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '湖南', 6.35, '002251', 0.32, 336609, '超市连锁', 421465, '步 步 高', 57895.2, 2.07, 21.23, 'bu bu gao', 'b b g', '11.94', 298598, 3.83, NULL, 1158110, 77898.5, NULL),
(792, '2016-06-05 13:21:18', '2016-06-05 13:21:18', '上海', 7.23, '002252', 0.61, 98427.3, '生物制药', 407767, '上海莱士', 98856.5, 10.7, 64.14, 'shanghailaishi', 'shls', '37.30', 691819, 5.02, NULL, 1078710, 137813, NULL),
(793, '2016-06-05 13:21:18', '2016-06-05 13:21:19', '四川', 5.9, '002253', 0.094, 35921, '软件服务', 42073.6, '川大智胜', 12683.4, 4.21, 131.72, 'chuandazhisheng', 'cdzs', '38.13', 44312.1, 3.18, NULL, 106035, 13924.5, NULL),
(794, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '山东', 3.16, '002254', 0.091, 115485, '化纤', 123476, '泰和新材', 61059.1, 3.74, 64.69, 'taihexincai', 'thxc', '14.30', 33318.4, 0.55, NULL, 253641, 61083.4, NULL),
(795, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '江苏', 3.08, '002255', 0.101, 52359, '专用机械', 210783, '海陆重工', 40468.4, 2.4, 36.72, 'hailuzhonggong', 'hlzg', '7.92', 34500.2, 0.67, NULL, 304078, 51640, NULL),
(796, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '深圳', 1.81, '002256', 0.106, 19459.9, '染料涂料', 61307.6, '彩虹精化', 31426.3, 7.62, 65.26, 'caihongjinghua', 'chjh', '19.78', 8224.07, 0.26, NULL, 134006, 31524.3, NULL),
(797, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '四川', 6.17, '002258', 0.437, 93762, '农药化肥', 79229.6, '利尔化学', 20244.2, 2.69, 19, 'lierhuaxue', 'lehx', '9.18', 42536.8, 2.1, NULL, 222975, 20244.4, NULL),
(798, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '四川', 1.32, '002259', 0.012, 49745.5, '家居用品', 122424, '升达林业', 60529.7, 5.36, 306.62, 'shengdalinye', 'sdly', '7.17', 8810.17, 0.14, NULL, 191570, 64332, NULL),
(799, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '广东', 1.25, '002260', -0.073, 10768.2, '航空', 37857.3, '德奥通航', 26520, 13.78, 0, 'deaotonghang', 'dath', '25.69', 982.96, 0.04, NULL, 71028.5, 26520, NULL),
(800, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '湖南', 3.78, '002261', 0.277, 9350.98, '互联网', 87067.9, '拓维信息', 22076.2, 5.48, 37.29, 'tuoweixinxi', 'twxx', '14.10', 77047.3, 1.74, NULL, 209601, 44327, NULL),
(801, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '江苏', 3.51, '002262', 0.302, 24935.7, '化学制药', 188632, '恩华药业', 39586, 6.8, 39.53, 'enhuayaoye', 'ehyy', '26.09', 53473.4, 1.1, NULL, 266182, 48516.7, NULL),
(802, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '浙江', 3.23, '002263', 0.005, 141674, '塑料', 125819, '大 东 南', 84536.9, 2.18, 701.03, 'da dong nan', 'd d n', '8.83', 187269, 1.99, NULL, 433518, 93918, NULL),
(803, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '福建', 1.94, '002264', -0.044, 39610.5, '超市连锁', 154353, '新 华 都', 53571.4, 2.98, 0, 'xin hua dou', 'x h d', '9.71', 32267.1, 0.6, NULL, 350782, 54150.2, NULL),
(804, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '云南', 1.73, '002265', -0.036, 21686.2, '汽车配件', 51111.5, '西仪股份', 29102.6, 7.35, 0, 'xiyigufen', 'xygf', '14.02', 14283.3, 0.49, NULL, 79396.1, 29102.6, NULL),
(805, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '浙江', 1.45, '002266', 0.014, 51684.3, '电气设备', 182139, '浙富控股', 142535, 5.36, 267.41, 'zhefukonggu', 'zfkg', '0.00', 13237.1, 0.07, NULL, 536286, 197872, NULL),
(806, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '陕西', 4.25, '002267', 0.33, 651600, '供气供热', 153036, '陕天然气', 101684, 2.84, 18.32, 'shantianranqi', 'strq', '10.45', 128990, 1.16, NULL, 936656, 111208, NULL),
(807, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '四川', 2.81, '002268', -0.015, 27217.7, '软件服务', 145506, '卫 士 通', 34439.6, 11.91, 0, 'wei shi tong', 'w s t', '33.96', 29595.9, 0.68, NULL, 178388, 43252.3, NULL),
(808, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '上海', 1.36, '002269', -0.038, 183507, '服饰', 303742, '美邦服饰', 251250, 4.17, 0, 'meibangfushi', 'mbfs', '4.79', 20872.3, 0.08, NULL, 628351, 252600, NULL),
(809, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '山东', 3.09, '002270', 0.012, 27709.9, '机床制造', 36557.8, '法因数控', 13948.9, 3.39, 430.73, 'fayinshukong', 'fysk', '15.89', 21767.7, 1.15, NULL, 72879.7, 18915, NULL),
(810, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '北京', 4.38, '002271', 0.35, 92405.4, '其他建材', 359555, '东方雨虹', 56348.8, 3.95, 25.35, 'dongfangyuhong', 'dfyh', '15.69', 140590, 1.69, NULL, 540336, 83247.1, NULL),
(811, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '四川', 2.92, '002272', 0.011, 52319.2, '机械基件', 116533, '川润股份', 31256.2, 3.84, 493.9, 'chuanrungufen', 'crgf', '0.00', 63770.7, 1.52, NULL, 183482, 41970, NULL),
(812, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '浙江', 3.25, '002273', 0.19, 63613.4, '元器件', 76679, '水晶光电', 35698.9, 6.08, 51.98, 'shuijingguangdian', 'sjgd', '26.30', 44326.4, 1.02, NULL, 197073, 43661.2, NULL),
(813, '2016-06-05 13:21:19', '2016-06-05 13:21:19', '江苏', 4.35, '002274', 0.006, 342172, '农药化肥', 211203, '华昌化工', 49063.3, 1.69, 635.86, 'huachanghuagong', 'hchg', '10.50', 78800, 1.24, NULL, 704259, 63491, NULL),
(814, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '广西', 3.7, '002275', 0.37, 32944.4, '中成药', 140798, '桂林三金', 53114.5, 5.2, 26.02, 'guilinsanjin', 'glsj', '19.52', 67881.8, 1.15, NULL, 253586, 59020, NULL),
(815, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '浙江', 2.96, '002276', 0.115, 64500.2, '电气设备', 338816, '万马股份', 83702.8, 5.02, 64.53, 'wanmagufen', 'wmgf', '19.77', 78818.8, 0.84, NULL, 449689, 93932.5, NULL),
(816, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '湖南', 5.6, '002277', 0.442, 100978, '百货', 374230, '友阿股份', 56612.3, 2, 12.65, 'youagufen', 'yagf', '11.61', 66670.2, 1.18, NULL, 900041, 56612.3, NULL),
(817, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '上海', 3.28, '002278', 0.1, 17517.3, '化工机械', 126066, '神开股份', 25537.1, 4.9, 80.44, 'shenkaigufen', 'skgf', '0.00', 48002.6, 1.32, NULL, 180341, 36391, NULL),
(818, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '北京', 6.31, '002279', 0.037, 14246.1, '软件服务', 45767.5, '久其软件', 8969.28, 4.35, 373.69, 'jiuqiruanjian', 'jqrj', '22.50', 76466.6, 3.87, NULL, 130175, 19781.1, NULL),
(819, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '浙江', 1.32, '002280', 0.199, 230.53, '软件服务', 89035.2, '联络互动', 11024.3, 16.78, 55.56, 'lianluohudong', 'llhd', '0.00', -13719.4, -0.2, NULL, 115168, 70249.8, NULL),
(820, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '湖北', 11.99, '002281', 0.546, 59418.7, '通信设备', 323935, '光迅科技', 16283, 2.71, 29.78, 'guangxunkeji', 'gxkj', '60.25', 147959, 7.05, NULL, 391361, 20989, NULL),
(821, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '河北', 2.34, '002282', 0.047, 26730.3, '轻工机械', 57008.1, '博深工具', 18638.8, 3.47, 86.82, 'boshengongju', 'bsgj', '12.74', 30876.9, 0.91, NULL, 103369, 33813, NULL),
(822, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '山东', 5.83, '002283', 0.146, 201838, '汽车配件', 172020, '天润曲轴', 55941.2, 1.8, 35.87, 'tianrunquzhou', 'trqz', '0.00', 182731, 3.27, NULL, 490541, 55941.2, NULL),
(823, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '浙江', 3.45, '002284', 0.14, 87227.8, '汽车配件', 258847, '亚太股份', 52249.6, 2.51, 30.81, 'yataigufen', 'ytgf', '20.74', 113704, 1.54, NULL, 419630, 73755.6, NULL),
(824, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '深圳', 2.26, '002285', 0.13, 20560.8, '房产服务', 515990, '世联行', 122164, 5.24, 52.48, 'shilianxing', 'slx', '7.73', 97323.6, 0.67, NULL, 603237, 144570, NULL),
(825, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '山东', 3.97, '002286', 0.079, 64853, '食品', 75710.1, '保龄宝', 26578.5, 3.65, 92.15, 'baolingbao', 'blb', '15.18', 79962.2, 2.17, NULL, 193426, 36925.6, NULL),
(826, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '西藏', 3.69, '002287', 0.375, 24854, '中成药', 132614, '奇正藏药', 40600, 7, 34.46, 'qizhengzangyao', 'qzzy', '36.98', 41102.2, 1.01, NULL, 177111, 40600, NULL),
(827, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '广东', 1.89, '002288', 0.024, 56162.1, '元器件', 146179, '超华科技', 66018.8, 3.28, 128.59, 'chaohuakeji', 'chkj', '10.06', 56576.8, 0.61, NULL, 234159, 93164.4, NULL),
(828, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '深圳', 8.78, '002289', -0.139, 51829.7, '元器件', 275085, '宇顺电子', 12558.5, 5.12, 0, 'yushundianzi', 'ysdz', '0.00', 179870, 9.63, NULL, 418714, 18683.6, NULL),
(829, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '江苏', 3.94, '002290', 0.106, 19626.3, '家用电器', 92247.8, '禾盛新材', 13638.9, 4, 74.47, 'heshengxincai', 'hsxc', '26.76', 44511, 2.11, NULL, 134512, 21067.2, NULL),
(830, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '广东', 5.11, '002291', 0.07, 13978.5, '服饰', 286553, '星期六', 36335, 1.48, 55.65, 'xingqiliu', 'xql', '0.00', 98302.9, 2.46, NULL, 329522, 39892.2, NULL),
(831, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '广东', 2.18, '002292', 0.202, 26157.5, '影视音像', 221491, '奥飞动漫', 64768.2, 11.4, 61.49, 'aofeidongman', 'afdm', '31.62', 23683.6, 0.19, NULL, 438533, 126388, NULL),
(832, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '江苏', 3.32, '002293', 0.262, 39569.3, '服饰', 216403, '罗莱家纺', 69986.4, 4.32, 27.38, 'luolaijiafang', 'lljf', '12.91', 34558, 0.49, NULL, 298616, 70181.5, NULL),
(833, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '深圳', 3.77, '002294', 0.592, 81884.6, '化学制药', 241006, '信立泰', 45918, 6.93, 22.06, 'xinlitai', 'xlt', '26.74', 18193.8, 0.17, NULL, 454212, 104602, NULL),
(834, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '广东', 4.22, '002295', 0.011, 25203.8, '铜', 93086.6, '精艺股份', 18216.7, 3.99, 733.74, 'jingyigufen', 'jygf', '15.86', 59014.9, 2.37, NULL, 128343, 24860, NULL),
(835, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '河南', 3.74, '002296', 0.082, 7907.17, '通信设备', 162371, '辉煌科技', 28780.3, 3.43, 77.89, 'huihuangkeji', 'hhkj', '16.88', 63554.6, 1.69, NULL, 201403, 37665.6, NULL),
(836, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '湖南', 2.77, '002297', -0.073, 44081.9, '矿物制品', 86436.8, '博云新材', 36420.6, 3.45, 0, 'boyunxincai', 'byxc', '12.58', 64570.8, 1.62, NULL, 175499, 39882.1, NULL),
(837, '2016-06-05 13:21:20', '2016-06-05 13:21:20', '安徽', 3.2, '002298', 0.02, 39813.9, '电气设备', 160575, '鑫龙电器', 35476.4, 3.31, 368.68, 'xinlongdianqi', 'xldq', '15.67', 56743.9, 0.9, NULL, 226011, 63291.9, NULL),
(838, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '福建', 4.74, '002299', -0.36, 663010, '农业综合', 277151, '圣农发展', 89981.5, 3.1, 0, 'shengnongfazhan', 'snfz', '25.20', 395572, 3.56, NULL, 1094530, 111090, NULL),
(839, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '福建', 2.9, '002300', 0.2, 95513.1, '电气设备', 184449, '太阳电缆', 45221.1, 2.81, 20.4, 'taiyangdianlan', 'tydl', '9.34', 34801.4, 0.77, NULL, 329876, 45225, NULL),
(840, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '深圳', 2.95, '002301', -0.053, 63998.5, '文教休闲', 102832, '齐心集团', 34613.8, 8.78, 0, 'qixinjituan', 'qxjt', '18.46', 38000.6, 1.01, NULL, 217346, 37614.4, NULL),
(841, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '新疆', 7.2, '002302', 0.098, 245958, '水泥', 838948, '西部建设', 27091.3, 1.93, 70.67, 'xibujianshe', 'xbjs', '7.25', 156875, 3.04, NULL, 1129050, 51611.7, NULL),
(842, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '深圳', 1.64, '002303', 0.101, 74555.2, '造纸', 170598, '美盈森', 75523.2, 7.14, 57.65, 'meiyingsen', 'mys', '10.85', 51679.8, 0.36, NULL, 317343, 143040, NULL),
(843, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '江苏', 13.77, '002304', 2.113, 648615, '白酒', 1738350, '洋河股份', 122825, 4.24, 13.81, 'yanghegufen', 'yhgf', '73.00', 74174.5, 0.49, NULL, 3046270, 150699, NULL),
(844, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '湖北', 1.91, '002305', -0.082, 3138.5, '区域地产', 1244190, '南国置业', 109479, 2.45, 0, 'nanguozhiye', 'ngzy', '5.52', 1710.74, 0.01, NULL, 1346530, 145506, NULL),
(845, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '北京', -0.24, '002306', -0.13, 33580.1, '酒店餐饮', 39169.5, '*ST云网', 61251.7, -37.97, 0, '*STyunwang', '*STyw', '0.00', 21995, 0.27, NULL, 88608.5, 80000, NULL),
(846, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '新疆', 2.31, '002307', 0.027, 64139.8, '建筑施工', 747506, '北新路桥', 55729.6, 4.08, 174.82, 'beixinluqiao', 'bxlq', '7.80', 33442.9, 0.6, NULL, 1088290, 55732.7, NULL),
(847, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '广东', 2.47, '002308', 0.022, 48144.3, '电脑设备', 131145, '威创股份', 83551, 12.52, 720.21, 'weichuanggufen', 'wcgf', '16.16', 57872.6, 0.69, NULL, 237833, 83559.1, NULL),
(848, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '江苏', 6.98, '002309', -0.362, 298582, '电气设备', 1182310, '中利科技', 36028.3, 1.87, 0, 'zhonglikeji', 'zlkj', '17.01', 229837, 4.04, NULL, 1647130, 56829.2, NULL),
(849, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '北京', 5.74, '002310', 0.156, 4011.4, '建筑施工', 1275020, '东方园林', 55499.1, 6.67, 122.82, 'dongfangyuanlin', 'dfyl', '23.53', 171243, 1.7, NULL, 1352130, 100871, NULL),
(850, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '广东', 3, '002311', 0.187, 259838, '饲料', 481410, '海大集团', 60504.4, 3.99, 32.01, 'haidajituan', 'hdjt', '16.75', 141407, 0.92, NULL, 896704, 153736, NULL),
(851, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '四川', 1.96, '002312', -0.119, 77152.1, '电脑设备', 171932, '三泰控股', 54175.1, 7.43, 0, 'santaikonggu', 'stkg', '18.68', 48277.5, 0.62, NULL, 287878, 77302.7, NULL),
(852, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '深圳', 6.09, '002313', -0.097, 46367.2, '通信设备', 362081, '日海通讯', 31200, 2.43, 0, 'rihaitongxun', 'rhtx', '14.53', 114810, 3.68, NULL, 448117, 31200, NULL),
(853, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '深圳', 2.4, '002314', -0.07, 107848, '其他建材', 926547, '雅致股份', 57984.1, 3.34, 0, 'yazhigufen', 'yzgf', '0.00', 198180, 1.06, NULL, 1081540, 187753, NULL),
(854, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '江苏', 16.73, '002315', 0.93, 2797.08, '互联网', 185990, '焦点科技', 6032.74, 3.46, 31.13, 'jiaodiankeji', 'jdkj', '64.45', 115547, 9.83, NULL, 233064, 11750, NULL),
(855, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '深圳', 2.15, '002316', 0.043, 10159.3, '软件服务', 151625, '键桥通讯', 31461.7, 5.11, 127.27, 'jianqiaotongxun', 'jqtx', '0.00', 24038.6, 0.61, NULL, 204330, 39312, NULL),
(856, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '广东', 2.65, '002317', 0.202, 54129.8, '中成药', 120964, '众生药业', 47404.6, 4.3, 28.26, 'zhongshengyaoye', 'zsyy', '11.15', 82542.1, 1.12, NULL, 322728, 73861.2, NULL),
(857, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '浙江', 7.17, '002318', 0.219, 134575, '特种钢', 194763, '久立特材', 32366.8, 3.71, 60.77, 'jiulitecai', 'jltc', '9.72', 117534, 3.49, NULL, 379064, 33660.2, NULL),
(858, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '广东', 2.8, '002319', 0.011, 49365.6, '染料涂料', 44783.3, '乐通股份', 19994.6, 3.95, 496.5, 'letonggufen', 'ltgf', '0.00', 19110.3, 0.96, NULL, 108092, 20000, NULL),
(859, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '海南', 4.82, '002320', 0.237, 132481, '水运', 60957.3, '海峡股份', 42587.6, 5.69, 57.87, 'haixiagufen', 'hxgf', '14.00', 101585, 2.39, NULL, 229533, 42588, NULL),
(860, '2016-06-05 13:21:21', '2016-06-05 13:21:21', '河南', 3.48, '002321', 0.049, 132257, '农业综合', 257045, '华英农业', 42345.9, 1.98, 69.87, 'huayingnongye', 'hyny', '10.06', 88509, 2.08, NULL, 454008, 42580, NULL),
(861, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '浙江', 4.18, '002322', 0.01, 18529.7, '电气设备', 95577.6, '理工监测', 26215.1, 2.92, 608.86, 'ligongjiance', 'lgjc', '16.83', 46500.1, 1.67, NULL, 123759, 27804, NULL),
(862, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '江苏', 7.98, '002323', 0.05, 23549.9, '电气设备', 65848.1, '雅百特', 8350.16, 2.95, 563.01, 'yabaite', 'ybt', '13.03', 55957.8, 2.25, NULL, 96808, 24857.7, NULL),
(863, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '上海', 6.43, '002324', 0.584, 70066.8, '塑料', 175866, '普利特', 15644.2, 2.61, 14.38, 'pulite', 'plt', '0.00', 57770.1, 2.14, NULL, 291001, 27000, NULL),
(864, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '深圳', 3.02, '002325', 0.152, 24986, '装修装饰', 571717, '洪涛股份', 63781.6, 8.24, 81.77, 'hongtaogufen', 'htgf', '8.48', 114226, 1.14, NULL, 631330, 100154, NULL),
(865, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '浙江', 2.24, '002326', 0.139, 78960.1, '化工原料', 178887, '永太科技', 41879.1, 5.33, 43.12, 'yongtaikeji', 'ytkj', '18.07', 57006.3, 0.71, NULL, 357946, 79870.3, NULL),
(866, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '深圳', 2.68, '002327', 0.212, 50701.5, '服饰', 174434, '富安娜', 45157.7, 3.5, 22.08, 'fuanna', 'fan', '8.17', 10046.4, 0.12, NULL, 282190, 86112.2, NULL),
(867, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '上海', 4.95, '002328', 0.12, 126550, '专用机械', 222819, '新朋股份', 32755.6, 1.52, 31.31, 'xinpenggufen', 'xpgf', '9.37', 121775, 2.71, NULL, 393249, 45000, NULL),
(868, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '广西', 5.48, '002329', 0.194, 50892.6, '乳制品', 92192.3, '皇氏集团', 14499, 4.43, 62.45, 'huangshijituan', 'hsjt', '14.41', 101660, 3.49, NULL, 235660, 29137.5, NULL),
(869, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '山东', 2.61, '002330', 0.049, 82946.4, '食品', 58900.2, '得利斯', 43714, 3.34, 89.1, 'delisi', 'dls', '10.65', 48325.9, 0.96, NULL, 160945, 50200, NULL),
(870, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '安徽', 4.05, '002331', 0.08, 12078, '软件服务', 130106, '皖通科技', 19319.3, 3.27, 82.65, 'wantongkeji', 'wtkj', '0.00', 60215.5, 2.06, NULL, 162629, 29193.9, NULL),
(871, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '浙江', 2.35, '002332', 0.083, 96584, '生物制药', 144919, '仙琚制药', 46760.4, 4.5, 63.96, 'xianjuzhiyao', 'xjzy', '10.50', 41155.1, 0.8, NULL, 282367, 51210, NULL),
(872, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '江苏', 5.42, '002333', 0.389, 67460.8, '铝', 53194.8, '罗普斯金', 24248.5, 2.6, 18.12, 'luopusijin', 'lpsj', '10.13', 70568.8, 2.81, NULL, 163181, 25130.2, NULL),
(873, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '深圳', 2.05, '002334', 0.087, 9403.16, '电气设备', 133127, '英威腾', 51075.3, 3.53, 41.77, 'yingweiteng', 'ywt', '8.39', 17711.8, 0.25, NULL, 183223, 71579, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(874, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '福建', 5.06, '002335', 0.073, 29424.3, '电气设备', 148286, '科华恒盛', 18292.9, 3.47, 119.72, 'kehuahengsheng', 'khhs', '43.40', 42288.7, 1.88, NULL, 226299, 22439.6, NULL),
(875, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '深圳', 6.92, '002336', 0.113, 93126, '超市连锁', 422630, '人人乐', 40000, 1.5, 45.88, 'renrenle', 'rrl', '10.24', 247590, 6.19, NULL, 647853, 40000, NULL),
(876, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '天津', 2.14, '002337', -0.04, 24499.8, '化工机械', 110972, '赛象科技', 56479.4, 3.18, 0, 'saixiangkeji', 'sxkj', '7.71', 43721.4, 0.74, NULL, 171840, 59428.3, NULL),
(877, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '吉林', 6.19, '002338', 0.263, 20887.6, '电器仪表', 69955.5, '奥普光电', 11818.6, 6.2, 72.93, 'aopuguangdian', 'apgd', '51.72', 36559.2, 3.05, NULL, 96651.4, 12000, NULL),
(878, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '山东', 3.56, '002339', 0.052, 20757.3, '电气设备', 148088, '积成电子', 29629, 4.12, 142.4, 'jichengdianzi', 'jcdz', '16.31', 45904.3, 1.21, NULL, 199468, 37889.6, NULL),
(879, '2016-06-05 13:21:22', '2016-06-05 13:21:22', '深圳', 3.63, '002340', 0.11, 279215, '小金属', 540779, '格林美', 116860, 2.7, 44.58, 'gelinmei', 'glm', '7.33', 238847, 1.99, NULL, 1270830, 120099, NULL),
(880, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '深圳', 4.2, '002341', 0.061, 59231.4, '化工原料', 156583, '新纶科技', 25643.1, 2.25, 76.86, 'xinlunkeji', 'xlkj', '19.28', 78432, 2.1, NULL, 359205, 37344, NULL),
(881, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '河北', 2.51, '002342', 0.031, 144990, '机械基件', 201483, '巨力索具', 82628.1, 2.24, 89.27, 'julisuoju', 'jlsj', '5.82', 67330.1, 0.7, NULL, 402197, 96000, NULL),
(882, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '浙江', 6.31, '002343', 0.249, 55457.6, '塑料', 117633, '禾欣股份', 15275, 6.54, 82.78, 'hexingufen', 'hxgf', '46.91', 63895.4, 3.23, NULL, 183748, 19812, NULL),
(883, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '浙江', 4.42, '002344', 0.458, 61448.2, '商品城', 369463, '海宁皮城', 110292, 3.06, 14.76, 'hainingpicheng', 'hnpc', '9.70', 44090.7, 0.39, NULL, 948213, 112000, NULL),
(884, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '广东', 2.91, '002345', 0.167, 26538, '服饰', 278094, '潮宏基', 83212, 6.73, 58.69, 'chaohongji', 'chj', '10.15', 90478.4, 1.07, NULL, 437119, 84511.1, NULL),
(885, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '上海', 3.47, '002346', 0.219, 15342.1, '水泥', 94144.7, '柘中股份', 7000, 3.94, 31.17, 'zhezhonggufen', 'zzgf', '17.29', 44081.5, 1, NULL, 200741, 44157.5, NULL),
(886, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '安徽', 5.37, '002347', 0.036, 35895.8, '机械基件', 113560, '泰尔重工', 14510.2, 4.1, 306.48, 'taierzhonggong', 'tezg', '0.00', 74526.9, 3.32, NULL, 173773, 22467.5, NULL),
(887, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '广东', 2.51, '002348', 0.064, 9935.21, '文教休闲', 65687, '高乐股份', 37057.8, 6.23, 122.83, 'gaolegufen', 'glgf', '6.73', 43614.6, 0.92, NULL, 121659, 47360, NULL),
(888, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '江苏', 5.34, '002349', 0.121, 41602.9, '中成药', 104999, '精华制药', 19766.7, 3.86, 85.29, 'jinghuazhiyao', 'jhzy', '0.00', 89729.3, 3.45, NULL, 178454, 26000, NULL),
(889, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '北京', 4.85, '002350', 0.057, 23375.7, '电气设备', 116418, '北京科锐', 21821.6, 3.07, 131.52, 'beijingkerui', 'bjkr', '17.15', 49238.2, 2.26, NULL, 166935, 21828, NULL),
(890, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '深圳', 5.66, '002351', 0.182, 21755.3, '电脑设备', 142848, '漫步者', 13387, 2.79, 43.37, 'manbuzhe', 'mbz', '20.89', 101187, 3.44, NULL, 177786, 29400, NULL),
(891, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '安徽', 6.27, '002352', 0.119, 22460.3, '钢加工', 60341.5, '鼎泰新材', 6107.72, 2.82, 74.53, 'dingtaixincai', 'dtxc', '20.19', 57999.6, 4.97, NULL, 90076.4, 11674.6, NULL),
(892, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '山东', 8.1, '002353', 0.106, 146363, '化工机械', 899114, '杰瑞股份', 66440.3, 5.47, 209.8, 'jieruigufen', 'jrgf', '19.34', 376731, 3.93, NULL, 1155530, 95785.4, NULL),
(893, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '辽宁', 3.5, '002354', 0.64, 861.46, '互联网', 46664.6, '天神娱乐', 6051.97, 18.67, 51.07, 'tianshenyule', 'tsyl', '0.00', -21396.6, -0.96, NULL, 136117, 22292.9, NULL),
(894, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '山东', 3.82, '002355', 0.029, 74103.8, '汽车配件', 175625, '兴民钢圈', 34260.8, 1.9, 124.76, 'xingmingangquan', 'xmgq', '0.00', 98372.4, 1.91, NULL, 302930, 51370, NULL),
(895, '2016-06-05 13:21:23', '2016-06-05 13:21:23', '深圳', 4.84, '002356', 0.186, 15365.8, '电器仪表', 178752, '浩宁达', 24000, 3.3, 43.08, 'haoningda', 'hnd', '23.68', 98513, 3.17, NULL, 254674, 31047.4, NULL),
(896, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '四川', 4.11, '002357', 0.369, 42572.9, '公路', 59268.3, '富临运业', 19573.9, 3.71, 20.68, 'fulinyunye', 'flyy', '14.25', 17218.4, 0.88, NULL, 139551, 19593.1, NULL),
(897, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '河南', 2.62, '002358', 0.118, 56892.3, '电气设备', 298928, '森源电气', 66811.2, 7.21, 80.03, 'senyuandianqi', 'sydq', '16.84', 42424.1, 0.53, NULL, 420578, 79559.5, NULL),
(898, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '山东', 2.23, '002359', 0.002, 47291.1, '钢加工', 79680.8, '齐星铁塔', 33593.9, 6.99, 3446.45, 'qixingtieta', 'qxtt', '25.10', 45576.3, 1.09, NULL, 138569, 41680, NULL),
(899, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '山西', 2.4, '002360', 0.114, 26543.7, '化工原料', 59705, '同德化工', 24508.6, 3.01, 31.65, 'tongdehuagong', 'tdhg', '11.97', 6320.66, 0.16, NULL, 133812, 39151.3, NULL),
(900, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '河南', 4.66, '000885', 0.133, 307279, '水泥', 74905.6, '同力水泥', 42679.9, 2.79, 48.82, 'tonglishuini', 'tlsn', '14.91', 119850, 2.52, NULL, 474024, 47479.9, NULL),
(901, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '海南', 2.82, '000886', 0.046, 14857.7, '路桥', 219608, '海南高速', 96462, 1.56, 47.39, 'hainangaosu', 'hngs', '6.04', 94393, 0.95, NULL, 324566, 98882.8, NULL),
(902, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '安徽', 2.91, '000887', 0.347, 142662, '橡胶', 377384, '中鼎股份', 111378, 8.5, 35.7, 'zhongdinggufen', 'zdgf', '21.52', 36183.1, 0.32, NULL, 667390, 111549, NULL),
(903, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '四川', 3.36, '000888', 0.104, 115720, '旅游景点', 60713.2, '峨眉山Ａ', 52681.9, 2.8, 45.2, 'emeishanＡ', 'emsＡ', '12.06', 42714.4, 0.81, NULL, 214282, 52691.3, NULL),
(904, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '河北', 3.54, '000889', 0.147, 65517.6, '批发业', 117230, '茂业物流', 33852.7, 2.5, 30.08, 'maoyewuliu', 'mywl', '10.65', 110595, 1.78, NULL, 298043, 62182.7, NULL),
(905, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '江苏', 2.75, '000890', 0.008, 63818.4, '钢加工', 192578, '法 尔 胜', 37955.7, 4.29, 759.67, 'fa er sheng', 'f e s', '10.82', 47292.5, 1.25, NULL, 310645, 37964.2, NULL),
(906, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '重庆', 0, '000892', -0.004, 0, '通信设备', 134.58, '*ST星美', 30693.8, 3625.95, 0, '*STxingmei', '*STxm', '13.95', 8873.73, 0.21, NULL, 134.58, 41387.7, NULL),
(907, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '广东', 1.23, '000893', -0.082, 115898, '食品', 620511, '东凌粮油', 39261.1, 8.71, 0, 'donglingliangyou', 'dlly', '0.00', 47740.9, 1.17, NULL, 754536, 40945.5, NULL),
(908, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '河南', 4.38, '000895', 0.601, 1086860, '食品', 760133, '双汇发展', 181743, 4.35, 15.87, 'shuanghuifazhan', 'shfz', '21.99', 166807, 0.51, NULL, 2120030, 330087, NULL),
(909, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '天津', 0.84, '000897', -0.046, 869.67, '区域地产', 608822, '津滨发展', 161711, 5.25, 0, 'jinbinfazhan', 'jbfz', '4.00', 30206.5, 0.19, NULL, 649956, 161727, NULL),
(910, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '辽宁', 6.64, '000898', 0.021, 4604500, '普钢', 2605300, '鞍钢股份', 614893, 0.87, 134.19, 'anganggufen', 'aggf', '3.86', 3151900, 4.36, NULL, 9099800, 723481, NULL),
(911, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '江西', 3.59, '000899', 0.413, 391365, '火力发电', 69896.5, '赣能股份', 55518.3, 2.37, 10.31, 'gannenggufen', 'gngf', '8.77', 61224.9, 0.95, NULL, 576176, 64667.8, NULL),
(912, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '湖南', 6.63, '000900', 0.236, 292289, '路桥', 440358, '现代投资', 101125, 1.12, 15.67, 'xiandaitouzi', 'xdtz', '6.81', 97130.9, 0.96, NULL, 1835270, 101189, NULL),
(913, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '黑龙江', 4.16, '000901', 0.048, 19758.9, '航空', 150230, '航天科技', 32362.4, 12.7, 547.13, 'hangtiankeji', 'htkj', '36.05', 64166.8, 1.98, NULL, 211606, 32362.4, NULL),
(914, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '湖北', 6.35, '000902', 0.65, 184040, '农药化肥', 374189, '新洋丰', 25800, 3.06, 15.77, 'xinyangfeng', 'xyf', '11.73', 114046, 1.75, NULL, 614163, 65048.5, NULL),
(915, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '云南', 4.54, '000903', 0.121, 179542, '机械基件', 410162, '云内动力', 68076, 1.42, 26.79, 'yunneidongli', 'yndl', '6.99', 184136, 2.3, NULL, 678844, 79901.4, NULL),
(916, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '福建', 4.91, '000905', 0.172, 80398.2, '港口', 262504, '厦门港务', 53100, 1.83, 26.17, 'shamengangwu', 'smgw', '9.84', 26087.8, 0.49, NULL, 527955, 53100, NULL),
(917, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '湖南', 3.4, '000906', 0.17, 56525.3, '批发业', 526769, '物产中拓', 33060.6, 3.16, 37.27, 'wuchanzhongtuo', 'wczt', '11.82', 48312.1, 1.23, NULL, 623670, 39293.3, NULL),
(918, '2016-06-05 13:21:24', '2016-06-05 13:21:24', '湖南', 2.45, '000908', 0.136, 31574.2, '化学制药', 172443, '景峰医药', 24678.2, 5.39, 48.49, 'jingfengyiyao', 'jfyy', '12.24', 102441, 1.28, NULL, 304894, 79979.5, NULL),
(919, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '浙江', 2.61, '000909', 0.067, 2507.34, '综合类', 469092, '数源科技', 29400, 3.37, 65.13, 'shuyuankeji', 'sykj', '19.29', 22302.4, 0.76, NULL, 511080, 29400, NULL),
(920, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '江苏', 5.09, '000910', 0.135, 182367, '家居用品', 564692, '大亚科技', 52750, 2.71, 51.21, 'dayakeji', 'dykj', '14.25', 31973.4, 0.61, NULL, 863749, 52750, NULL),
(921, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '广西', 4.87, '000911', 0.08, 132070, '食品', 323508, '南宁糖业', 28664, 2.34, 77.57, 'nanningtangye', 'nnty', '0.00', 145650, 4.49, NULL, 482170, 32408.1, NULL),
(922, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '四川', 1.21, '000912', -0.03, 116652, '农药化肥', 156915, '*ST天化', 58500, 3.9, 0, '*STtianhua', '*STth', '6.36', 97332.7, 1.66, NULL, 850514, 58500, NULL),
(923, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '浙江', 4.69, '000913', 0.015, 81397.7, '摩托车', 206472, '钱江摩托', 45343.6, 1.32, 207.27, 'qianjiangmotuo', 'qjmt', '12.22', 133710, 2.95, NULL, 359272, 45353.6, NULL),
(924, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '山东', 5.62, '000915', 0.354, 43770.4, '生物制药', 100187, '山大华特', 17937.6, 4.45, 35.34, 'shandahuate', 'sdht', '32.30', 3458.53, 0.19, NULL, 194040, 18025.5, NULL),
(925, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '北京', 4.2, '000916', 0.138, 388216, '路桥', 163170, '华北高速', 108997, 1.21, 18.49, 'huabeigaosu', 'hbgs', '4.76', 133833, 1.23, NULL, 658838, 109000, NULL),
(926, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '湖南', 7.1, '000917', 0.104, 593079, '影视音像', 557001, '电广传媒', 106191, 6.03, 205.65, 'dianguangchuanmei', 'dgcm', '0.00', 610699, 4.31, NULL, 1671110, 141756, NULL),
(927, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '湖南', 2.27, '000918', -0.123, 35303.3, '全国地产', 3515290, '嘉凯城', 180419, 1.9, 0, 'jiakaicheng', 'jkc', '5.70', -91959.8, -0.51, NULL, 3684430, 180419, NULL),
(928, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '江苏', 4.67, '000919', 0.23, 99798.5, '中成药', 221117, '金陵药业', 50322.4, 2.98, 30.24, 'jinlingyaoye', 'jlyy', '13.22', 46626.6, 0.93, NULL, 363729, 50400, NULL),
(929, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '贵州', 2.26, '000920', 0.102, 8525.78, '运输设备', 52393, '南方汇通', 42200, 5.41, 60.02, 'nanfanghuitong', 'nfht', '0.00', 1988.68, 0.05, NULL, 158053, 42200, NULL),
(930, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '广东', 2.91, '000921', 0.371, 339036, '家用电器', 1062980, '海信科龙', 90171.8, 2.95, 11.56, 'haixinkelong', 'hxkl', '8.02', 215377, 1.58, NULL, 1617860, 136273, NULL),
(931, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '黑龙江', 3.8, '000922', -0.084, 61507.3, '电气设备', 284238, '佳电股份', 29843.5, 2.68, 0, 'jiadiangufen', 'jdgf', '9.02', 108984, 1.83, NULL, 372581, 59586.7, NULL),
(932, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '河北', 2.08, '000923', -0.148, 22168.5, '工程机械', 88057.2, '河北宣工', 19799.9, 5.33, 0, 'hebeixuangong', 'hbxg', '0.00', 16355.8, 0.83, NULL, 149361, 19800, NULL),
(933, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '浙江', 3.67, '000925', 0.04, 27114.5, '专用机械', 206547, '众合科技', 30133.8, 3.34, 176.45, 'zhonghekeji', 'zhkj', '16.84', 97669.2, 3.01, NULL, 381042, 32408.4, NULL),
(934, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '湖北', 8.46, '000926', 0.35, 163913, '区域地产', 2640330, '福星股份', 53021.4, 1.1, 13.28, 'fuxinggufen', 'fxgf', '11.44', 0, 0, NULL, 3340350, 71235.6, NULL),
(935, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '天津', 0.61, '000927', -0.337, 276562, '汽车整车', 167276, '*ST夏利', 159517, 8.82, 0, '*STxiali', '*STxl', '7.12', 133984, 0.84, NULL, 663396, 159517, NULL),
(936, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '吉林', 4.06, '000928', 0.386, 6204.37, '建筑施工', 1179450, '中钢国际', 28289.9, 3.31, 17.44, 'zhonggangguoji', 'zggj', '12.40', 173903, 2.71, NULL, 1241130, 64256.2, NULL),
(937, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '甘肃', 4.59, '000929', 0.901, 30843.3, '啤酒', 129968, '兰州黄河', 18563.2, 2.58, 6.58, 'lanzhouhuanghe', 'lzhh', '14.58', 19266.2, 1.04, NULL, 171658, 18576.6, NULL),
(938, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '安徽', 2.62, '000930', -0.335, 394264, '食品', 327571, '中粮生化', 96441.1, 5.64, 0, 'zhongliangshenghua', 'zlsh', '11.20', 90302.1, 0.94, NULL, 790413, 96441.1, NULL),
(939, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '北京', 1.15, '000931', 0.222, 40275.4, '区域地产', 164878, '中 关 村', 50651.4, 7.64, 19.86, 'zhong guan cun', 'z g c', '8.13', 95167.6, 1.41, NULL, 243851, 67484.7, NULL),
(940, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '湖南', 3.34, '000932', -0.051, 4369370, '普钢', 2527660, '华菱钢铁', 301491, 0.91, 0, 'hualinggangtie', 'hlgt', '0.00', 702774, 2.33, NULL, 7521580, 301565, NULL),
(941, '2016-06-05 13:21:25', '2016-06-05 13:21:25', '河南', 3.49, '000933', -0.152, 2253160, '煤炭开采', 1454490, '神火股份', 190042, 1.17, 0, 'shenhuogufen', 'shgf', '4.10', 194044, 1.02, NULL, 5030780, 190050, NULL),
(942, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '四川', 3.52, '000935', -0.081, 413056, '水泥', 88040.9, '四川双马', 31941, 1.6, 0, 'sichuanshuangma', 'scsm', '6.70', 99226.9, 1.3, NULL, 565137, 76344, NULL),
(943, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '江苏', 2.97, '000936', 0.074, 38618.7, '化纤', 144597, '华西股份', 74768.6, 2.54, 50.83, 'huaxigufen', 'hxgf', '0.00', 4886, 0.06, NULL, 344430, 88601.3, NULL),
(944, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '河北', 5.14, '000937', 0.002, 1375300, '煤炭开采', 1382150, '冀中能源', 286919, 0.97, 1380.64, 'jizhongnengyuan', 'jzny', '5.32', 425969, 1.21, NULL, 4206580, 353355, NULL),
(945, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '北京', 10.97, '000938', 0.459, 4978.31, '软件服务', 352060, '紫光股份', 20607.5, 4.46, 53.26, 'ziguanggufen', 'zggf', '60.86', 46169.8, 2.24, NULL, 570554, 20608, NULL),
(946, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '湖北', 6.2, '000939', 0.13, 1161080, '火力发电', 804551, '凯迪电力', 94117.4, 1.77, 50.65, 'kaididianli', 'kddl', '7.84', 280378, 1.86, NULL, 3088290, 150729, NULL),
(947, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '云南', 5.53, '000948', -0.196, 28892.1, '软件服务', 152041, '南天信息', 23127.8, 2.42, 0, 'nantianxinxi', 'ntxx', '17.88', 79820.8, 3.24, NULL, 233947, 24660.6, NULL),
(948, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '河南', 2.37, '000949', 0.058, 278740, '化纤', 200912, '新乡化纤', 102653, 2.26, 46.51, 'xinxianghuaxian', 'xxhx', '4.06', 95014.5, 0.92, NULL, 504859, 102724, NULL),
(949, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '重庆', 3.14, '000950', -0.321, 447248, '农药化肥', 156354, '建峰化工', 59879.9, 1.92, 0, 'jianfenghuagong', 'jfhg', '0.00', 107013, 1.79, NULL, 688226, 59879.9, NULL),
(950, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '山东', 10.62, '000951', 0.424, 167545, '汽车整车', 1612490, '中国重汽', 41942.6, 1.27, 15.91, 'zhongguozhongqi', 'zgzq', '9.15', 68408.8, 1.63, NULL, 1850970, 41942.6, NULL),
(951, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '湖北', 1.89, '000952', -0.088, 53242, '化学制药', 55812, '广济药业', 25168, 5.6, 0, 'guangjiyaoye', 'gjyy', '16.37', 6769.52, 0.27, NULL, 170920, 25170.6, NULL),
(952, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '广西', 0.7, '000953', -0.099, 59112.6, '农药化肥', 81467.9, '河池化工', 29404.5, 10.24, 0, 'hechihuagong', 'hchg', '0.00', 4456.81, 0.15, NULL, 153792, 29405.9, NULL),
(953, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '海南', 1.22, '000955', -0.035, 43832, '纺织', 28028.5, '欣龙控股', 53839.5, 4.37, 0, 'xinlongkonggu', 'xlkg', '0.00', 44989.7, 0.84, NULL, 93590.4, 53839.5, NULL),
(954, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '山东', 4.57, '000957', 0.202, 98139.5, '汽车整车', 363406, '中通客车', 23848.9, 2.94, 33.14, 'zhongtongkeche', 'ztkc', '30.11', 13797.1, 0.58, NULL, 506288, 23850.5, NULL),
(955, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '河北', 2.12, '000958', 0.361, 114155, '火力发电', 20027.4, '东方能源', 25048, 10.26, 30.19, 'dongfangnengyuan', 'dfny', '14.43', 112481, 2.33, NULL, 224199, 48339.3, NULL),
(956, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '北京', 4.53, '000959', -0.042, 3616400, '普钢', 640178, '首钢股份', 120615, 1.36, 0, 'shouganggufen', 'sggf', '3.87', 1303060, 2.46, NULL, 6259760, 528939, NULL),
(957, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '云南', 5.73, '000960', -0.488, 950077, '小金属', 887512, '锡业股份', 115122, 1.79, 0, 'xiyegufen', 'xygf', '11.15', 523519, 4.55, NULL, 2203540, 115122, NULL),
(958, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '江苏', 7.93, '000961', 0.381, 216087, '建筑施工', 8197410, '中南建设', 116386, 1.42, 14.8, 'zhongnanjianshe', 'znjs', '17.02', 106296, 0.91, NULL, 8919710, 116784, NULL),
(959, '2016-06-05 13:21:26', '2016-06-05 13:21:26', '宁夏', 4.38, '000962', -0.354, 158715, '小金属', 202162, '东方钽业', 44083.1, 2.08, 0, 'dongfangtanye', 'dfty', '0.00', 119687, 2.72, NULL, 391215, 44083.3, NULL),
(960, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '浙江', 5.85, '000963', 1.536, 114093, '医药商业', 832055, '华东医药', 43406, 12.13, 23.11, 'huadongyiyao', 'hdyy', '66.21', 1903.18, 0.04, NULL, 1053030, 43406, NULL),
(961, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '天津', 4.25, '000965', 0.07, 11616.8, '区域地产', 442334, '天保基建', 100894, 1.15, 34.77, 'tianbaojijian', 'tbjj', '5.20', 189402, 1.88, NULL, 535944, 100894, NULL),
(962, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '湖北', 4.71, '000966', 0.597, 704227, '火力发电', 86151, '长源电力', 55414.2, 2.21, 8.71, 'zhangyuandianli', 'zydl', '13.97', 153284, 2.77, NULL, 981017, 55414.2, NULL),
(963, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '浙江', 5.03, '000967', 0.116, 34557.3, '电气设备', 150257, '上风高科', 27343.9, 2.35, 50.78, 'shangfenggaoke', 'sfgk', '21.02', 48465.4, 1.58, NULL, 266270, 30666.7, NULL),
(964, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '山西', 2.34, '000968', -1.33, 866447, '煤炭开采', 335408, '煤 气 化', 51374.7, 2.46, 0, 'mei qi hua', 'm q h', '0.00', 58391.6, 1.14, NULL, 1418020, 51374.7, NULL),
(965, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '北京', 3.65, '000969', 0.016, 284853, '钢加工', 376980, '安泰科技', 86125.6, 2.44, 271.15, 'antaikeji', 'atkj', '15.78', 153063, 1.77, NULL, 809838, 86279.6, NULL),
(966, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '北京', 3.52, '000970', 0.124, 83985.5, '元器件', 381441, '中科三环', 106520, 3.64, 51.76, 'zhongkesanhuan', 'zksh', '15.93', 42736.5, 0.4, NULL, 516787, 106520, NULL),
(967, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '湖北', 0.1, '000971', -0.07, 4701.33, '纺织', 5545.72, '蓝鼎控股', 24278.8, 189.46, 0, 'landingkonggu', 'ldkg', '0.00', 18857.9, 0.78, NULL, 11557.8, 24310, NULL),
(968, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '新疆', 1.46, '000972', -0.033, 94764.4, '食品', 104958, '新中基', 77128.4, 10.08, 0, 'xinzhongji', 'xzj', '6.13', 107309, 1.39, NULL, 239236, 77128.4, NULL),
(969, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '广东', 2.08, '000973', 0.027, 118448, '塑料', 244560, '佛塑科技', 77240.1, 2.94, 112.23, 'fosukeji', 'fskj', '10.00', 31420.6, 0.32, NULL, 543532, 96742.3, NULL),
(970, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '内蒙', 3.35, '000975', 0.074, 50573, '铅锌', 133335, '银泰资源', 56320.2, 3.2, 72.15, 'yintaiziyuan', 'ytzy', '0.00', 209270, 1.93, NULL, 464006, 108557, NULL),
(971, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '广东', 0.34, '000976', -0.039, 34534.6, '化纤', 19621.9, '*ST春晖', 58656, 19.58, 0, '*STchunhui', '*STch', '8.48', 35867.9, 0.61, NULL, 59890.8, 58664.3, NULL),
(972, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '山东', 2.64, '000977', 0.25, 17877.1, '电脑设备', 508119, '浪潮信息', 95972.6, 6.67, 35.24, 'langchaoxinxi', 'lcxx', '23.81', 62752.6, 0.65, NULL, 630006, 95972.6, NULL),
(973, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '广西', 4.01, '000978', -0.01, 100928, '旅游景点', 58800.4, '桂林旅游', 36010, 1.92, 0, 'guilinlvyou', 'glly', '10.76', 97098.1, 2.7, NULL, 288272, 36010, NULL),
(974, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '安徽', 1.37, '000979', 0.159, 37425, '区域地产', 1621530, '中弘股份', 307283, 4.42, 18.98, 'zhonghonggufen', 'zhgf', '2.81', 25738.2, 0.06, NULL, 1718780, 461031, NULL),
(975, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '山东', 1.74, '300121', 0.067, 43719.8, '化工原料', 75487.1, '阳谷华泰', 13806.2, 4.41, 57.85, 'yangguhuatai', 'yght', '12.24', 9642.1, 0.34, NULL, 130299, 28080, NULL),
(976, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '重庆', 3.11, '300122', 0.135, 34575.3, '生物制药', 148993, '智飞生物', 33315.1, 5.51, 63.45, 'zhifeishengwu', 'zfsw', '14.45', 101639, 1.27, NULL, 268492, 80000, NULL),
(977, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '湖南', 3.16, '300123', -0.026, 41441.7, '船舶', 71242.3, '太阳鸟', 27409.6, 6.48, 0, 'taiyangniao', 'tyn', '13.71', 43748.8, 1.51, NULL, 148884, 28889.7, NULL),
(978, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '深圳', 4.51, '300124', 0.417, 21448.7, '电器仪表', 383581, '汇川技术', 61742, 8.05, 43.45, 'huichuanjishu', 'hcjs', '19.32', 150744, 1.91, NULL, 480665, 79089.3, NULL),
(979, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '辽宁', 9.08, '300125', -0.166, 62001.2, '电气设备', 118376, '易世达', 7747.64, 2.29, 0, 'yishida', 'ysd', '0.00', 81123.3, 6.87, NULL, 218464, 11800, NULL),
(980, '2016-06-05 13:21:27', '2016-06-05 13:21:27', '上海', 3.37, '300126', 0.062, 20274.4, '轻工机械', 93623.5, '锐奇股份', 21090.3, 3.82, 104.61, 'ruiqigufen', 'rqgf', '11.26', 47802.8, 1.56, NULL, 124425, 30730.8, NULL),
(981, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '四川', 3.07, '300127', 0.114, 20266.9, '元器件', 82843.1, '银河磁体', 22201.5, 3.14, 42.32, 'yinheciti', 'yhct', '24.21', 49620.3, 1.54, NULL, 107586, 32314.6, NULL),
(982, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '江苏', 4.98, '300128', -0.012, 58959.7, '元器件', 173913, '锦富新材', 30156.8, 2.97, 0, 'jinfuxincai', 'jfxc', '16.30', 155990, 3.12, NULL, 384621, 50013, NULL),
(983, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '上海', 2.39, '300129', 0.117, 60590.4, '电气设备', 184056, '泰胜风能', 46378.8, 2.68, 27.28, 'taishengfengneng', 'tsfn', '6.91', 45989.6, 0.71, NULL, 284740, 64800, NULL),
(984, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '深圳', 5.15, '300130', 0.154, 2977.81, '电脑设备', 100871, '新国都', 14739.7, 3.44, 57.48, 'xinguodou', 'xgd', '28.98', 57405.3, 2.51, NULL, 156033, 22860, NULL),
(985, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '深圳', 1.26, '300131', 0.007, 13061.2, '元器件', 40891.9, '英唐智控', 26546.5, 17.17, 1539.01, 'yingtangzhikong', 'ytzk', '10.61', 3214.68, 0.06, NULL, 75411.5, 53476.3, NULL),
(986, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '福建', 1.55, '300132', 0.018, 30963.5, '化工原料', 52968.8, '青松股份', 27355.1, 5.12, 214.32, 'qingsonggufen', 'qsgf', '8.02', 8241.61, 0.21, NULL, 103663, 38592, NULL),
(987, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '浙江', 3.76, '300133', 0.223, 4541.1, '影视音像', 331515, '华策影视', 68234, 6.32, 53.36, 'huaceyingshi', 'hcys', '16.32', 155766, 1.59, NULL, 537623, 98096.3, NULL),
(988, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '深圳', 3.79, '300134', 0.079, 91700.9, '通信设备', 156410, '大富科技', 59772, 6.06, 145.13, 'dafukeji', 'dfkj', '30.44', 150933, 2.31, NULL, 393292, 65280, NULL),
(989, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '江苏', 1.26, '300135', 0.034, 31509.1, '化工原料', 260286, '宝利国际', 70904.4, 10.06, 185.11, 'baoliguoji', 'blgj', '5.90', 3525.6, 0.04, NULL, 344503, 92160, NULL),
(990, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '深圳', 1.34, '300136', 0.119, 28711.1, '通信设备', 73094.8, '信维通信', 40429.5, 14.16, 79.7, 'xinweitongxin', 'xwtx', '18.95', 3027.13, 0.05, NULL, 121495, 59582.7, NULL),
(991, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '河北', 3.85, '300137', 0.104, 19404.2, '电器仪表', 109597, '先河环保', 28141.7, 3.35, 61.97, 'xianhehuanbao', 'xhhb', '13.99', 67777, 1.97, NULL, 160983, 34439.5, NULL),
(992, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '河北', 5.81, '300138', 0.227, 44670.5, '食品', 80763.4, '晨光生物', 13768, 2.17, 27.85, 'chenguangshengwu', 'cgsw', '16.78', 63550.5, 3.54, NULL, 139966, 17957.1, NULL),
(993, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '北京', 4.53, '300139', 0.138, 7527.25, '元器件', 71822.1, '福星晓程', 21216.1, 2.39, 39.09, 'fuxingxiaocheng', 'fxxc', '13.66', 58043.3, 2.12, NULL, 139656, 27400, NULL),
(994, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '陕西', 3.19, '300140', 0.001, 28090.3, '电气设备', 62150.1, '启源装备', 24158.1, 5.56, 6529.27, 'qiyuanzhuangbei', 'qyzb', '16.85', 37564.4, 1.54, NULL, 110932, 24400, NULL),
(995, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '江苏', 4.12, '300141', 0.1, 8664.87, '电气设备', 62731.9, '和顺电气', 10621.2, 2.83, 58.33, 'heshundianqi', 'hsdq', '34.15', 30402.2, 1.82, NULL, 78107, 16696.6, NULL),
(996, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '云南', 5.97, '300142', -0.143, 48425.3, '生物制药', 217910, '沃森生物', 33665.1, 8.16, 0, 'wosenshengwu', 'wssw', '0.00', 165985, 3.55, NULL, 631488, 46800, NULL),
(997, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '广东', 2.12, '300143', 0.041, 41319.1, '种植业', 8218.51, '星河生物', 10594.4, 5.42, 140.66, 'xingheshengwu', 'xhsw', '24.06', 50814, 3.45, NULL, 73168.9, 14740, NULL),
(998, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '浙江', 2.54, '300144', 0.193, 168246, '旅游景点', 115209, '宋城演艺', 121906, 6.83, 44.89, 'songchengyanyi', 'scyy', '25.70', 174849, 1.22, NULL, 405087, 143093, NULL),
(999, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '浙江', 5.8, '300145', 0.32, 65126.2, '专用机械', 109128, '南方泵业', 17864.6, 4.63, 42.85, 'nanfangbengye', 'nfby', '21.87', 62070, 2.36, NULL, 204382, 26311.6, NULL),
(1000, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '广东', 5.95, '300146', 0.59, 40250, '食品', 348604, '汤臣倍健', 33743.2, 4.91, 25.48, 'tangchenbeijian', 'tcbj', '14.16', 263382, 3.62, NULL, 467659, 72801.1, NULL),
(1001, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '广东', 5.03, '300147', 0.18, 120452, '生物制药', 267283, '香雪制药', 65972.9, 2.84, 50.75, 'xiangxuezhiyao', 'xxzy', '14.31', 213798, 3.23, NULL, 508749, 66147.6, NULL),
(1002, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '湖南', 4.34, '300148', 0.19, 4102.4, '出版业', 72528.1, '天舟文化', 33751.9, 3.69, 42.17, 'tianzhouwenhua', 'tzwh', '0.00', 113557, 2.69, NULL, 193817, 42235.1, NULL),
(1003, '2016-06-05 13:21:28', '2016-06-05 13:21:28', '广东', 1.63, '300149', 0.059, 18187.3, '食品', 45682.6, '量子高科', 27934.7, 11.51, 158.72, 'liangzigaoke', 'lzgk', '18.09', 7729.08, 0.18, NULL, 76926.2, 42210, NULL),
(1004, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '北京', 2.62, '300150', 0.03, 2241.17, '软件服务', 135209, '世纪瑞尔', 35772.9, 4.57, 200.63, 'shijiruier', 'sjre', '10.56', 72866.5, 1.35, NULL, 152810, 54000, NULL),
(1005, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '深圳', 1.56, '300151', 0.033, 24926.8, '机械基件', 64091.5, '昌红科技', 26603.9, 5.64, 134.04, 'changhongkeji', 'chkj', '13.19', 11106, 0.22, NULL, 99888.6, 50250, NULL),
(1006, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '江苏', 6.26, '300152', 0.126, 35067.1, '专用机械', 201660, '科融环境', 23760, 2.66, 66.29, 'keronghuanjing', 'krhj', '7.06', 96935.2, 4.08, NULL, 313554, 23760, NULL),
(1007, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '上海', 2.9, '300153', 0.048, 14436.2, '电气设备', 89155, '科泰电源', 15479.5, 2.62, 79.79, 'ketaidianyuan', 'ktdy', '18.84', 49463.8, 1.55, NULL, 121106, 32000, NULL),
(1008, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '深圳', 6.63, '300154', 0.229, 9518.9, '元器件', 154425, '瑞凌股份', 15559.8, 2.2, 31.84, 'ruilinggufen', 'rlgf', '9.44', 90685.3, 4, NULL, 169077, 22673, NULL),
(1009, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '广东', 2.06, '300155', 0.028, 22430.4, '元器件', 101938, '安居宝', 26697.6, 5.03, 183.16, 'anjubao', 'ajb', '13.18', 55135.4, 1.01, NULL, 137670, 54690, NULL),
(1010, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '北京', 5.12, '300156', 0.11, 8289.23, '环境保护', 121992, '神雾环保', 25275.9, 5.18, 174.89, 'shenwuhuanbao', 'swhb', '18.28', 93558.9, 2.32, NULL, 251587, 40401, NULL),
(1011, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '北京', 3.79, '300157', 0.087, 54423.5, '石油开采', 152980, '恒泰艾普', 47627.3, 2.3, 50.31, 'hengtaiaipu', 'htap', '12.97', 118438, 1.98, NULL, 334103, 59770.3, NULL),
(1012, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '山西', 6.81, '300158', 0.112, 100040, '中成药', 150083, '振东制药', 28613.2, 2.76, 84.27, 'zhendongzhiyao', 'zdzy', '16.89', 127776, 4.44, NULL, 314723, 28800, NULL),
(1013, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '新疆', 1.53, '300159', 0.024, 29793.2, '农用机械', 100647, '新研股份', 57603.2, 6.86, 223.99, 'xinyangufen', 'xygf', '15.55', 3313.23, 0.05, NULL, 151740, 72160, NULL),
(1014, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '江苏', 5.93, '300160', 0.226, 34797.5, '玻璃', 83116.5, '秀强股份', 18680, 2.23, 29.31, 'xiuqianggufen', 'xqgf', '13.75', 64117.4, 3.43, NULL, 140929, 18680, NULL),
(1015, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '湖北', 5.12, '300161', -0.176, 18021.4, '机床制造', 102602, '华中数控', 15637.4, 7.46, 0, 'huazhongshukong', 'hzsk', '23.21', 48745.5, 3.01, NULL, 134144, 16174.5, NULL),
(1016, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '深圳', 2.25, '300162', 0.059, 23366.5, '元器件', 54885.9, '雷曼股份', 21252.5, 6.1, 116, 'leimangufen', 'lmgf', '24.20', 32790, 0.98, NULL, 89630, 33500, NULL),
(1017, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '浙江', 4.13, '300163', 0.041, 35719.4, '其他建材', 33255.3, '先锋新材', 9721.74, 7.22, 367.64, 'xianfengxincai', 'xfxc', '0.00', 41043.1, 2.6, NULL, 99389.8, 15800, NULL),
(1018, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '陕西', 3.25, '300164', -0.068, 45957.4, '石油开采', 100517, '通源石油', 30189.2, 5.28, 0, 'tongyuanshiyou', 'tysy', '7.76', 66376.2, 1.64, NULL, 198470, 40509.5, NULL),
(1019, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '江苏', 6.38, '300165', 0.15, 13703.5, '电器仪表', 136153, '天瑞仪器', 13840.4, 1.98, 53.09, 'tianruiyiqi', 'tryq', '10.99', 99870.9, 4.33, NULL, 165053, 23088, NULL),
(1020, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '北京', 2.97, '300166', 0.097, 2948.28, '软件服务', 90861, '东方国信', 34280.9, 6.11, 93.08, 'dongfangguoxin', 'dfgx', '26.78', 68896.9, 1.22, NULL, 196700, 56495.8, NULL),
(1021, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '深圳', 2.21, '300167', -0.073, 3430.25, '通信设备', 77867.6, '迪威视讯', 30024, 6.29, 0, 'diweishixun', 'dwsx', '14.48', 29790.2, 0.99, NULL, 115623, 30024, NULL),
(1022, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '上海', 3.38, '300168', 0.05, 19068.7, '软件服务', 237392, '万达信息', 97850.6, 5.63, 350.17, 'wandaxinxi', 'wdxx', '25.92', 61709.6, 0.62, NULL, 439520, 100163, NULL),
(1023, '2016-06-05 13:21:29', '2016-06-05 13:21:29', '江苏', 3.75, '300169', 0.022, 48259.2, '塑料', 92928.1, '天晟新材', 18455.8, 2.22, 185.62, 'tianshengxincai', 'tsxc', '11.49', 82893.9, 2.54, NULL, 193775, 32598.4, NULL),
(1024, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '上海', 2.08, '300170', 0.111, 29211.5, '软件服务', 141254, '汉得信息', 61574.6, 6.28, 59.14, 'handexinxi', 'hdxx', '13.85', 32962.2, 0.4, NULL, 184942, 82359.9, NULL),
(1025, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '上海', 4.22, '300171', 0.32, 22699.7, '医疗保健', 343666, '东富龙', 32033.2, 3.66, 24.69, 'dongfulong', 'dfl', '18.32', 119442, 1.88, NULL, 414230, 63483.6, NULL),
(1026, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '江苏', 2.83, '300172', 0.119, 5150.26, '环境保护', 102872, '中电环保', 22767.3, 3.61, 42.76, 'zhongdianhuanbao', 'zdhb', '9.17', 29060.7, 0.86, NULL, 139368, 33800, NULL),
(1027, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '广东', 2.63, '300173', 0.039, 17134, '轻工机械', 92226.8, '智慧松德', 24604.9, 4.94, 166.39, 'zhihuisongde', 'zhsd', '0.00', 81742.1, 1.39, NULL, 194792, 58618.1, NULL),
(1028, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '福建', 3.76, '300174', 0.149, 33806.7, '化工原料', 28820.2, '元力股份', 7262.89, 3.54, 44.87, 'yuanligufen', 'ylgf', '24.03', 26103.8, 1.92, NULL, 82767, 13600, NULL),
(1029, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '山东', 1.96, '300175', 0.057, 21767.7, '食品', 112087, '朗源股份', 46479.4, 3.31, 56.59, 'langyuangufen', 'lygf', '8.22', 7043.56, 0.15, NULL, 165736, 47080, NULL),
(1030, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '广东', 5.32, '300176', 0.101, 79989.4, '汽车配件', 85446.6, '鸿特精密', 10728, 2.92, 76.49, 'hongtejingmi', 'htjm', '0.00', 31930.8, 2.98, NULL, 196879, 10728, NULL),
(1031, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '广东', 3.57, '300177', 0.024, 17554, '通信设备', 142769, '中海达', 25465.3, 3.13, 233.58, 'zhonghaida', 'zhd', '13.24', 74707.7, 1.71, NULL, 183999, 43582.9, NULL),
(1032, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '深圳', 2.39, '300178', 0.122, 18050, '旅游服务', 226029, '腾邦国际', 51940.1, 6.39, 62.71, 'tengbangguoji', 'tbgj', '19.82', 25830.9, 0.48, NULL, 293670, 53825.2, NULL),
(1033, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '河南', 1.51, '300179', 0.047, 16562.4, '矿物制品', 54409.8, '四方达', 32249.2, 3.86, 61.93, 'sifangda', 'sfd', '7.25', 5429.91, 0.11, NULL, 82820.7, 47520, NULL),
(1034, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '上海', 3.78, '300180', 0.43, 67336, '化纤', 62236.7, '华峰超纤', 29990.8, 3.12, 27.43, 'huafengchaoxian', 'hfcx', '0.00', 54207.7, 1.37, NULL, 184870, 39500, NULL),
(1035, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '浙江', 2.08, '300181', 0.1, 45358.6, '中成药', 100256, '佐力药业', 39829.8, 3.69, 42.54, 'zuoliyaoye', 'zlyy', '9.04', 41321, 0.68, NULL, 162798, 60862.5, NULL),
(1036, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '北京', 3.72, '300182', 0.23, 15672.5, '软件服务', 178374, '捷成股份', 23061.2, 8.56, 83.21, 'jiechenggufen', 'jcgf', '17.73', 63450.2, 1.12, NULL, 243913, 56503.8, NULL),
(1037, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '山东', 4.31, '300183', 0.258, 1140.71, '软件服务', 193064, '东软载波', 25392.8, 3.69, 30.76, 'dongruanzaibo', 'drzb', '20.16', 70312.2, 1.58, NULL, 215154, 44544.8, NULL),
(1038, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '湖北', 1.75, '300184', 0.05, 16229.3, '元器件', 53097.4, '力源信息', 25733.3, 14.78, 293.58, 'liyuanxinxi', 'lyxx', '0.00', 19031.4, 0.5, NULL, 92106.3, 38407.6, NULL),
(1039, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '山东', 3.89, '300185', 0.064, 239687, '工程机械', 346494, '通裕重工', 70989.1, 1.61, 48.94, 'tongyuzhonggong', 'tyzg', '8.06', 215378, 2.39, NULL, 772622, 90000, NULL),
(1040, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '广东', 3.82, '300186', 0.11, 52586, '农业综合', 152374, '大华农', 40047.3, 8.64, 150.62, 'dahuanong', 'dhn', '0.00', 116072, 2.15, NULL, 234134, 53934, NULL),
(1041, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '湖南', 4.62, '300187', 0.16, 14685.2, '环境保护', 105611, '永清环保', 19740.4, 4.63, 72.23, 'yongqinghuanbao', 'yqhb', '14.56', 46636, 2.19, NULL, 153750, 21308.3, NULL),
(1042, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '福建', 2.26, '300188', 0.043, 23815.8, '软件服务', 76104.3, '美亚柏科', 23551.6, 7.37, 195.07, 'meiyaboke', 'mybk', '25.87', 21855.6, 0.49, NULL, 123815, 44316.3, NULL),
(1043, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '海南', 3.04, '300189', 0.001, 31679.5, '种植业', 74535.3, '神农大丰', 40960, 9.33, 9886.3, 'shennongdafeng', 'sndf', '5.84', 72640.7, 1.77, NULL, 155466, 40960, NULL),
(1044, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '江苏', 4.34, '300190', 0.131, 21523.3, '环境保护', 138445, '维尔利', 30437.1, 7.92, 131.21, 'weierli', 'wel', '17.62', 92155.8, 2.65, NULL, 250535, 34812.1, NULL),
(1045, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '北京', 3.78, '300191', -0.017, 16712.1, '石油开采', 99085.4, '潜能恒信', 20702, 3.51, 0, 'qiannenghengxin', 'qnhx', '28.45', 55003.8, 1.72, NULL, 123551, 32000, NULL),
(1046, '2016-06-05 13:21:30', '2016-06-05 13:21:30', '江苏', 2.7, '300192', 0.056, 24287.3, '染料涂料', 46443.2, '科斯伍德', 17448.8, 2.74, 66.01, 'kesiwude', 'kswd', '12.09', 20063.4, 0.83, NULL, 80243.9, 24255, NULL),
(1047, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '深圳', 9.1, '300193', 0.21, 40077.4, '专用机械', 174106, '佳士科技', 15178.4, 1.9, 42.51, 'jiashikeji', 'jskj', '9.52', 151643, 6.58, NULL, 221863, 23050.6, NULL),
(1048, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '重庆', 7.45, '300194', 0.097, 74143, '化学制药', 113573, '福安药业', 15000.4, 2.04, 78.35, 'fuanyaoye', 'fayy', '18.65', 150141, 5.32, NULL, 247594, 28199.9, NULL),
(1049, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '天津', 6.69, '300195', 0.38, 61839, '轻工机械', 149171, '长荣股份', 12937.9, 2.48, 32.72, 'zhangronggufen', 'zrgf', '16.93', 146472, 4.3, NULL, 294250, 34085.2, NULL),
(1050, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '江苏', 6.1, '300196', 0.482, 117149, '玻璃', 80149.5, '长海股份', 10995.6, 3.66, 23.14, 'zhanghaigufen', 'zhgf', '38.67', 45688.1, 2.38, NULL, 229329, 19200, NULL),
(1051, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '深圳', 5.7, '300197', 0.24, 32024.5, '环境保护', 399525, '铁汉生态', 29379.6, 6.32, 80.69, 'tiehanshengtai', 'thst', '13.27', 163098, 3.03, NULL, 612918, 53839.8, NULL),
(1052, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '福建', 2.72, '300198', 0.057, 28263.9, '塑料', 115150, '纳川股份', 34402.6, 4.32, 102.49, 'nachuangufen', 'ncgf', '14.09', 36081.3, 0.87, NULL, 192516, 41587.6, NULL),
(1053, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '深圳', 2.71, '300199', 0.101, 73921.4, '化学制药', 72483.6, '翰宇药业', 39891.7, 5.89, 79.09, 'hanyuyaoye', 'hyyy', '19.24', 99595.5, 1.12, NULL, 305062, 89001.6, NULL),
(1054, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '北京', 3.48, '300200', 0.128, 15786.6, '化工原料', 57627.8, '高盟新材', 20320.2, 2.66, 36.24, 'gaomengxincai', 'gmxc', '14.39', 41798.8, 1.96, NULL, 80503.9, 21360, NULL),
(1055, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '江苏', 2, '300201', -0.03, 21659.2, '专用机械', 75736.3, '海伦哲', 35021.9, 5.03, 0, 'hailunzhe', 'hlz', '15.25', 24633.9, 0.68, NULL, 125348, 36492.5, NULL),
(1056, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '辽宁', 2.52, '300202', 0.109, 26735.7, '专用机械', 127252, '聚龙股份', 42022.1, 7.32, 84.47, 'julonggufen', 'jlgf', '21.16', 9757.1, 0.18, NULL, 163433, 54950.4, NULL),
(1057, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '浙江', 4.74, '300203', 0.176, 20748.2, '电器仪表', 191916, '聚光科技', 44500, 4.55, 61.35, 'juguangkeji', 'jgkj', '25.24', 92331.4, 2.04, NULL, 305511, 45305.9, NULL),
(1058, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '北京', 4.62, '300204', 0.325, 23168.3, '生物制药', 147909, '舒泰神', 33048.1, 5.28, 37.49, 'shutaishen', 'sts', '17.01', 63781, 1.9, NULL, 181984, 33616.8, NULL),
(1059, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '湖北', 2.58, '300205', 0.045, 14102.2, '元器件', 151301, '天喻信息', 42489.1, 4.25, 121.71, 'tianyuxinxi', 'tyxx', '14.02', 40045.6, 0.93, NULL, 182057, 43005.6, NULL),
(1060, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '深圳', 4.91, '300206', 0.026, 4480.35, '医疗保健', 99917.6, '理邦仪器', 13613.7, 2.81, 264.5, 'libangyiqi', 'lbyq', '11.65', 80016.5, 3.42, NULL, 134014, 23400, NULL),
(1061, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '深圳', 2.47, '300207', 0.154, 41199.1, '元器件', 338485, '欣旺达', 43521, 7.4, 59.18, 'xinwangda', 'xwd', '24.70', 45525.9, 0.72, NULL, 466018, 63077.5, NULL),
(1062, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '山东', 3.37, '300208', 0.72, 23112.4, '电气设备', 98965.1, '恒顺众昇', 23822.4, 11.48, 29.02, 'hengshunzhongsheng', 'hszs', '0.00', 34577.3, 1.13, NULL, 193335, 30661, NULL),
(1063, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '江苏', 3.71, '300209', 0.02, 10634.3, '软件服务', 66902.8, '天泽信息', 20331.9, 6.32, 593.88, 'tianzexinxi', 'tzxx', '24.31', 53354, 2.18, NULL, 100781, 24493, NULL),
(1064, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '辽宁', 3.64, '300210', 0.152, 17341.4, '专用机械', 82388.9, '森远股份', 11521.7, 2.94, 35.29, 'senyuangufen', 'sygf', '14.26', 19482.9, 0.8, NULL, 142286, 24251.4, NULL),
(1065, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '江苏', 3.09, '300211', 0.04, 14559.8, '通信设备', 32200.2, '亿通科技', 9125.58, 3.65, 139.79, 'yitongkeji', 'ytkj', '24.10', 18074.1, 1.13, NULL, 56880, 15930.3, NULL),
(1066, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '北京', 3.1, '300212', 0.179, 13886.3, '软件服务', 291609, '易华录', 30312.6, 7.94, 68.85, 'yihualu', 'yhl', '28.03', 23560.2, 0.73, NULL, 372607, 32160, NULL),
(1067, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '北京', 3.53, '300213', 0.119, 15167.3, '通信设备', 105972, '佳讯飞鸿', 12526.2, 4.75, 70.49, 'jiaxunfeihong', 'jxfh', '24.24', 35363.1, 1.35, NULL, 158432, 26101.6, NULL),
(1068, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '山东', 3.11, '300214', 0.123, 52038.2, '化工原料', 92662.1, '日科化学', 29255.9, 1.99, 25.19, 'rikehuaxue', 'rkhx', '7.54', 44779.7, 1.11, NULL, 152553, 40500, NULL),
(1069, '2016-06-05 13:21:31', '2016-06-05 13:21:31', '江苏', 1.77, '300215', -0.03, 110851, '电气设备', 51429.6, '电科院', 47999.9, 3.81, 0, 'diankeyuan', 'dky', '10.62', 24573.7, 0.34, NULL, 347481, 72000, NULL),
(1070, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '湖南', 2.67, '300216', 0.103, 40824.3, '医疗保健', 140860, '千山药机', 26000.5, 17.9, 231.95, 'qianshanyaoji', 'qsyj', '31.71', 21559.4, 0.6, NULL, 255203, 36159.5, NULL),
(1071, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '江苏', 2.99, '300217', 0.105, 28360.7, '电器仪表', 119938, '东方电热', 21553.3, 2.28, 32.38, 'dongfangdianre', 'dfdr', '4.86', 33278.5, 0.84, NULL, 173788, 39547.2, NULL),
(1072, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '安徽', 4.37, '300218', 0.12, 86280.9, '塑料', 66028.4, '安利股份', 16845.9, 2.32, 42.13, 'anligufen', 'algf', '14.93', 37089.4, 1.71, NULL, 178711, 21697.2, NULL),
(1073, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '广东', 3.94, '300219', 0.232, 51657.4, '元器件', 84789.4, '鸿利光电', 13907.3, 4.42, 37.57, 'hongliguangdian', 'hlgd', '14.36', 40492, 1.65, NULL, 174213, 24601.3, NULL),
(1074, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '湖北', 2.37, '300220', 0.043, 9501.51, '元器件', 24999.7, '金运激光', 6731.77, 10.13, 281.16, 'jinyunjiguang', 'jyjg', '0.00', 8281.74, 0.66, NULL, 43054, 12600, NULL),
(1075, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '广东', 1.81, '300221', 0.064, 35410, '塑料', 83287, '银禧科技', 40000, 4.52, 64.29, 'yinxikeji', 'yxkj', '0.00', 12405.2, 0.31, NULL, 131460, 40324, NULL),
(1076, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '上海', 4.12, '300222', 0.2, 17807.5, '电气设备', 115799, '科大智能', 14645.1, 8.41, 94.14, 'kedazhineng', 'kdzn', '26.74', 90788.4, 2.71, NULL, 186524, 33482.9, NULL),
(1077, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '北京', 6.36, '300223', 0.003, 7161.28, '半导体', 86793.9, '北京君正', 9735.32, 2.36, 2917.15, 'beijingjunzheng', 'bjjz', '0.00', 73341.7, 4.41, NULL, 106721, 16640, NULL),
(1078, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '山东', 4.02, '300224', 0.2, 45020.1, '元器件', 195454, '正海磁材', 45729.8, 4.82, 51.2, 'zhenghaicicai', 'zhcc', '24.44', 91484.2, 1.81, NULL, 286373, 50507.4, NULL),
(1079, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '上海', 1.69, '300225', 0.072, 34575.1, '染料涂料', 60110.7, '金力泰', 33679.7, 3.28, 38.37, 'jinlitai', 'jlt', '0.00', 2514.41, 0.05, NULL, 100696, 47034, NULL),
(1080, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '上海', 1.4, '300226', -0.698, 22685.5, '互联网', 225336, '上海钢联', 14146.8, 27.55, 0, 'shanghaiganglian', 'shgl', '0.00', 4863.64, 0.31, NULL, 260897, 15600, NULL),
(1081, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '深圳', 2.76, '300227', 0.231, 25416.9, '元器件', 23600.5, '光韵达', 13575.9, 12.87, 76.95, 'guangyunda', 'gyd', '24.85', 12493.1, 0.9, NULL, 59164.3, 13921, NULL),
(1082, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '江苏', 9.45, '300228', 0.4, 50950.7, '化工机械', 193290, '富瑞特装', 10931.5, 3.38, 42.47, 'furuitezhuang', 'frtz', '16.00', 42243.9, 2.9, NULL, 304731, 14576.8, NULL),
(1083, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '北京', 3.04, '300229', 0.055, 10804.7, '软件服务', 68452.2, '拓尔思', 40980.9, 5.53, 153.29, 'tuoersi', 'tes', '21.28', 54549.2, 1.17, NULL, 155906, 46588.7, NULL),
(1084, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '上海', 4.61, '300230', 0.18, 30674.4, '塑料', 79630.4, '永利带业', 10568.8, 3.89, 60.81, 'yonglidaiye', 'yldy', '27.98', 49942.5, 2.44, NULL, 147288, 20472.3, NULL),
(1085, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '北京', 1.25, '300231', 0.121, 7434.38, '软件服务', 46619.3, '银信科技', 25605.7, 9.1, 46.85, 'yinxinkeji', 'yxkj', '19.00', 6499.22, 0.19, NULL, 54840.6, 33631.4, NULL),
(1086, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '深圳', 3.45, '300232', 0.281, 27204.8, '半导体', 98067.7, '洲明科技', 13858.8, 4.67, 28.68, 'zhoumingkeji', 'zmkj', '16.20', 23861.3, 1.18, NULL, 153414, 20303.8, NULL),
(1087, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '山东', 9.45, '300233', 0.682, 71093, '化学制药', 83824.3, '金城医药', 11112.2, 4.76, 32.99, 'jinchengyiyao', 'jcyy', '25.96', 60627.5, 4.79, NULL, 180236, 12660, NULL),
(1088, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '浙江', 2.17, '300234', 0.209, 9751.44, '陶瓷', 60643.2, '开尔新材', 14247.4, 5.09, 26.49, 'kaierxincai', 'kexc', '18.55', 4173.23, 0.16, NULL, 81574.2, 26400, NULL),
(1089, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '深圳', 2.09, '300235', 0.068, 1866.14, '软件服务', 24138.2, '方直科技', 9147.62, 7.8, 120.14, 'fangzhikeji', 'fzkj', '23.80', 6258.08, 0.4, NULL, 34677.4, 15840, NULL),
(1090, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '上海', 4.79, '300236', 0.21, 14775.3, '化工原料', 43655.7, '上海新阳', 15161.9, 3.35, 61.86, 'shanghaixinyang', 'shxy', '39.35', 51456.1, 2.8, NULL, 100893, 18401.9, NULL),
(1091, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '山东', 4.85, '300237', 0.206, 34967.5, '橡胶', 203425, '美晨科技', 11414.7, 3.79, 44.57, 'meichenkeji', 'mckj', '9.28', 68664, 2.63, NULL, 293019, 26068.7, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1092, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '广东', 2.17, '300238', 0.069, 20407.4, '医疗保健', 30932.1, '冠昊生物', 18096.7, 12.42, 195.35, 'guanhaoshengwu', 'ghsw', '39.37', 12037.7, 0.49, NULL, 65620.2, 24699.5, NULL),
(1093, '2016-06-05 13:21:32', '2016-06-05 13:21:32', '内蒙', 1.72, '300239', 0.02, 19988.7, '生物制药', 28755.5, '东宝生物', 12244, 5.54, 235.29, 'dongbaoshengwu', 'dbsw', '8.29', 5154.3, 0.26, NULL, 52652.2, 19754.8, NULL),
(1094, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '江苏', 3.92, '300240', 0.089, 27569.3, '仓储物流', 99772, '飞力达', 24367.6, 2.48, 54.66, 'feilida', 'fld', '10.98', 36884.1, 1.51, NULL, 165626, 24370.7, NULL),
(1095, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '深圳', 2.94, '300241', 0.098, 39299.6, '半导体', 66593, '瑞丰光电', 16046.1, 3.01, 44.92, 'ruifengguangdian', 'rfgd', '15.16', 25125.9, 1.14, NULL, 126325, 22009.3, NULL),
(1096, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '广东', 5.72, '300242', 0.121, 6253.33, '元器件', 35673, '明家科技', 4177, 8.78, 206.9, 'mingjiakeji', 'mjkj', '0.00', 36972.8, 4.24, NULL, 86062.9, 8714.83, NULL),
(1097, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '山东', 2.15, '300243', 0.11, 10684.6, '化工原料', 52266.3, '瑞丰高材', 13358, 4.5, 41.98, 'ruifenggaocai', 'rfgc', '15.25', 4143.01, 0.2, NULL, 88101.6, 20615.6, NULL),
(1098, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '浙江', 3.12, '300244', 0.33, 12751.8, '医疗保健', 88268.4, '迪安诊断', 18042.9, 16.45, 77.89, 'dianzhenduan', 'dazd', '32.26', 18487.8, 0.69, NULL, 162710, 26978.4, NULL),
(1099, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '上海', 2.49, '300245', 0.096, 9467.71, '软件服务', 64791.9, '天玑科技', 17093.6, 5.63, 72.7, 'tianjikeji', 'tjkj', '21.75', 14067.3, 0.52, NULL, 77574.9, 27275, NULL),
(1100, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '广东', 2.82, '300246', 0.057, 7406.3, '医疗保健', 34764.4, '宝莱特', 10588.5, 6.05, 151.06, 'baolaite', 'blt', '33.47', 11460.5, 0.78, NULL, 52853.7, 14608.8, NULL),
(1101, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '安徽', 2.63, '300247', 0.045, 25546.2, '医疗保健', 47183.5, '桑乐金', 16768.4, 3.18, 93.26, 'sanglejin', 'slj', '8.40', 25327.6, 0.98, NULL, 90180.5, 25861, NULL),
(1102, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '河南', 1.83, '300248', 0.001, 15467.9, '软件服务', 44316.3, '新开普', 17105.8, 8.29, 8507.12, 'xinkaipu', 'xkp', '25.80', 6374.9, 0.22, NULL, 64002.2, 28544, NULL),
(1103, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '四川', 3.77, '300249', -0.054, 9671.75, '专用机械', 107679, '依米康', 9694.04, 3.26, 0, 'yimikang', 'ymk', '9.13', 38409.8, 2.18, NULL, 144510, 17597.3, NULL),
(1104, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '浙江', 7.56, '300250', 0.11, 2319.06, '通信设备', 54266.4, '初灵信息', 4419.64, 6.14, 227.84, 'chulingxinxi', 'clxx', '58.25', 49776.5, 5.08, NULL, 89018.5, 9802.88, NULL),
(1105, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '北京', 4.4, '300251', 0.056, 2140.46, '影视音像', 394820, '光线传媒', 122462, 4.8, 188.29, 'guangxianchuanmei', 'gxcm', '12.53', 282828, 1.93, NULL, 776108, 146680, NULL),
(1106, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '深圳', 1.89, '300252', 0.187, 24508.8, '电气设备', 131123, '金信诺', 26275.2, 8.22, 41.42, 'jinxinnuo', 'jxn', '29.73', 10295.3, 0.25, NULL, 204444, 40853.2, NULL),
(1107, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '上海', 1.49, '300253', 0.107, 2679.75, '软件服务', 68923, '卫宁软件', 38014.2, 18, 125.7, 'weiningruanjian', 'wnrj', '23.15', 4308.1, 0.08, NULL, 125765, 54649.4, NULL),
(1108, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '山西', 3.66, '300254', 0.12, 26892.2, '化学制药', 31552.7, '仟源医药', 10493.9, 4.64, 77.49, 'qianyuanyiyao', 'qyyy', '0.00', 29593, 1.7, NULL, 114209, 17359, NULL),
(1109, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '河北', 3, '300255', 0.127, 39432.1, '生物制药', 133558, '常山药业', 32701.3, 3.93, 46.55, 'changshanyaoye', 'csyy', '8.19', 44444.8, 0.94, NULL, 217979, 47104.7, NULL),
(1110, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '浙江', 9.45, '300256', 0.051, 93580.8, '元器件', 240767, '星星科技', 12601.6, 1.4, 129.39, 'xingxingkeji', 'xxkj', '16.42', 257580, 8.63, NULL, 557296, 29829.8, NULL),
(1111, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '浙江', 3.84, '300257', 0.163, 87753.6, '机械基件', 324087, '开山股份', 81436.5, 4.05, 47.64, 'kaishangufen', 'ksgf', '0.00', 151113, 1.76, NULL, 447498, 85800, NULL),
(1112, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '江苏', 4.51, '300258', 0.249, 80143.6, '汽车配件', 51654.4, '精锻科技', 24977, 2.51, 22.75, 'jingduankeji', 'jdkj', '23.00', 48561.7, 1.8, NULL, 173950, 27000, NULL),
(1113, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '河南', 1.74, '300259', 0.069, 25220.7, '电器仪表', 63727.6, '新天科技', 25213.7, 3.87, 48.49, 'xintiankeji', 'xtkj', '10.11', 837.17, 0.02, NULL, 98524.4, 46674.9, NULL),
(1114, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '江苏', 6.48, '300260', 0.055, 27590.5, '机械基件', 65486.8, '新莱应材', 4724.25, 2.86, 169.1, 'xinlaiyingcai', 'xlyc', '30.40', 39308.3, 3.93, NULL, 100729, 10005, NULL),
(1115, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '江苏', 1.78, '300261', 0.095, 43833.1, '农药化肥', 54554.9, '雅本化学', 37034, 6.25, 58.39, 'yabenhuaxue', 'ybhx', '11.29', 21357, 0.54, NULL, 148805, 39240.4, NULL),
(1116, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '上海', 1.7, '300262', 0.14, 8320.21, '环境保护', 73269.9, '巴安水务', 22652.5, 10.8, 84.23, 'baanshuiwu', 'basw', '14.29', 1747.46, 0.05, NULL, 143007, 37352, NULL),
(1117, '2016-06-05 13:21:33', '2016-06-05 13:21:33', '河南', 5.19, '300263', 0.14, 33095.9, '专用机械', 225753, '隆华节能', 22690, 3.13, 64.79, 'longhuajieneng', 'lhjn', '17.74', 143029, 3.24, NULL, 370015, 44168.6, NULL),
(1118, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '深圳', 2.6, '300264', -0.027, 1674.92, '通信设备', 53470.3, '佳创视讯', 17065.8, 3.5, 0, 'jiachuangshixun', 'jcsx', '14.45', 28008.6, 1.22, NULL, 63240.8, 22950, NULL),
(1119, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '江苏', 2.33, '300265', 0.063, 27736.6, '电气设备', 90121.4, '通光线缆', 33750, 3.62, 66.77, 'tongguangxianlan', 'tgxl', '0.00', 24446.8, 0.72, NULL, 129717, 33750, NULL),
(1120, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '浙江', 2.6, '300266', 0.085, 41789.8, '机械基件', 80175.1, '兴源环境', 15197.3, 21.27, 323.84, 'xingyuanhuanjing', 'xyhj', '39.07', 40674.5, 0.98, NULL, 153719, 41401.2, NULL),
(1121, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '湖南', 2.08, '300267', 0.312, 84038.8, '化学制药', 145751, '尔康制药', 56685.3, 12.98, 43.21, 'erkangzhiyao', 'ekzy', '14.73', 11251, 0.12, NULL, 294657, 91194.6, NULL),
(1122, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '湖南', 2.17, '300268', -0.102, 8831.95, '农业综合', 5477.47, '万福生科', 9891.23, 6.45, 0, 'wanfushengke', 'wfsk', '19.76', 37698.5, 2.81, NULL, 33856.8, 13400, NULL),
(1123, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '深圳', 4.98, '300269', 0.19, 21494.7, '半导体', 123010, '联建光电', 17143.8, 5.79, 79.65, 'lianjianguangdian', 'ljgd', '0.00', 165761, 3.28, NULL, 313078, 50553.8, NULL),
(1124, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '浙江', 2.06, '300270', 0.107, 5492.74, '通信设备', 52975.1, '中威电子', 14126.7, 5.45, 52.27, 'zhongweidianzi', 'zwdz', '15.24', 14126.5, 0.52, NULL, 71415, 27280, NULL),
(1125, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '天津', 4.15, '002510', 0.198, 68453.9, '汽车配件', 239901, '天汽模', 31875.2, 2.05, 21.48, 'tianqimo', 'tqm', '7.64', 64613.5, 1.57, NULL, 373242, 41152, NULL),
(1126, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '广东', 4.91, '002511', 0.094, 227600, '造纸', 198534, '中顺洁柔', 48541.9, 1.48, 38.58, 'zhongshunjierou', 'zsjr', '16.50', 127436, 2.62, NULL, 454287, 48672, NULL),
(1127, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '广东', 4.03, '002512', 0.039, 43413.5, '元器件', 94373.2, '达华智能', 17035.8, 8.22, 427.04, 'dahuazhineng', 'dhzn', '19.65', 70298.6, 1.98, NULL, 269338, 35428.2, NULL),
(1128, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '江苏', 5.36, '002513', -0.043, 150022, '农药化肥', 82475.6, '蓝丰生化', 21312, 2.01, 0, 'lanfengshenghua', 'lfsh', '13.73', 61216.4, 2.87, NULL, 268891, 21312, NULL),
(1129, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '江苏', 3.52, '002514', 0.114, 20876.8, '机械基件', 51848.5, '宝馨科技', 21062.5, 4.21, 64.94, 'baoxinkeji', 'bxkj', '12.20', 54644.1, 1.97, NULL, 125849, 27701.7, NULL),
(1130, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '浙江', 3.75, '002515', 0.06, 42014.1, '食品', 56689.2, '金字火腿', 19617.2, 4.8, 149.69, 'jinzihuotui', 'jzht', '0.00', 79421.8, 2.21, NULL, 143517, 35967.4, NULL),
(1131, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '江苏', 2.99, '002516', 0.21, 252586, '纺织', 221173, '旷达科技', 27224.5, 3.13, 23.85, 'kuangdakeji', 'kdkj', '6.60', 71156.2, 1.07, NULL, 522627, 66250, NULL),
(1132, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '福建', 3.42, '002517', 0.026, 34587.8, '服饰', 30261.5, '泰亚股份', 17680, 9, 594.29, 'taiyagufen', 'tygf', '39.38', 33299.3, 1.88, NULL, 79183.7, 17680, NULL),
(1133, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '深圳', 5.36, '002518', 0.269, 41767.3, '电器仪表', 155006, '科士达', 27993.7, 3.1, 30.87, 'keshida', 'ksd', '23.94', 73290.6, 2.47, NULL, 204694, 29717.7, NULL),
(1134, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '江苏', 3.61, '002519', 0.17, 31026.7, '通信设备', 145224, '银河电子', 39770.6, 4.09, 44.88, 'yinhedianzi', 'yhdz', '21.35', 105119, 1.85, NULL, 255425, 56916.2, NULL),
(1135, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '浙江', 2.07, '002520', 0.074, 31957.6, '机床制造', 86078.1, '日发精机', 31259.6, 7, 97.99, 'rifajingji', 'rfjj', '19.26', 22897.8, 0.71, NULL, 133627, 32400, NULL),
(1136, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '山东', 6.51, '002521', 0.31, 93771.6, '造纸', 283634, '齐峰新材', 40356.8, 1.32, 16.32, 'qifengxincai', 'qfxc', '8.56', 198725, 4.02, NULL, 409524, 49468.6, NULL),
(1137, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '浙江', 1.51, '002522', 0.027, 70367.1, '塑料', 102492, '浙江众成', 50948.2, 6.89, 196.45, 'zhejiangzhongcheng', 'zjzc', '17.34', 27619.5, 0.31, NULL, 191124, 88328.2, NULL),
(1138, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '湖南', 2.48, '002523', 0.019, 27615.8, '工程机械', 118670, '天桥起重', 30123.9, 2.45, 157.32, 'tianqiaoqizhong', 'tqqz', '5.75', 42344.8, 0.75, NULL, 153581, 56215.9, NULL),
(1139, '2016-06-05 13:21:34', '2016-06-05 13:21:34', '新疆', 1.51, '002524', -0.02, 78352.1, '钢加工', 56681.3, '光正集团', 49055.7, 3.71, 0, 'guangzhengjituan', 'gzjt', '0.00', 29764.5, 0.59, NULL, 189476, 50333.3, NULL),
(1140, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '山东', 3.68, '002526', 0.022, 58757.1, '工程机械', 237807, '山东矿机', 41731.8, 1.98, 163.04, 'shandongkuangji', 'sdkj', '9.50', 110797, 2.07, NULL, 344679, 53400, NULL),
(1141, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '上海', 3.52, '002527', 0.142, 44855.4, '电器仪表', 182674, '新时达', 34583.8, 8.77, 108.52, 'xinshida', 'xsd', '15.15', 86458.3, 1.47, NULL, 302168, 58977.1, NULL),
(1142, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '深圳', 3.04, '002528', -0.014, 10728.5, '电脑设备', 147386, '英飞拓', 51349.6, 3.59, 0, 'yingfeituo', 'yft', '8.23', 132949, 1.91, NULL, 250676, 69662.6, NULL),
(1143, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '福建', 4.89, '002529', -0.09, 37417.7, '专用机械', 54222.3, '海源机械', 20000, 3.71, 0, 'haiyuanjixie', 'hyjx', '17.89', 62375.5, 3.12, NULL, 114274, 20000, NULL),
(1144, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '江苏', 2.53, '002530', 0.056, 21090.9, '专用机械', 57337.8, '丰东股份', 26800, 9.38, 211.14, 'fengdonggufen', 'fdgf', '23.19', 21037.7, 0.78, NULL, 99721.5, 26800, NULL),
(1145, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '江苏', 2.42, '002531', 0.145, 79683.2, '电气设备', 271089, '天顺风能', 82121.9, 3.88, 32.3, 'tianshunfengneng', 'tsfn', '11.36', 57030.2, 0.69, NULL, 391212, 82300, NULL),
(1146, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '浙江', 3.6, '002532', 0.212, 52787.3, '农用机械', 78390.1, '新界泵业', 22798.3, 2.73, 23.16, 'xinjiebengye', 'xjby', '13.88', 38579.1, 1.2, NULL, 167747, 32127, NULL),
(1147, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '湖南', 3.55, '002533', 0.091, 50467.3, '电气设备', 212265, '金杯电工', 50027.3, 1.6, 31.43, 'jinbeidiangong', 'jbdg', '10.44', 78960.7, 1.43, NULL, 294258, 55350.4, NULL),
(1148, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '浙江', 5.96, '002534', -0.499, 102869, '专用机械', 495010, '杭锅股份', 39362.7, 1.84, 0, 'hangguogufen', 'hggf', '9.92', 103938, 2.6, NULL, 690286, 40052, NULL),
(1149, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '河南', 5.22, '002535', -0.047, 166556, '工程机械', 455445, '林州重机', 32372.8, 1.62, 0, 'linzhouzhongji', 'lzzj', '6.84', 207147, 3.36, NULL, 775972, 61667.9, NULL),
(1150, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '河南', 15.75, '002536', 0.33, 106615, '汽车配件', 172246, '西泵股份', 4621.25, 1.72, 46.9, 'xibenggufen', 'xbgf', '15.00', 131807, 11.85, NULL, 311971, 11126.9, NULL),
(1151, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '山东', 4.89, '002537', 0.272, 71770, '机械基件', 155805, '海立美达', 30000, 3.39, 30.52, 'hailimeida', 'hlmd', '27.46', 77772.2, 2.57, NULL, 295375, 30270, NULL),
(1152, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '安徽', 3.13, '002538', 0.2, 91202, '农药化肥', 236406, '司尔特', 57358, 3.02, 23.69, 'sierte', 'set', '9.12', 47193.1, 0.8, NULL, 371740, 59200, NULL),
(1153, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '四川', 7.1, '002539', 0.27, 311516, '农药化肥', 302163, '新都化工', 15864.5, 2.7, 43.07, 'xindouhuagong', 'xdhg', '15.87', 128322, 3.18, NULL, 812976, 40404, NULL),
(1154, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '江苏', 2.5, '002540', 0.134, 53171.7, '铝', 199393, '亚太科技', 70512.3, 3.03, 28.39, 'yataikeji', 'ytkj', '7.44', 71100.3, 0.68, NULL, 298442, 104000, NULL),
(1155, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '安徽', 9.09, '002541', 0.343, 120832, '钢加工', 554109, '鸿路钢构', 16454, 1.48, 19.7, 'hongluganggou', 'hlgg', '16.34', 119575, 4.46, NULL, 721817, 26800, NULL),
(1156, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '北京', 1.66, '002542', 0.073, 62712.3, '建筑施工', 218003, '中化岩土', 35954.1, 5.66, 64.53, 'zhonghuayantu', 'zhyt', '7.67', 33360, 0.32, NULL, 326922, 103800, NULL),
(1157, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '广东', 6.14, '002543', 0.457, 77736, '家用电器', 249498, '万和电气', 31872.5, 1.93, 12.96, 'wanhedianqi', 'whdq', '17.45', 124897, 2.84, NULL, 389817, 44000, NULL),
(1158, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '广东', 2.2, '002544', 0.031, 44999.1, '软件服务', 220916, '杰赛科技', 50931.2, 13.45, 482.73, 'jiesaikeji', 'jskj', '27.04', 21657.8, 0.42, NULL, 283567, 51576, NULL),
(1159, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '山东', 11.05, '002545', 0.134, 49659.4, '钢加工', 239257, '东方铁塔', 11400, 2.42, 99.8, 'dongfangtieta', 'dftt', '7.84', 152845, 5.87, NULL, 410582, 26025, NULL),
(1160, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '江苏', 5.18, '002546', 0.251, 30643.5, '电气设备', 126072, '新联电子', 23500.4, 2.8, 28.88, 'xinliandianzi', 'xldz', '10.86', 47660.3, 1.89, NULL, 167267, 25200, NULL),
(1161, '2016-06-05 13:21:35', '2016-06-05 13:21:35', '江苏', 5.24, '002547', 0.233, 90222.5, '通信设备', 155562, '春兴精工', 17471.5, 4.07, 45.69, 'chunxingjinggong', 'cxjg', '0.00', 114690, 3.4, NULL, 284564, 33732.6, NULL),
(1162, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '深圳', 2.62, '002548', 0.112, 22943.1, '饲料', 84054.8, '金新农', 31020, 3.94, 46.29, 'jinxinnong', 'jxn', '18.89', 30329.1, 0.98, NULL, 140338, 31020, NULL),
(1163, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '湖南', 1.4, '002549', -0.055, 44473.9, '环境保护', 44274.3, '凯美特气', 19698, 10.36, 0, 'kaimeiteqi', 'kmtq', '10.55', 2177.45, 0.04, NULL, 124684, 56700, NULL),
(1164, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '江苏', 3.34, '002550', 0.208, 10426, '生物制药', 197517, '千红制药', 40693.4, 3.53, 28.38, 'qianhongzhiyao', 'qhzy', '8.88', 70661.3, 1.1, NULL, 244599, 64000, NULL),
(1165, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '深圳', 3.24, '002551', 0.158, 24216.2, '医疗保健', 205246, '尚荣医疗', 26765.7, 5.29, 54.26, 'shangrongyiliao', 'sryl', '22.50', 68188.4, 1.57, NULL, 286935, 43555.1, NULL),
(1166, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '浙江', 2.7, '002552', 0.019, 41437.9, '机械基件', 53302.1, '宝鼎重工', 16837.5, 3.67, 264.16, 'baodingzhonggong', 'bdzg', '14.87', 34037.3, 1.13, NULL, 109475, 30000, NULL),
(1167, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '江苏', 1.81, '002553', 0.113, 13928.7, '机械基件', 43165.2, '南方轴承', 21924, 10.35, 82.52, 'nanfangzhoucheng', 'nfzc', '12.49', 5651.9, 0.16, NULL, 68286.4, 34800, NULL),
(1168, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '北京', 3.99, '002554', 0.14, 38588.1, '石油开采', 156764, '惠博普', 25321.1, 2.1, 31.29, 'huibopu', 'hbp', '14.67', 105222, 2.04, NULL, 290743, 51562.5, NULL),
(1169, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '安徽', 3.25, '002555', 0.247, 32742.6, '汽车配件', 184564, '顺荣三七', 15903, 7.7, 50.7, 'shunrongsanqi', 'srsq', '0.00', 170109, 1.94, NULL, 410036, 87710.8, NULL),
(1170, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '安徽', 4.43, '002556', 0.202, 46450.3, '其他商业', 453457, '辉隆股份', 46327.6, 2.63, 28.8, 'huilonggufen', 'hlgf', '13.87', 104675, 2.19, NULL, 628148, 47840, NULL),
(1171, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '安徽', 5.2, '002557', 0.284, 82986.5, '食品', 237026, '洽洽食品', 50700, 2.55, 23.32, 'qiaqiashipin', 'qqsp', '20.52', 158845, 3.13, NULL, 381642, 50700, NULL),
(1172, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '重庆', 9.34, '002558', 0.018, 42413.4, '旅游服务', 22632.6, '世纪游轮', 3246.15, 3.39, 885.93, 'shijiyoulun', 'sjyl', '121.91', 40424.6, 6.18, NULL, 65556.6, 6545, NULL),
(1173, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '江苏', 3.67, '002559', 0.152, 34098.9, '机床制造', 108059, '亚威股份', 29178.6, 2.76, 33.39, 'yaweigufen', 'ywgf', '14.79', 58153.5, 1.65, NULL, 166412, 35200, NULL),
(1174, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '河南', 9.99, '002560', 0.207, 20236.8, '电气设备', 111155, '通达股份', 8852.33, 1.8, 43.37, 'tongdagufen', 'tdgf', '10.94', 94742.4, 6.78, NULL, 211045, 13980.3, NULL),
(1175, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '上海', 4.44, '002561', 0.316, 60510.9, '百货', 117110, '徐家汇', 38629.7, 2.69, 18.85, 'xujiahui', 'xjh', '12.43', 52352.2, 1.26, NULL, 224052, 41576.3, NULL),
(1176, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '浙江', 3.91, '002562', 0.147, 48257.1, '化工原料', 53002.9, '兄弟科技', 10824.5, 3.79, 50.45, 'xiongdikeji', 'xdkj', '24.39', 42505.5, 1.99, NULL, 115515, 21340, NULL),
(1177, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '浙江', 6.16, '002563', 0.315, 144539, '服饰', 706417, '森马服饰', 91683.4, 3.18, 31.07, 'senmafushi', 'smfs', '10.89', 379571, 2.83, NULL, 992624, 134000, NULL),
(1178, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '江苏', 3.97, '002564', 0.062, 200909, '化工机械', 468086, '天沃科技', 49876.9, 1.81, 57.78, 'tianwokeji', 'twkj', '7.57', 152715, 2.06, NULL, 718735, 73971.2, NULL),
(1179, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '上海', 2.43, '002565', 0.074, 63116.8, '造纸', 144997, '上海绿新', 68733.8, 2.52, 41.27, 'shanghailvxin', 'shlx', '7.47', 59760.8, 0.86, NULL, 324924, 69668, NULL),
(1180, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '吉林', 5.35, '002566', 0.167, 27903.5, '中成药', 235642, '益盛药业', 20651.9, 2.9, 46.45, 'yishengyaoye', 'ysyy', '11.92', 82973.6, 2.51, NULL, 276162, 33095.2, NULL),
(1181, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '湖南', 4.18, '002567', 0.054, 128306, '饲料', 143827, '唐人神', 41985.6, 1.84, 71.58, 'tangrenshen', 'trs', '0.00', 75585.7, 1.8, NULL, 366393, 42078.6, NULL),
(1182, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '上海', 3.48, '002568', 1.368, 32466.5, '食品', 152791, '百润股份', 10751.9, 21.89, 27.81, 'bairungufen', 'brgf', '22.96', 21396.5, 0.48, NULL, 211963, 44800, NULL),
(1183, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '浙江', 3.58, '002569', -0.041, 15522.1, '服饰', 54962.4, '步森股份', 13802.2, 4.44, 0, 'busengufen', 'bsgf', '0.00', 31881.4, 2.28, NULL, 76537.1, 14001, NULL),
(1184, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '浙江', 3.39, '002570', -0.101, 162780, '乳制品', 247248, '贝因美', 101862, 3.13, 0, 'beiyinmei', 'bym', '13.39', 118346, 1.16, NULL, 467102, 102252, NULL),
(1185, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '安徽', 4.05, '002571', 0.013, 64431, '玻璃', 94072.2, '德力股份', 24707.6, 4.56, 696.02, 'deligufen', 'dlgf', '14.84', 90377.4, 2.31, NULL, 215158, 39195.1, NULL),
(1186, '2016-06-05 13:21:36', '2016-06-05 13:21:36', '广东', 4.42, '002572', 0.306, 54752.4, '家居用品', 138298, '索菲亚', 26682.4, 7.87, 56.75, 'suofeiya', 'sfy', '53.25', 81470.6, 1.85, NULL, 277513, 44099, NULL),
(1187, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '北京', 2.4, '002573', 0.195, 203882, '环境保护', 179475, '清新环境', 106491, 6.69, 41.13, 'qingxinhuanjing', 'qxhj', '18.30', 66571.3, 0.62, NULL, 518929, 106560, NULL),
(1188, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '浙江', 5.79, '002574', 0.126, 8899.87, '服饰', 462819, '明牌珠宝', 52800, 3.95, 90.96, 'mingpaizhubao', 'mpzb', '10.87', 165074, 3.13, NULL, 485734, 52800, NULL),
(1189, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '广东', 1.51, '002575', 0.022, 41541.1, '文教休闲', 33091.3, '群兴玩具', 57992, 10.96, 379.7, 'qunxingwanju', 'qxwj', '11.30', 15371.7, 0.26, NULL, 98831.9, 58872, NULL),
(1190, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '江苏', 5.12, '002576', 0.019, 28103.4, '电气设备', 80387.4, '通达动力', 11852.4, 3.05, 420.08, 'tongdadongli', 'tddl', '20.92', 54705.9, 3.31, NULL, 113846, 16510, NULL),
(1191, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '深圳', 4.97, '002577', -0.019, 29878.9, '电脑设备', 91370.6, '雷柏科技', 28125.2, 16.21, 0, 'leibokeji', 'lbkj', '48.91', 98571.8, 3.47, NULL, 194735, 28397.7, NULL),
(1192, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '福建', 2.26, '002578', 0.035, 49739.4, '铝', 49605, '闽发铝业', 26504.8, 2.85, 91.12, 'minfalvye', 'mfly', '8.98', 32237, 0.75, NULL, 133658, 42950, NULL),
(1193, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '广东', 1.8, '002579', 0.03, 59196.2, '元器件', 33379, '中京电子', 35046, 3.94, 119.87, 'zhongjingdianzi', 'zjdz', '14.81', 14640.1, 0.42, NULL, 113113, 35046, NULL),
(1194, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '山东', 4.9, '002580', 0.086, 43330.3, '电气设备', 127917, '圣阳股份', 14919.9, 2.06, 58.95, 'shengyanggufen', 'sygf', '16.45', 61969.1, 2.85, NULL, 181227, 21755.2, NULL),
(1195, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '山东', 2.84, '002581', 0.182, 14779.2, '化工原料', 63320.3, '万昌科技', 19415.4, 6.69, 52.17, 'wanchangkeji', 'wckj', '25.59', 43448, 1.54, NULL, 82588.8, 28152.8, NULL),
(1196, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '河南', 9.63, '002582', 0.24, 49208.8, '食品', 81037.5, '好想你', 9514.4, 1.56, 31.32, 'haoxiangni', 'hxn', '33.92', 83548.6, 5.66, NULL, 220602, 14760, NULL),
(1197, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '深圳', 2.87, '002583', -0.003, 99518.1, '通信设备', 194454, '海能达', 38118.6, 4.91, 0, 'hainengda', 'hnd', '10.40', 87968.9, 1.26, NULL, 356345, 69833.2, NULL),
(1198, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '广东', 5.74, '002584', 0.238, 32540.7, '化工原料', 95713.5, '西陇化工', 10292.3, 3.62, 43.67, 'xilonghuagong', 'xlhg', '14.18', 58198, 2.91, NULL, 173136, 20000, NULL),
(1199, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '江苏', 7.21, '002585', 0.093, 191346, '塑料', 283871, '双星新材', 54048.8, 1.24, 48.08, 'shuangxingxincai', 'sxxc', '9.85', 363674, 5.07, NULL, 582152, 71732.8, NULL),
(1200, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '浙江', 2.11, '002586', 0.021, 20699.2, '建筑施工', 212225, '围海股份', 69189, 5.3, 267.99, 'weihaigufen', 'whgf', '10.17', 41947, 0.58, NULL, 389889, 72812.6, NULL),
(1201, '2016-06-05 13:21:37', '2016-06-05 13:21:37', '深圳', 1.54, '002587', 0.004, 14538.5, '元器件', 47232.9, '奥拓电子', 23763.2, 4.79, 888.59, 'aotuodianzi', 'atdz', '0.00', 2776.45, 0.07, NULL, 67880.7, 37345.1, NULL),
(1202, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '山东', 5.68, '002588', 0.56, 128040, '农药化肥', 304482, '史丹利', 35197.3, 3.95, 20, 'shidanli', 'sdl', '12.31', 86405, 1.48, NULL, 543014, 58356, NULL),
(1203, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '山东', 11.1, '002589', 0.4, 41804.8, '医药商业', 658339, '瑞康医药', 14516.2, 9.38, 139.84, 'ruikangyiyao', 'rkyy', '28.20', 213979, 7.72, NULL, 739560, 27727.2, NULL),
(1204, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '浙江', 1.87, '002590', 0.125, 46799.1, '汽车配件', 120115, '万安科技', 36039.9, 4, 29.97, 'wanankeji', 'wakj', '28.67', 6577.5, 0.16, NULL, 189423, 41256.3, NULL),
(1205, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '江西', 2.92, '002591', 0.062, 12162.8, '机械基件', 60994.4, '恒大高新', 15097.1, 4.16, 98.14, 'hengdagaoxin', 'hdgx', '0.00', 30507.5, 1.16, NULL, 92390.3, 26204, NULL),
(1206, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '广西', 5.5, '002592', 0.31, 16955.3, '运输设备', 83996.1, '八菱科技', 11357, 8.39, 74.53, 'balingkeji', 'blkj', '32.35', 65754.1, 2.64, NULL, 159198, 24933.7, NULL),
(1207, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '福建', 7.45, '002593', 0.11, 65981, '汽车配件', 231941, '日上集团', 13085.4, 2.11, 77.53, 'rishangjituan', 'rsjt', '7.35', 119686, 5.13, NULL, 326597, 23310, NULL),
(1208, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '深圳', 10.44, '002594', 0.188, 2966470, '汽车整车', 3928000, '比亚迪', 74675.6, 4.39, 121.5, 'biyadi', 'byd', '60.00', 1029830, 4.16, NULL, 9525840, 247600, NULL),
(1209, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '山东', 3.34, '002595', 0.394, 100724, '专用机械', 174080, '豪迈科技', 41445.2, 5.98, 25.38, 'haomaikeji', 'hmkj', '20.87', 50634.4, 0.63, NULL, 304338, 80000, NULL),
(1210, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '海南', 5.05, '002596', -0.071, 47987.8, '其他建材', 106264, '海南瑞泽', 15849.2, 3.35, 0, 'hainanruize', 'hnrz', '29.27', 81453.4, 3.04, NULL, 203899, 26777.9, NULL),
(1211, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '安徽', 3.46, '002597', 0.208, 125110, '化工原料', 182908, '金禾实业', 55485.5, 2.06, 17.18, 'jinheshiye', 'jhsy', '13.36', 50959.3, 0.9, NULL, 350609, 56832, NULL),
(1212, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '山东', 2.33, '002598', 0.088, 22742.8, '机械基件', 66500.1, '山东章鼓', 26388.8, 4.07, 54.23, 'shandongzhanggu', 'sdzg', '11.55', 21169.9, 0.68, NULL, 98078.8, 31200, NULL),
(1213, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '北京', 4.54, '002599', 0.094, 52886.2, '广告包装', 47217.9, '盛通股份', 8981.25, 3.62, 87.26, 'shengtonggufen', 'stgf', '33.45', 27160.7, 2.06, NULL, 122609, 13200, NULL),
(1214, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '广东', 1.92, '002600', 0.006, 77137.5, '元器件', 206587, '江粉磁材', 38768.2, 3.51, 525.39, 'jiangfencicai', 'jfcc', '12.75', 45177.7, 0.71, NULL, 316602, 63560, NULL),
(1215, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '河南', 11.7, '002601', 0.24, 158445, '化工原料', 245203, '佰利联', 16426.2, 2, 51.29, 'baililian', 'bll', '13.46', 139169, 6.81, NULL, 576133, 20442.4, NULL),
(1216, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '浙江', 3.62, '002602', 0.14, 96330.3, '汽车配件', 140655, '世纪华通', 56597.8, 3.66, 47.12, 'shijihuatong', 'sjht', '20.42', 189499, 1.85, NULL, 456117, 102709, NULL),
(1217, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '河北', 4.19, '002603', 0.198, 142618, '中成药', 235643, '以岭药业', 88611.7, 3.18, 33.75, 'yilingyaoye', 'ylyy', '15.74', 167196, 1.48, NULL, 549607, 112650, NULL),
(1218, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '山东', 3.72, '002604', 0.1, 52473, '食品', 138906, '龙力生物', 43214, 2.22, 58.93, 'longlishengwu', 'llsw', '9.71', 89643, 1.78, NULL, 257361, 50402.6, NULL),
(1219, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '上海', 2.71, '002605', 0.167, 21568.7, '文教休闲', 74104.4, '姚记扑克', 25465.9, 10.72, 87.03, 'yaojipuke', 'yjpk', '15.62', 16354.6, 0.44, NULL, 150242, 37400, NULL),
(1220, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '辽宁', 3.51, '002606', -0.067, 44680.2, '电气设备', 80320.9, '大连电瓷', 15031.2, 2.92, 0, 'daliandianci', 'dldc', '19.13', 30383.5, 1.52, NULL, 138784, 20000, NULL),
(1221, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '安徽', 2.27, '002607', 0.007, 74497.6, '汽车服务', 172390, '亚夏汽车', 24930, 3.09, 481.74, 'yaxiaqiche', 'yxqc', '11.02', 20232.2, 0.57, NULL, 345717, 35692.8, NULL),
(1222, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '江苏', -0.4, '002608', -0.97, 246424, '船舶', 551912, '*ST舜船', 32281.4, -21.98, 0, '*STshunchuan', '*STsc', '0.00', 51993.1, 1.39, NULL, 842580, 37485, NULL),
(1223, '2016-06-05 13:21:38', '2016-06-05 13:21:38', '深圳', 1.38, '002609', 0.053, 10321.7, '软件服务', 71030.6, '捷顺科技', 27591.1, 8.87, 115.48, 'jieshunkeji', 'jskj', '15.80', 1619.31, 0.03, NULL, 108590, 60104.2, NULL),
(1224, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '江苏', 3.24, '002610', 0.066, 441556, '电气设备', 330245, '爱康科技', 58996.3, 2.54, 61.83, 'aikangkeji', 'akkj', '18.76', 140499, 1.94, NULL, 946745, 72500, NULL),
(1225, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '广东', 1.6, '002611', 0.045, 42384.5, '轻工机械', 105685, '东方精工', 31445.4, 5.02, 89.56, 'dongfangjinggong', 'dfjg', '0.00', 5404, 0.09, NULL, 198085, 58059.2, NULL),
(1226, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '北京', 11.47, '002612', 0.216, 35330.9, '服饰', 220439, '朗姿股份', 10010.2, 2.14, 56.63, 'langzigufen', 'lzgf', '0.00', 165175, 8.26, NULL, 325654, 20000, NULL),
(1227, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '河南', 2.07, '002613', 0.033, 60304.9, '专用机械', 121033, '北玻股份', 36464.5, 2.57, 80.94, 'beibogufen', 'bbgf', '7.35', 43691.7, 0.61, NULL, 201196, 72090, NULL),
(1228, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '福建', 3.98, '002614', 0.106, 56561.9, '医疗保健', 240133, '蒙发利', 27601.8, 2.11, 39.54, 'mengfali', 'mfl', '11.98', 110110, 1.98, NULL, 334878, 55477.5, NULL),
(1229, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '浙江', 3.37, '002615', 0.081, 27074.7, '家居用品', 36152.1, '哈尔斯', 10285.5, 3.32, 68.93, 'haersi', 'hes', '18.99', 25302.1, 1.39, NULL, 77417.9, 18240, NULL),
(1230, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '广东', 4.72, '002616', 0.139, 94396.1, '环境保护', 86258.2, '长青集团', 16820.4, 4.36, 73.98, 'zhangqingjituan', 'zqjt', '20.84', 94573.5, 2.63, NULL, 261132, 35933.3, NULL),
(1231, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '浙江', 4.89, '002617', 0.177, 46823, '电气设备', 123262, '露笑科技', 7404.75, 4.33, 59.89, 'luxiaokeji', 'lxkj', '0.00', 52542.4, 2.92, NULL, 226085, 18000, NULL),
(1232, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '深圳', 8.84, '002618', 0.159, 78101.8, '元器件', 74761.5, '丹邦科技', 18264, 1.94, 53.99, 'danbangkeji', 'dbkj', '24.18', 107727, 5.9, NULL, 228268, 18264, NULL),
(1233, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '浙江', 9.71, '002619', 0.24, 34555.3, '水泥', 84386, '巨龙管业', 9909.66, 2.2, 55.75, 'julongguanye', 'jlgy', '15.66', 263898, 8.25, NULL, 360577, 32000.8, NULL),
(1234, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '深圳', 8.79, '002620', 0.317, 15372.8, '装修装饰', 179960, '瑞和股份', 9343.38, 2.29, 31.65, 'ruihegufen', 'rhgf', '31.20', 56274.2, 4.69, NULL, 217595, 12000, NULL),
(1235, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '辽宁', 4.89, '002621', 0.109, 7091.33, '专用机械', 98076.5, '三垒股份', 5625, 3.51, 78.61, 'sanleigufen', 'slgf', '19.33', 50795.2, 2.26, NULL, 114260, 22500, NULL),
(1236, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '吉林', 2.64, '002622', 0.09, 10618.3, '电气设备', 72442, '永大集团', 26085.5, 9.59, 140.92, 'yongdajituan', 'ydjt', '11.06', 42062.1, 1, NULL, 144196, 42000, NULL),
(1237, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '江苏', 13.42, '002623', 0.292, 58268.6, '玻璃', 139418, '亚玛顿', 16000, 1.63, 37.43, 'yamadun', 'ymd', '32.65', 148672, 9.29, NULL, 264069, 16000, NULL),
(1238, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '浙江', 1.59, '002624', 0.081, 771.14, '影视音像', 178507, '完美环球', 14480.1, 13.22, 129.3, 'wanmeihuanqiu', 'wmhq', '39.03', 2275.1, 0.05, NULL, 224557, 48770.7, NULL),
(1239, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '浙江', 1.66, '002625', 0.066, 12826.6, '汽车配件', 21770.2, '龙生股份', 18799.7, 16.1, 202.85, 'longshenggufen', 'lsgf', '44.20', 2804.03, 0.09, NULL, 64346.7, 30075.4, NULL),
(1240, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '福建', 2.47, '002626', 0.148, 51151.1, '食品', 106401, '金达威', 57600, 3.41, 28.49, 'jindawei', 'jdw', '16.14', 26921.9, 0.47, NULL, 191862, 57600, NULL),
(1241, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '湖北', 6.73, '002627', 0.188, 70470.3, '公路', 95317.1, '宜昌交运', 13069.4, 2.18, 39.11, 'yichangjiaoyun', 'ycjy', '20.38', 41512.2, 3.11, NULL, 200281, 13350, NULL),
(1242, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '四川', 3.53, '002628', 0.015, 7347.68, '建筑施工', 420337, '成都路桥', 63559.1, 1.56, 182.08, 'chengdouluqiao', 'cdlq', '6.84', 83869.9, 1.14, NULL, 605128, 73741.6, NULL),
(1243, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '四川', 1.71, '002629', -0.106, 11870.2, '石油贸易', 64750.2, '仁智油服', 33012.4, 4.47, 0, 'renzhiyoufu', 'rzyf', '12.08', 8860.48, 0.22, NULL, 88726.9, 41194.8, NULL),
(1244, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '四川', 3.87, '002630', 0.153, 98590.9, '专用机械', 601814, '华西能源', 60588.3, 2.13, 26.85, 'huaxinengyuan', 'hxny', '0.00', 162420, 2.2, NULL, 824442, 73800, NULL),
(1245, '2016-06-05 13:21:39', '2016-06-05 13:21:39', '江苏', 2.3, '002631', 0.125, 32088.2, '家居用品', 98116.9, '德尔家居', 28362.7, 4.66, 42.89, 'deerjiaju', 'dejj', '24.95', 40838.7, 0.63, NULL, 170201, 64937.4, NULL),
(1246, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 4.64, '002632', 0.09, 49031, '化工原料', 78977, '道明光学', 26078.6, 2.76, 78.41, 'daomingguangxue', 'dmgx', '11.61', 84352.3, 2.85, NULL, 150228, 29586.1, NULL),
(1247, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 3.32, '002633', -0.11, 24746.4, '机械基件', 40427.4, '*ST申科', 8671.87, 4.91, 0, '*STshenke', '*STsk', '23.42', 29935.2, 2, NULL, 76061.6, 15000, NULL),
(1248, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 5.13, '002634', 0.131, 19386.6, '服饰', 36025.1, '棒杰股份', 7026.83, 3.06, 59.89, 'bangjiegufen', 'bjgf', '10.89', 34607.2, 2.7, NULL, 76493.4, 12805.6, NULL),
(1249, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '江苏', 5.81, '002635', 0.19, 73093.1, '电脑设备', 188941, '安洁科技', 18364.8, 3.02, 48.77, 'anjiekeji', 'ajkj', '35.68', 124955, 3.22, NULL, 307022, 38863.3, NULL),
(1250, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '上海', 1.88, '002636', 0.05, 74369.6, '元器件', 169206, '金安国纪', 24638.8, 11.72, 219.64, 'jinanguoji', 'jagj', '15.59', 19133.3, 0.26, NULL, 250497, 72800, NULL),
(1251, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 7.28, '002637', 0.076, 59926.3, '日用化工', 106279, '赞宇科技', 11337.7, 2.05, 98.75, 'zanyukeji', 'zykj', '12.52', 62695.8, 3.92, NULL, 202092, 16000, NULL),
(1252, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '广东', 5.97, '002638', 0.045, 34892.6, '半导体', 252945, '勤上光电', 36777, 2.57, 169.88, 'qinshangguangdian', 'qsgd', '20.44', 133409, 3.56, NULL, 320362, 37467, NULL),
(1253, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '福建', 7.88, '002639', 0.043, 70656.7, '专用机械', 118880, '雪人股份', 12077.5, 3.29, 303.57, 'xuerengufen', 'xrgf', '9.10', 114045, 5.7, NULL, 242643, 20000, NULL),
(1254, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '山西', 8.97, '002640', 0.358, 3846.03, '服饰', 128310, '跨境通', 9791.99, 6.14, 76.85, 'kuajingtong', 'kjt', '32.30', 139643, 6.59, NULL, 239979, 21180.2, NULL),
(1255, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 2.63, '002641', 0.138, 115925, '塑料', 177306, '永高股份', 68418, 2.8, 26.57, 'yonggaogufen', 'yggf', '8.06', 40686.5, 0.47, NULL, 375108, 86400, NULL),
(1256, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '北京', 6.3, '002642', 0.151, 25203.2, '软件服务', 157321, '荣之联', 16755.8, 4.42, 92.29, 'rongzhilian', 'rzl', '38.90', 173287, 4.34, NULL, 314234, 39922.6, NULL),
(1257, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '山东', 7.07, '002643', 0.22, 60558.6, '化工原料', 166503, '万润股份', 26775.2, 4.06, 69.62, 'wanrungufen', 'wrgf', '47.50', 162986, 4.8, NULL, 270634, 33987.1, NULL),
(1258, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '甘肃', 2.37, '002644', 0.038, 15719.9, '中成药', 105467, '佛慈制药', 44429, 5.36, 169.17, 'focizhiyao', 'fczy', '11.13', 63440.8, 1.24, NULL, 152456, 51065.7, NULL),
(1259, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '江苏', 4.4, '002645', 0.008, 21842, '专用机械', 52718.2, '华宏科技', 14372.3, 5.03, 1431.6, 'huahongkeji', 'hhkj', '20.38', 31285.1, 2.01, NULL, 84433.2, 15600.8, NULL),
(1260, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '青海', 5.1, '002646', 0.41, 49956, '白酒', 194402, '青青稞酒', 45000, 3.7, 23.06, 'qingqingkejiu', 'qqkj', '20.66', 85475.6, 1.9, NULL, 298384, 45000, NULL),
(1261, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 4.52, '002647', 0.013, 27502.9, '电气设备', 208170, '宏磊股份', 9162.75, 7.83, 1324.32, 'hongleigufen', 'hlgf', '0.00', 50899.3, 2.32, NULL, 259233, 21958.3, NULL),
(1262, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '浙江', 4.33, '002648', -0.143, 398327, '化工原料', 297138, '卫星石化', 80000, 1.71, 0, 'weixingshihua', 'wxsh', '8.74', 148578, 1.86, NULL, 779429, 80000, NULL),
(1263, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '北京', 9.77, '002649', 0.767, 29131.7, '软件服务', 114557, '博彦科技', 16428.8, 3.33, 21.25, 'boyankeji', 'bykj', '37.46', 102005, 6.08, NULL, 215887, 16770, NULL),
(1264, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '湖南', 4, '002650', 0.322, 32612.8, '食品', 74192.8, '加加食品', 45121.3, 3.2, 19.88, 'jiajiashipin', 'jjsp', '7.34', 89758.5, 1.95, NULL, 243795, 46080, NULL),
(1265, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '四川', 4.43, '002651', 0.155, 21386.3, '专用机械', 190171, '利君股份', 13280, 5.79, 82.5, 'lijungufen', 'ljgf', '8.33', 93659.5, 2.34, NULL, 221269, 40100, NULL),
(1266, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '江苏', 1.89, '002652', 0.083, 36331.1, '其他建材', 131145, '扬子新材', 23298.6, 7.19, 81.74, 'yangzixincai', 'yzxc', '12.60', 8909.28, 0.28, NULL, 180893, 32004, NULL),
(1267, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '西藏', 1.95, '002653', 0.199, 39696.8, '化学制药', 162981, '海思科', 39266.3, 11.21, 54.96, 'haisike', 'hsk', '16.02', 2792.73, 0.03, NULL, 280261, 108027, NULL),
(1268, '2016-06-05 13:21:40', '2016-06-05 13:21:40', '深圳', 5.22, '002654', 0.11, 50187.1, '半导体', 108600, '万润科技', 12118.1, 4.6, 140.27, 'wanrunkeji', 'wrkj', '0.00', 79078.2, 3.27, NULL, 192666, 24206, NULL),
(1269, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '山东', 1.73, '002655', 0.025, 33608.9, '元器件', 53625.1, '共达电声', 36000, 8.96, 306.92, 'gongdadiansheng', 'gdds', '15.34', 6423.6, 0.18, NULL, 106244, 36000, NULL),
(1270, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 6.12, '002656', 0.12, 10330.9, '服饰', 157096, '卡奴迪路', 15968.8, 2.57, 65.78, 'kanudilu', 'kndl', '14.95', 53480.9, 2.67, NULL, 251819, 20000, NULL),
(1271, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '北京', 4.97, '002657', 0.265, 8431.28, '软件服务', 110496, '中科金财', 16539.1, 9.29, 87.2, 'zhongkejincai', 'zkjc', '56.70', 83913.4, 2.65, NULL, 236017, 31697.9, NULL),
(1272, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '北京', 2.31, '002658', 0.148, 13302, '电器仪表', 133787, '雪迪龙', 28527.5, 7.58, 59.22, 'xuedilong', 'xdl', '16.41', 24627.4, 0.41, NULL, 162978, 60488, NULL),
(1273, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '江苏', 1.9, '002659', -0.029, 34547.6, '建筑施工', 113358, '中泰桥梁', 31100, 6.25, 0, 'zhongtaiqiaoliang', 'ztql', '18.88', 18444.3, 0.59, NULL, 200281, 31100, NULL),
(1274, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '深圳', 3, '002660', -0.11, 43182.8, '电气设备', 88417.4, '茂硕电源', 18156.2, 2.72, 0, 'maoshuodianyuan', 'msdy', '13.49', 47529.4, 1.71, NULL, 158813, 27734.1, NULL),
(1275, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '湖南', 8.7, '002661', 0.61, 36984.5, '食品', 51301.9, '克明面业', 8221.75, 3.58, 26.27, 'kemingmianye', 'kmmy', '16.93', 43032.9, 5.03, NULL, 114795, 8552.53, NULL),
(1276, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '北京', 5.53, '002662', 0.37, 109882, '汽车配件', 253384, '京威股份', 38849.4, 1.94, 17.13, 'jingweigufen', 'jwgf', '13.82', 209147, 2.79, NULL, 478421, 75000, NULL),
(1277, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 2.33, '002663', 0.088, 17982.6, '建筑施工', 470586, '普邦园林', 73910.6, 3.02, 39.71, 'pubangyuanlin', 'pbyl', '0.00', 106197, 0.66, NULL, 541964, 161152, NULL),
(1278, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '浙江', 3.42, '002664', 0.215, 33766.1, '电气设备', 114724, '信质电机', 34221.4, 5.57, 44.19, 'xinzhidianji', 'xzdj', '30.90', 43760, 1.09, NULL, 174559, 40002, NULL),
(1279, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '北京', 3.66, '002665', 0.14, 46595.6, '电气设备', 301209, '首航节能', 51688.9, 5.75, 80.56, 'shouhangjieneng', 'shjn', '8.42', 130207, 1.78, NULL, 459986, 73004.8, NULL),
(1280, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 3.43, '002666', 0.096, 32322.1, '化工原料', 232737, '德联集团', 22925.2, 2.23, 39.59, 'delianjituan', 'dljt', '8.36', 135927, 1.8, NULL, 298447, 75432.9, NULL),
(1281, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '辽宁', 5.64, '002667', 0.09, 10777.3, '工程机械', 69143.2, '鞍重股份', 8594.25, 4.22, 131.85, 'anzhonggufen', 'azgf', '0.00', 32896.1, 2.42, NULL, 87862, 13596, NULL),
(1282, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 9.68, '002668', 0.794, 68875, '家用电器', 272411, '奥马电器', 11388.8, 3.64, 22.16, 'aomadianqi', 'amdq', '61.66', 45101.4, 2.73, NULL, 379669, 16535, NULL),
(1283, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '上海', 3.34, '002669', 0.295, 18545.6, '化工原料', 53902.6, '康达新材', 13051, 4.58, 25.87, 'kangdaxincai', 'kdxc', '21.19', 22952.8, 1.15, NULL, 81180.8, 20000, NULL),
(1284, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 3.88, '002670', 0.145, 30792.6, '电气设备', 91315.7, '华声股份', 13817.4, 4.72, 63.09, 'huashenggufen', 'hsgf', '27.88', 42909, 2.15, NULL, 127611, 20000, NULL),
(1285, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '山东', 3.33, '002671', 0.043, 52190.4, '其他建材', 159010, '龙泉股份', 31455.1, 7.18, 277.48, 'longquangufen', 'lqgf', '12.04', 65879.3, 1.48, NULL, 249338, 44369.6, NULL),
(1286, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 2.98, '002672', 0.2, 90444.4, '环境保护', 247516, '东江环保', 42918.8, 5.45, 40.66, 'dongjianghuanbao', 'djhb', '0.00', 35995.1, 0.41, NULL, 615277, 86951.7, NULL),
(1287, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '陕西', 4.16, '002673', 0.56, 17013, '证券', 0, '西部证券', 230000, 4.22, 16.19, 'xibuzhengquan', 'xbzq', '24.77', 544138, 1.95, NULL, 6001920, 279557, NULL),
(1288, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '福建', 6.56, '002674', 0.059, 53902.2, '纺织', 203918, '兴业科技', 24057.2, 1.68, 94.25, 'xingyekeji', 'xykj', '15.32', 71962.5, 2.97, NULL, 270905, 24247.8, NULL),
(1289, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '山东', 6.9, '002675', 0.289, 32375.6, '化学制药', 87743, '东诚药业', 12274.2, 5.33, 63.76, 'dongchengyaoye', 'dcyy', '40.85', 57380, 3.32, NULL, 146799, 17280, NULL),
(1290, '2016-06-05 13:21:41', '2016-06-05 13:21:41', '广东', 6.71, '002676', 0.137, 42086.6, '塑料', 112404, '顺威股份', 15862.4, 3.22, 78.76, 'shunweigufen', 'swgf', '21.89', 62074.2, 3.88, NULL, 176567, 16000, NULL),
(1291, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '浙江', 2.35, '002677', 0.135, 18625.6, '家用电器', 67097.7, '浙江美大', 10000, 8.7, 75.68, 'zhejiangmeida', 'zjmd', '16.96', 27237, 0.68, NULL, 105881, 40000, NULL),
(1292, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '广东', 1.95, '002678', 0.095, 55660.8, '文教休闲', 151048, '珠江钢琴', 95340.1, 6.62, 67.74, 'zhujianggangqin', 'zjgq', '12.14', 31810, 0.33, NULL, 242368, 95600, NULL),
(1293, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '福建', 4.95, '002679', 0.003, 3112.05, '林业', 139273, '福建金森', 13868, 2.79, 2097.49, 'fujianjinsen', 'fjjs', '22.95', 34162.6, 2.46, NULL, 159139, 13868, NULL),
(1294, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '江苏', 5.21, '002680', 0.019, 11238.6, '工程机械', 62112.1, '黄海机械', 6638.5, 4.64, 626.06, 'huanghaijixie', 'hhjx', '39.20', 39407.1, 2.9, NULL, 76052.5, 13600, NULL),
(1295, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '深圳', 3.71, '002681', 0.17, 29201.4, '家用电器', 146596, '奋达科技', 20927.3, 6.97, 78.79, 'fendakeji', 'fdkj', '16.74', 111985, 1.81, NULL, 288372, 61761.8, NULL),
(1296, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '福建', 3.97, '002682', 0.084, 77998.1, '公路', 149250, '龙洲股份', 26231.4, 2.33, 54.83, 'longzhougufen', 'lzgf', '0.00', 29336.9, 1.09, NULL, 348261, 26859.3, NULL),
(1297, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '广东', 3.41, '002683', 0.109, 73197.1, '化工原料', 271953, '宏大爆破', 47336, 4.13, 64.31, 'hongdabaopo', 'hdbp', '8.46', 124970, 2.05, NULL, 398128, 60990, NULL),
(1298, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '广东', 3.03, '002684', 0.012, 30994.3, '电气设备', 49580.7, '猛狮科技', 20587.4, 5.23, 670.22, 'mengshikeji', 'mskj', '30.00', 38580.1, 1.39, NULL, 130188, 27753.4, NULL),
(1299, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '江苏', 1.43, '002685', 0.018, 16551.7, '工程机械', 92145.6, '华东重机', 56000, 4.95, 195.73, 'huadongzhongji', 'hdzj', '0.00', 7782.72, 0.14, NULL, 119847, 56000, NULL),
(1300, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '浙江', 2.03, '002686', 0.11, 19100.2, '专用机械', 63524.4, '亿利达', 29326.5, 8.36, 77.32, 'yilida', 'yld', '0.00', 22430.9, 0.55, NULL, 121141, 40801.5, NULL),
(1301, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '浙江', 2.71, '002687', 0.098, 59043, '服饰', 52235.6, '乔治白', 33914.8, 2.63, 36.33, 'qiaozhibai', 'qzb', '13.10', 36338.9, 1.02, NULL, 126959, 35485.2, NULL),
(1302, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '内蒙', 4.5, '002688', 0.234, 46403.3, '化学制药', 94449, '金河生物', 20827.3, 2.73, 26.29, 'jinheshengwu', 'jhsw', '9.90', 49801.6, 2.29, NULL, 169689, 21784, NULL),
(1303, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '辽宁', 1.38, '002689', 0.064, 63777.6, '运输设备', 159316, '博林特', 93641, 4.91, 53.14, 'bolinte', 'blt', '7.93', 12880.7, 0.13, NULL, 262469, 96235.5, NULL),
(1304, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '安徽', 2.58, '002690', 0.167, 22639.6, '专用机械', 164219, '美亚光电', 32675.3, 6.91, 53.39, 'meiyaguangdian', 'mygd', '21.83', 39673.5, 0.59, NULL, 192153, 67600, NULL),
(1305, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '河北', 4.18, '002691', 0.069, 6789.86, '专用机械', 75424.4, '冀凯股份', 19818.6, 4.07, 122.91, 'jikaigufen', 'jkgf', '0.00', 44227.9, 2.21, NULL, 96385.5, 20000, NULL),
(1306, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '江苏', 4.13, '002692', 0.221, 49149.9, '电气设备', 238978, '远程电缆', 20202.2, 2.58, 24.06, 'yuanchengdianlan', 'ycdl', '7.73', 54271.2, 1.66, NULL, 317995, 32643, NULL),
(1307, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '海南', 2.29, '002693', 0.053, 21551, '化学制药', 29826.1, '双成药业', 40500, 4.01, 86.17, 'shuangchengyaoye', 'scyy', '9.51', 34176.4, 0.82, NULL, 127086, 41918.6, NULL),
(1308, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '湖北', 3.05, '002694', 0.049, 74209.6, '塑料', 143225, '顾地科技', 29557.1, 2.87, 89.61, 'gudikeji', 'gdkj', '16.05', 34785.6, 1.01, NULL, 242051, 34560, NULL),
(1309, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '江西', 11.88, '002695', 0.3, 32324.1, '食品', 118771, '煌上煌', 11325.5, 1.79, 36.23, 'huangshanghuang', 'hsh', '33.80', 94371.1, 7.45, NULL, 179794, 12665.8, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1310, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '广西', 5.29, '002696', 0.041, 53061.8, '渔业', 92696.2, '百洋股份', 10377, 2.21, 142.09, 'baiyanggufen', 'bygf', '17.79', 46820.7, 2.66, NULL, 163619, 17600, NULL),
(1311, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '四川', 2.52, '002697', 0.147, 80472.1, '超市连锁', 247386, '红旗连锁', 43098.9, 3.69, 31.64, 'hongqiliansuo', 'hqls', '5.57', 44402.8, 0.56, NULL, 348812, 80000, NULL),
(1312, '2016-06-05 13:21:42', '2016-06-05 13:21:42', '黑龙江', 4.33, '002698', 0.295, 18294.7, '化工机械', 168538, '博实股份', 10771.7, 6.9, 50.49, 'boshigufen', 'bsgf', '18.40', 46896.5, 1.17, NULL, 203736, 40100, NULL),
(1313, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '浙江', 2.58, '002699', 0.059, 24335.3, '文教休闲', 85945.7, '美盛文化', 13882, 13.29, 289.28, 'meishengwenhua', 'mswh', '39.03', 38478.4, 0.86, NULL, 132289, 44600, NULL),
(1314, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '新疆', 1.86, '002700', 0.132, 34980.9, '供气供热', 49095.1, '新疆浩源', 17215.5, 5.31, 37.44, 'xinjianghaoyuan', 'xjhy', '14.06', 2375.48, 0.06, NULL, 97085.6, 42242.7, NULL),
(1315, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '北京', 3.98, '002701', 0.564, 264878, '广告包装', 453397, '奥瑞金', 51858.4, 5.48, 19.32, 'aoruijin', 'arj', '8.92', 104443, 1.06, NULL, 855586, 98134.4, NULL),
(1316, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '福建', 2.76, '002702', -0.024, 32723.4, '食品', 46689.3, '海欣食品', 12280, 9.08, 0, 'haixinshipin', 'hxsp', '20.75', 26579.3, 0.94, NULL, 91479, 28280, NULL),
(1317, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '浙江', 4.51, '002703', 0.114, 45566.6, '汽车配件', 132968, '浙江世宝', 1500, 7.55, 149.01, 'zhejiangshibao', 'zjsb', '26.25', 66001.2, 2.09, NULL, 201261, 31585.8, NULL),
(1318, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 4.91, '002705', 0.228, 118933, '家用电器', 317476, '新宝股份', 10937.8, 2.94, 31.62, 'xinbaogufen', 'xbgf', '15.37', 71041, 1.61, NULL, 485954, 44200.1, NULL),
(1319, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '上海', 7.15, '002706', 0.519, 9177.87, '电气设备', 80091.4, '良信电器', 3473.6, 4.71, 32.43, 'liangxindianqi', 'lxdq', '26.33', 44141.3, 3.84, NULL, 115752, 11499.4, NULL),
(1320, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '北京', 7, '002707', 0.3, 1033.3, '旅游服务', 208336, '众信旅游', 8218.98, 7.15, 89.26, 'zhongxinlvyou', 'zxly', '21.13', 89208.8, 4.27, NULL, 281750, 20876.8, NULL),
(1321, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '江苏', 4.87, '002708', 0.165, 26928.3, '汽车配件', 78254.4, '光洋股份', 6865.1, 3.45, 50.83, 'guangyanggufen', 'gygf', '13.88', 48754.9, 2.62, NULL, 111553, 18590.6, NULL),
(1322, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 7.16, '002709', 0.244, 40491.6, '化工原料', 56011.6, '天赐材料', 5670.77, 3.88, 56.97, 'tiancicailiao', 'tccl', '58.95', 40634.9, 3.37, NULL, 129992, 12041.3, NULL),
(1323, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 3.76, '002711', 0.21, 18433.8, '仓储物流', 150783, '欧浦智网', 12904, 4.87, 43.58, 'oupuzhiwang', 'opzw', '27.93', 33609.2, 1.02, NULL, 211292, 33002.2, NULL),
(1324, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '浙江', 10.65, '002712', 0.394, 340.7, '广告包装', 121904, '思美传媒', 2905.22, 4.27, 57.55, 'simeichuanmei', 'smcm', '0.00', 40142.1, 4.56, NULL, 124928, 8798.95, NULL),
(1325, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '北京', 3.36, '002713', -0.11, 10591.7, '装修装饰', 130677, '东易日盛', 6241.31, 4.41, 0, 'dongyirisheng', 'dyrs', '29.74', 39289, 1.57, NULL, 184548, 24968.1, NULL),
(1326, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '河南', 4.09, '002714', 0.097, 207782, '农业综合', 183068, '牧原股份', 14325.1, 10.77, 227.62, 'muyuangufen', 'mygf', '53.46', 49633.7, 1.03, NULL, 516504, 48400, NULL),
(1327, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 5.23, '002715', -0.147, 24383.4, '汽车配件', 41336.3, '登云股份', 5211.08, 4.22, 0, 'dengyungufen', 'dygf', '33.70', 24281.5, 2.64, NULL, 73294.7, 9200, NULL),
(1328, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '湖南', 3.81, '002716', 0.32, 66236.8, '小金属', 473181, '金贵银业', 28632.2, 2.34, 31.09, 'jinguiyinye', 'jgyy', '14.47', 52096.3, 1.04, NULL, 577733, 50329.1, NULL),
(1329, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 2.5, '002717', 0.215, 3624.93, '建筑施工', 199661, '岭南园林', 15320.4, 5.16, 30.02, 'lingnanyuanlin', 'lnyl', '31.79', 1623.95, 0.05, NULL, 305711, 32573.6, NULL),
(1330, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '浙江', 6.66, '002718', 0.594, 9377.42, '家居用品', 45477.7, '友邦吊顶', 2096, 4.84, 27.13, 'youbangdiaoding', 'ybdd', '58.13', 12803.6, 1.55, NULL, 61599, 8256, NULL),
(1331, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '新疆', 10.07, '002719', 0.215, 23685.1, '乳制品', 82735.3, '麦趣尔', 3380.14, 5.22, 122.22, 'maiquer', 'mqe', '42.80', 73392.2, 6.75, NULL, 131978, 10872.2, NULL),
(1332, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '北京', 9.2, '002721', 0.42, 35443.7, '服饰', 437270, '金一文化', 7296.18, 6.52, 78.45, 'jinyiwenhua', 'jywh', '18.83', 134154, 6.21, NULL, 518090, 21601.2, NULL),
(1333, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '江苏', 4.3, '002722', 0.214, 21467.5, '纺织机械', 50965.5, '金轮股份', 4574.16, 4.19, 42.08, 'jinlungufen', 'jlgf', '30.20', 20573.2, 1.53, NULL, 77164.1, 13410, NULL),
(1334, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '广东', 3.36, '002723', 0.29, 32987.3, '家用电器', 41449.3, '金莱特', 6130, 4.49, 52.96, 'jinlaite', 'jlt', '20.16', 22370.9, 1.2, NULL, 94858.2, 18670, NULL),
(1335, '2016-06-05 13:21:43', '2016-06-05 13:21:43', '深圳', 3.63, '002724', -0.039, 5397.87, '半导体', 111132, '海洋王', 5000, 3.99, 0, 'haiyangwang', 'hyw', '21.53', 36891.5, 0.92, NULL, 158732, 40000, NULL),
(1336, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '浙江', 5.41, '002725', 0.206, 34960.8, '汽车配件', 48707.1, '跃岭股份', 5296, 2.54, 33.37, 'yuelinggufen', 'ylgf', '21.05', 39317.1, 2.46, NULL, 98744.2, 16000, NULL),
(1337, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '山东', 3.39, '002726', 0.113, 44418.3, '食品', 119946, '龙大肉食', 10918, 2.7, 40.42, 'longdaroushi', 'ldrs', '15.88', 58339, 1.34, NULL, 181668, 43648, NULL),
(1338, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '云南', 8.07, '002727', 0.668, 37498, '医药商业', 280691, '一心堂', 10622.5, 5.26, 31.77, 'yixintang', 'yxt', '23.45', 83776.8, 3.22, NULL, 373414, 26030, NULL),
(1339, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '广东', 3.88, '002728', 0.204, 11847.2, '中成药', 51472, '台城制药', 5867, 5.69, 54.22, 'taichengzhiyao', 'tczy', '24.22', 33792.6, 1.69, NULL, 117968, 20000, NULL),
(1340, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '福建', 5.54, '002729', 0.189, 3630.35, '元器件', 27831.8, '好利来', 1668, 11.01, 161.55, 'haolilai', 'hll', '84.50', 17792.1, 2.67, NULL, 48442.4, 6668, NULL),
(1341, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '浙江', 5.51, '002730', 0.258, 24503.9, '电气设备', 83910.2, '电光科技', 3667, 5.9, 63.09, 'dianguangkeji', 'dgkj', '16.86', 35455, 2.42, NULL, 118901, 14667, NULL),
(1342, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '辽宁', 7.02, '002731', 0.248, 9774.21, '服饰', 178744, '萃华珠宝', 3768, 3.31, 46.75, 'cuihuazhubao', 'chzb', '24.61', 40195.6, 2.67, NULL, 198252, 15068, NULL),
(1343, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '广东', 4.67, '002732', 0.291, 25701.2, '乳制品', 58787.2, '燕塘乳业', 3935, 4.39, 35.18, 'yantangruye', 'ytry', '25.22', 31940.6, 2.03, NULL, 98364.3, 15735, NULL),
(1344, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '深圳', 5.48, '002733', 0.236, 21829.1, '电气设备', 164338, '雄韬股份', 5100, 3.16, 36.72, 'xiongtaogufen', 'xtgf', '27.00', 46361.8, 2.27, NULL, 195935, 20400, NULL),
(1345, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '江苏', 5.64, '002734', 0.29, 53559.4, '农药化肥', 37209.7, '利民股份', 3250, 5.41, 65.69, 'limingufen', 'lmgf', '29.48', 33346.6, 2.57, NULL, 110620, 13000, NULL),
(1346, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '深圳', 5.54, '002735', 0.14, 6362.14, '塑料', 41197.1, '王子新材', 2000, 5.03, 99.15, 'wangzixincai', 'wzxc', '0.00', 16263.7, 2.03, NULL, 51468.4, 8000, NULL),
(1347, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '深圳', 5.55, '002736', 1.1, 98078.2, '证券', 0, '国信证券', 120000, 3.05, 7.69, 'guoxinzhengquan', 'gxzq', '15.48', 668272, 0.81, NULL, 34804700, 820000, NULL),
(1348, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '黑龙江', 8.04, '002737', 1.25, 71124.5, '中成药', 192986, '葵花药业', 7299.95, 4.63, 29.89, 'kuihuayaoye', 'khyy', '35.43', 122168, 4.18, NULL, 312475, 29200, NULL),
(1349, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '北京', 4.8, '002738', 0.143, 17154.1, '建筑施工', 41919.6, '中矿资源', 3000, 4.27, 71.48, 'zhongkuangziyuan', 'zkzy', '28.10', 23128.2, 1.86, NULL, 71118.8, 12461, NULL),
(1350, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '北京', 7.89, '002739', 1.14, 122575, '影视音像', 316222, '万达院线', 6000, 18.03, 63.39, 'wandayuanxian', 'wdyx', '0.00', 119280, 2.13, NULL, 589639, 56000, NULL),
(1351, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '深圳', 9.32, '002740', 0.37, 2979.62, '服饰', 124585, '爱迪尔', 2500, 3.84, 50.89, 'aidier', 'ade', '16.16', 42223.6, 4.22, NULL, 128422, 10000, NULL),
(1352, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '广东', 6.05, '002741', 0.26, 17185.2, '化工原料', 64741.8, '光华科技', 3000, 5.75, 66.89, 'guanghuakeji', 'ghkj', '23.10', 32469.8, 2.71, NULL, 92161.4, 12000, NULL),
(1353, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '重庆', 8.04, '002742', 0.4, 44262.7, '其他建材', 151736, '三圣特材', 3600, 2.82, 30.09, 'sanshengtecai', 'sstc', '22.42', 54020.2, 3.75, NULL, 207309, 14400, NULL),
(1354, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '安徽', 6.07, '002743', 0.14, 50469.1, '钢加工', 248047, '富煌钢构', 3034, 3.62, 83.64, 'fuhuangganggou', 'fhgg', '14.06', 24640.9, 2.03, NULL, 316056, 12134, NULL),
(1355, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '广东', 5.6, '002745', 0.54, 226925, '半导体', 420156, '木林森', 4450, 4.63, 24.86, 'mulinsen', 'mls', '32.30', 87162.6, 1.96, NULL, 663988, 44450, NULL),
(1356, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '山东', 6.17, '002746', 0.06, 61955.6, '农业综合', 60710.2, '仙坛股份', 3985, 3.31, 189.22, 'xiantangufen', 'xtgf', '39.70', 38325.5, 2.41, NULL, 146091, 15935, NULL),
(1357, '2016-06-05 13:21:44', '2016-06-05 13:21:44', '江苏', 3.86, '002747', 0.16, 13836.9, '机械基件', 34210.4, '埃斯顿', 3000, 8.8, 118.06, 'aisidun', 'asd', '32.22', 17004.5, 1.42, NULL, 57179.6, 12000, NULL),
(1358, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '江西', 7.76, '002748', 0.21, 49486.8, '化工原料', 52562.7, '世龙实业', 3000, 3.26, 68.47, 'shilongshiye', 'slsy', '15.82', 45256, 3.77, NULL, 113505, 12000, NULL),
(1359, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '四川', 10.54, '002749', 1.37, 1847.59, '农药化肥', 79130.9, '国光股份', 1500, 4.57, 19.46, 'guoguanggufen', 'gggf', '78.51', 33063.6, 4.41, NULL, 86295.3, 7500, NULL),
(1360, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '云南', 8.49, '002750', 0.5, 26911.7, '中成药', 37752.5, '龙津药业', 1675, 7.84, 76.4, 'longjinyaoye', 'ljyy', '14.98', 28980.8, 4.34, NULL, 66724.8, 6675, NULL),
(1361, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '深圳', 5.94, '002751', 0.35, 3843.84, '家居用品', 69506.8, '易尚展示', 1756, 10.61, 108.02, 'yishangzhanshi', 'yszs', '68.98', 16278.1, 2.32, NULL, 82466.6, 7024, NULL),
(1362, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '福建', 3.13, '002752', 0.11, 105177, '广告包装', 112283, '昇兴股份', 6000, 10.22, 157.31, 'shengxinggufen', 'sxgf', '17.37', 28313.2, 0.67, NULL, 238040, 42000, NULL),
(1363, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '山西', 8.44, '002753', 0.39, 27047.4, '化工原料', 73416.5, '永东股份', 2470, 3.1, 42.71, 'yongdonggufen', 'ydgf', '24.42', 38948.1, 3.95, NULL, 110361, 9870, NULL),
(1364, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '北京', 5.1, '002755', 0.186, 3697.71, '建筑施工', 71146.8, '东方新星', 2534, 4.45, 61.08, 'dongfangxinxing', 'dfxx', '34.80', 14126, 1.39, NULL, 75920.8, 10134, NULL),
(1365, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '浙江', 13.88, '002756', 0.77, 40559.2, '特种钢', 246518, '永兴特钢', 5000, 2.34, 26.62, 'yongxingtegang', 'yxtg', '44.52', 98600.6, 4.93, NULL, 317138, 20000, NULL),
(1366, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '广东', 6.43, '002757', 0.4, 20439.3, '家居用品', 55898.2, '南兴装备', 2734, 3.92, 40.18, 'nanxingzhuangbei', 'nxzb', '43.19', 35031.4, 3.2, NULL, 96202.7, 10934, NULL),
(1367, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '浙江', 8.99, '002758', 0.46, 9247.65, '医药商业', 72205.7, '华通医药', 1400, 4.85, 60.33, 'huatongyiyao', 'htyy', '82.48', 29310.9, 5.23, NULL, 91449, 5600, NULL),
(1368, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '广东', 5.55, '002759', 0.34, 5357, '家用电器', 35436.7, '天际股份', 2400, 7.18, 73.03, 'tianjigufen', 'tjgf', '0.00', 26197.7, 2.73, NULL, 62631.5, 9600, NULL),
(1369, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '安徽', 6.38, '002760', 0.29, 37088.1, '机械基件', 47571.2, '凤形股份', 2200, 5.48, 81.26, 'fengxinggufen', 'fxgf', '40.48', 23657.9, 2.69, NULL, 98944.2, 8800, NULL),
(1370, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '湖南', 5.04, '002761', 0.1, 2795.75, '纺织', 59698.2, '多喜爱', 3000, 6.76, 219.74, 'duoxiai', 'dxa', '41.18', 24021.7, 2, NULL, 86463.4, 12000, NULL),
(1371, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '广东', 6.7, '002762', 0.275, 4246.6, '服饰', 81690.6, '金发拉比', 2975, 10.45, 127.43, 'jinfalabi', 'jflb', '0.00', 43307.9, 3.64, NULL, 88021.1, 11900, NULL),
(1372, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '深圳', 6.79, '002763', 0.78, 42349.2, '服饰', 161335, '汇洁股份', 5400, 4.26, 24.56, 'huijiegufen', 'hjgf', '33.69', 80209.5, 3.71, NULL, 223538, 21600, NULL),
(1373, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '重庆', 4.44, '002765', 0.24, 43102.9, '汽车配件', 86958, '蓝黛传动', 5200, 4.71, 58.28, 'landaichuandong', 'ldcd', '25.85', 56006.1, 2.69, NULL, 147692, 20800, NULL),
(1374, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '深圳', 5.11, '002766', 0.26, 16839.9, '汽车配件', 109913, '索菱股份', 4580, 3.91, 51.45, 'suolinggufen', 'slgf', '0.00', 42625.6, 2.33, NULL, 145343, 18300.9, NULL),
(1375, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '浙江', 5.85, '002767', 0.22, 1621.15, '电器仪表', 63576.8, '先锋电子', 2500, 4.3, 56.96, 'xianfengdianzi', 'xfdz', '35.76', 33725.4, 3.37, NULL, 67590.6, 10000, NULL),
(1376, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '山东', 8.49, '002768', 0.62, 8373.88, '塑料', 87562.4, '国恩股份', 2000, 3.77, 34.6, 'guoengufen', 'gegf', '32.36', 38594.6, 4.82, NULL, 115430, 8000, NULL),
(1377, '2016-06-05 13:21:45', '2016-06-05 13:21:45', '深圳', 12.42, '002769', 1.43, 351.17, '仓储物流', 2168460, '普路通', 1850, 6.14, 35.55, 'pulutong', 'plt', '93.54', 50551.4, 6.83, NULL, 2170260, 7400, NULL),
(1378, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '河南', 3.81, '002770', 0.2, 25121.8, '乳制品', 77924.9, '科迪乳业', 6840, 4.56, 58.03, 'kediruye', 'kdry', '13.51', 44831.1, 1.64, NULL, 191476, 27340, NULL),
(1379, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 6.42, '002771', 0.51, 402.11, '软件服务', 88823.7, '真视通', 2000, 6.73, 56.45, 'zhenshitong', 'zst', '103.93', 25255.1, 3.16, NULL, 89785, 8000, NULL),
(1380, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '甘肃', 6.37, '002772', 0.33, 46436.3, '种植业', 66763.3, '众兴菌业', 3725, 4, 48.97, 'zhongxingjunye', 'zxjy', '26.21', 55129.8, 3.7, NULL, 150998, 14892.8, NULL),
(1381, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '四川', 5.02, '002773', 0.32, 44182.9, '中成药', 181776, '康弘药业', 4560, 10.41, 90.95, 'kanghongyaoye', 'khyy', '69.61', 67357.9, 1.51, NULL, 260398, 44560, NULL),
(1382, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '深圳', 8.74, '002775', 0.46, 1771.43, '建筑施工', 173547, '文科园林', 3000, 3.25, 41.27, 'wenkeyuanlin', 'wkyl', '47.56', 56389.9, 4.7, NULL, 176643, 12000, NULL),
(1383, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '广东', 8.89, '002776', 0.77, 10987.4, '服饰', 104193, '柏堡龙', 2622, 3.98, 30.8, 'bobaolong', 'bbl', '32.40', 61771.9, 5.89, NULL, 119805, 10488, NULL),
(1384, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '山东', 1.65, '300001', 0.097, 39297.7, '电气设备', 234027, '特锐德', 84849.6, 7.37, 63.13, 'teruide', 'trd', '21.31', 2835.87, 0.03, NULL, 331846, 88176, NULL),
(1385, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 2.42, '300002', 0.056, 34932.7, '软件服务', 225158, '神州泰岳', 113988, 4.74, 102.51, 'shenzhoutaiyue', 'szty', '8.83', 81238.6, 0.41, NULL, 542844, 198647, NULL),
(1386, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 4.08, '300003', 0.355, 71018.1, '医疗保健', 236314, '乐普医疗', 68610.7, 8.38, 48.25, 'lepuyiliao', 'lpyl', '36.57', 75276.8, 0.93, NULL, 533462, 81200, NULL),
(1387, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '广东', 5.9, '300004', 0.037, 74471.2, '电气设备', 133461, '南风股份', 31925.6, 2.36, 185.77, 'nanfenggufen', 'nfgf', '19.37', 239918, 4.71, NULL, 362994, 50921.9, NULL),
(1388, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 2.49, '300005', 0.242, 23000.6, '服饰', 118873, '探路者', 34774.8, 5.7, 29.44, 'tanluzhe', 'tlz', '16.95', 18149.7, 0.35, NULL, 189318, 51367.9, NULL),
(1389, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '重庆', 4.86, '300006', 0.055, 92016.3, '化学制药', 100781, '莱美药业', 13526, 4.5, 199.58, 'laimeiyaoye', 'lmyy', '9.25', 54305.7, 2.69, NULL, 255480, 20179.4, NULL),
(1390, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '河南', 8.03, '300007', 0.223, 35287.2, '电器仪表', 120251, '汉威电子', 9108.69, 4.76, 85.74, 'hanweidianzi', 'hwdz', '21.06', 74574.5, 5.09, NULL, 256019, 14651.1, NULL),
(1391, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '上海', 3.4, '300008', 0.083, 20689.7, '船舶', 73374.2, '上海佳豪', 17216.2, 5.07, 103.72, 'shanghaijiahao', 'shjh', '26.02', 39213.9, 1.57, NULL, 139087, 24997.2, NULL),
(1392, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '安徽', 2.05, '300009', 0.162, 33697.1, '生物制药', 38473.9, '安科生物', 24507.7, 7.98, 50.56, 'ankeshengwu', 'aksw', '25.47', 10138.6, 0.27, NULL, 90874, 37737.9, NULL),
(1393, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 1.99, '300010', -0.019, 11054.3, '软件服务', 113924, '立思辰', 40201.1, 12.99, 0, 'lisichen', 'lsc', '0.00', 39236.2, 0.57, NULL, 203259, 68457.8, NULL),
(1394, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 3.61, '300011', 0.179, 21599.8, '运输设备', 144709, '鼎汉技术', 34399.5, 10.54, 106.3, 'dinghanjishu', 'dhjs', '24.22', 91982.5, 1.75, NULL, 299781, 52514.9, NULL),
(1395, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '深圳', 3.35, '300012', 0.102, 49214.9, '电器仪表', 64417.3, '华测检测', 27521.8, 4.26, 69.91, 'huacejiance', 'hcjc', '11.36', 41464.7, 1.08, NULL, 156822, 38298.6, NULL),
(1396, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '江苏', 1.89, '300013', 0.007, 16674.6, '仓储物流', 32615.3, '新宁物流', 18000, 6.09, 795.36, 'xinningwuliu', 'xnwl', '14.83', 8131.7, 0.45, NULL, 57261, 18000, NULL),
(1397, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '广东', 2.54, '300014', 0.154, 35405.3, '元器件', 80628.2, '亿纬锂能', 31314.2, 6.18, 50.85, 'yiweilineng', 'ywln', '39.43', 7721.42, 0.19, NULL, 179283, 39938.1, NULL),
(1398, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '湖南', 2.19, '300015', 0.206, 60542.1, '医疗保健', 142524, '爱尔眼科', 77944.1, 12.87, 68.41, 'aieryanke', 'aeyk', '33.00', 11597.3, 0.12, NULL, 280150, 98242.9, NULL),
(1399, '2016-06-05 13:21:46', '2016-06-05 13:21:46', '北京', 2.16, '300016', 0.178, 15540.7, '中成药', 43906.4, '北陆药业', 24856.3, 8.27, 49.95, 'beiluyaoye', 'blyy', '21.53', 10547.7, 0.34, NULL, 95311.2, 31113, NULL),
(1400, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '上海', 2.75, '300017', 0.461, 34740.1, '电信运营', 206588, '网宿科技', 49603.2, 15.89, 47.43, 'wangsukeji', 'wskj', '69.04', 7137.8, 0.1, NULL, 253853, 69937.8, NULL),
(1401, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '湖北', 3.89, '300018', 0.059, 5332.71, '电气设备', 71969.6, '中元华电', 14995.9, 4.16, 136.21, 'zhongyuanhuadian', 'zyhd', '11.47', 36776.9, 1.89, NULL, 86216.2, 19500, NULL),
(1402, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '四川', 1.8, '300019', 0.102, 16364.5, '化工原料', 39061.9, '硅宝科技', 21627.3, 4.47, 39.71, 'guibaokeji', 'gbkj', '0.00', 1201.81, 0.04, NULL, 81671.5, 32640, NULL),
(1403, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '浙江', 3.19, '300020', 0.166, 8821.42, '软件服务', 361345, '银江股份', 57228.4, 3.86, 37.06, 'yinjianggufen', 'yjgf', '16.52', 64331.5, 0.98, NULL, 441231, 65495.8, NULL),
(1404, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '甘肃', 1.76, '300021', 0.042, 28904.4, '农业综合', 122925, '大禹节水', 16771, 5.63, 118.31, 'dayujieshui', 'dyjs', '19.42', 4424.58, 0.16, NULL, 163329, 27860, NULL),
(1405, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '四川', 0.22, '300022', 0.003, 11158.7, '其他商业', 260711, '吉峰农机', 31994.3, 28.84, 952.74, 'jifengnongji', 'jfnj', '7.43', 7450.6, 0.21, NULL, 291421, 35740, NULL),
(1406, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '陕西', 7.43, '300023', 0.056, 12712.5, '专用机械', 141263, '宝德股份', 5004.5, 2.66, 175.79, 'baodegufen', 'bdgf', '25.50', 77941.8, 6.16, NULL, 300017, 12644.3, NULL),
(1407, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '辽宁', 3.18, '300024', 0.24, 37055.6, '专用机械', 242096, '机器人', 63389.7, 16.26, 107.73, 'jiqiren', 'jqr', '26.15', 31115.2, 0.48, NULL, 367052, 65485.2, NULL),
(1408, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '浙江', 3.56, '300025', 0.129, 2863.78, '通信设备', 146396, '华星创业', 13827, 3.51, 48.38, 'huaxingchuangye', 'hxcy', '14.22', 25461.6, 1.19, NULL, 178335, 21426.5, NULL),
(1409, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '天津', 3.83, '300026', 0.28, 71566, '中成药', 304403, '红日药业', 63972.9, 4.13, 29.05, 'hongriyaoye', 'hryy', '14.54', 111459, 1.22, NULL, 414060, 91153.2, NULL),
(1410, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '浙江', 4.77, '300027', 0.41, 34182.3, '影视音像', 549906, '华谊兄弟', 92314.6, 8.3, 54.53, 'huayixiongdi', 'hyxd', '15.25', 79041.8, 0.57, NULL, 1102860, 138855, NULL),
(1411, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '四川', 0.6, '300028', -0.32, 4911.91, '通信设备', 37200.2, '金亚科技', 27179.2, 57.08, 0, 'jinyakeji', 'jykj', '18.52', 25138.6, 0.73, NULL, 65011.8, 34620.3, NULL),
(1412, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '江苏', 2.87, '300029', -0.113, 24028.9, '半导体', 75045.8, '天龙光电', 19345.7, 2.8, 0, 'tianlongguangdian', 'tlgd', '12.21', 83145.1, 4.16, NULL, 104810, 20000, NULL),
(1413, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '广东', 2.5, '300030', 0.06, 21891.5, '医疗保健', 46268.7, '阳普医疗', 24159.5, 7.54, 157.07, 'yangpuyiliao', 'ypyl', '14.25', 24779.3, 0.84, NULL, 112047, 29600, NULL),
(1414, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '江苏', 2.88, '300031', 0.131, 30671.7, '橡胶', 60821.1, '宝通科技', 22284.6, 7.93, 87.15, 'baotongkeji', 'btkj', '23.87', 23517.8, 0.78, NULL, 98098.7, 30000, NULL),
(1415, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '浙江', 2.99, '300032', 0.3, 73487.4, '元器件', 177251, '金龙机电', 54484.6, 7.73, 38.44, 'jinlongjidian', 'jljd', '18.47', 98749.5, 1.46, NULL, 345741, 67594, NULL),
(1416, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '浙江', 2.59, '300033', 0.417, 14713.9, '软件服务', 233592, '同花顺', 26199.8, 14.96, 46.46, 'tonghuashun', 'ths', '82.45', 35677.6, 0.66, NULL, 268424, 53760, NULL),
(1417, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '北京', 3.47, '300034', 0.132, 43636, '小金属', 80028.9, '钢研高纳', 32000, 4.91, 64.66, 'gangyangaona', 'gygn', '19.69', 39555.2, 1.23, NULL, 139956, 32030.9, NULL),
(1418, '2016-06-05 13:21:47', '2016-06-05 13:21:47', '湖南', 3.61, '300035', 0.07, 15610.6, '工程机械', 75662.4, '中科电气', 18398.7, 2.13, 54.63, 'zhongkedianqi', 'zkdq', '0.00', 37459.1, 1.6, NULL, 100822, 23385.4, NULL),
(1419, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '北京', 3.28, '300036', 0.019, 20231, '软件服务', 45364.8, '超图软件', 15169.5, 6.05, 509.26, 'chaoturuanjian', 'ctrj', '20.97', 26720, 1.36, NULL, 81019.4, 19589.6, NULL),
(1420, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '深圳', 10.27, '300037', 0.24, 45306.8, '化工原料', 105576, '新宙邦', 10867.1, 2.2, 50.57, 'xinzhoubang', 'xzb', '60.20', 116815, 6.35, NULL, 225318, 18402.1, NULL),
(1421, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '北京', 7.1, '300038', 0.127, 12844.3, '通信设备', 167154, '梅泰诺', 11241.6, 2.55, 71.15, 'meitainuo', 'mtn', '0.00', 77029.6, 4.79, NULL, 224892, 16064.9, NULL),
(1422, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '上海', 2.35, '300039', 0.227, 38835.8, '中成药', 201286, '上海凯宝', 61186.8, 5.08, 26.3, 'shanghaikaibao', 'shkb', '9.89', 26898.8, 0.32, NULL, 248435, 83368.5, NULL),
(1423, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '黑龙江', 4.2, '300040', -0.061, 33301.2, '电气设备', 82656.9, '九洲电气', 19844.8, 1.81, 0, 'jiuzhoudianqi', 'jzdq', '13.82', 38241.8, 1.38, NULL, 139123, 27780, NULL),
(1424, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '湖北', 6.38, '300041', 0.283, 42252.5, '化工原料', 77515.3, '回天新材', 12850, 2.6, 29.33, 'huitianxincai', 'htxc', '11.30', 46697.8, 2.76, NULL, 142515, 16895.5, NULL),
(1425, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '深圳', 6.2, '300042', 0.074, 4921.24, '电脑设备', 59193, '朗科科技', 9072, 4.27, 178.45, 'langkekeji', 'lkkj', '30.63', 60245.7, 4.51, NULL, 85781, 13360, NULL),
(1426, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '广东', 1.5, '300043', 0.14, 44412.4, '文教休闲', 137007, '互动娱乐', 77074.1, 7.37, 39.48, 'hudongyule', 'hdyl', '0.00', 231.16, 0, NULL, 370109, 124420, NULL),
(1427, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '深圳', 2.93, '300044', 0.044, 1491.32, '软件服务', 82017.6, '赛为智能', 14739.8, 4.93, 165.08, 'saiweizhineng', 'swzn', '0.00', 26032.7, 1.16, NULL, 104840, 22365.6, NULL),
(1428, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '北京', 1.5, '300045', 0.019, 7454.1, '电脑设备', 71301.7, '华力创通', 32802.7, 7.96, 320.25, 'hualichuangtong', 'hlct', '17.50', 12435.2, 0.22, NULL, 108527, 55512, NULL),
(1429, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '湖北', 5.46, '300046', 0.111, 16899.8, '半导体', 63370.8, '台基股份', 12269, 2.49, 61.55, 'taijigufen', 'tjgf', '0.00', 56347.9, 3.97, NULL, 83109.6, 14208, NULL),
(1430, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '深圳', 3.84, '300047', -0.009, 13870, '软件服务', 123288, '天源迪科', 24061.6, 2.67, 0, 'tianyuandike', 'tydk', '17.76', 52854, 1.64, NULL, 197324, 32307.3, NULL),
(1431, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '北京', 4.51, '300048', 0.065, 40030, '电气设备', 142607, '合康变频', 31153.3, 4.72, 162.68, 'hekangbianpin', 'hkbp', '20.15', 85025.6, 2.51, NULL, 207310, 33814.5, NULL),
(1432, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '内蒙', 4.77, '300049', 0.136, 10599.7, '中成药', 122807, '福瑞股份', 22238, 4.02, 70.48, 'furuigufen', 'frgf', '21.48', 94671.8, 3.59, NULL, 194288, 26345.8, NULL),
(1433, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '广东', 7.98, '300050', 0.168, 11756.9, '软件服务', 143443, '世纪鼎利', 13078.2, 1.97, 46.9, 'shijidingli', 'sjdl', '13.99', 141481, 5.67, NULL, 225397, 24945.7, NULL),
(1434, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '福建', 1.52, '300051', -0.014, 6016.01, '互联网', 39397.1, '三五互联', 21173.9, 8.48, 0, 'sanwuhulian', 'swhl', '19.91', 12923.6, 0.4, NULL, 83548.3, 32100, NULL),
(1435, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '深圳', 3.59, '300052', 0.051, 4602.03, '互联网', 46131.8, '中青宝', 26000, 6.12, 215.82, 'zhongqingbao', 'zqb', '22.36', 57585.8, 2.21, NULL, 154327, 26000, NULL),
(1436, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '广东', 5.24, '300053', 0.123, 13611.3, '半导体', 71010, '欧比特', 16558.5, 3.81, 80.96, 'oubite', 'obt', '14.83', 79864.1, 3.45, NULL, 142002, 23116, NULL),
(1437, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '湖北', 2.78, '300054', 0.165, 40519.9, '化工原料', 83756.7, '鼎龙股份', 29472.6, 4.32, 36.41, 'dinglonggufen', 'dlgf', '21.79', 43820, 0.99, NULL, 159894, 44190.4, NULL),
(1438, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '北京', 3.76, '300055', 0.229, 66230.8, '环境保护', 283519, '万邦达', 51625.4, 3.94, 32.26, 'wanbangda', 'wbd', '18.00', 138068, 1.88, NULL, 488028, 73518.5, NULL),
(1439, '2016-06-05 13:21:48', '2016-06-05 13:21:48', '福建', 4.3, '300056', 0.21, 20335.1, '专用机械', 86706.1, '三维丝', 11381, 10.83, 122.36, 'sanweisi', 'sws', '16.82', 32719, 1.99, NULL, 136848, 16466.1, NULL),
(1440, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '广东', 5.3, '300057', 0.106, 149144, '广告包装', 255050, '万顺股份', 24990, 1.86, 46.17, 'wanshungufen', 'wsgf', '15.13', 122465, 2.79, NULL, 487306, 43966.5, NULL),
(1441, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 2.29, '300058', 0.045, 9657.82, '广告包装', 554945, '蓝色光标', 140530, 6.25, 160.31, 'lanseguangbiao', 'lsgb', '10.05', 112567, 0.58, NULL, 1291340, 193117, NULL),
(1442, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '上海', 1.71, '300059', 0.613, 9382.67, '互联网', 1906000, '东方财富', 129126, 19.39, 27.03, 'dongfangcaifu', 'dfcf', '23.00', 9033.82, 0.05, NULL, 1969470, 169951, NULL),
(1443, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '上海', 1.67, '300061', 0.087, 26060.9, '医疗保健', 48050.2, '康耐特', 14255, 5.13, 49.09, 'kangnaite', 'knt', '0.00', 5107.6, 0.21, NULL, 79212.2, 24903.6, NULL),
(1444, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '福建', 4.96, '300062', 0.111, 19384.5, '电气设备', 70664.6, '中能电气', 7913.14, 2.64, 59.16, 'zhongnengdianqi', 'zndq', '0.00', 36051, 2.34, NULL, 99505.5, 15400, NULL),
(1445, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '广东', 3.27, '300063', 0.007, 34791, '染料涂料', 73608.8, '天龙集团', 11908.5, 8.1, 1800.81, 'tianlongjituan', 'tljt', '31.19', 34230.4, 1.7, NULL, 143795, 20100, NULL),
(1446, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '河南', 2.8, '300064', 0.08, 134788, '矿物制品', 149464, '豫金刚石', 60575, 3.04, 56.65, 'yujingangshi', 'yjgs', '9.85', 70058.1, 1.03, NULL, 348399, 67812, NULL),
(1447, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 2.88, '300065', 0.061, 8598.87, '软件服务', 54284.6, '海兰信', 18136, 5.51, 129.2, 'hailanxin', 'hlx', '34.71', 29328.9, 1.39, NULL, 78155.5, 21050.6, NULL),
(1448, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '江西', 2.91, '300066', 0.16, 26667.2, '电器仪表', 85015.5, '三川股份', 37296.1, 3.02, 29.35, 'sanchuangufen', 'scgf', '6.29', 29508.5, 0.71, NULL, 142003, 41601.3, NULL),
(1449, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '上海', 1.79, '300067', 0.146, 22433.4, '染料涂料', 82438.6, '安诺其', 34060.5, 4.25, 25.98, 'annuoqi', 'anq', '8.59', 14752.1, 0.28, NULL, 130660, 52665.9, NULL),
(1450, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '浙江', 4.77, '300068', 0.133, 120456, '电气设备', 371022, '南都电源', 43708.1, 2.09, 37.46, 'nandoudianyuan', 'nddy', '20.77', 167302, 2.77, NULL, 554354, 60498, NULL),
(1451, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '浙江', 4.15, '300069', 0.06, 22012.1, '电气设备', 39746.3, '金利华电', 8033.31, 3.82, 131.5, 'jinlihuadian', 'jlhd', '30.55', 26053.5, 2.23, NULL, 66385, 11700, NULL),
(1452, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 5.82, '300070', 0.14, 29499.4, '环境保护', 455703, '碧水源', 66397.1, 7.52, 175.64, 'bishuiyuan', 'bsy', '15.59', 209909, 1.71, NULL, 1089440, 122946, NULL),
(1453, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 1.68, '300071', 0.077, 4766.83, '广告包装', 94606.9, '华谊嘉信', 42544.3, 8.13, 88.79, 'huayijiaxin', 'hyjx', '0.00', 15715, 0.23, NULL, 174717, 68529.5, NULL),
(1454, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 3.48, '300072', 0.609, 69098.8, '化工原料', 560379, '三聚环保', 59687.7, 9.33, 26.62, 'sanjuhuanbao', 'sjhb', '27.04', 33789.4, 0.51, NULL, 716887, 66148.9, NULL),
(1455, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 5.12, '300073', 0.006, 30017.4, '矿物制品', 63190.9, '当升科技', 15899.2, 3.03, 1295.45, 'dangshengkeji', 'dskj', '52.65', 58978.2, 3.69, NULL, 108540, 16000, NULL),
(1456, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '上海', 1.88, '300074', -0.039, 13346.8, '通信设备', 44919.5, '华平股份', 34271.4, 4.07, 0, 'huapinggufen', 'hpgf', '9.71', 16947.6, 0.32, NULL, 106022, 52800, NULL),
(1457, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 3.07, '300075', 0.093, 7999.43, '软件服务', 114920, '数字政通', 25145.1, 5.57, 91.92, 'shuzizhengtong', 'szzt', '21.90', 42670.7, 1.12, NULL, 145904, 38153.8, NULL),
(1458, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '浙江', 5.03, '300076', 0.031, 17370.4, '电脑设备', 85634.9, 'GQY视讯', 17980.4, 2.95, 239.55, 'GQYshixun', 'GQYsx', '21.45', 66815.1, 3.15, NULL, 119756, 21200, NULL),
(1459, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '深圳', 10.07, '300077', 0.11, 2894.05, '半导体', 278215, '国民技术', 26029.3, 2.17, 104.88, 'guominjishu', 'gmjs', '18.11', 219320, 7.76, NULL, 305729, 28256, NULL),
(1460, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '浙江', 7.09, '300078', 0.262, 18818.7, '元器件', 85772.6, '中瑞思创', 11660, 6.34, 85.84, 'zhongruisichuang', 'zrsc', '30.40', 85148.1, 5.08, NULL, 212636, 16750, NULL),
(1461, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '北京', 4.35, '300079', 0.161, 35749.7, '通信设备', 245375, '数码视讯', 60322.7, 3.01, 40.73, 'shumashixun', 'smsx', '8.72', 122963, 1.78, NULL, 373342, 68889.7, NULL),
(1462, '2016-06-05 13:21:49', '2016-06-05 13:21:49', '河南', 6.36, '300080', -0.04, 133473, '其他建材', 317376, '新大新材', 35949.9, 1.19, 0, 'xindaxincai', 'xdxc', '0.00', 243478, 4.84, NULL, 541517, 50280.4, NULL),
(1463, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '河北', 5.87, '300081', 0.027, 3235.07, '通信设备', 54177.1, '恒信移动', 9117.98, 3.4, 365.08, 'hengxinyidong', 'hxyd', '17.75', 53302.3, 3.98, NULL, 87575.2, 13400, NULL),
(1464, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '辽宁', 4.21, '300082', 0.014, 229402, '化工原料', 248514, '奥克股份', 67386.1, 1.33, 193.84, 'aokegufen', 'akgf', '8.55', 170037, 2.52, NULL, 525592, 67392, NULL),
(1465, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '广东', 8.42, '300083', -0.84, 163850, '元器件', 223240, '劲胜精密', 20202, 2.21, 0, 'jingshengjingmi', 'jsjm', '9.80', 144829, 6.35, NULL, 428323, 22820.8, NULL),
(1466, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '甘肃', 3.29, '300084', 0.028, 19603.9, '石油开采', 64548.2, '海默科技', 22302.2, 2.42, 139.39, 'haimokeji', 'hmkj', '12.24', 60770.9, 1.87, NULL, 161757, 32476.6, NULL),
(1467, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '深圳', 1.59, '300085', 0.02, 804.95, '软件服务', 65240.3, '银之杰', 25068.9, 16.29, 654.55, 'yinzhijie', 'yzj', '32.35', 20530.9, 0.39, NULL, 99511, 52544.4, NULL),
(1468, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '海南', 5.88, '300086', 0.062, 32900.8, '化学制药', 128803, '康芝药业', 28918.5, 2.2, 103.45, 'kangzhiyaoye', 'kzyy', '11.06', 126651, 4.22, NULL, 194454, 30000, NULL),
(1469, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '安徽', 1.8, '300087', -0.011, 20328.9, '种植业', 70421, '荃银高科', 25292.4, 8.34, 0, 'quanyingaoke', 'qygk', '10.98', 16401.3, 0.52, NULL, 103541, 31680, NULL),
(1470, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '安徽', 5.99, '300088', 0.19, 150582, '元器件', 271650, '长信科技', 48757.1, 2.4, 40.35, 'zhangxinkeji', 'zxkj', '14.69', 188592, 3.27, NULL, 499080, 57700.7, NULL),
(1471, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '广东', 5.31, '300089', 0.061, 16170.5, '陶瓷', 58335.4, '长城集团', 8650.83, 7.91, 341.99, 'zhangchengjituan', 'zcjt', '0.00', 48589.4, 3.24, NULL, 113150, 15000, NULL),
(1472, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '安徽', 4.09, '300090', 0.237, 73810.4, '专用机械', 373969, '盛运环保', 37541.3, 3.85, 33.12, 'shengyunhuanbao', 'syhb', '8.19', 81508.3, 1.54, NULL, 691183, 52949.4, NULL),
(1473, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '江苏', 3.97, '300091', 0.1, 53464.1, '机械基件', 114973, '金通灵', 14456.8, 4.23, 84.18, 'jintongling', 'jtl', '13.63', 44255.2, 2.12, NULL, 198239, 20900, NULL),
(1474, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '四川', 2.27, '300092', 0.018, 35335.5, '专用机械', 35081.4, '科新机电', 15198.3, 3.48, 219.33, 'kexinjidian', 'kxjd', '11.51', 20638.8, 0.91, NULL, 74449.2, 22750, NULL),
(1475, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '广东', 4.08, '300093', 0.037, 49395.9, '玻璃', 87651.2, '金刚玻璃', 21526.1, 6.34, 345.97, 'jingangboli', 'jgbl', '24.90', 38683.3, 1.79, NULL, 144607, 21600, NULL),
(1476, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '广东', 4.74, '300094', -0.114, 31722.1, '渔业', 203127, '国联水产', 33894.1, 6.57, 0, 'guolianshuichan', 'glsc', '14.02', 99870.6, 2.82, NULL, 262021, 35380.7, NULL),
(1477, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '江西', 2.64, '300095', 0.102, 27061.7, '机械基件', 79658.1, '华伍股份', 22893.4, 2.64, 34.35, 'huawugufen', 'hwgf', '12.45', 26978.7, 0.88, NULL, 120156, 30819.5, NULL),
(1478, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '福建', 1.63, '300096', 0.027, 11189.7, '软件服务', 69497.9, '易联众', 41422.8, 24.3, 743.78, 'yilianzhong', 'ylz', '17.30', 3415.51, 0.08, NULL, 86843.3, 43000, NULL),
(1479, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '辽宁', 3.79, '300097', 0.064, 9414.67, '电器仪表', 54475, '智云股份', 7992.22, 6.12, 182.33, 'zhiyungufen', 'zygf', '52.22', 20758.2, 1.71, NULL, 71170.2, 12135.3, NULL),
(1480, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '广东', 3.31, '300098', 0.14, 6231.68, '通信设备', 76900.4, '高新兴', 19696.2, 5.39, 63.58, 'gaoxinxing', 'gxx', '13.31', 37086.7, 1.26, NULL, 166172, 29358.4, NULL),
(1481, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '山东', 3.73, '300099', -0.028, 13129.3, '电器仪表', 54692.1, '尤洛卡', 10797, 7.1, 0, 'youluoka', 'ylk', '8.67', 37683.6, 1.76, NULL, 88913.9, 21459.9, NULL),
(1482, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '浙江', 5, '300100', 0.302, 79688.3, '汽车服务', 174458, '双林股份', 26869.8, 2.38, 19.71, 'shuanglingufen', 'slgf', '41.20', 100338, 2.54, NULL, 378325, 39577.5, NULL),
(1483, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '四川', 2.83, '300101', 0.148, 9021.49, '通信设备', 79286.2, '振芯科技', 22020.2, 12.38, 118.13, 'zhenxinkeji', 'zxkj', '0.00', 32557.4, 1.17, NULL, 103135, 27800, NULL),
(1484, '2016-06-05 13:21:50', '2016-06-05 13:21:50', '福建', 3.05, '300102', 0.041, 89224.7, '半导体', 105927, '乾照光电', 36147.9, 1.95, 72.1, 'qianzhaoguangdian', 'qzgd', '7.61', 84861, 1.44, NULL, 223460, 59000, NULL),
(1485, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '陕西', 3.87, '300103', 0.108, 11412.2, '工程机械', 83126, '达刚路机', 8441.92, 3.12, 55.69, 'dagangluji', 'dglj', '16.76', 31284, 1.48, NULL, 98152.2, 21173.4, NULL),
(1486, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '北京', 1.84, '300104', 0.137, 35634, '互联网', 518540, '乐视网', 109243, 16.81, 112.78, 'leshiwang', 'lsw', '56.32', 38908.1, 0.21, NULL, 1123400, 185517, NULL),
(1487, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '山东', 4.09, '300105', -0.062, 21477, '电器仪表', 256412, '龙源技术', 51321.6, 1.84, 0, 'longyuanjishu', 'lyjs', '7.98', 67710.8, 1.32, NULL, 291011, 51321.6, NULL),
(1488, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '新疆', 3.97, '300106', 0.11, 54702.2, '农业综合', 86757.9, '西部牧业', 16313.3, 2.71, 49.05, 'xibumuye', 'xbmy', '13.56', 28058.5, 1.71, NULL, 183496, 16380, NULL),
(1489, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '河北', 1.63, '300107', 0.02, 49114.1, '化工原料', 40216.1, '建新股份', 33739.1, 3.09, 125.03, 'jianxingufen', 'jxgf', '6.28', 15631.3, 0.29, NULL, 92677.8, 53929.3, NULL),
(1490, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '吉林', 3.73, '300108', 0.195, 37711.5, '化工原料', 100021, '双龙股份', 12211.1, 2.69, 25.71, 'shuanglonggufen', 'slgf', '8.66', 91118.9, 2.15, NULL, 227169, 42401, NULL),
(1491, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '河南', 3.6, '300109', 0.225, 25491.1, '化工原料', 14643.5, '新开源', 8041.25, 10.37, 83.13, 'xinkaiyuan', 'xky', '54.30', 18401.9, 1.6, NULL, 47893.5, 11520, NULL),
(1492, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '山东', 2.21, '300110', 0.031, 118936, '化学制药', 104998, '华仁药业', 65444.9, 4.82, 170.52, 'huarenyaoye', 'hryy', '0.00', 33670.2, 0.51, NULL, 264993, 66487, NULL),
(1493, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '浙江', 1.06, '300111', 0.002, 154171, '半导体', 146411, '向日葵', 111329, 4.73, 1409.62, 'xiangrikui', 'xrk', '5.15', 21402, 0.19, NULL, 318164, 111980, NULL),
(1494, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '深圳', 1.98, '300112', 0.045, 12153.4, '电器仪表', 25672.5, '万讯自控', 13250.5, 11.14, 247.28, 'wanxunzikong', 'wxzk', '13.38', 13531.1, 0.55, NULL, 61204.9, 24741.2, NULL),
(1495, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '浙江', 3.93, '300113', 0.348, 4158.66, '互联网', 67050.9, '顺网科技', 17872.4, 8.59, 48.57, 'shunwangkeji', 'swkj', '0.00', 42295.4, 1.45, NULL, 143662, 29180.9, NULL),
(1496, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '陕西', 4.6, '300114', 0.207, 27441.5, '元器件', 110616, '中航电测', 20280, 5.61, 62.46, 'zhonghangdiance', 'zhdc', '25.69', 51948.9, 1.98, NULL, 171988, 26256, NULL),
(1497, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '深圳', 5.55, '300115', 0.41, 156213, '元器件', 276958, '长盈精密', 51316.6, 4.94, 34.95, 'zhangyingjingmi', 'zyjm', '22.53', 145192, 2.61, NULL, 482350, 55575.9, NULL),
(1498, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '陕西', 1.86, '300116', 0.018, 11897.3, '专用机械', 79147, '坚瑞消防', 24409.6, 4.4, 225.39, 'jianruixiaofang', 'jrxf', '14.86', 53350.5, 1.07, NULL, 132916, 50023.8, NULL),
(1499, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '北京', 4.1, '300117', 0.107, 39980.3, '装修装饰', 308548, '嘉寓股份', 32580, 1.85, 35.62, 'jiayugufen', 'jygf', '6.13', 54474.2, 1.67, NULL, 387869, 32580, NULL),
(1500, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '浙江', 4.29, '300118', 0.159, 138616, '半导体', 472164, '东方日升', 39515.9, 2.02, 27.27, 'dongfangrisheng', 'dfrs', '18.37', 203331, 3.13, NULL, 702737, 64991.2, NULL),
(1501, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '天津', 4.17, '300119', 0.121, 39503.1, '生物制药', 101135, '瑞普生物', 20359.6, 2.69, 46.25, 'ruipushengwu', 'rpsw', '16.08', 81565.2, 2.1, NULL, 230848, 38914.6, NULL),
(1502, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '天津', 2.9, '300120', 0.029, 35301.9, '电气设备', 25317.4, '经纬电材', 15568.6, 3.8, 190.42, 'jingweidiancai', 'jwdc', '13.53', 30490.3, 1.49, NULL, 67594.9, 20481.6, NULL),
(1503, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '江苏', 7.3, '300346', 0.133, 18621.6, '半导体', 104668, '南大光电', 5734.47, 4.86, 133.51, 'nandaguangdian', 'ndgd', '35.01', 66062.6, 4.11, NULL, 130768, 16086.4, NULL),
(1504, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '浙江', 2.07, '300347', 0.176, 14578.4, '医疗保健', 53397.8, '泰格医药', 29105.7, 11.07, 64.94, 'taigeyiyao', 'tgyy', '30.62', 15492.1, 0.36, NULL, 114831, 43059.8, NULL),
(1505, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '深圳', 3.42, '300348', 0.023, 635.67, '软件服务', 31976.4, '长亮科技', 5541.39, 12.12, 918.47, 'zhangliangkeji', 'zlkj', '34.50', 29561.1, 2.09, NULL, 59371.4, 14144.5, NULL),
(1506, '2016-06-05 13:21:51', '2016-06-05 13:21:51', '浙江', 5.06, '300349', 0.327, 15035, '电器仪表', 65857.1, '金卡股份', 4500, 4.56, 35.26, 'jinkagufen', 'jkgf', '28.08', 30568.6, 1.7, NULL, 123479, 18000, NULL),
(1507, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '深圳', 5.09, '300350', 0.18, 7273.52, '仓储物流', 64680.6, '华鹏飞', 4020.79, 8.23, 204.82, 'huapengfei', 'hpf', '34.68', 19783.8, 1.33, NULL, 82768.9, 14823.3, NULL),
(1508, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '浙江', 3.01, '300351', 0.167, 9993.25, '元器件', 75940.9, '永贵电器', 9352.2, 6.27, 56.52, 'yongguidianqi', 'ygdq', '27.47', 40640.4, 1.21, NULL, 117796, 33719.4, NULL),
(1509, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 2.63, '300352', 0.051, 4795.21, '软件服务', 68837.2, '北信源', 12536.9, 10.04, 257.38, 'beixinyuan', 'bxy', '17.62', 18060.1, 0.68, NULL, 79327.6, 26680, NULL),
(1510, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 2.52, '300353', 0.076, 9826.66, '通信设备', 37458.9, '东土科技', 8957.45, 30.3, 498.35, 'dongtukeji', 'dtkj', '18.10', 10879.2, 0.64, NULL, 55849.6, 17124.1, NULL),
(1511, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '江苏', 2.4, '300354', 0.014, 6550.31, '电器仪表', 26500.3, '东华测试', 4477.02, 7.12, 613.05, 'donghuaceshi', 'dhcs', '23.46', 10439.7, 0.75, NULL, 35184.5, 13837, NULL),
(1512, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '内蒙', 3.46, '300355', 0.256, 22355.9, '环境保护', 308215, '蒙草抗旱', 22780.9, 3.08, 20.85, 'mengcaokanghan', 'mckh', '7.12', 50802.8, 1.15, NULL, 384316, 44039.2, NULL),
(1513, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '江苏', 8.04, '300356', 0.043, 13843, '电气设备', 111353, '光一科技', 6729.95, 2.55, 238.39, 'guangyikeji', 'gykj', '0.00', 92685.2, 5.75, NULL, 195021, 16122.2, NULL),
(1514, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '浙江', 3.2, '300357', 0.318, 3686.96, '生物制药', 43619.3, '我武生物', 6928.97, 10.51, 52.89, 'wowushengwu', 'wwsw', '36.10', 18171, 1.12, NULL, 53474.6, 16160, NULL),
(1515, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '湖南', 3.63, '300358', 0.21, 55955.4, '专用机械', 123445, '楚天科技', 7338.62, 5.3, 52.34, 'chutiankeji', 'ctkj', '19.56', 15955.2, 0.6, NULL, 235317, 26628.9, NULL),
(1516, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '广东', 1.86, '300359', 0.157, 1462.25, '文教休闲', 23209.6, '全通教育', 8081.77, 28.66, 169.64, 'quantongjiaoyu', 'qtjy', '30.29', 841.19, 0.04, NULL, 44625.9, 21384, NULL),
(1517, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '浙江', 3.84, '300360', 0.437, 6996.38, '电器仪表', 135221, '炬华科技', 7464, 11.48, 50.49, 'juhuakeji', 'jhkj', '21.23', 13571.5, 0.56, NULL, 144947, 24178.5, NULL),
(1518, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '四川', 6.06, '300362', 0.143, 40365, '电气设备', 101584, '天保重装', 4559.97, 5.43, 115.23, 'tianbaozhongzhuang', 'tbzz', '0.00', 34177.9, 3.33, NULL, 163269, 10273.2, NULL),
(1519, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '重庆', 3.1, '300363', 0.199, 83914.4, '化学制药', 66756.2, '博腾股份', 9562.49, 9.18, 71.61, 'botenggufen', 'btgf', '20.58', 15726.1, 0.56, NULL, 187570, 27931.4, NULL),
(1520, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 3.88, '300364', 0.058, 490.6, '出版业', 28650.2, '中文在线', 3000, 20.6, 689.4, 'zhongwenzaixian', 'zwzx', '103.69', 16734.8, 1.39, NULL, 52881.9, 12000, NULL),
(1521, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 3.22, '300365', 0.112, 7590.6, '软件服务', 48731.9, '恒华科技', 5755.5, 5.48, 79.11, 'henghuakeji', 'hhkj', '40.08', 16819.4, 0.96, NULL, 60300.6, 17575.9, NULL),
(1522, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '四川', 3.15, '300366', 0.182, 1423.87, '软件服务', 43301.4, '创意信息', 3577.9, 7.29, 63.15, 'chuangyixinxi', 'cyxx', '39.22', 6574.72, 0.58, NULL, 48644, 11430, NULL),
(1523, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 2.96, '300367', 0.136, 10693.6, '电脑设备', 106510, '东方网力', 14814.4, 11.53, 125.35, 'dongfangwangli', 'dfwl', '25.66', 18476, 0.62, NULL, 157772, 29786.2, NULL),
(1524, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '河北', 2.06, '300368', -0.021, 24659.3, '专用机械', 36572.1, '汇金股份', 7644.02, 7.46, 0, 'huijingufen', 'hjgf', '28.90', 5943.75, 0.24, NULL, 78814.1, 24760, NULL),
(1525, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 4.02, '300369', -0.036, 8698.69, '软件服务', 100279, '绿盟科技', 10253.7, 6.2, 0, 'lvmengkeji', 'lmkj', '39.72', 65013.8, 1.82, NULL, 165629, 35798.5, NULL),
(1526, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '北京', 1.7, '300370', -0.037, 16035.2, '电器仪表', 71221.1, '安控科技', 12353.5, 6.07, 0, 'ankongkeji', 'akkj', '9.00', 4706.21, 0.19, NULL, 92161.6, 24307.8, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1527, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '河北', 3.89, '300371', 0.167, 15748.9, '电器仪表', 31164.8, '汇中股份', 3551.13, 4.64, 54.19, 'huizhonggufen', 'hzgf', '26.96', 18383.8, 1.53, NULL, 51509.6, 12000, NULL),
(1528, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '辽宁', 3.87, '300372', 0.096, 12216.1, '电气设备', 104987, '欣泰电气', 9073.75, 2.62, 53.05, 'xintaidianqi', 'xtdq', '0.00', 15473, 0.9, NULL, 123499, 17155.7, NULL),
(1529, '2016-06-05 13:21:52', '2016-06-05 13:21:52', '江苏', 4.55, '300373', 0.387, 22966.6, '半导体', 61251, '扬杰科技', 5080, 6.36, 37.42, 'yangjiekeji', 'yjkj', '23.06', 27342.6, 1.63, NULL, 96698.6, 16753, NULL),
(1530, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 3.79, '300374', 0.11, 19849.8, '其他建材', 73456.7, '恒通科技', 4868, 3.52, 64.1, 'hengtongkeji', 'htkj', '21.26', 25979.9, 1.33, NULL, 111645, 19468, NULL),
(1531, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '天津', 5.29, '300375', 0.333, 32702.9, '汽车配件', 73235.5, '鹏翎股份', 7187.89, 2.51, 19.96, 'penglinggufen', 'plgf', '22.19', 26141.2, 1.41, NULL, 123890, 18593.2, NULL),
(1532, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '广东', 4.62, '300376', 0.422, 26515.2, '电气设备', 276954, '易事特', 6269.2, 5.8, 31.74, 'yishite', 'yst', '27.55', 5834.26, 0.23, NULL, 317675, 25046, NULL),
(1533, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '深圳', 3.67, '300377', 0.059, 10849.7, '软件服务', 28011.7, '赢时胜', 3807.27, 12.61, 389.71, 'yingshisheng', 'yss', '48.45', 13772.4, 1.24, NULL, 44073.1, 11070, NULL),
(1534, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '上海', 5.71, '300378', 0.09, 8659.15, '软件服务', 113021, '鼎捷软件', 5112.5, 5.28, 134.56, 'dingjieruanjian', 'djrj', '37.40', 61195.9, 3.05, NULL, 150555, 20074.6, NULL),
(1535, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 6.74, '300379', 0.06, 700.53, '软件服务', 40519, '东方通', 5869, 6.23, 352.08, 'dongfangtong', 'dft', '74.78', 49818.1, 4.32, NULL, 87299.9, 11522, NULL),
(1536, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '上海', 2.98, '300380', 0.08, 3131.2, '软件服务', 39919, '安硕信息', 4832.25, 13.07, 380.37, 'anshuoxinxi', 'asxx', '48.16', 14314.2, 1.04, NULL, 46232.2, 13744, NULL),
(1537, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '广东', 7.07, '300381', 0.248, 31075.1, '饲料', 41091.4, '溢多利', 2633.5, 3.79, 53.95, 'yiduoli', 'ydl', '58.18', 32019, 3.12, NULL, 94952, 10254, NULL),
(1538, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '江苏', 5.03, '300382', 0.416, 11049, '专用机械', 56782.4, '斯莱克', 3167.83, 5.7, 34.51, 'silaike', 'slk', '33.75', 17341, 1.48, NULL, 71983.7, 11712.1, NULL),
(1539, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 2.61, '300383', 0.171, 34945.9, '电信运营', 31485.7, '光环新网', 11692.3, 37.23, 284.02, 'guanghuanxinwang', 'ghxw', '37.88', 14742.3, 0.54, NULL, 88506.6, 27290, NULL),
(1540, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 4.82, '300384', 0.431, 12897.4, '纺织机械', 80267.4, '三联虹普', 4187.68, 7.63, 42.68, 'sanlianhongpu', 'slhp', '52.40', 26329.5, 1.76, NULL, 119312, 14935.2, NULL),
(1541, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '江苏', 5.6, '300385', 0.255, 21084.4, '专用机械', 71095.6, '雪浪环境', 4368.6, 6.27, 68.97, 'xuelanghuanjing', 'xlhj', '33.03', 35692.9, 2.97, NULL, 125067, 12000, NULL),
(1542, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 6.59, '300386', 0.287, 2123.88, '软件服务', 139935, '飞天诚信', 7745.35, 4.66, 53.53, 'feitianchengxin', 'ftcx', '29.70', 68669.2, 3.29, NULL, 164895, 20902.2, NULL),
(1543, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '湖北', 9.63, '300387', 0.487, 5571.12, '化工原料', 50607.3, '富邦股份', 2044.29, 3.59, 35.51, 'fubanggufen', 'fbgf', '26.00', 28061.4, 4.6, NULL, 64874.7, 6099, NULL),
(1544, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '安徽', 2.93, '300388', 0.088, 12828.5, '环境保护', 83181.6, '国祯环保', 6618, 7.37, 122.66, 'guozhenhuanbao', 'gzhb', '20.90', 8597.87, 0.32, NULL, 290507, 26468, NULL),
(1545, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '深圳', 4.68, '300389', 0.275, 20454.4, '半导体', 84161.8, '艾比森', 4522.06, 4.14, 35.16, 'aibisen', 'abs', '54.05', 20833.7, 1.3, NULL, 120618, 16030, NULL),
(1546, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '江苏', 2.89, '300390', 0.2, 9834.08, '电脑设备', 25819.4, '天华超净', 4712.52, 6.05, 43.71, 'tianhuachaojing', 'thcj', '15.64', 5789, 0.49, NULL, 42012, 11697, NULL),
(1547, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '山东', 2.19, '300391', 0.05, 20317.4, '机械基件', 43328.2, '康跃科技', 5167.5, 6.24, 135.82, 'kangyuekeji', 'kykj', '0.00', 6815.7, 0.41, NULL, 76687.2, 16667.5, NULL),
(1548, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '北京', 6.32, '300392', 0.443, 553.72, '互联网', 95972.2, '腾信股份', 3200, 9.65, 68.82, 'tengxingufen', 'txgf', '28.38', 33780.3, 2.64, NULL, 113328, 12800, NULL),
(1549, '2016-06-05 13:21:53', '2016-06-05 13:21:53', '江苏', 6.37, '300393', 0.371, 19999.4, '塑料', 84178.1, '中来股份', 2348.95, 5.55, 47.61, 'zhonglaigufen', 'zlgf', '32.72', 32665.3, 2.73, NULL, 117225, 11949, NULL),
(1550, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '江苏', 8.36, '300394', 0.69, 7286.68, '通信设备', 52032.2, '天孚通信', 1524, 5.31, 34.71, 'tianfutongxin', 'tftx', '38.19', 33292.4, 4.48, NULL, 64193.8, 7434, NULL),
(1551, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '湖北', 5.19, '300395', 0.288, 16600.8, '玻璃', 56830.8, '菲利华', 3240, 3.7, 33.29, 'feilihua', 'flh', '28.17', 23362.8, 1.81, NULL, 76342.6, 12920, NULL),
(1552, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '吉林', 6.11, '300396', 0.313, 16572.4, '医疗保健', 82923.7, '迪瑞医疗', 3835, 5.22, 50.9, 'diruiyiliao', 'dryl', '37.12', 40995.4, 2.67, NULL, 106514, 15335, NULL),
(1553, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '陕西', 10.66, '300397', -0.129, 6174.08, '通信设备', 128533, '天和防务', 3000, 5.49, 0, 'tianhefangwu', 'thfw', '62.05', 64742.5, 5.4, NULL, 155879, 12000, NULL),
(1554, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '上海', 6.54, '300398', 0.498, 8790.37, '染料涂料', 57536.7, '飞凯材料', 2600, 6.91, 45.4, 'feikaicailiao', 'fkcl', '60.64', 29300.7, 2.82, NULL, 93241.4, 10400, NULL),
(1555, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '北京', 5.87, '300399', 0.176, 3831.71, '互联网', 38218.3, '京天利', 2000, 10.86, 180.77, 'jingtianli', 'jtl', '43.02', 19904.6, 2.49, NULL, 50829.8, 8000, NULL),
(1556, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '深圳', 3.08, '300400', 0.156, 4501.2, '专用机械', 40683.1, '劲拓股份', 3000, 6.46, 63.67, 'jingtuogufen', 'jtgf', '28.70', 8372.94, 0.7, NULL, 47680.9, 12000, NULL),
(1557, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '浙江', 3.92, '300401', 0.06, 16955.2, '食品', 37712.1, '花园生物', 4540, 3.96, 129.52, 'huayuanshengwu', 'hysw', '23.97', 5058.16, 0.28, NULL, 74561.1, 18140, NULL),
(1558, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '江苏', 3.44, '300402', 0.01, 30459.6, '专用机械', 102462, '宝色股份', 5100, 3.54, 607.11, 'baosegufen', 'bsgf', '0.00', 22421.7, 1.11, NULL, 153005, 20200, NULL),
(1559, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 8.52, '300403', 0.494, 16672.3, '电气设备', 88377.4, '地尔汉宇', 3400, 3.99, 34.45, 'dierhanyu', 'dehy', '52.48', 64369.8, 4.8, NULL, 123470, 13400, NULL),
(1560, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 6.29, '300404', 0.22, 6139.76, '医疗保健', 41945.5, '博济医药', 1667, 8.11, 137.38, 'bojiyiyao', 'bjyy', '39.41', 22534.1, 3.38, NULL, 51135.6, 6667, NULL),
(1561, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '辽宁', 9.02, '300405', 0.03, 19042.4, '化工原料', 102081, '科隆精化', 1700, 3.22, 481.66, 'kelongjinghua', 'kljh', '42.11', 27524.5, 4.05, NULL, 137693, 6800, NULL),
(1562, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '北京', 4.14, '300406', 0.427, 6696.37, '化学制药', 103364, '九强生物', 4886, 6.69, 32.47, 'jiuqiangshengwu', 'jqsw', '20.14', 23502.4, 0.94, NULL, 111095, 24983.7, NULL),
(1563, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '天津', 5.57, '300407', 0.263, 9630.05, '电气设备', 76659.3, '凯发电气', 3400, 6.58, 69.57, 'kaifadianqi', 'kfdq', '38.15', 25915.2, 1.91, NULL, 101657, 13600, NULL),
(1564, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 4.41, '300408', 0.449, 73482, '元器件', 338629, '三环集团', 9199.9, 5.59, 27.47, 'sanhuanjituan', 'shjt', '17.86', 83635.4, 0.98, NULL, 439505, 85760, NULL),
(1565, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 5.85, '300409', 0.398, 11649.6, '陶瓷', 60304.8, '道氏技术', 2437.5, 5.56, 40.9, 'daoshijishu', 'dsjs', '46.35', 24379.8, 2.5, NULL, 78433.8, 9750, NULL),
(1566, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 6.59, '300410', 0.275, 6590.55, '电器仪表', 41154.7, '正业科技', 1500, 5.59, 66.84, 'zhengyekeji', 'zykj', '49.27', 14292.1, 2.38, NULL, 49498.6, 6000, NULL),
(1567, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '浙江', 3.29, '300411', 0.137, 10287.2, '专用机械', 52010.2, '金盾股份', 4000, 16.33, 195.99, 'jindungufen', 'jdgf', '0.00', 20002.8, 1.25, NULL, 74712.1, 16000, NULL),
(1568, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '浙江', 3.09, '300412', 0.179, 9246.37, '医疗保健', 33858.4, '迦南科技', 2948, 13.82, 119.23, 'jianankeji', 'jnkj', '32.39', 9431.96, 0.8, NULL, 44827.6, 11748, NULL),
(1569, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '湖南', 3.8, '300413', 0.109, 5111.9, '百货', 201795, '快乐购', 7000, 5.82, 101.79, 'kuailegou', 'klg', '27.82', 67156, 1.67, NULL, 219165, 40100, NULL),
(1570, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '四川', 7.57, '300414', 0.488, 4379.55, '元器件', 68922.8, '中光防雷', 2107, 5.55, 43, 'zhongguangfanglei', 'zgfl', '35.65', 29478.7, 3.5, NULL, 74553.4, 8426.5, NULL),
(1571, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '广东', 6.15, '300415', 0.39, 34022.4, '专用机械', 79900.7, '伊之密', 3000, 4.12, 33.96, 'yizhimi', 'yzm', '15.87', 34821.4, 2.9, NULL, 138673, 12000, NULL),
(1572, '2016-06-05 13:21:54', '2016-06-05 13:21:54', '江苏', 6.58, '300416', 0.28, 13896.2, '电器仪表', 34584.2, '苏试试验', 1570, 7.67, 93.48, 'sushishiyan', 'sssy', '29.86', 20290.4, 3.23, NULL, 51937.3, 6280, NULL),
(1573, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '广东', 8.27, '300417', 0.36, 749.93, '电器仪表', 33017.3, '南华仪器', 1020, 6.25, 75.95, 'nanhuayiqi', 'nhyq', '40.91', 16073.7, 3.94, NULL, 36963.4, 4080, NULL),
(1574, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '北京', 8.73, '300418', 0.696, 2702.09, '互联网', 190015, '昆仑万维', 7000, 7.67, 48.07, 'kunlunwanwei', 'klww', '29.78', 142376, 5.08, NULL, 317459, 28000, NULL),
(1575, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '北京', 12.75, '300419', 0.576, 5683.97, '软件服务', 52787.2, '浩丰科技', 1030, 5.66, 62.54, 'haofengkeji', 'hfkj', '44.99', 26430.6, 6.43, NULL, 60055.1, 4110, NULL),
(1576, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '江苏', 4.79, '300420', 0.14, 8075.45, '机械基件', 35870.3, '五洋科技', 2000, 6.04, 116.37, 'wuyangkeji', 'wykj', '61.89', 19880.1, 2.49, NULL, 46804.8, 8000, NULL),
(1577, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '江苏', 4.92, '300421', 0.25, 25913, '机械基件', 37539.2, '力星股份', 2800, 4.12, 44.66, 'lixinggufen', 'lxgf', '29.81', 32171.4, 2.87, NULL, 70046.2, 11200, NULL),
(1578, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '广西', 5.57, '300422', 0.35, 6329.72, '环境保护', 62304.5, '博世科', 1550, 8.74, 75.98, 'boshike', 'bsk', '32.15', 13884.1, 2.24, NULL, 76621.3, 6200, NULL),
(1579, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '山东', 4.74, '300423', 0.26, 4574.97, '电气设备', 48967.8, '鲁亿通', 2200, 5.12, 51.57, 'luyitong', 'lyt', '0.00', 17872.2, 2.03, NULL, 57958.1, 8800, NULL),
(1580, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '浙江', 5.03, '600283', 0.08, 143909, '水务', 174969, '钱江水利', 28533, 1.71, 54.2, 'qianjiangshuili', 'qjsl', '13.41', 116877, 3.31, NULL, 468679, 35299.6, NULL),
(1581, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '上海', 6.91, '600284', 0.208, 15329.2, '建筑施工', 912618, '浦东建设', 66104, 1.66, 27.59, 'pudongjianshe', 'pdjs', '10.64', 227444, 3.28, NULL, 1543400, 69304, NULL),
(1582, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '河南', 3.42, '600285', 0.153, 42902.9, '中成药', 89874.8, '羚锐制药', 46379.4, 2.81, 31.45, 'lingruizhiyao', 'lrzy', '10.28', 13056.1, 0.24, NULL, 283568, 53548.2, NULL),
(1583, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '江苏', 2.78, '600287', 0.092, 33926.3, '商贸代理', 308304, '江苏舜天', 43679.6, 2.92, 44.16, 'jiangsushuntian', 'jsst', '8.98', 19071.4, 0.44, NULL, 444110, 43679.6, NULL),
(1584, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '北京', 3.34, '600288', 0.023, 40749.7, '软件服务', 194482, '大恒科技', 43680, 3.39, 242.6, 'dahengkeji', 'dhkj', '12.43', 18688.8, 0.43, NULL, 294220, 43680, NULL),
(1585, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '黑龙江', 3.41, '600289', 0.023, 38185.2, '软件服务', 192820, '亿阳信通', 56737.9, 4.58, 333.96, 'yiyangxintong', 'yyxt', '13.69', 39743.9, 0.7, NULL, 280037, 56737.9, NULL),
(1586, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '浙江', 3.88, '600290', 0.153, 56782, '电气设备', 397338, '华仪电气', 52688.4, 2.22, 28.15, 'huayidianqi', 'hydq', '9.21', 94885.4, 1.8, NULL, 515909, 52688.4, NULL),
(1587, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '内蒙', 9.78, '600291', 0.96, 32755.8, '多元金融', 2099520, '西水股份', 38400, 3.75, 19.11, 'xishuigufen', 'xsgf', '20.17', 43854.4, 1.14, NULL, 11762100, 38400, NULL),
(1588, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '重庆', 6.12, '600292', 0.295, 337514, '环境保护', 429457, '中电远达', 78081.7, 2.36, 24.43, 'zhongdianyuanda', 'zdyd', '12.91', 315864, 4.05, NULL, 893414, 78081.7, NULL),
(1589, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '湖北', 2.16, '600293', 0.007, 129782, '玻璃', 85999.4, '三峡新材', 34450.3, 3.24, 513.37, 'sanxiaxincai', 'sxxc', '11.90', 31995.7, 0.93, NULL, 253966, 34450.3, NULL),
(1590, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '内蒙', 6.74, '600295', 0.107, 1937130, '服饰', 1301020, '鄂尔多斯', 61200, 1.03, 32.45, 'eerduosi', 'eeds', '7.81', 130165, 1.26, NULL, 4366010, 103200, NULL),
(1591, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '辽宁', 5.43, '600297', 0.29, 704949, '中成药', 4100350, '广汇汽车', 35000, 3.29, 36.19, 'guanghuiqiche', 'ghqc', '9.80', 999408, 2.73, NULL, 6796880, 366693, NULL),
(1592, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '湖北', 8.75, '600298', 0.425, 351646, '食品', 194860, '安琪酵母', 32428.8, 3.33, 34.24, 'anqijiaomu', 'aqjm', '15.59', 114527, 3.47, NULL, 599297, 32963.2, NULL),
(1593, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '北京', 0.51, '600299', -1.403, 948681, '化工原料', 504616, '蓝星新材', 52270.8, 19.76, 0, 'lanxingxincai', 'lxxc', '13.55', 182910, 3.5, NULL, 1829120, 52270.8, NULL),
(1594, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '江苏', 1.61, '600300', 0.061, 199727, '软饮料', 441705, '维维股份', 167200, 3.36, 44.22, 'weiweigufen', 'wwgf', '6.17', 25458.8, 0.15, NULL, 789129, 167200, NULL),
(1595, '2016-06-05 13:21:55', '2016-06-05 13:21:55', '广西', -0.92, '600301', -0.043, 71059.9, '化工原料', 8908.17, '*ST南化', 23514.8, -10.19, 0, '*STnanhua', '*STnh', '13.03', 58516.8, 2.49, NULL, 133692, 23514.8, NULL),
(1596, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '陕西', 3.1, '600302', -0.1, 20353, '纺织机械', 113467, '标准股份', 34601, 1.97, 0, 'biaozhungufen', 'bzgf', '8.35', 34727.7, 1, NULL, 153369, 34601, NULL),
(1597, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '辽宁', 3.67, '600303', 0.004, 235862, '汽车整车', 350485, '曙光股份', 57450.6, 1.47, 670.93, 'shuguanggufen', 'sggf', '11.44', 80720.1, 1.3, NULL, 827147, 62032.4, NULL),
(1598, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '江苏', 4.71, '600305', 0.601, 60210.9, '食品', 82314.8, '恒顺醋业', 30136.9, 3.99, 15.65, 'hengshuncuye', 'hscy', '21.44', 77752.6, 2.58, NULL, 219351, 30136.9, NULL),
(1599, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '辽宁', 0.27, '600306', -0.41, 123984, '百货', 54186.4, '商业城', 17740.6, 46.5, 0, 'shangyecheng', 'syc', '13.84', 20405.1, 1.15, NULL, 224652, 17813.9, NULL),
(1600, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '甘肃', 2.38, '600307', -0.245, 2563940, '普钢', 1587590, '酒钢宏兴', 626336, 1.74, 0, 'jiuganghongxing', 'jghx', '2.54', 686673, 1.1, NULL, 4720800, 626336, NULL),
(1601, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '山东', 5.43, '600308', 0.05, 873930, '造纸', 620120, '华泰股份', 116756, 0.87, 47.17, 'huataigufen', 'htgf', '4.42', 224377, 1.92, NULL, 1682040, 116756, NULL),
(1602, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '山东', 5.07, '600309', 0.471, 1494080, '化工原料', 1012450, '万华化学', 216233, 3.76, 20.22, 'wanhuahuaxue', 'whhx', '16.28', 4842.74, 0.02, NULL, 4432630, 216233, NULL),
(1603, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '广西', 11.89, '600310', 1.418, 275799, '水力发电', 267938, '桂东电力', 27592.5, 1.89, 7.9, 'guidongdianli', 'gddl', '7.73', 57653.6, 2.09, NULL, 939472, 27592.5, NULL),
(1604, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '甘肃', 1.31, '600311', -0.022, 29391.2, '黄金', 62129.4, '荣华实业', 66560, 3.87, 0, 'ronghuashiye', 'rhsy', '5.90', 21943.9, 0.33, NULL, 96811.8, 66560, NULL),
(1605, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '河南', 5.42, '600312', 0.258, 163538, '电气设备', 744233, '平高电气', 81896.6, 4.08, 42.75, 'pinggaodianqi', 'pgdq', '14.68', 302355, 2.66, NULL, 1088880, 113749, NULL),
(1606, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '北京', 3.01, '600313', 0.005, 23401.7, '种植业', 153660, '农发种业', 30420, 3.33, 1047.45, 'nongfazhongye', 'nfzy', '13.27', 63104, 1.72, NULL, 232751, 36728.7, NULL),
(1607, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '上海', 6.32, '600315', 0.953, 19477.3, '日用化工', 455121, '上海家化', 67107.3, 5.35, 17.72, 'shanghaijiahua', 'shjh', '27.88', 115366, 1.72, NULL, 633223, 67236.7, NULL),
(1608, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '江西', 7.17, '600316', 0.021, 79245.8, '航空', 581067, '洪都航空', 71711.5, 2.64, 448.68, 'hongdouhangkong', 'hdhk', '18.59', 314009, 4.38, NULL, 996025, 71711.5, NULL),
(1609, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '辽宁', 1.52, '600317', 0.05, 1147680, '港口', 338326, '营口港', 329272, 3.18, 48.64, 'yingkougang', 'ykg', '3.48', 155388, 0.24, NULL, 1686280, 647298, NULL),
(1610, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '安徽', 4.49, '600318', 0.008, 143208, '水泥', 118166, '巢东股份', 24200, 4.6, 1236.6, 'chaodonggufen', 'cdgf', '26.84', 35382.2, 1.46, NULL, 636641, 24200, NULL),
(1611, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '山东', 0.29, '600319', -0.274, 120097, '化工原料', 89157, '亚星化学', 31559.4, 36.62, 0, 'yaxinghuaxue', 'yxhx', '9.95', 71594.9, 2.27, NULL, 225537, 31559.4, NULL),
(1612, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '上海', 3.38, '600320', 0.025, 1446690, '工程机械', 2493300, '振华重工', 276833, 1.71, 115.75, 'zhenhuazhonggong', 'zhzg', '4.28', 554318, 1.26, NULL, 5520060, 439029, NULL),
(1613, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '四川', 1.82, '600321', 0.012, 184711, '其他建材', 77936, '国栋建设', 118088, 2.61, 193.51, 'guodongjianshe', 'gdjs', '4.02', 100990, 0.67, NULL, 356547, 151055, NULL),
(1614, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '天津', 4.13, '600322', 0.03, 11712.4, '区域地产', 1957230, '天房发展', 110570, 1.03, 71.98, 'tianfangfazhan', 'tffz', '4.65', 220524, 1.99, NULL, 2074580, 110570, NULL),
(1615, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '广东', 5.45, '600323', 0.247, 343957, '水务', 210203, '瀚蓝环境', 57924.3, 2, 22.05, 'hanlanhuanjing', 'hlhj', '12.51', 174522, 2.28, NULL, 1222820, 76626.4, NULL),
(1616, '2016-06-05 13:21:56', '2016-06-05 13:21:56', '广东', 8.66, '600325', 0.298, 48412, '区域地产', 7048250, '华发股份', 81704.6, 1.37, 19.87, 'huafagufen', 'hfgf', '10.88', 164939, 2.02, NULL, 7558900, 81704.6, NULL),
(1617, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '西藏', 2.11, '600326', 0.105, 143163, '建筑施工', 199689, '西藏天路', 54720, 4.32, 43.64, 'xizangtianlu', 'xztl', '8.13', 19178.2, 0.35, NULL, 382262, 54720, NULL),
(1618, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '江苏', 4.45, '600327', 0.223, 111526, '百货', 208080, '大东方', 52171.2, 1.6, 15.94, 'dadongfang', 'ddf', '8.75', 7694.47, 0.15, NULL, 535676, 52171.2, NULL),
(1619, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '内蒙', 3.44, '600328', -0.054, 388390, '化工原料', 158998, '兰太实业', 35911.8, 2.92, 0, 'lantaishiye', 'ltsy', '10.60', 37664.3, 1.05, NULL, 683504, 35911.8, NULL),
(1620, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '天津', 5.03, '600329', 0.32, 77743.6, '中成药', 435186, '中新药业', 53620.4, 3.56, 28.81, 'zhongxinyaoye', 'zxyy', '16.76', 130748, 1.7, NULL, 641805, 76887.3, NULL),
(1621, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '浙江', 4.16, '600330', 0.025, 114597, '元器件', 244235, '天通股份', 58881.8, 1.97, 165.66, 'tiantonggufen', 'ttgf', '13.93', 262143, 3.16, NULL, 437950, 83047.1, NULL),
(1622, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '四川', 2.04, '600331', -0.046, 256708, '铅锌', 386308, '宏达股份', 103200, 2.55, 0, 'hongdagufen', 'hdgf', '5.47', 307788, 1.51, NULL, 987630, 203200, NULL),
(1623, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '广东', 6.3, '600332', 0.6, 190299, '中成药', 1108920, '白云山', 103634, 4.22, 22.16, 'baiyunshan', 'bys', '24.87', 246628, 1.91, NULL, 1649080, 129108, NULL),
(1624, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '吉林', 3.57, '600333', -0.028, 210772, '供气供热', 94678.7, '长春燃气', 49602, 1.73, 0, 'zhangchunranqi', 'zcrq', '8.31', 56331.2, 1.06, NULL, 470760, 52962, NULL),
(1625, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '天津', 8.77, '600335', 0.724, 132469, '汽车配件', 2677130, '国机汽车', 57476, 1.8, 10.93, 'guojiqiche', 'gjqc', '11.73', 124195, 1.98, NULL, 3028720, 62714.6, NULL),
(1626, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '山东', 1.56, '600336', 0.11, 59664, '家用电器', 176670, '澳柯玛', 68007.2, 3.26, 23.15, 'aokema', 'akm', '6.64', 50062.4, 0.73, NULL, 316667, 68207.2, NULL),
(1627, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '新疆', 4.46, '600337', 0.199, 114825, '家居用品', 230203, '美克家居', 64239.7, 2.81, 31.53, 'meikejiaju', 'mkjj', '12.02', 94944, 1.47, NULL, 429106, 64633.6, NULL),
(1628, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '西藏', 0.05, '600338', -0.045, 10293.4, '铅锌', 23431.8, '西藏珠峰', 15833.3, 250, 0, 'xizangzhufeng', 'xzzf', '30.43', 4995.71, 0.08, NULL, 39677.1, 65300.7, NULL),
(1629, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '新疆', 1.37, '600339', -0.364, 278468, '石油加工', 42647.6, '天利高新', 57815.5, 4.17, 0, 'tianligaoxin', 'tlgx', '5.38', 45029.3, 0.78, NULL, 376934, 57815.5, NULL),
(1630, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '河北', 4.38, '600340', 1.146, 192646, '区域地产', 13062300, '华夏幸福', 264576, 5.87, 11.23, 'huaxiaxingfu', 'hxxf', '24.59', 2085.38, 0.01, NULL, 13840100, 264576, NULL),
(1631, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '陕西', 3.42, '600343', 0.021, 76451.5, '航空', 276953, '航天动力', 57536.6, 5.69, 472.48, 'hangtiandongli', 'htdl', '20.81', 118342, 1.85, NULL, 386917, 63820.6, NULL),
(1632, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '湖北', 6.09, '600345', 0.109, 5401.93, '通信设备', 77887.8, '长江通信', 19800, 2.08, 58.24, 'zhangjiangtongxin', 'zjtx', '19.32', 37733.1, 1.91, NULL, 167284, 19800, NULL),
(1633, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '辽宁', 0.79, '600346', -0.188, 142843, '化工机械', 133308, '大橡塑', 66778.7, 9.24, 0, 'daxiangsu', 'dxs', '6.21', 59100, 0.89, NULL, 301432, 66778.7, NULL),
(1634, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '山西', 5.64, '600348', 0.134, 782444, '煤炭开采', 1166620, '阳泉煤业', 240500, 1.2, 25.24, 'yangquanmeiye', 'yqmy', '6.21', 0, 0, NULL, 3177190, 240500, NULL),
(1635, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '山东', 4.41, '600350', 0.205, 799203, '路桥', 1785810, '山东高速', 481117, 1.23, 13.25, 'shandonggaosu', 'sdgs', '5.41', 489265, 1.02, NULL, 4301640, 481117, NULL),
(1636, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '山西', 2.64, '600351', 0.205, 158770, '中成药', 121695, '亚宝药业', 63295.2, 3.96, 25.54, 'yabaoyaoye', 'ybyy', '10.16', 40223.4, 0.58, NULL, 342585, 69200, NULL),
(1637, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '浙江', 3.96, '600352', 0.58, 485312, '染料涂料', 1694290, '浙江龙盛', 305993, 2.59, 8.9, 'zhejianglongsheng', 'zjls', '9.04', 152427, 0.47, NULL, 2605350, 325333, NULL),
(1638, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '四川', 1.84, '600353', 0.034, 24172.8, '元器件', 100835, '旭光股份', 54372, 3.75, 101.06, 'xuguanggufen', 'xggf', '7.87', 36128.6, 0.66, NULL, 131550, 54372, NULL),
(1639, '2016-06-05 13:21:57', '2016-06-05 13:21:57', '甘肃', 1.28, '600354', -0.231, 69951.6, '种植业', 213310, '敦煌种业', 44780.2, 4.93, 0, 'dunhuangzhongye', 'dhzy', '8.10', 51695, 1.15, NULL, 317443, 44780.2, NULL),
(1640, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '湖北', 1.77, '600355', -0.218, 14742.4, '元器件', 41372.2, '精伦电子', 24604.5, 11.72, 0, 'jinglundianzi', 'jldz', '7.50', 39699, 1.61, NULL, 59569.4, 24604.5, NULL),
(1641, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '黑龙江', 6.37, '600356', 0.11, 100221, '造纸', 137823, '恒丰纸业', 29873.1, 1.37, 43.8, 'hengfengzhiye', 'hfzy', '10.53', 92567, 3.1, NULL, 264835, 29873.1, NULL),
(1642, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '江苏', 0.77, '600358', 0.092, 39914, '旅游服务', 13300.4, '国旅联合', 43200, 10.82, 45.06, 'guolvlianhe', 'gllh', '13.50', 5777.12, 0.13, NULL, 71169.1, 43200, NULL),
(1643, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '新疆', 2.76, '600359', 0.176, 94688.7, '农业综合', 117187, '新农开发', 32100, 3.07, 24.04, 'xinnongkaifa', 'xnkf', '9.46', 112050, 2.94, NULL, 249818, 38151.3, NULL),
(1644, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '吉林', 2.69, '600360', 0.026, 112011, '半导体', 183330, '华微电子', 73808, 2.16, 111.18, 'huaweidianzi', 'hwdz', '11.59', 48872, 0.66, NULL, 350322, 73808, NULL),
(1645, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '北京', 4.64, '600361', 0.091, 60670.3, '超市连锁', 945073, '华联综超', 66580.8, 1.31, 33.33, 'hualianzongchao', 'hlzc', '6.32', 167671, 2.52, NULL, 1241090, 66580.8, NULL),
(1646, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '江西', 13.3, '600362', 0.259, 1785950, '铜', 5950430, '江西铜业', 207525, 1.06, 27.23, 'jiangxitongye', 'jxty', '13.39', 1168590, 3.37, NULL, 9005420, 346273, NULL),
(1647, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '江西', 4.17, '600363', 0.191, 50891.3, '元器件', 214003, '联创光电', 42280.7, 2.64, 28.85, 'lianchuangguangdian', 'lcgd', '16.44', 63361.2, 1.43, NULL, 368140, 44347.7, NULL),
(1648, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '吉林', 3.44, '600365', 0.022, 12553.1, '红黄药酒', 63693.6, '通葡股份', 14000, 7.82, 607.07, 'tongpugufen', 'tpgf', '13.08', 74790.9, 3.74, NULL, 95235, 20000, NULL),
(1649, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '浙江', 6.33, '600366', 0.44, 79993.1, '电器仪表', 222969, '宁波韵升', 51449.8, 2.41, 17.97, 'ningboyunsheng', 'nbys', '25.06', 44336.1, 0.83, NULL, 415844, 53497.8, NULL),
(1650, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '贵州', 4.17, '600367', -0.035, 38021, '化工原料', 119525, '红星发展', 29120, 1.84, 0, 'hongxingfazhan', 'hxfz', '12.40', 28521.1, 0.98, NULL, 182042, 29120, NULL),
(1651, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '广西', 3.63, '600368', 0.083, 717272, '路桥', 429187, '五洲交通', 83380.1, 1.34, 29.52, 'wuzhoujiaotong', 'wzjt', '5.01', 57996.7, 0.7, NULL, 1383780, 83380.1, NULL),
(1652, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '重庆', 6.6, '600369', 1.007, 30769.1, '证券', 0, '西南证券', 232255, 2.37, 7.77, 'xinanzhengquan', 'xnzq', '7.96', 1067460, 3.78, NULL, 9560440, 282255, NULL),
(1653, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '江苏', 3.77, '600370', 0.06, 40256.4, '纺织', 111296, '三房巷', 31889.8, 1.81, 56.89, 'sanfangxiang', 'sfx', '5.53', 53735.5, 1.69, NULL, 155626, 31889.8, NULL),
(1654, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '黑龙江', 1.74, '600371', 0.044, 16414.3, '种植业', 43953.5, '万向德农', 22506, 6.01, 118.52, 'wanxiangdenong', 'wxdn', '15.61', 3237.5, 0.14, NULL, 76103.7, 22506, NULL),
(1655, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '北京', 3, '600372', 0.087, 242898, '航空', 1036040, '中航电子', 175916, 7.88, 135.69, 'zhonghangdianzi', 'zhdz', '18.62', 100270, 0.57, NULL, 1496650, 175916, NULL),
(1656, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '江西', 6.7, '600373', 0.39, 125879, '出版业', 1051680, '中文传媒', 118568, 3.43, 30.36, 'zhongwenchuanmei', 'zwcm', '21.78', 543615, 3.95, NULL, 1632840, 137794, NULL),
(1657, '2016-06-05 13:21:58', '2016-06-05 13:21:58', '安徽', 6.02, '600375', -0.396, 323258, '汽车整车', 469841, '华菱星马', 55574.1, 0.93, 0, 'hualingxingma', 'hlxm', '5.70', 266488, 4.8, NULL, 963420, 55574.1, NULL),
(1658, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '北京', 6.67, '600376', 0.411, 81579.7, '区域地产', 10160700, '首开股份', 224201, 1.38, 11.16, 'shoukaigufen', 'skgf', '10.63', 405207, 1.81, NULL, 11098100, 224201, NULL),
(1659, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '江苏', 3.92, '600377', 0.343, 170613, '路桥', 546267, '宁沪高速', 379798, 1.94, 11.1, 'ninghugaosu', 'nhgs', '8.60', 1044670, 2.07, NULL, 3765520, 503775, NULL),
(1660, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '四川', 2.43, '600378', 0.091, 29360, '化工原料', 75836.2, '天科股份', 29719.3, 9.44, 125.81, 'tiankegufen', 'tkgf', '15.58', 15308.5, 0.52, NULL, 108301, 29719.3, NULL),
(1661, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '陕西', 1.79, '600379', 0.059, 23314, '电气设备', 54947.6, '宝光股份', 23585.8, 7.67, 115.52, 'baoguanggufen', 'bggf', '17.68', 759.81, 0.03, NULL, 80214, 23585.8, NULL),
(1662, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '深圳', 3, '600380', 0.21, 400038, '化学制药', 524724, '健康元', 154584, 3.44, 24.56, 'jiankangyuan', 'jky', '9.25', 61566, 0.39, NULL, 1250320, 158388, NULL),
(1663, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '青海', 2.12, '600381', 0.1, 9903.63, '医疗保健', 146186, '青海春天', 19892.6, 9.89, 119.69, 'qinghaichuntian', 'qhct', '15.17', 13316.1, 0.19, NULL, 184177, 68831.4, NULL),
(1664, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '广东', 7.63, '600382', 0.355, 3535.06, '商贸代理', 103522, '广东明珠', 34174.7, 1.29, 13.86, 'guangdongmingzhu', 'gdmz', '13.53', 9316.7, 0.27, NULL, 292639, 34174.7, NULL),
(1665, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '深圳', 6.98, '600383', 0.116, 27467.5, '全国地产', 11486400, '金地集团', 449849, 1.46, 44.15, 'jindijituan', 'jdjt', '11.00', 475969, 1.06, NULL, 13264400, 449961, NULL),
(1666, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '山东', 0.35, '600385', -0.01, 80.76, '黄金', 14832.3, '山东金泰', 14277.4, 41.4, 0, 'shandongjintai', 'sdjt', '22.84', 29904.4, 2.02, NULL, 16540.9, 14810.7, NULL),
(1667, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '北京', 4.27, '600386', 0.224, 48707.9, '公共交通', 151827, '北巴传媒', 40320, 2.56, 24.34, 'beibachuanmei', 'bbcm', '20.14', 64700.6, 1.6, NULL, 264119, 40320, NULL),
(1668, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '浙江', 3.68, '600387', 0.106, 537672, '石油贸易', 211758, '海越股份', 38571, 2.96, 51.29, 'haiyuegufen', 'hygf', '12.63', 16947.4, 0.44, NULL, 939108, 38610, NULL),
(1669, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '福建', 2.97, '600388', 0.161, 87069.3, '专用机械', 1069850, '龙净环保', 106905, 3.94, 36.35, 'longjinghuanbao', 'ljhb', '12.64', 52246.5, 0.49, NULL, 1243500, 106905, NULL),
(1670, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '江苏', 6.51, '600389', 0.083, 170803, '农药化肥', 83716.1, '江山股份', 19800, 2.9, 113.76, 'jiangshangufen', 'jsgf', '14.59', 21455.3, 1.08, NULL, 304421, 19800, NULL),
(1671, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '湖南', 2.22, '600390', -0.05, 77393.1, '小金属', 120212, '金瑞科技', 38194.7, 4.16, 0, 'jinruikeji', 'jrkj', '12.82', 57899.8, 1.28, NULL, 234000, 45125.6, NULL),
(1672, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '四川', 5.1, '600391', 0.067, 146781, '航空', 273138, '成发科技', 33012.9, 6.06, 231.62, 'chengfakeji', 'cfkj', '36.81', 101153, 3.06, NULL, 463381, 33012.9, NULL),
(1673, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '山西', 3.39, '600392', 0.058, 18171.3, '小金属', 151241, '盛和资源', 15660, 7.98, 232.32, 'shengheziyuan', 'shzy', '19.74', 1038.08, 0.03, NULL, 187658, 37641.6, NULL),
(1674, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '广东', 3.27, '600393', 0.068, 8422.67, '全国地产', 298777, '东华实业', 28950.5, 2.55, 61.26, 'donghuashiye', 'dhsy', '11.38', 21662.5, 0.72, NULL, 347533, 30000, NULL),
(1675, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '贵州', 3.53, '600395', 0.013, 281689, '煤炭开采', 372291, '盘江股份', 165505, 1.79, 245.96, 'panjianggufen', 'pjgf', '8.74', 233941, 1.41, NULL, 1063820, 165505, NULL),
(1676, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '辽宁', 2.62, '600396', 0.165, 1268760, '火力发电', 122978, '金山股份', 81280, 2.43, 19.23, 'jinshangufen', 'jsgf', '5.48', 48263.5, 0.56, NULL, 1493420, 86866.4, NULL),
(1677, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '江西', 3.42, '600397', -0.113, 325045, '煤炭开采', 428352, '安源煤业', 98996, 1.42, 0, 'anyuanmeiye', 'aymy', '4.41', 184668, 1.87, NULL, 950083, 98996, NULL),
(1678, '2016-06-05 13:21:59', '2016-06-05 13:21:59', '江苏', 1.56, '600398', 0.371, 243629, '服饰', 1445590, '海澜之家', 153122, 9.56, 20.08, 'hailanzhijia', 'hlzj', '11.13', 201740, 0.45, NULL, 1876600, 449276, NULL),
(1679, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '辽宁', 1.43, '600399', 0.22, 276159, '特种钢', 756181, '抚顺特钢', 112962, 5.56, 39.35, 'fushuntegang', 'fstg', '6.45', 16257.4, 0.13, NULL, 1305050, 130000, NULL),
(1680, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '江苏', 2.58, '600400', 0.05, 40131.3, '服饰', 515162, '红豆股份', 56040, 5.83, 184.05, 'hongdougufen', 'hdgf', '9.01', 25329, 0.36, NULL, 649671, 71185, NULL),
(1681, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '江苏', 1.02, '600401', 0.008, 608345, '半导体', 686775, '*ST海润', 324744, 2.32, 156.53, '*SThairun', '*SThr', '2.49', 125578, 0.27, NULL, 1518270, 472494, NULL),
(1682, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '河南', 4, '600403', -0.097, 507780, '煤炭开采', 604534, '大有能源', 239081, 1.28, 0, 'dayounengyuan', 'dyny', '7.03', 32854.8, 0.14, NULL, 1651800, 239081, NULL),
(1683, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '北京', 1.72, '600405', -0.038, 32503.2, '电气设备', 136363, '动力源', 42389.3, 4.11, 0, 'dongliyuan', 'dly', '13.48', 10894.2, 0.26, NULL, 202462, 42389.3, NULL),
(1684, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '江苏', 2.79, '600406', 0.01, 48858.2, '软件服务', 1176070, '国电南瑞', 220575, 5.26, 716.25, 'guodiannanrui', 'gdnr', '13.67', 114844, 0.47, NULL, 1308270, 242895, NULL),
(1685, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '山西', 1.26, '600408', -0.235, 261320, '焦炭加工', 457265, '*ST安泰', 100680, 4.9, 0, '*STantai', '*STat', '5.88', 145310, 1.44, NULL, 763559, 100680, NULL),
(1686, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '河北', 3.39, '600409', 0.102, 1247570, '化工原料', 512908, '三友化工', 185039, 2.08, 34.46, 'sanyouhuagong', 'syhg', '6.48', 236541, 1.28, NULL, 2030510, 185039, NULL),
(1687, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '北京', 3.64, '600410', 0.085, 19906.1, '软件服务', 466434, '华胜天成', 63744.6, 3.84, 81.89, 'huashengtiancheng', 'hstc', '11.03', 64623.4, 1.01, NULL, 653502, 64172.6, NULL),
(1688, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '浙江', 1.6, '600415', 0.041, 529465, '商品城', 1253180, '小商品城', 544321, 4.76, 93.88, 'xiaoshangpincheng', 'xspc', '6.60', 146848, 0.27, NULL, 2896380, 544321, NULL),
(1689, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '湖南', 5.02, '600416', -0.088, 136891, '电气设备', 1501060, '湘电股份', 39614.1, 2.35, 0, 'xiangdiangufen', 'xdgf', '11.44', 257985, 3.47, NULL, 1849610, 74340.5, NULL),
(1690, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '安徽', 5.58, '600418', 0.4, 965497, '汽车整车', 2219690, '江淮汽车', 82961.7, 1.84, 13.99, 'jianghuaiqiche', 'jhqc', '10.97', 136106, 0.93, NULL, 3904070, 146323, NULL),
(1691, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '新疆', 3.31, '600419', 0.23, 29245.2, '乳制品', 23050.9, '天润乳业', 8021.08, 7.37, 53.18, 'tianrunruye', 'trry', '55.28', 28187.2, 3.26, NULL, 59035.5, 8638.94, NULL),
(1692, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '上海', 4.28, '600420', 0.427, 159350, '化学制药', 200251, '现代制药', 28773.3, 6.84, 34.34, 'xiandaizhiyao', 'xdzy', '29.39', 7341.37, 0.26, NULL, 423142, 28773.3, NULL),
(1693, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '湖北', 0.03, '600421', 0.003, 4016.61, '机械基件', 2861.25, '仰帆控股', 19560, 391.75, 2122.79, 'yangfankonggu', 'yfkg', '18.25', 19584.9, 1, NULL, 8314.7, 19560, NULL),
(1694, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '云南', 6.1, '600422', 0.632, 45232.4, '中成药', 206131, '昆药集团', 34034, 5.02, 24.21, 'kunyaojituan', 'kyjt', '13.22', 84602, 2.48, NULL, 330090, 34113, NULL),
(1695, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '广西', 2.97, '600423', -0.243, 288907, '农药化肥', 172213, '柳化股份', 39934.8, 1.66, 0, 'liuhuagufen', 'lhgf', '9.19', 51815.2, 1.3, NULL, 521621, 39934.8, NULL),
(1696, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '新疆', 3.64, '600425', -0.169, 729436, '水泥', 312940, '青松建化', 137879, 1.28, 0, 'qingsongjianhua', 'qsjh', '4.42', 320171, 2.32, NULL, 1232890, 137879, NULL),
(1697, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '山东', 7.34, '600426', 0.552, 915806, '农药化肥', 268514, '华鲁恒升', 95362.5, 1.66, 11.07, 'hualuhengsheng', 'hlhs', '11.64', 232806, 2.44, NULL, 1282650, 95362.5, NULL),
(1698, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '广东', 4.07, '600428', 0.232, 1200560, '水运', 282647, '中远航运', 169045, 3.5, 30.74, 'zhongyuanhangyun', 'zyhy', '5.99', 225445, 1.33, NULL, 1732370, 169045, NULL),
(1699, '2016-06-05 13:22:00', '2016-06-05 13:22:00', '北京', 3.73, '600429', 0.04, 116705, '乳制品', 492003, '三元股份', 88500, 1.82, 102.25, 'sanyuangufen', 'sygf', '8.63', 426939, 2.85, NULL, 746929, 149756, NULL),
(1700, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '吉林', 4.88, '600432', -0.218, 984218, '小金属', 1366700, '吉恩镍业', 81112.1, 1.92, 0, 'jiennieye', 'jeny', '6.97', 625202, 3.9, NULL, 2604070, 160372, NULL),
(1701, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '广东', 1.9, '600433', 0.011, 144057, '造纸', 127149, '冠豪高新', 119028, 3.87, 343.22, 'guanhaogaoxin', 'ghgx', '9.20', 69587.4, 0.55, NULL, 378775, 127132, NULL),
(1702, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '北京', 2.72, '600435', 0.005, 97350.2, '专用机械', 221473, '北方导航', 74466, 10.01, 2743.91, 'beifangdaohang', 'bfdh', '23.10', 77540.5, 1.04, NULL, 385611, 74466, NULL),
(1703, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '福建', 7.49, '600436', 0.627, 26882.6, '中成药', 246402, '片仔癀', 40221.1, 6.48, 38.69, 'pianzihuang', 'pzh', '39.34', 80805.5, 2.01, NULL, 375803, 40221.1, NULL),
(1704, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '四川', 2.76, '600438', 0.114, 201310, '饲料', 363732, '通威股份', 68752, 3.59, 43.59, 'tongweigufen', 'twgf', '6.84', 45453, 0.56, NULL, 682888, 81711, NULL),
(1705, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '河南', 2.43, '600439', 0.089, 48629, '服饰', 376480, '瑞贝卡', 94332.1, 2.09, 28.46, 'ruibeika', 'rbk', '5.72', 43712.7, 0.46, NULL, 466123, 94332.1, NULL),
(1706, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '安徽', -0.3, '600444', -0.072, 17812.8, '塑料', 24958, '*ST国通', 10500, -52.73, 0, '*STguotong', '*STgt', '20.41', 11042.1, 1.05, NULL, 44808.6, 10500, NULL),
(1707, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '深圳', 4.09, '600446', 0.31, 7653.03, '软件服务', 175104, '金证股份', 26563.6, 24.84, 170.78, 'jinzhenggufen', 'jzgf', '35.50', 28230.5, 1.02, NULL, 248803, 27683.6, NULL),
(1708, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '山东', 1.98, '600448', 0.023, 54119.6, '纺织', 139869, '华纺股份', 39939.4, 4.71, 205.74, 'huafanggufen', 'hfgf', '6.71', 65484.2, 1.55, NULL, 236163, 42236.4, NULL),
(1709, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '宁夏', 8.6, '600449', -0.088, 474731, '水泥', 240999, '宁夏建材', 47818.1, 1.01, 0, 'ningxiajiancai', 'nxjc', '8.86', 202657, 4.24, NULL, 808193, 47818.1, NULL),
(1710, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '重庆', 3.95, '600452', 0.848, 39340, '火力发电', 40888.6, '涪陵电力', 16000, 4.07, 9.48, 'fulingdianli', 'fldl', '31.33', 26888.2, 1.68, NULL, 104135, 16000, NULL),
(1711, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '陕西', 2.07, '600455', -0.025, 45698.6, '软件服务', 11560, '博通股份', 4971.77, 18.24, 0, 'botonggufen', 'btgf', '49.14', 14566.3, 2.33, NULL, 64189.6, 6245.79, NULL),
(1712, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '陕西', 8.24, '600456', -0.116, 263770, '小金属', 410047, '宝钛股份', 43026.6, 1.55, 0, 'baotaigufen', 'btgf', '17.38', 237072, 5.51, NULL, 734064, 43026.6, NULL),
(1713, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '湖南', 4.45, '600458', 0.312, 234210, '塑料', 657328, '时代新材', 66142.2, 3.42, 24.4, 'shidaixincai', 'sdxc', '12.73', 173750, 2.63, NULL, 1086800, 66142.2, NULL),
(1714, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '云南', 6.74, '600459', 0.151, 52715.1, '小金属', 219564, '贵研铂业', 26097.8, 1.89, 42.38, 'guiyanboye', 'gyby', '20.72', 116742, 4.47, NULL, 317399, 26097.8, NULL),
(1715, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '浙江', 1.94, '600460', 0.052, 121902, '半导体', 222933, '士兰微', 124717, 3.05, 57.4, 'shilanwei', 'slw', '7.90', 17092, 0.14, NULL, 403633, 124717, NULL),
(1716, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '江西', 5.79, '600461', 0.316, 105207, '水务', 79408.6, '洪城水业', 33000, 1.91, 17.54, 'hongchengshuiye', 'hcsy', '13.07', 117393, 3.56, NULL, 518133, 33000, NULL),
(1717, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '吉林', 0.55, '600462', -0.05, 19758.8, '造纸', 18372.3, '石岘纸业', 53378, 24.02, 0, 'shixianzhiye', 'sxzy', '7.91', 64306.4, 1.2, NULL, 39887.4, 53378, NULL),
(1718, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '北京', 3.12, '600463', 0.046, 4856.75, '园区开发', 195150, '空港股份', 25200, 3.18, 107.56, 'kongganggufen', 'kggf', '14.16', 9812.67, 0.39, NULL, 267032, 25200, NULL),
(1719, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '四川', 3.67, '600466', -0.17, 91250.5, '中成药', 4645980, '蓝光发展', 43900.6, 3.11, 0, 'languangfazhan', 'lgfz', '8.42', 200950, 0.95, NULL, 5332340, 211702, NULL),
(1720, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '山东', 4.01, '600467', 0.047, 235691, '渔业', 151425, '好当家', 73049.7, 1.39, 59.4, 'haodangjia', 'hdj', '4.29', 112898, 1.55, NULL, 492846, 73049.7, NULL),
(1721, '2016-06-05 13:22:01', '2016-06-05 13:22:01', '天津', 1.43, '600468', 0.061, 29362.4, '电气设备', 72251, '百利电气', 45619.2, 8.65, 102.13, 'bailidianqi', 'bldq', '13.69', 3550.43, 0.08, NULL, 146361, 45619.2, NULL),
(1722, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '河南', 7.69, '600469', 0.391, 309446, '汽车配件', 357006, '风神股份', 37494.2, 1.58, 15.51, 'fengshengufen', 'fsgf', '17.19', 79476.9, 2.12, NULL, 723800, 37494.2, NULL),
(1723, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '安徽', 3.96, '600470', 0.105, 352271, '农药化肥', 218879, '六国化工', 52160, 1.46, 27.54, 'liuguohuagong', 'lghg', '7.18', 126268, 2.42, NULL, 655100, 52160, NULL),
(1724, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '江苏', 5.45, '600475', 0.21, 64814.2, '专用机械', 375579, '华光股份', 25600, 2.27, 29.42, 'huaguanggufen', 'hggf', '14.85', 8955.99, 0.35, NULL, 466102, 25600, NULL),
(1725, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '湖南', 1.4, '600476', -0.033, 5922.56, '软件服务', 28047.3, '湘邮科技', 16107, 11.94, 0, 'xiangyoukeji', 'xykj', '31.41', 13140.4, 0.82, NULL, 35225.6, 16107, NULL),
(1726, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '浙江', 1.65, '600477', 0.038, 68830.2, '钢加工', 527718, '杭萧钢构', 60249.6, 4.82, 103.74, 'hangxiaoganggou', 'hxgg', '9.60', 14286.7, 0.19, NULL, 626204, 73838.5, NULL),
(1727, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '湖南', 1.55, '600478', -0.038, 82169.9, '元器件', 104329, '科力远', 85002.3, 7.35, 0, 'keliyuan', 'kly', '11.32', 58914.4, 0.64, NULL, 277796, 92738, NULL),
(1728, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '湖南', 3.6, '600479', 0.104, 39022.8, '中成药', 138725, '千金药业', 30481.9, 3.88, 67.48, 'qianjinyaoye', 'qjyy', '16.34', 21044.9, 0.6, NULL, 218901, 34875.6, NULL),
(1729, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '广东', 6.12, '300424', 0.219, 26226.8, '航空', 68647.3, '航新科技', 3327, 7.3, 102.12, 'hangxinkeji', 'hxkj', '57.86', 30312.9, 2.28, NULL, 106244, 13307, NULL),
(1730, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '四川', 9.29, '300425', 0.54, 12283.9, '专用机械', 63477.5, '环能科技', 1800, 5.36, 50.79, 'huannengkeji', 'hnkj', '33.39', 36281.2, 5.04, NULL, 84315.5, 7200, NULL),
(1731, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '浙江', 10.24, '300426', 0.74, 479.48, '影视音像', 121579, '唐德影视', 2000, 7.96, 59.86, 'tangdeyingshi', 'tdys', '0.00', 42998.5, 5.37, NULL, 123023, 8000, NULL),
(1732, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '福建', 5.86, '300427', 0.13, 3891.71, '电气设备', 54214.6, '红相电力', 2217, 10.99, 262.63, 'hongxiangdianli', 'hxdl', '20.28', 19952.4, 2.25, NULL, 58954.6, 8867, NULL),
(1733, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '河北', 7.42, '300428', 0.47, 13267.9, '铝', 47336.9, '四通新材', 2020, 4.3, 38.57, 'sitongxincai', 'stxc', '0.00', 29340.1, 3.63, NULL, 67329.7, 8080, NULL),
(1734, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '江苏', 6.97, '300429', 0.58, 14585.8, '化工原料', 35315.8, '强力新材', 2000, 17.83, 121.49, 'qianglixincai', 'qlxc', '120.69', 29792.5, 3.73, NULL, 59927.6, 7980, NULL),
(1735, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '北京', 9.68, '300430', 0.57, 4379.43, '电器仪表', 76244.4, '诚益通', 1520, 5.17, 50, 'chengyitong', 'cyt', '0.00', 31703.8, 5.21, NULL, 94113, 6080, NULL),
(1736, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '北京', 4.02, '300431', 0.056, 2419.21, '互联网', 47282.1, '暴风科技', 3000, 19.16, 689.62, 'baofengkeji', 'bfkj', '0.00', 20522.9, 1.71, NULL, 63056, 12000, NULL),
(1737, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '四川', 6.87, '300432', 0.85, 18586.5, '汽车配件', 91703.2, '富临精工', 3000, 8.01, 37.11, 'fulinjinggong', 'fljg', '25.27', 35843, 2.99, NULL, 121431, 12000, NULL),
(1738, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '湖南', 14.27, '300433', 1.07, 997132, '元器件', 801208, '蓝思科技', 6736, 3.91, 27.4, 'lansikeji', 'lskj', '92.36', 145776, 2.16, NULL, 1972640, 67336, NULL),
(1739, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '四川', 5.52, '300434', 0.26, 2108.05, '专用机械', 35839.5, '金石东方', 1700, 5.85, 73.24, 'jinshidongfang', 'jsdf', '0.00', 14137.1, 2.08, NULL, 42676.8, 6800, NULL),
(1740, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '浙江', 7.26, '300435', 0.48, 9568.92, '机械基件', 81818.5, '中泰股份', 1999.94, 4.05, 34.95, 'zhongtaigufen', 'ztgf', '21.33', 28244.8, 3.53, NULL, 95606, 8000, NULL),
(1741, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '福建', 6.69, '300436', 0.87, 6676.05, '化学制药', 41930.1, '广生堂', 1400, 16.46, 73.19, 'guangshengtang', 'gst', '62.35', 24525.8, 3.5, NULL, 54406.1, 7000, NULL),
(1742, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '河南', 6.06, '300437', 0.33, 8540.01, '化工原料', 35378, '清水源', 1670, 8.38, 91.76, 'qingshuiyuan', 'qsy', '27.43', 16472.8, 2.47, NULL, 46890.3, 6670, NULL),
(1743, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '广东', 9.19, '300438', 0.44, 18509.8, '电气设备', 84874.9, '鹏辉能源', 2100, 5.4, 67.78, 'penghuinengyuan', 'phny', '123.07', 42216.4, 5.03, NULL, 113413, 8400, NULL),
(1744, '2016-06-05 13:22:02', '2016-06-05 13:22:02', '浙江', 10.52, '300439', 0.71, 15533.6, '化学制药', 113160, '美康生物', 2834, 6.7, 59.62, 'meikangshengwu', 'mksw', '30.40', 68367.1, 6.03, NULL, 133413, 11334, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1745, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '四川', 9.77, '300440', 0.44, 6236.18, '软件服务', 128233, '运达科技', 2800, 4.21, 56.3, 'yundakeji', 'ydkj', '34.56', 65247.3, 5.83, NULL, 136532, 11200, NULL),
(1746, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '浙江', 5.24, '300441', 0.29, 17537.1, '机床制造', 28857.9, '鲍斯股份', 2112, 8.97, 96.46, 'baosigufen', 'bsgf', '0.00', 16370.2, 1.94, NULL, 56751.3, 8448, NULL),
(1747, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '上海', 9.47, '300442', 0.32, 8820.05, '轻工机械', 99029.4, '普丽盛', 2500, 3.46, 60.66, 'pulisheng', 'pls', '41.58', 52063.4, 5.21, NULL, 118308, 10000, NULL),
(1748, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '山东', 14.53, '300443', 1.24, 12998.1, '专用机械', 83122, '金雷风电', 1407, 5.59, 36.4, 'jinleifengdian', 'jlfd', '67.10', 43251.9, 7.69, NULL, 105138, 5626, NULL),
(1749, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '北京', 5.66, '300444', 0.13, 11567.8, '电气设备', 91240.1, '双杰电气', 3448.63, 5.39, 146.4, 'shuangjiedianqi', 'sjdq', '23.46', 38180.4, 2.77, NULL, 108375, 13794.5, NULL),
(1750, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '北京', 8.33, '300445', 0.36, 9779.96, '电器仪表', 24558.2, '康斯特', 1020, 7.01, 97.42, 'kangsite', 'kst', '26.94', 14843.8, 3.64, NULL, 36101, 4080, NULL),
(1751, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '河北', 6.06, '300446', 0.87, 10714.9, '化工原料', 30219.4, '乐凯新材', 1540, 9.65, 40.18, 'lekaixincai', 'lkxc', '44.28', 9668.71, 1.57, NULL, 44762.8, 6140, NULL),
(1752, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '江苏', 6.39, '300447', 0.48, 5320.93, '电气设备', 52766.8, '全信股份', 2025, 6.97, 56.22, 'quanxingufen', 'qxgf', '89.87', 19973.1, 2.47, NULL, 61272.7, 8100, NULL),
(1753, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '广东', 6.54, '300448', 0.12, 5347.62, '软件服务', 52819.7, '浩云科技', 2000, 6.87, 221.27, 'haoyunkeji', 'hykj', '86.85', 28997.4, 3.62, NULL, 58886.2, 8000, NULL),
(1754, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '北京', 10.26, '300449', 0.4, 926.2, '电脑设备', 81905, '汉邦高科', 1770, 4.81, 72.6, 'hanbanggaoke', 'hbgk', '47.54', 32715.1, 4.63, NULL, 83932.6, 7070, NULL),
(1755, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '江苏', 9.45, '300450', 0.86, 6747.4, '专用机械', 107868, '先导股份', 1700, 12.19, 84.73, 'xiandaogufen', 'xdgf', '0.00', 42291.9, 6.22, NULL, 127240, 6800, NULL),
(1756, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '浙江', 10.25, '300451', 0.14, 7557.8, '软件服务', 55799, '创业软件', 1700, 8.24, 389.04, 'chuangyeruanjian', 'cyrj', '0.00', 24095.4, 3.54, NULL, 68461.1, 6800, NULL),
(1757, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '安徽', 7.31, '300452', 0.56, 12236.7, '化学制药', 27979.6, '山河药辅', 1160, 7.31, 60.74, 'shanheyaofu', 'shyf', '53.98', 15930.3, 3.43, NULL, 43288.3, 4640, NULL),
(1758, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '江西', 6.35, '300453', 0.38, 13766.2, '医疗保健', 31990.3, '三鑫医疗', 1986, 5.26, 55.47, 'sanxinyiliao', 'sxyl', '26.65', 24180.6, 3.05, NULL, 56194.8, 7936, NULL),
(1759, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '北京', 3.89, '300455', 0.14, 9130.01, '运输设备', 54163.8, '康拓红外', 3500, 6.44, 111.7, 'kangtuohongwai', 'kthw', '46.20', 21784.6, 1.56, NULL, 65829.8, 14000, NULL),
(1760, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '北京', 6.54, '300456', 0.29, 2672.61, '元器件', 55597.4, '耐威科技', 2100, 15.78, 223.3, 'naiweikeji', 'nwkj', '105.77', 26752.7, 3.18, NULL, 66520.9, 8400, NULL),
(1761, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '深圳', 6.25, '300457', 0.49, 18230.2, '专用机械', 47612.3, '赢合科技', 1950, 9.2, 73.62, 'yinghekeji', 'yhkj', '75.49', 22717.9, 2.91, NULL, 76391.3, 7800, NULL),
(1762, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '广东', 9.17, '300458', 0.392, 7835.91, '元器件', 145169, '全志科技', 4000, 6.12, 71.64, 'quanzhikeji', 'qzkj', '101.83', 40414.8, 2.53, NULL, 163651, 16000, NULL),
(1763, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '浙江', 2.27, '300459', 0.088, 22511, '化工原料', 41528.4, '浙江金科', 6625, 14.79, 191.03, 'zhejiangjinke', 'zjjk', '30.15', 32126.9, 1.21, NULL, 73935.8, 26500, NULL),
(1764, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '广东', 3.76, '300460', 0.17, 36443.1, '元器件', 48605.7, '惠伦晶体', 4208, 4.94, 67.53, 'huilunjingti', 'hljt', '25.30', 25689.2, 1.53, NULL, 90406.3, 16827.4, NULL),
(1765, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '浙江', 4.56, '300461', 0.23, 1033.45, '专用机械', 29475.5, '田中精机', 1668, 6.8, 84.12, 'tianzhongjingji', 'tzjj', '0.00', 15238.4, 2.29, NULL, 34532.6, 6668, NULL),
(1766, '2016-06-05 13:22:03', '2016-06-05 13:22:03', '上海', 7.02, '300462', 0.4, 1833.56, '专用机械', 57949.1, '华铭智能', 1722, 5.65, 62.42, 'huamingzhineng', 'hmzn', '0.00', 26690.1, 3.87, NULL, 61103.6, 6888, NULL),
(1767, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '四川', 10.11, '300463', 0.88, 25819.7, '化学制药', 189489, '迈克生物', 3750, 6.67, 45.84, 'maikeshengwu', 'mksw', '90.90', 97042.1, 5.22, NULL, 236263, 18600, NULL),
(1768, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '广东', 5.41, '300464', 0.143, 21504.3, '机械基件', 44568.6, '星徽精密', 2067, 6.35, 120.24, 'xinghuijingmi', 'xhjm', '0.00', 22712, 2.75, NULL, 71843.8, 8267, NULL),
(1769, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '北京', 5.38, '300465', 0.13, 5435.28, '软件服务', 81333.5, '高伟达', 3334, 6.22, 164.5, 'gaoweida', 'gwd', '0.00', 35514.6, 2.66, NULL, 87395.8, 13334, NULL),
(1770, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '江苏', 5.57, '300466', 0.13, 4601.1, '电器仪表', 51802.8, '赛摩电气', 2000, 4.9, 128.51, 'saimodianqi', 'smdq', '33.62', 22429.1, 2.8, NULL, 61517.2, 8000, NULL),
(1771, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '四川', 10.39, '300467', 0.96, 3212.84, '互联网', 40974.1, '迅游科技', 1000, 21.07, 143.46, 'xunyoukeji', 'xykj', '64.74', 32324.9, 8.08, NULL, 47363.6, 4000, NULL),
(1772, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '深圳', 7.47, '300468', 0.36, 981.77, '软件服务', 66875.9, '四方精创', 2500, 5.52, 73.19, 'sifangjingchuang', 'sfjc', '73.51', 46916.8, 4.69, NULL, 78248.8, 10000, NULL),
(1773, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '上海', 4.35, '300469', -0.24, 558.12, '软件服务', 52047.6, '信息发展', 1670, 8.99, 0, 'xinxifazhan', 'xxfz', '124.80', 12701.6, 1.9, NULL, 57872.4, 6680, NULL),
(1774, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '四川', 14.22, '300470', 0.84, 4498.37, '机械基件', 76245.5, '日机密封', 1334, 4.32, 49, 'rijimifeng', 'rjmf', '93.88', 42320.5, 7.93, NULL, 89307.8, 5334, NULL),
(1775, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '四川', 18.65, '300471', 1.18, 13520.7, '专用机械', 169199, '厚普股份', 1480, 4.34, 43.42, 'houpugufen', 'hpgf', '51.09', 78015.8, 10.96, NULL, 203656, 7120, NULL),
(1776, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '北京', 5.47, '300472', 0.222, 4323.85, '专用机械', 40515.9, '新元科技', 1667, 5.8, 71.41, 'xinyuankeji', 'xykj', '0.00', 18471, 2.77, NULL, 48415.2, 6667, NULL),
(1777, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '辽宁', 14.49, '300473', 0.863, 18988.2, '汽车配件', 158577, '德尔股份', 2500, 2.94, 24.64, 'deergufen', 'degf', '69.90', 99233.4, 9.92, NULL, 183905, 10000, NULL),
(1778, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '安徽', 5.04, '300475', 0.34, 4778.4, '专用机械', 114810, '聚隆科技', 5000, 3.62, 35.57, 'julongkeji', 'jlkj', '25.30', 43399.2, 2.17, NULL, 120697, 20000, NULL),
(1779, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '广东', 8.05, '300476', 0.57, 44995.9, '元器件', 123565, '胜宏科技', 3667, 3.55, 33.62, 'shenghongkeji', 'shkj', '27.82', 72878.4, 4.97, NULL, 177713, 14667, NULL),
(1780, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '北京', 6.24, '300477', 0.36, 7459.58, '电气设备', 126300, '合纵科技', 2600, 4.37, 49.4, 'hezongkeji', 'hzkj', '75.74', 23767.6, 2.2, NULL, 142345, 10818, NULL),
(1781, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '浙江', 6.96, '300478', 0.31, 6324.5, '橡胶', 48107, '杭州高新', 1667, 4.55, 67.75, 'hangzhougaoxin', 'hzgx', '56.45', 24014.2, 3.6, NULL, 61163.5, 6667, NULL),
(1782, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '山东', 4.74, '300479', 0.29, 6778.41, '软件服务', 37108.3, '神思电子', 2000, 7.72, 63.15, 'shensidianzi', 'ssdz', '91.20', 16144, 2.02, NULL, 45274.3, 8000, NULL),
(1783, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '河南', 4.87, '300480', 0.25, 2330.82, '电器仪表', 44992.4, '光力科技', 2300, 6.64, 86.37, 'guanglikeji', 'glkj', '26.20', 18193, 1.98, NULL, 48583.3, 9200, NULL),
(1784, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '河南', 5.04, '300481', 0.47, 6611.03, '化工原料', 26563.3, '濮阳惠成', 2000, 5.2, 36.75, 'puyanghuicheng', 'pyhc', '52.65', 15946.2, 1.99, NULL, 46459.8, 8000, NULL),
(1785, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '广东', 7.51, '300482', 0.89, 14567.7, '生物制药', 57195.3, '万孚生物', 2200, 8.21, 46.33, 'wanfushengwu', 'wfsw', '47.86', 37852.6, 4.3, NULL, 74513.5, 8800, NULL),
(1786, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '上海', 6.23, '300483', 0.34, 7524.47, '专用机械', 45712.2, '沃施股份', 1550, 5.55, 67.43, 'woshigufen', 'wsgf', '58.64', 18982.9, 3.09, NULL, 55847.1, 6150, NULL),
(1787, '2016-06-05 13:22:04', '2016-06-05 13:22:04', '北京', 14.9, '300485', 1.17, 10103.6, '生物制药', 165963, '赛升药业', 3000, 4.68, 39.74, 'saishengyaoye', 'ssyy', '50.31', 116091, 9.67, NULL, 182509, 12000, NULL),
(1788, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '山西', 4.91, '300486', 0.28, 9250.38, '专用机械', 84020.3, '东杰智能', 3472, 4.73, 55.22, 'dongjiezhineng', 'djzn', '40.40', 28117.6, 2.02, NULL, 100063, 13886.1, NULL),
(1789, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '陕西', 8.22, '300487', 0.48, 3694.59, '化工原料', 63624.9, '蓝晓科技', 2000, 4.06, 46.77, 'lanxiaokeji', 'lxkj', '52.42', 38288.3, 4.79, NULL, 78522.9, 8000, NULL),
(1790, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '浙江', 8.99, '300488', 0.63, 16385.6, '机械基件', 43834.7, '恒锋工具', 1251, 4.6, 40.84, 'hengfenggongju', 'hfgj', '0.00', 20425.2, 3.27, NULL, 66851.4, 6251, NULL),
(1791, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '黑龙江', 9.22, '300489', 0.47, 7476.65, '铝', 29873.3, '中飞股份', 1135, 5.07, 66.51, 'zhongfeigufen', 'zfgf', '84.80', 21077.9, 4.65, NULL, 69233.6, 4537.5, NULL),
(1792, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '深圳', -0.57, '000033', -0.032, 26307.7, '酒店餐饮', 2504.73, '*ST新都', 32940.2, 0, 0, '*STxindou', '*STxd', '0.00', 10031.8, 0.3, NULL, 41683.2, 32940.2, NULL),
(1793, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '上海', 15.32, '600000', 1.281, 1509100, '银行', 0, '浦发银行', 1492280, 0.97, 5.81, 'pufayinxing', 'pfyx', '18.01', 6063900, 3.25, NULL, 460374000, 1865350, NULL),
(1794, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '广东', 7.81, '600004', 0.538, 628782, '机场', 320441, '白云机场', 115000, 1.6, 11.61, 'baiyunjichang', 'byjc', '12.28', 340315, 2.96, NULL, 1179100, 115000, NULL),
(1795, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '湖北', 3.58, '600005', 0.052, 4570850, '普钢', 3981120, '武钢股份', 1009380, 1.25, 43.35, 'wuganggufen', 'wggf', '2.92', 992948, 0.98, NULL, 9831060, 1009380, NULL),
(1796, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '湖北', 3.14, '600006', 0.118, 323009, '汽车整车', 1403830, '东风汽车', 200000, 3.45, 45.97, 'dongfengqiche', 'dfqc', '6.37', 61461.5, 0.31, NULL, 2038950, 200000, NULL),
(1797, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '北京', 5.29, '600007', 0.303, 117837, '园区开发', 85992.5, '中国国贸', 100728, 2.41, 21.02, 'zhongguoguomao', 'zggm', '18.39', 187252, 1.86, NULL, 982988, 100728, NULL),
(1798, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '北京', 3.36, '600008', 0.087, 280836, '环境保护', 1680740, '首创股份', 220000, 2.83, 54.99, 'shouchuanggufen', 'scgf', '3.99', 335174, 1.39, NULL, 3346270, 241031, NULL),
(1799, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '上海', 9.9, '600009', 0.67, 943641, '机场', 1111450, '上海机场', 109348, 2.7, 19.97, 'shanghaijichang', 'shjc', '27.79', 257550, 1.34, NULL, 2420410, 192696, NULL),
(1800, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '内蒙', 1.48, '600010', -0.02, 2356630, '普钢', 6751810, '包钢股份', 1574200, 2.92, 0, 'baoganggufen', 'bggf', '2.98', 1350480, 0.41, NULL, 13879500, 3256070, NULL),
(1801, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '北京', 4.86, '600011', 0.628, 19020300, '火力发电', 3233370, '华能国际', 1050000, 2.12, 8.21, 'huanengguoji', 'hngj', '7.46', 1434650, 0.99, NULL, 29640500, 1442040, NULL),
(1802, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '安徽', 4.61, '600012', 0.284, 81855.6, '路桥', 103151, '皖通高速', 116560, 2.01, 16.31, 'wantonggaosu', 'wtgs', '14.26', 28052.3, 0.17, NULL, 1167630, 165861, NULL),
(1803, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '北京', 10.4, '600015', 0.867, 1014200, '银行', 0, '华夏银行', 778522, 1.05, 6.27, 'huaxiayinxing', 'hxyx', '10.16', 3054300, 2.86, NULL, 191723000, 1068560, NULL),
(1804, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '北京', 7.68, '600016', 0.78, 3523300, '银行', 0, '民生银行', 2955180, 1.21, 6.32, 'minshengyinxing', 'msyx', '8.99', 6475600, 1.77, NULL, 430107000, 3648540, NULL),
(1805, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '山东', 3.26, '600017', 0.074, 1057560, '港口', 308115, '日照港', 307565, 1.88, 41.76, 'rizhaogang', 'rzg', '4.23', 295582, 0.96, NULL, 1846750, 307565, NULL),
(1806, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '上海', 2.44, '600018', 0.134, 3453010, '港口', 2050890, '上港集团', 2275520, 3.14, 28.69, 'shanggangjituan', 'sgjt', '5.21', 865172, 0.37, NULL, 9868090, 2317370, NULL),
(1807, '2016-06-05 13:22:05', '2016-06-05 13:22:05', '上海', 6.98, '600019', 0.193, 8079540, '普钢', 7770380, '宝钢股份', 1642430, 0.89, 16.19, 'baoganggufen', 'bggf', '5.25', 3373810, 2.05, NULL, 23301400, 1646930, NULL),
(1808, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '河南', 5.17, '600020', 0.353, 1594650, '路桥', 803262, '中原高速', 224737, 1, 7.33, 'zhongyuangaosu', 'zygs', '4.53', 175571, 0.78, NULL, 4562540, 224737, NULL),
(1809, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '上海', 4.56, '600021', 0.334, 2742510, '火力发电', 780754, '上海电力', 213974, 3.18, 21.73, 'shanghaidianli', 'shdl', '10.53', 420398, 1.96, NULL, 4759220, 213974, NULL),
(1810, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '山东', 1.81, '600022', 0.001, 3506400, '普钢', 967935, '山东钢铁', 643630, 1.82, 1858.2, 'shandonggangtie', 'sdgt', '2.44', 766446, 0.91, NULL, 4747130, 842042, NULL),
(1811, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '浙江', 3.9, '600023', 0.32, 4656140, '火力发电', 2447800, '浙能电力', 255426, 2.16, 14.63, 'zhenengdianli', 'zndl', '5.35', 2345250, 1.72, NULL, 10570300, 1360070, NULL),
(1812, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '上海', 6.23, '600026', 0.074, 4440870, '水运', 655531, '中海发展', 273603, 1.78, 74.67, 'zhonghaifazhan', 'zhfz', '6.25', 776596, 1.93, NULL, 6696520, 403203, NULL),
(1813, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '山东', 3.73, '600027', 0.398, 12028700, '火力发电', 1827290, '华电国际', 594006, 2.1, 9.84, 'huadianguoji', 'hdgj', '5.26', 926569, 1.05, NULL, 18697600, 880729, NULL),
(1814, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '北京', 5.63, '600028', 0.202, 69562400, '石油加工', 39555500, '中国石化', 9555780, 0.87, 12.12, 'zhongguoshihua', 'zgsh', '4.81', 11907300, 0.98, NULL, 147036000, 12107100, NULL),
(1815, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '广东', 3.94, '600029', 0.355, 14002100, '空运', 2121400, '南方航空', 702265, 2.08, 11.53, 'nanfanghangkong', 'nfhk', '7.07', 1438700, 1.47, NULL, 18817500, 981757, NULL),
(1816, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '深圳', 10.75, '600030', 1.13, 96553, '证券', 0, '中信证券', 981466, 1.38, 7.22, 'zhongxinzhengquan', 'zxzq', '16.62', 5435320, 4.49, NULL, 77550600, 1211690, NULL),
(1817, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '湖南', 3.08, '600031', 0.044, 1545370, '工程机械', 3637590, '三一重工', 759371, 2.06, 72.34, 'sanyizhonggong', 'syzg', '5.07', 76295.1, 0.1, NULL, 6049820, 761650, NULL),
(1818, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '福建', 2.85, '600033', 0.117, 1653860, '路桥', 112849, '福建高速', 274440, 1.33, 16.18, 'fujiangaosu', 'fjgs', '3.29', 166058, 0.61, NULL, 1910990, 274440, NULL),
(1819, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '湖北', 2.7, '600035', 0.194, 63338.3, '路桥', 74066.1, '楚天高速', 145338, 1.68, 11.72, 'chutiangaosu', 'ctgs', '5.15', 35862.6, 0.25, NULL, 927870, 145338, NULL),
(1820, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '深圳', 13.17, '600036', 1.308, 2866500, '银行', 0, '招商银行', 2062890, 1.27, 6.41, 'zhaoshangyinxing', 'zsyx', '17.78', 6752300, 2.68, NULL, 522122000, 2521980, NULL),
(1821, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '北京', 6.74, '600037', 0.27, 436369, '影视音像', 445408, '歌华有线', 116835, 2.47, 32.49, 'gehuayouxian', 'ghyx', '15.61', 348765, 2.99, NULL, 1030310, 116835, NULL),
(1822, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '黑龙江', 10.66, '600038', 0.317, 255652, '航空', 1729910, '中直股份', 39265, 3.88, 65.35, 'zhongzhigufen', 'zzgf', '39.82', 423272, 7.18, NULL, 2099910, 58947.7, NULL),
(1823, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '四川', 2.55, '600039', 0.108, 260355, '建筑施工', 2826810, '四川路桥', 301973, 1.74, 20.65, 'sichuanluqiao', 'sclq', '3.85', 88722.9, 0.29, NULL, 5315980, 301973, NULL),
(1824, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '广东', 5.97, '600048', 0.46, 297481, '全国地产', 36259600, '保利地产', 1075270, 1.42, 9.24, 'baolidichan', 'bldc', '8.51', 707498, 0.66, NULL, 37944700, 1075270, NULL),
(1825, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '上海', 3.69, '600050', 0.109, 35647500, '电信运营', 5645750, '中国联通', 2119660, 1.72, 29.2, 'zhongguoliantong', 'zglt', '3.97', 2781150, 1.31, NULL, 54024200, 2119660, NULL),
(1826, '2016-06-05 13:22:06', '2016-06-05 13:22:06', '浙江', 6.79, '600051', 0.36, 66528.6, '综合类', 604284, '宁波联合', 30579.2, 1.22, 11.88, 'ningbolianhe', 'nblh', '9.99', 22338.3, 0.72, NULL, 802588, 31088, NULL),
(1827, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '浙江', 2.17, '600052', -0.077, 21724.6, '区域地产', 852512, '浙江广厦', 87178.9, 2.46, 0, 'zhejiangguangsha', 'zjgs', '6.52', 4554.18, 0.05, NULL, 964746, 87178.9, NULL),
(1828, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '江西', 2.03, '600053', 0.064, 3193.53, '区域地产', 246329, '中江地产', 43354.1, 6.49, 103.45, 'zhongjiangdichan', 'zjdc', '35.97', 18868.7, 0.44, NULL, 261045, 43354.1, NULL),
(1829, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '安徽', 4.92, '600054', 0.26, 193533, '旅游景点', 120028, '黄山旅游', 11762, 3.54, 34.87, 'huangshanlvyou', 'hsly', '25.72', 13183.5, 0.26, NULL, 341695, 49820, NULL),
(1830, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '北京', 3.14, '600055', 0.093, 21894.2, '医疗保健', 70982.1, '华润万东', 21645, 7.49, 126.41, 'huarunwandong', 'hrwd', '27.68', 11343.5, 0.52, NULL, 133525, 21645, NULL),
(1831, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '北京', 5.13, '600056', 0.369, 148487, '医药商业', 1196450, '中国医药', 98220.3, 2.79, 19.39, 'zhongguoyiyao', 'zgyy', '15.54', 172944, 1.71, NULL, 1476770, 101251, NULL),
(1832, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '福建', 3.82, '600057', 0.173, 135698, '仓储物流', 1849090, '象屿股份', 29016.8, 2.56, 28.29, 'xiangyugufen', 'xygf', '10.44', 168485, 1.63, NULL, 2269550, 103625, NULL),
(1833, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '北京', 7.71, '600058', -0.274, 993737, '商贸代理', 3693310, '五矿发展', 107191, 4.84, 0, 'wukuangfazhan', 'wkfz', '19.78', 379054, 3.54, NULL, 5131340, 107191, NULL),
(1834, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '浙江', 4.67, '600059', 0.087, 116830, '红黄药酒', 262190, '古越龙山', 80852.4, 1.91, 51.61, 'guyuelongshan', 'gyls', '9.83', 188045, 2.33, NULL, 417372, 80852.4, NULL),
(1835, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '山东', 8.42, '600060', 0.478, 136260, '家用电器', 1673080, '海信电器', 130848, 1.7, 14.99, 'haixindianqi', 'hxdq', '16.47', 225874, 1.73, NULL, 1954980, 130848, NULL),
(1836, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '上海', 6.9, '600061', 0.8, 45997.6, '化纤', 18025100, '国投安信', 42908.3, 1.84, 9.42, 'guotouanxin', 'gtax', '17.14', 1754890, 4.75, NULL, 19272800, 369415, NULL),
(1837, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '北京', 10.52, '600062', 0.58, 178393, '化学制药', 420021, '华润双鹤', 57169.6, 1.96, 17.76, 'huarunshuanghe', 'hrsh', '18.70', 115925, 2.03, NULL, 682386, 57169.6, NULL),
(1838, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '安徽', 2.7, '600063', 0.031, 362617, '化纤', 196070, '皖维高新', 149785, 1.64, 72.34, 'wanweigaoxin', 'wwgx', '4.45', 59314.5, 0.36, NULL, 861651, 164589, NULL),
(1839, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '江苏', 13.35, '600064', 0.667, 15863, '园区开发', 1031640, '南京高科', 77432.8, 1.27, 12.74, 'nanjinggaoke', 'njgk', '15.04', 46031.9, 0.59, NULL, 2304070, 77432.8, NULL),
(1840, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '河南', 4.64, '600066', 0.427, 362143, '汽车整车', 1567120, '宇通客车', 189953, 3.96, 21.52, 'yutongkeche', 'ytkc', '19.59', 128888, 0.58, NULL, 2278160, 221394, NULL),
(1841, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '福建', 4.81, '600067', 0.24, 96005.2, '全国地产', 1459550, '冠城大通', 148290, 1.45, 16.77, 'guanchengdatong', 'gcdt', '6.67', 166705, 1.12, NULL, 1890940, 148290, NULL),
(1842, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '湖北', 4.17, '600068', 0.273, 1166570, '建筑施工', 6959880, '葛洲坝', 414858, 1.83, 14.05, 'gezhouba', 'gzb', '5.91', 743589, 1.61, NULL, 11485000, 460478, NULL),
(1843, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '河南', 0.97, '600069', -0.09, 215466, '造纸', 152125, '*ST银鸽', 82537.4, 3.66, 0, '*STyinge', '*STyg', '4.17', 76961.5, 0.62, NULL, 517994, 124910, NULL),
(1844, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '浙江', 3.14, '600070', 0.001, 36267.5, '纺织', 62784.4, '浙江富润', 35661.3, 2.6, 5900.22, 'zhejiangfurun', 'zjfr', '15.80', 3291.73, 0.09, NULL, 227793, 35661.3, NULL),
(1845, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '江西', 2.05, '600071', -0.025, 40955.1, '文教休闲', 62220.8, '*ST光学', 23747.2, 7.24, 0, '*STguangxue', '*STgx', '26.72', 11017.9, 0.46, NULL, 112901, 23747.2, NULL),
(1846, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '上海', 2.3, '600072', -0.061, 72463.1, '船舶', 119771, '钢构工程', 47843, 11.28, 0, 'ganggougongcheng', 'gggc', '13.95', 40558.2, 0.85, NULL, 216091, 47843, NULL),
(1847, '2016-06-05 13:22:07', '2016-06-05 13:22:07', '上海', 3.36, '600073', 0.085, 134990, '食品', 347536, '上海梅林', 82273.5, 4.01, 79.57, 'shanghaimeilin', 'shml', '12.54', 180045, 1.92, NULL, 625257, 93773, NULL),
(1848, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '江苏', 0.52, '600074', 0.06, 18160.7, '电脑设备', 134431, '保千里', 89598.1, 40.03, 229.47, 'baoqianli', 'bql', '14.11', -153865, -0.68, NULL, 161748, 225595, NULL),
(1849, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '新疆', 3.57, '600075', 0.06, 87004, '化工原料', 188466, '新疆天业', 43859.2, 4.48, 134.02, 'xinjiangtianye', 'xjty', '11.23', 24755.8, 0.56, NULL, 340175, 43859.2, NULL),
(1850, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '山东', 0.31, '600076', -0.035, 227.53, '通信设备', 73034.9, '青鸟华光', 36553.6, 21.87, 0, 'qingniaohuaguang', 'qnhg', '13.09', 48777.1, 1.33, NULL, 78415.8, 36553.6, NULL),
(1851, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '浙江', 2.79, '600077', 0.005, 5708.78, '全国地产', 1340910, '宋都股份', 109096, 1.81, 473.05, 'songdougufen', 'sdgf', '4.88', 128210, 0.96, NULL, 1384170, 134012, NULL),
(1852, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '江苏', 2.7, '600078', 0.031, 207626, '化工原料', 274996, '澄星股份', 66257.3, 2.14, 92.4, 'chengxinggufen', 'cxgf', '6.24', 38929.4, 0.59, NULL, 567548, 66257.3, NULL),
(1853, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '湖北', 5.91, '600079', 0.233, 288570, '化学制药', 823650, '人福医药', 103099, 2.69, 34.04, 'renfuyiyao', 'rfyy', '16.49', 449399, 3.49, NULL, 1550620, 128605, NULL),
(1854, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '陕西', 3.38, '600080', 0.04, 38727, '中成药', 45789.1, '金花股份', 30529.6, 2.22, 94.71, 'jinhuagufen', 'jhgf', '10.91', 25259.8, 0.83, NULL, 126312, 30529.6, NULL),
(1855, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '上海', 3.33, '600081', 0.377, 95347.5, '汽车配件', 258103, '东风科技', 31356, 4.97, 21.94, 'dongfengkeji', 'dfkj', '16.14', 1522.9, 0.05, NULL, 423176, 31356, NULL),
(1856, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '天津', 2.72, '600082', 0.013, 4089.28, '园区开发', 329300, '海泰发展', 63237.6, 1.77, 180.53, 'haitaifazhan', 'htfz', '5.86', 41259.1, 0.64, NULL, 343003, 64611.6, NULL),
(1857, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '广东', 0.22, '600083', 0.042, 314.61, '元器件', 10094.1, '博信股份', 22692.3, 45.22, 114.83, 'boxingufen', 'bxgf', '20.54', 9643.53, 0.42, NULL, 12861.2, 23000, NULL),
(1858, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '新疆', 2.12, '600084', -0.045, 33084.2, '红黄药酒', 360863, '中葡股份', 80991.9, 2.41, 0, 'zhongpugufen', 'zpgf', '5.95', 270840, 2.41, NULL, 423104, 112373, NULL),
(1859, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '北京', 4.86, '600085', 0.37, 128996, '中成药', 1154900, '同仁堂', 137147, 4.96, 33.77, 'tongrentang', 'trt', '28.02', 198921, 1.45, NULL, 1417220, 137147, NULL),
(1860, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '湖北', 6.03, '600086', 0.63, 21045.7, '服饰', 775636, '东方金钰', 35228.2, 4.99, 25.88, 'dongfangjinyu', 'dfjy', '8.70', 153178, 3.4, NULL, 850056, 45000, NULL),
(1861, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '上海', 3.48, '600088', 0.092, 41028.2, '影视音像', 99136.4, '中视传媒', 33142.2, 5.86, 111, 'zhongshichuanmei', 'zscm', '24.85', 31993.5, 0.97, NULL, 142837, 33142.2, NULL),
(1862, '2016-06-05 13:22:08', '2016-06-05 13:22:08', '新疆', 6.16, '600089', 0.342, 1761280, '电气设备', 4226150, '特变电工', 317749, 1.81, 16.31, 'tebiandiangong', 'tbdg', '8.55', 814860, 2.51, NULL, 6607980, 324905, NULL),
(1863, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '新疆', 1.31, '600090', 0.082, 52238.4, '啤酒', 79258.3, '啤酒花', 36791.7, 7.63, 61.28, 'pijiuhua', 'pjh', '13.09', 38512.3, 1.05, NULL, 150134, 36791.7, NULL),
(1864, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '内蒙', 0.65, '600091', -0.241, 1310.62, '化工原料', 44481.4, '*ST明科', 33652.6, 10.91, 0, '*STmingke', '*STmk', '11.23', 121788, 3.62, NULL, 119981, 33652.6, NULL),
(1865, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '四川', 4.73, '600093', 0.13, 32373.8, '汽车配件', 504944, '禾嘉股份', 32244.8, 2.32, 144.91, 'hejiagufen', 'hjgf', '12.99', 403888, 3.6, NULL, 569183, 112245, NULL),
(1866, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '上海', 2.78, '600094', 0.065, 44831.8, '区域地产', 2805710, '大名城', 131284, 2.87, 61.4, 'damingcheng', 'dmc', '9.49', 248455, 1.24, NULL, 3111250, 201156, NULL),
(1867, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '黑龙江', 1.95, '600095', -0.029, 19973.9, '区域地产', 79000.8, '哈高科', 36126.4, 4.01, 0, 'hagaoke', 'hgk', '9.90', 26740.8, 0.74, NULL, 120134, 36126.4, NULL),
(1868, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '云南', 4.93, '600096', 0.03, 1885040, '农药化肥', 2842030, '云天化', 52126.4, 1.8, 146.29, 'yuntianhua', 'yth', '9.29', 408225, 3.62, NULL, 6543850, 112908, NULL),
(1869, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '上海', 4.4, '600097', 0.028, 69192.9, '渔业', 64573.7, '开创国际', 20259.8, 6.87, 546.2, 'kaichuangguoji', 'kcgj', '15.36', 2548.95, 0.13, NULL, 134227, 20259.8, NULL),
(1870, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '广东', 5.13, '600098', 0.196, 1617430, '火力发电', 844324, '广州发展', 272620, 1.77, 23.15, 'guangzhoufazhan', 'gzfz', '8.17', 382557, 1.4, NULL, 3468710, 272620, NULL),
(1871, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '江苏', 2.15, '600099', 0.007, 13456.3, '摩托车', 39830.2, '林海股份', 21912, 6.22, 1008.69, 'linhaigufen', 'lhgf', '11.57', 19940.8, 0.91, NULL, 58814.4, 21912, NULL),
(1872, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '北京', 5.9, '600100', 0.33, 544878, '电脑设备', 2739830, '同方股份', 207020, 2.37, 23.51, 'tongfanggufen', 'tfgf', '15.35', 965152, 3.26, NULL, 5274730, 296390, NULL),
(1873, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '四川', 5.72, '600101', 0.143, 176041, '水力发电', 35852.6, '明星电力', 32417.9, 1.74, 34.89, 'mingxingdianli', 'mxdl', '11.96', 46140.2, 1.42, NULL, 274226, 32417.9, NULL),
(1874, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '福建', 1.1, '600103', -0.07, 128733, '造纸', 156720, '青山纸业', 106184, 4.23, 0, 'qingshanzhiye', 'qszy', '5.33', 745.9, 0.01, NULL, 353186, 106184, NULL),
(1875, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '上海', 14.43, '600104', 1.285, 3556130, '汽车整车', 26730400, '上汽集团', 1102560, 1.24, 6.97, 'shangqijituan', 'sqjt', '20.55', 3773140, 3.42, NULL, 47426200, 1102560, NULL),
(1876, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '江苏', 4.5, '600105', 0.2, 38966.2, '通信设备', 137066, '永鼎股份', 38095.5, 2.73, 38.84, 'yongdinggufen', 'ydgf', '17.92', 53522.4, 1.13, NULL, 260226, 47249.7, NULL),
(1877, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '重庆', 3.5, '600106', 0.163, 33243.1, '路桥', 245624, '重庆路桥', 90774.2, 3.01, 32.33, 'zhongqingluqiao', 'zqlq', '7.36', 5429.05, 0.06, NULL, 760349, 90774.2, NULL),
(1878, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '湖北', 1.46, '600107', 0.006, 17693.8, '服饰', 83380.7, '美尔雅', 36000, 9.84, 1259.26, 'meierya', 'mey', '20.43', 15956.4, 0.44, NULL, 130716, 36000, NULL),
(1879, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '甘肃', 2.42, '600108', 0.045, 139538, '农业综合', 302142, '亚盛集团', 194692, 2.78, 75.26, 'yashengjituan', 'ysjt', '5.07', 53910.9, 0.28, NULL, 734510, 194692, NULL),
(1880, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '四川', 5.17, '600109', 0.43, 9835.41, '证券', 0, '国金证券', 283686, 2.34, 14.82, 'guojinzhengquan', 'gjzq', '13.20', 784179, 2.59, NULL, 7134560, 302436, NULL),
(1881, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '吉林', 1.58, '600110', 0.031, 236533, '电气设备', 304705, '中科英华', 115031, 8.7, 221.16, 'zhongkeyinghua', 'zkyh', '6.90', 71362.3, 0.62, NULL, 679024, 115031, NULL),
(1882, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '内蒙', 2.27, '600111', 0.072, 213824, '小金属', 1016590, '北方稀土', 221920, 5.78, 91.64, 'beifangxitu', 'bfxt', '14.92', 16602.3, 0.05, NULL, 1536910, 363307, NULL),
(1883, '2016-06-05 13:22:09', '2016-06-05 13:22:09', '贵州', 2.49, '600112', 0.007, 35199.1, '电气设备', 134431, '天成控股', 50920.5, 5.08, 941.7, 'tianchengkonggu', 'tckg', '11.06', 39231.1, 0.77, NULL, 276082, 50920.5, NULL),
(1884, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '浙江', 1.88, '600113', 0.036, 2134.96, '区域地产', 98439.7, '浙江东日', 31860, 3.98, 104.37, 'zhejiangdongri', 'zjdr', '12.05', 10731, 0.34, NULL, 122910, 31860, NULL),
(1885, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '浙江', 3.8, '600114', 0.23, 87936.5, '机械基件', 82601.6, '东睦股份', 23948.2, 2.92, 25.44, 'dongmugufen', 'dmgf', '16.50', 74437.9, 1.9, NULL, 216722, 39076.6, NULL),
(1886, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '上海', 2.47, '600115', 0.281, 11930800, '空运', 1701100, '东方航空', 778221, 3.32, 14.56, 'dongfanghangkong', 'dfhk', '6.79', 1741000, 1.37, NULL, 17611200, 1267430, NULL),
(1887, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '重庆', 6.34, '600116', 0.35, 239732, '水力发电', 139362, '三峡水利', 26753.3, 1.87, 17.72, 'sanxiashuili', 'sxsl', '7.57', 128390, 3.88, NULL, 443457, 33100.2, NULL),
(1888, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '青海', 3.32, '600117', -0.318, 891087, '特种钢', 619396, '西宁特钢', 74121.9, 1.4, 0, 'xiningtegang', 'xntg', '5.23', 39989.5, 0.54, NULL, 2421510, 74121.9, NULL),
(1889, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '北京', 3.71, '600118', 0.142, 57449.8, '航空', 811171, '中国卫星', 118249, 9.8, 128.02, 'zhongguoweixing', 'zgwx', '31.74', 161270, 1.36, NULL, 987325, 118249, NULL),
(1890, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '上海', 2.49, '600119', 0.079, 34785.9, '仓储物流', 143513, '长江投资', 30740, 5.38, 85.34, 'zhangjiangtouzi', 'zjtz', '14.99', 32169.5, 1.05, NULL, 222656, 30740, NULL),
(1891, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '浙江', 10.65, '600120', 0.588, 39916.3, '商贸代理', 590435, '浙江东方', 50547.3, 1.64, 14.82, 'zhejiangdongfang', 'zjdf', '19.74', 4275.71, 0.08, NULL, 1188150, 50547.3, NULL),
(1892, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '河南', 3.9, '600121', -0.169, 515044, '煤炭开采', 373965, '郑州煤电', 69834.4, 1.29, 0, 'zhengzhoumeidian', 'zzmd', '4.65', 50314.1, 0.5, NULL, 1072380, 101534, NULL),
(1893, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '江苏', 6.91, '600122', 0.227, 76128.6, '其他商业', 1281860, '宏图高科', 114027, 1.25, 19, 'hongtugaoke', 'htgk', '19.38', 206871, 1.8, NULL, 1767410, 114635, NULL),
(1894, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '山西', 8.48, '600123', 0.069, 450765, '煤炭开采', 659214, '兰花科创', 114240, 0.82, 50.18, 'lanhuakechuang', 'lhkc', '7.23', 39492.1, 0.35, NULL, 2225740, 114240, NULL),
(1895, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '辽宁', 3.63, '600125', 0.12, 214376, '铁路', 390464, '铁龙物流', 130552, 2.27, 34.19, 'tielongwuliu', 'tlwl', '6.34', 15779.5, 0.12, NULL, 660522, 130552, NULL),
(1896, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '浙江', 3.59, '600126', -0.353, 192959, '普钢', 426576, '杭钢股份', 83893.9, 1.64, 0, 'hangganggufen', 'hggf', '6.10', 73577.1, 0.88, NULL, 637564, 83893.9, NULL),
(1897, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '湖南', 1.28, '600127', -0.134, 47813.8, '农业综合', 75722.9, '金健米业', 54446, 4.33, 0, 'jinjianmiye', 'jjmy', '6.53', 46598.4, 0.73, NULL, 141908, 64178.3, NULL),
(1898, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '江苏', 6.09, '600128', 0.087, 30469.7, '商贸代理', 193421, '弘业股份', 24676.8, 1.65, 57.99, 'hongyegufen', 'hygf', '12.88', 70761.5, 2.87, NULL, 303609, 24676.8, NULL),
(1899, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '重庆', 3.18, '600129', 0.422, 161061, '中成药', 615672, '太极集团', 42689.4, 4.52, 17.06, 'taijijituan', 'tjjt', '16.92', 45789.5, 1.07, NULL, 1045890, 42689.4, NULL),
(1900, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '浙江', 1.2, '600130', 0.027, 10072.5, '通信设备', 95770.6, '波导股份', 76800, 4.58, 101.99, 'bodaogufen', 'bdgf', '8.85', 45592.2, 0.59, NULL, 122607, 76800, NULL),
(1901, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '四川', 1.7, '600131', 0.152, 117392, '水力发电', 14126.9, '岷江水电', 39736.7, 3.85, 21.49, 'minjiangshuidian', 'mjsd', '9.12', 4714.3, 0.09, NULL, 232953, 50412.5, NULL),
(1902, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '重庆', 2.61, '600132', 0.17, 162126, '啤酒', 158941, '重庆啤酒', 48397.1, 4.92, 37.74, 'zhongqingpijiu', 'zqpj', '16.34', 0, 0, NULL, 405832, 48397.1, NULL),
(1903, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '湖北', 2.41, '600133', 0.02, 91417, '园区开发', 1102520, '东湖高新', 53794.9, 3.72, 228.82, 'donghugaoxin', 'dhgx', '7.67', 54265.7, 0.86, NULL, 1478050, 63425.8, NULL),
(1904, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '河北', 4.25, '600135', 0.026, 23037.5, '化工原料', 131491, '乐凯胶片', 34200, 3.08, 249.5, 'lekaijiaopian', 'lkjp', '15.75', 89991.4, 2.41, NULL, 173011, 37299.2, NULL),
(1905, '2016-06-05 13:22:10', '2016-06-05 13:22:10', '湖北', 5.11, '600136', 0.15, 8503.85, '商贸代理', 68331.1, '道博股份', 10429.4, 4.44, 83.65, 'daobogufen', 'dbgf', '25.64', 62323.1, 3.8, NULL, 117648, 16401.8, NULL),
(1906, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '四川', 4.75, '600137', 0.011, 10298.7, '服饰', 39520, '浪莎股份', 9721.75, 4.41, 970.32, 'langshagufen', 'lsgf', '30.36', 34179.8, 3.52, NULL, 55516.5, 9721.75, NULL),
(1907, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '北京', 6.33, '600138', 0.229, 233930, '旅游服务', 343868, '中青旅', 70271.8, 2.91, 40.33, 'zhongqinglv', 'zql', '19.86', 171299, 2.37, NULL, 908594, 72384, NULL),
(1908, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '四川', 1.97, '600139', 0.011, 54035.5, '铜', 253249, '西部资源', 66189, 11.23, 972.14, 'xibuziyuan', 'xbzy', '12.31', 37693.7, 0.57, NULL, 620371, 66189, NULL),
(1909, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '湖北', 9.15, '600141', 0.097, 1009280, '化工原料', 511083, '兴发集团', 43723.1, 1.31, 61.91, 'xingfajituan', 'xfjt', '10.61', 286331, 5.4, NULL, 2132800, 52998.2, NULL),
(1910, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '广东', 3.19, '600143', 0.165, 273792, '塑料', 880405, '金发科技', 256000, 2.18, 21.12, 'jinfakeji', 'jfkj', '6.36', 282495, 1.1, NULL, 1400300, 256000, NULL),
(1911, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '新疆', -3.81, '600145', -0.008, 1235.77, '陶瓷', 1350.46, '*ST新亿', 37768.5, -1.5, 0, '*STxinyi', '*STxy', '1.87', 6743.71, 0.18, NULL, 3479.4, 37768.5, NULL),
(1912, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '宁夏', 0.68, '600146', -0.059, 2974.8, '塑料', 6754.5, '商赢环球', 20000, 38.89, 0, 'shangyinghuanqiu', 'syhq', '27.61', 12242, 0.61, NULL, 29428.5, 20000, NULL),
(1913, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '吉林', 2.6, '600148', 0.055, 17431.7, '汽车配件', 66411.3, '长春一东', 14151.6, 8.85, 210.38, 'zhangchunyidong', 'zcyd', '20.50', 8911.74, 0.63, NULL, 86583.3, 14151.6, NULL),
(1914, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '河北', 0.71, '600149', -0.012, 2733.15, '综合类', 14514, '廊坊发展', 38016, 22.12, 0, 'langfangfazhan', 'lffz', '16.64', 10597.4, 0.28, NULL, 29790.4, 38016, NULL),
(1915, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '上海', 12.75, '600150', 0.125, 1216760, '船舶', 3694470, '中国船舶', 137812, 2.78, 142.11, 'zhongguochuanbo', 'zgcb', '22.68', 449950, 3.26, NULL, 5379410, 137812, NULL),
(1916, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '上海', 3.24, '600151', -0.014, 259338, '半导体', 399493, '航天机电', 125018, 2.78, 0, 'hangtianjidian', 'htjd', '10.53', 286349, 2.29, NULL, 963491, 125018, NULL),
(1917, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '浙江', 1.94, '600152', 0.066, 46959.8, '纺织', 69344.4, '维科精华', 29349.4, 3.46, 51.17, 'weikejinghua', 'wkjh', '9.97', 12855.8, 0.44, NULL, 149918, 29349.4, NULL),
(1918, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '福建', 6.33, '600153', 0.257, 104642, '商贸代理', 8920280, '建发股份', 283520, 2.73, 33.65, 'jianfagufen', 'jfgf', '17.31', 259419, 0.91, NULL, 10216300, 283520, NULL),
(1919, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '河北', 0.16, '600155', -0.113, 5865.45, '化工原料', 179970, '宝硕股份', 41250, 95.84, 0, 'baoshuogufen', 'bsgf', '13.10', 36891.8, 0.77, NULL, 191389, 47660.3, NULL),
(1920, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '湖南', 1.69, '600156', -0.004, 15682.5, '纺织', 64751.8, '华升股份', 40211.1, 6.06, 0, 'huashenggufen', 'hsgf', '11.59', 13376.8, 0.33, NULL, 111277, 40211.1, NULL),
(1921, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '山西', 1.79, '600157', 0.039, 1859970, '煤炭开采', 1931010, '永泰能源', 459565, 2.55, 58.05, 'yongtainengyuan', 'ytny', '4.12', 692134, 0.62, NULL, 8586920, 1119460, NULL),
(1922, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '天津', 1.76, '600158', 0.015, 11661.9, '文教休闲', 322026, '中体产业', 65749.5, 8.58, 519.16, 'zhongtichanye', 'ztcy', '18.93', 2382.18, 0.03, NULL, 359911, 84373.5, NULL),
(1923, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '北京', 2.5, '600159', -0.02, 5233.45, '区域地产', 247898, '大龙地产', 83000.3, 1.68, 0, 'dalongdichan', 'dldc', '4.71', 34618.8, 0.42, NULL, 274028, 83000.3, NULL),
(1924, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '浙江', 3.96, '600160', 0.047, 466232, '化工原料', 295854, '巨化股份', 181092, 2.52, 105.54, 'juhuagufen', 'jhgf', '10.26', 246419, 1.36, NULL, 906354, 181092, NULL),
(1925, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '北京', 3.88, '600161', 0.107, 267020, '生物制药', 177193, '天坛生物', 51546.7, 5.98, 108.71, 'tiantanshengwu', 'ttsw', '28.71', 16605.6, 0.32, NULL, 576452, 51546.7, NULL),
(1926, '2016-06-05 13:22:11', '2016-06-05 13:22:11', '深圳', 2.44, '600162', 0.21, 53427.9, '全国地产', 1154830, '香江控股', 76781.3, 2.36, 13.76, 'xiangjiangkonggu', 'xjkg', '6.55', 1538.67, 0.02, NULL, 1392080, 76781.3, NULL),
(1927, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '福建', 1.4, '600163', -0.07, 196190, '造纸', 63462, '*ST南纸', 72142, 3.99, 0, '*STnanzhi', '*STnz', '5.59', 204757, 2.05, NULL, 278889, 99946.5, NULL),
(1928, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '宁夏', 3.15, '600165', -0.213, 64631.5, '钢加工', 124185, '新日恒力', 19395.3, 8.96, 0, 'xinrihengli', 'xrhl', '12.43', 69470.9, 2.54, NULL, 248459, 27395.3, NULL),
(1929, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '北京', 5.47, '600166', 0.046, 947163, '汽车整车', 1482980, '福田汽车', 280967, 1.1, 64.61, 'futianqiche', 'ftqc', '5.50', 1017440, 3.05, NULL, 3930790, 333507, NULL),
(1930, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '辽宁', 5.31, '600167', 0.628, 84872.8, '供气供热', 34703.9, '联美控股', 21100, 4.85, 20.51, 'lianmeikonggu', 'lmkg', '17.86', 24701.8, 1.17, NULL, 275234, 21100, NULL),
(1931, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '湖北', 5.96, '600168', 0.26, 484126, '水务', 127000, '武汉控股', 56888.1, 1.49, 17.02, 'wuhankonggu', 'whkg', '9.88', 151264, 2.13, NULL, 769793, 70957, NULL),
(1932, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '山西', 2.24, '600169', 0.003, 508928, '工程机械', 1970950, '太原重工', 242396, 2.19, 782.15, 'taiyuanzhonggong', 'tyzg', '3.96', 122943, 0.51, NULL, 2707190, 242396, NULL),
(1933, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '上海', 3.24, '600170', 0.16, 559998, '建筑施工', 9336280, '上海建工', 469020, 2.67, 27.07, 'shanghaijiangong', 'shjg', '3.89', 411241, 0.69, NULL, 12108200, 594321, NULL),
(1934, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '上海', 2.67, '600171', 0.033, 9157.85, '半导体', 153426, '上海贝岭', 67380.8, 4.21, 170.59, 'shanghaibeiling', 'shbl', '15.81', 80176.5, 1.19, NULL, 201618, 67380.8, NULL),
(1935, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '河南', 5.07, '600172', 0.16, 243689, '矿物制品', 244778, '黄河旋风', 49667.8, 2.4, 40.1, 'huanghexuanfeng', 'hhxf', '17.20', 162727, 2.34, NULL, 624991, 69503.2, NULL),
(1936, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '浙江', 2.23, '600173', 0.065, 1259.27, '全国地产', 438621, '卧龙地产', 72505.7, 2.22, 38.26, 'wolongdichan', 'wldc', '8.33', 1580.56, 0.02, NULL, 453053, 72514.7, NULL),
(1937, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '浙江', 1.9, '600175', 0.069, 18794, '全国地产', 686474, '美都能源', 144803, 2.46, 33.85, 'meidounengyuan', 'mdny', '4.79', 140180, 0.57, NULL, 1438240, 245104, NULL),
(1938, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '浙江', 5.16, '600176', 0.552, 1237400, '玻璃', 700779, '中国巨石', 87263, 4.05, 18.96, 'zhongguojushi', 'zgjs', '9.26', 127750, 1.46, NULL, 2068860, 87263, NULL),
(1939, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '浙江', 8.52, '600177', 1.304, 374645, '服饰', 2196630, '雅戈尔', 222661, 1.53, 4.99, 'yageer', 'yge', '15.34', 34081.6, 0.15, NULL, 4597800, 222661, NULL),
(1940, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '黑龙江', 3.88, '600178', 0.146, 28900.7, '汽车整车', 117078, '东安动力', 46208, 2.03, 27, 'dongandongli', 'dadl', '8.55', 85944.1, 1.86, NULL, 310091, 46208, NULL),
(1941, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '黑龙江', -0.43, '600179', -0.416, 75036.8, '焦炭加工', 54110.8, '黑化股份', 39000, -20.72, 0, 'heihuagufen', 'hhgf', '10.55', 32563.7, 0.83, NULL, 129276, 39000, NULL),
(1942, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '山东', 4.31, '600180', 0.14, 2717, '仓储物流', 918058, '瑞茂通', 88254.9, 3.61, 64.43, 'ruimaotong', 'rmt', '14.27', 146612, 1.44, NULL, 1021620, 101741, NULL),
(1943, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '黑龙江', 3.03, '600182', 0.314, 109671, '汽车配件', 177936, 'S佳通', 17000, 4.24, 20.44, 'Sjiatong', 'Sjt', '17.59', 119.85, 0, NULL, 297283, 34000, NULL),
(1944, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '广东', 3.01, '600183', 0.162, 259671, '元器件', 494003, '生益科技', 142302, 2.82, 26.22, 'shengyikeji', 'sykj', '9.32', 108871, 0.77, NULL, 848532, 142302, NULL),
(1945, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '湖北', 2.4, '600184', 0.036, 45528.7, '玻璃', 208700, '光电股份', 41876.1, 9.1, 304.72, 'guangdiangufen', 'gdgf', '22.32', 23615.7, 0.56, NULL, 296293, 41876.1, NULL),
(1946, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '广东', 6, '600185', 1.589, 20415.8, '区域地产', 1887840, '格力地产', 57761.4, 2.69, 5.07, 'gelidichan', 'gldc', '6.23', -38123.8, -0.66, NULL, 1992480, 57761.4, NULL),
(1947, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '河南', 0.09, '600186', -0.472, 48829.6, '食品', 91567.6, '莲花味精', 106202, 112.19, 0, 'lianhuaweijing', 'lhwj', '5.57', 31854.8, 0.3, NULL, 215171, 106202, NULL),
(1948, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '黑龙江', 1.84, '600187', 0.008, 63152.2, '水务', 134198, '国中水务', 145562, 2.62, 288.19, 'guozhongshuiwu', 'gzsw', '4.71', 133762, 0.92, NULL, 418393, 145562, NULL),
(1949, '2016-06-05 13:22:12', '2016-06-05 13:22:12', '山东', 8.39, '600188', 0.1, 2807400, '煤炭开采', 4084810, '兖州煤业', 295998, 1.2, 39.2, 'yanzhoumeiye', 'yzmy', '9.50', 128599, 0.26, NULL, 13199100, 491840, NULL),
(1950, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '吉林', 4.07, '600189', -0.082, 119158, '林业', 280904, '吉林森工', 31050, 3.39, 0, 'jilinsengong', 'jlsg', '10.69', 65421.3, 2.11, NULL, 493346, 31050, NULL),
(1951, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '辽宁', 2.96, '600190', 0.055, 788099, '港口', 119036, '锦州港', 133898, 1.66, 44.61, 'jinzhougang', 'jzg', '4.21', 266351, 1.33, NULL, 1183970, 200229, NULL),
(1952, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '内蒙', 4.43, '600191', 0.324, 11528.1, '食品', 71894.7, '华资实业', 48493.2, 2.61, 17.86, 'huazishiye', 'hzsy', '13.25', 42285.3, 0.87, NULL, 288792, 48493.2, NULL),
(1953, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '甘肃', 4.26, '600192', 0.079, 58323.8, '电气设备', 314226, '长城电工', 44174.8, 1.58, 42.79, 'zhangchengdiangong', 'zcdg', '9.04', 90308.9, 2.04, NULL, 438445, 44174.8, NULL),
(1954, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '上海', 0.82, '600193', 0.036, 10118, '普钢', 16239.7, '创兴资源', 42537.3, 16.45, 188.9, 'chuangxingziyuan', 'cxzy', '13.49', 13643.2, 0.32, NULL, 64176.9, 42537.3, NULL),
(1955, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '北京', 6.77, '600195', 0.338, 117005, '饲料', 191549, '中牧股份', 42980, 2.54, 25.44, 'zhongmugufen', 'zmgf', '18.58', 91618.5, 2.13, NULL, 429328, 42980, NULL),
(1956, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '上海', 7.57, '600196', 0.564, 454936, '化学制药', 774337, '复星医药', 190561, 3.07, 20.62, 'fuxingyiyao', 'fxyy', '19.47', 606153, 2.62, NULL, 3634630, 231138, NULL),
(1957, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '新疆', 3.79, '600197', 0.3, 31308.6, '白酒', 164119, '伊力特', 44100, 2.63, 16.59, 'yilite', 'ylt', '13.72', 20361.5, 0.46, NULL, 223290, 44100, NULL),
(1958, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '北京', 4.23, '600198', -0.333, 87394.6, '通信设备', 899677, '大唐电信', 53298.9, 3.63, 0, 'datangdianxin', 'dtdx', '18.80', 368297, 4.18, NULL, 1400930, 88210.8, NULL),
(1959, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '安徽', 4, '600199', 0.062, 37912.8, '白酒', 229849, '金种子酒', 55577.5, 2.07, 67.23, 'jinzhongzijiu', 'jzzj', '9.84', 70080.3, 1.26, NULL, 329586, 55577.5, NULL),
(1960, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '江苏', 1.59, '600200', 0.028, 41166.6, '生物制药', 306328, '江苏吴中', 52208.9, 8.3, 238.76, 'jiangsuwuzhong', 'jswz', '16.53', 5211.71, 0.08, NULL, 400680, 62860, NULL),
(1961, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '内蒙', 6.41, '600201', 0.91, 40734.6, '生物制药', 146396, '金宇集团', 28252.8, 6.86, 24.54, 'jinyujituan', 'jyjt', '27.69', 32251, 1.13, NULL, 221017, 28641.5, NULL),
(1962, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '黑龙江', 2.24, '600202', 0.006, 52144.5, '电气设备', 178315, '哈空调', 38334.1, 8.42, 1695.66, 'hakongdiao', 'hkd', '10.33', 7652.45, 0.2, NULL, 255533, 38334.1, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(1963, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '福建', 4.43, '600203', 0.062, 39233.3, '元器件', 219032, '福日电子', 28377.9, 2.07, 73.81, 'furidianzi', 'frdz', '11.25', 106859, 2.81, NULL, 431596, 38028.1, NULL),
(1964, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '北京', 3.28, '600206', 0.027, 33317.2, '半导体', 259288, '有研新材', 58713.4, 3.19, 195.7, 'youyanxincai', 'yyxc', '11.81', 140523, 1.68, NULL, 309047, 83877.8, NULL),
(1965, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '河南', 0.98, '600207', -0.138, 134267, '元器件', 146993, '安彩高科', 44000, 4.93, 0, 'ancaigaoke', 'acgk', '11.29', 195879, 2.84, NULL, 326966, 69000, NULL),
(1966, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '浙江', 2.55, '600208', 0.054, 23598.5, '全国地产', 6014820, '新湖中宝', 636300, 2.2, 52.11, 'xinhuzhongbao', 'xhzb', '3.96', 485507, 0.6, NULL, 7689760, 813813, NULL),
(1967, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '海南', 1.61, '600209', -0.03, 21745, '综合类', 28068.8, '罗顿发展', 42204, 5.03, 0, 'luodunfazhan', 'ldfz', '11.13', 11838.7, 0.27, NULL, 95951.3, 43901.1, NULL),
(1968, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '上海', 2.75, '600210', 0.123, 385034, '广告包装', 481722, '紫江企业', 143674, 1.66, 18.57, 'zijiangqiye', 'zjqy', '5.11', 40006, 0.26, NULL, 1135750, 151674, NULL),
(1969, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '西藏', 2.9, '600211', 0.168, 10428.8, '中成药', 75061.4, '西藏药业', 11410.9, 9.87, 85.28, 'xizangyaoye', 'xzyy', '43.08', 21666.8, 1.49, NULL, 98122.9, 14558.9, NULL),
(1970, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '山东', 1.52, '600212', -0.45, 23939.2, '综合类', 22799.5, '江泉实业', 51169.7, 8.03, 0, 'jiangquanshiye', 'jqsy', '9.96', 44167.5, 0.86, NULL, 87366.7, 51169.7, NULL),
(1971, '2016-06-05 13:22:13', '2016-06-05 13:22:13', '江苏', 0.02, '600213', -0.187, 26395.7, '汽车整车', 184868, '亚星客车', 22000, 392.59, 0, 'yaxingkeche', 'yxkc', '12.10', 34209.4, 1.55, NULL, 219494, 22000, NULL),
(1972, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '吉林', 5.13, '600215', -0.064, 5044.4, '园区开发', 251920, '长春经开', 46503.3, 1.35, 0, 'zhangchunjingkai', 'zcjk', '6.96', 97854.9, 2.1, NULL, 392963, 46503.3, NULL),
(1973, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '浙江', 7.06, '600216', 0.144, 250588, '化学制药', 361433, '浙江医药', 93610.4, 1.28, 31.41, 'zhejiangyiyao', 'zjyy', '13.97', 90958.9, 0.97, NULL, 831205, 93610.8, NULL),
(1974, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '陕西', 0.58, '600217', 0.1, 41620.2, '水泥', 171722, '*ST秦岭', 66080, 11.17, 54.75, '*STqinling', '*STql', '7.52', -38920.2, -0.29, NULL, 232021, 134159, NULL),
(1975, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '安徽', 4.8, '600218', 0.14, 85880.6, '农用机械', 220253, '全柴动力', 28340, 1.94, 35.28, 'quanchaidongli', 'qcdl', '9.43', 104455, 2.83, NULL, 320670, 36875.5, NULL),
(1976, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '山东', 8.25, '600219', 0.13, 1166460, '铝', 951678, '南山铝业', 283518, 0.76, 29.89, 'nanshanlvye', 'nsly', '7.06', 1427380, 5.03, NULL, 3233650, 283518, NULL),
(1977, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '江苏', 0.96, '600220', 0.016, 186661, '纺织', 204467, '江苏阳光', 178334, 4.97, 151.38, 'jiangsuyangguang', 'jsyg', '4.29', 0, 0, NULL, 436810, 178334, NULL),
(1978, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '海南', 2.43, '600221', 0.132, 5372950, '空运', 2650050, '海南航空', 1181210, 1.68, 15.47, 'hainanhangkong', 'hnhk', '3.24', 568814, 0.47, NULL, 12330000, 1218220, NULL),
(1979, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '河南', 2.57, '600222', 0.003, 65430.8, '中成药', 147329, '太龙药业', 49660.9, 2.27, 907.21, 'tailongyaoye', 'tlyy', '7.80', 65246.8, 1.14, NULL, 266500, 57388.6, NULL),
(1980, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '山东', 2.07, '600223', 0.044, 45980.6, '区域地产', 3109720, '鲁商置业', 100097, 2.43, 56.41, 'lushangzhiye', 'lszy', '5.23', 29922.2, 0.3, NULL, 3182810, 100097, NULL),
(1981, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '天津', 2.35, '600225', -0.44, 15812.4, '区域地产', 1383460, '天津松江', 62094.7, 2.23, 0, 'tianjinsongjiang', 'tjsj', '5.79', 114839, 1.23, NULL, 1458130, 93549.2, NULL),
(1982, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '浙江', 3.61, '600226', 0.229, 71063.4, '农药化肥', 91089.6, '升华拜克', 40554.9, 3.98, 31.43, 'shenghuabaike', 'shbk', '9.23', 34512.6, 0.85, NULL, 229149, 40554.9, NULL),
(1983, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '贵州', 2.85, '600227', -0.147, 495024, '农药化肥', 172971, '赤天化', 95039.2, 1.59, 0, 'chitianhua', 'cth', '5.99', 135488, 1.43, NULL, 722808, 95039.2, NULL),
(1984, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '江西', 0.32, '600228', -0.024, 28091.2, '化工原料', 24430.1, '昌九生化', 24132, 29.56, 0, 'changjiushenghua', 'cjsh', '10.77', 33596.6, 1.39, NULL, 61007.4, 24132, NULL),
(1985, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '山东', 3.06, '600229', 0.148, 116480, '化工原料', 115588, '青岛碱业', 39578.6, 3.96, 41.13, 'qingdaojianye', 'qdjy', '11.75', 74204.5, 1.87, NULL, 314241, 39578.6, NULL),
(1986, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '河北', 5.09, '600230', -0.797, 279572, '农药化肥', 87507.8, '沧州大化', 29418.8, 1.45, 0, 'cangzhoudahua', 'czdh', '13.98', 64217.6, 2.18, NULL, 427128, 29418.8, NULL),
(1987, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '辽宁', 3.67, '600231', -0.177, 741440, '普钢', 585475, '凌钢股份', 80400.2, 1.2, 0, 'lingganggufen', 'lggf', '2.48', 5234.62, 0.07, NULL, 1517590, 80400.2, NULL),
(1988, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '浙江', 3.17, '600232', 0.029, 36328.4, '纺织', 133033, '金鹰股份', 36471.9, 1.99, 108.96, 'jinyinggufen', 'jygf', '13.18', 39735.3, 1.09, NULL, 177595, 36471.9, NULL),
(1989, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '辽宁', 6.33, '600233', 0.123, 14619.5, '服饰', 118321, '大杨创世', 16500, 2.03, 52.11, 'dayangchuangshi', 'dycs', '17.71', 18181.3, 1.1, NULL, 147128, 16500, NULL),
(1990, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '山西', 0.22, '600234', -0.087, 96.41, '文教休闲', 742.42, '山水文化', 20244.6, 42.92, 0, 'shanshuiwenhua', 'sswh', '14.24', 29344.5, 1.45, NULL, 45967, 20244.6, NULL),
(1991, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '浙江', 3.96, '600235', -0.035, 95498.4, '造纸', 125699, '民丰特纸', 35130, 1.71, 0, 'minfengtezhi', 'mftz', '14.67', 82903.2, 2.36, NULL, 263904, 35130, NULL),
(1992, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '广西', 1.86, '600236', 0.265, 1652820, '水力发电', 220583, '桂冠电力', 112853, 3.55, 12.43, 'guiguandianli', 'ggdl', '6.98', 5781.47, 0.03, NULL, 2110650, 228045, NULL),
(1993, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '安徽', 2.51, '600237', 0.003, 66881.5, '元器件', 103776, '铜峰电子', 56437, 2.08, 795.19, 'tongfengdianzi', 'tfdz', '7.28', 83564, 1.48, NULL, 215332, 56437, NULL),
(1994, '2016-06-05 13:22:14', '2016-06-05 13:22:14', '海南', 1.98, '600238', 0.003, 26263.7, '红黄药酒', 79353.5, '海南椰岛', 44473.2, 5.12, 1530.63, 'hainanyedao', 'hnyd', '12.25', 12748.6, 0.28, NULL, 126958, 44820, NULL),
(1995, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '云南', 3.58, '600239', -0.17, 32317.3, '区域地产', 3105430, '云南城投', 107046, 1.57, 0, 'yunnanchengtou', 'ynct', '4.72', 185641, 1.73, NULL, 3585550, 107046, NULL),
(1996, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '北京', 3.02, '600240', 0.314, 21670.6, '全国地产', 1121080, '华业资本', 142425, 3.68, 17.67, 'huayeziben', 'hyzb', '9.98', 28096.4, 0.2, NULL, 1973970, 142425, NULL),
(1997, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '辽宁', 1.67, '600241', -0.25, 12762.9, '商贸代理', 152562, '时代万恒', 18020, 5.01, 0, 'shidaiwanheng', 'sdwh', '14.07', 8024.37, 0.35, NULL, 217861, 22619.2, NULL),
(1998, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '广东', -0.36, '600242', -0.131, 92708.5, '水运', 54427.4, '*ST中昌', 26730.3, -21.83, 0, '*STzhongchang', '*STzc', '14.00', 39610.3, 1.45, NULL, 213527, 27333.5, NULL),
(1999, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '青海', 3.02, '600243', -0.081, 39275.8, '机床制造', 151816, '青海华鼎', 23685, 2.99, 0, 'qinghaihuading', 'qhhd', '9.53', 38081.6, 1.61, NULL, 253149, 23685, NULL),
(2000, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '北京', 2.91, '600246', 0.012, 2972.2, '区域地产', 1236360, '万通地产', 121680, 1.57, 187.42, 'wantongdichan', 'wtdc', '5.16', 82462.9, 0.68, NULL, 1382070, 121680, NULL),
(2001, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '吉林', 0.12, '600247', -0.018, 194.71, '商贸代理', 70308.6, '*ST成城', 33644.2, 112.02, 0, '*STchengcheng', '*STcc', '13.19', 531.3, 0.02, NULL, 86231.1, 33644.2, NULL),
(2002, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '陕西', 3.73, '600248', 0.152, 40969.1, '建筑施工', 435783, '延长化建', 46738.9, 1.92, 23.58, 'yanzhanghuajian', 'yzhj', '8.00', 63775.6, 1.35, NULL, 502276, 47368.9, NULL),
(2003, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '广西', 4.33, '600249', -0.17, 109770, '日用化工', 165732, '两面针', 45000, 1.25, 0, 'liangmianzhen', 'lmz', '7.21', 85772.9, 1.56, NULL, 429509, 55000, NULL),
(2004, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '江苏', 1.11, '600250', -0.378, 16487.7, '商贸代理', 79116.9, '南纺股份', 25869.2, 8.31, 0, 'nanfanggufen', 'nfgf', '13.29', 18125.8, 0.7, NULL, 172188, 25869.2, NULL),
(2005, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '新疆', 2.43, '600251', 0.145, 93470.6, '农业综合', 144449, '冠农股份', 78484.2, 3.68, 30.82, 'guannonggufen', 'gngf', '7.67', 37030.4, 0.47, NULL, 340864, 78484.2, NULL),
(2006, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '广西', 4.81, '600252', 0.535, 76626.5, '中成药', 407381, '中恒集团', 109175, 3.32, 14.91, 'zhonghengjituan', 'zhjt', '4.45', 89631.7, 0.77, NULL, 722589, 115837, NULL),
(2007, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '安徽', 1.83, '600255', -0.019, 130193, '铜', 285644, '鑫科材料', 156375, 2.33, 0, 'xinkecailiao', 'xkcl', '4.03', 116109, 0.66, NULL, 525285, 176959, NULL),
(2008, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '新疆', 2.15, '600256', 0.078, 1336490, '综合类', 688268, '广汇能源', 522142, 3.24, 44.62, 'guanghuinengyuan', 'ghny', '4.27', 70167.2, 0.13, NULL, 4004200, 522142, NULL),
(2009, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '湖南', 1.79, '600257', 0.016, 17942.8, '渔业', 81083, '大湖股份', 42705, 4.69, 257.3, 'dahugufen', 'dhgf', '10.26', 9888.53, 0.23, NULL, 148332, 42705, NULL),
(2010, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '北京', 5.08, '600258', 0.181, 194621, '酒店餐饮', 34250.8, '首旅酒店', 23140, 3.65, 51.21, 'shoulvjiudian', 'sljd', '20.35', 12198.2, 0.53, NULL, 400706, 23140, NULL),
(2011, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '海南', 2.94, '600259', -0.134, 32249.8, '小金属', 315340, '广晟有色', 24940, 16.48, 0, 'guangshengyouse', 'gsys', '67.00', 76105.4, 2.9, NULL, 412271, 26212.2, NULL),
(2012, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '湖北', 4.18, '600260', 0.13, 102052, '白酒', 493386, '凯乐科技', 52764, 1.88, 36.4, 'kailekeji', 'klkj', '13.99', 116511, 1.75, NULL, 698490, 66674.8, NULL),
(2013, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '浙江', 1.88, '600261', 0.123, 95419.6, '家用电器', 317541, '阳光照明', 145210, 3.78, 28.89, 'yangguangzhaoming', 'ygzm', '7.16', 26642.2, 0.18, NULL, 462202, 145210, NULL),
(2014, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '内蒙', 6.74, '600262', -0.056, 43416.9, '工程机械', 203706, '北方股份', 17000, 4.15, 0, 'beifanggufen', 'bfgf', '27.36', 40393.1, 2.38, NULL, 274099, 17000, NULL),
(2015, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '云南', -0.12, '600265', -0.201, 10501.2, '林业', 25963.9, 'ST景谷', 12980, -137.92, 0, 'STjinggu', 'STjg', '26.54', 17658.5, 1.36, NULL, 42146.6, 12980, NULL),
(2016, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '北京', 12.36, '600266', 0.186, 16733.5, '区域地产', 4539420, '北京城建', 141645, 0.9, 29.76, 'beijingchengjian', 'bjcj', '11.89', 379732, 2.42, NULL, 5861050, 156704, NULL),
(2017, '2016-06-05 13:22:15', '2016-06-05 13:22:15', '浙江', 7.2, '600267', 0.038, 561799, '化学制药', 695229, '海正药业', 83970.9, 1.74, 164.84, 'haizhengyaoye', 'hzyy', '11.68', 365418, 3.78, NULL, 1808160, 96553.2, NULL),
(2018, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 2.84, '600268', -0.187, 148533, '电气设备', 653208, '国电南自', 63524.6, 2.52, 0, 'guodiannanzi', 'gdnz', '7.49', 102314, 1.61, NULL, 1006070, 63524.6, NULL),
(2019, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江西', 5.41, '600269', 0.182, 2279620, '路桥', 485219, '赣粤高速', 233541, 0.89, 13.24, 'ganyuegaosu', 'gygs', '4.40', 183795, 0.79, NULL, 3153530, 233541, NULL),
(2020, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '北京', 8.8, '600270', 0.532, 71192.8, '仓储物流', 357425, '外运发展', 90548.2, 2.37, 19.63, 'waiyunfazhan', 'wyfz', '17.47', 53847.2, 0.59, NULL, 950475, 90548.2, NULL),
(2021, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '北京', 8, '600271', 0.884, 96314.5, '电脑设备', 1209800, '航天信息', 92340, 5.53, 25.03, 'hangtianxinxi', 'htxx', '25.46', 65592.5, 0.71, NULL, 1413890, 92340, NULL),
(2022, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '上海', 1.91, '600272', 0.045, 19907.1, '服饰', 39445.6, '开开实业', 16000, 5.63, 118.76, 'kaikaishiye', 'kksy', '17.42', 1340.93, 0.06, NULL, 96625.7, 24300, NULL),
(2023, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '浙江', 2.35, '600273', 0.24, 262168, '化工原料', 189836, '嘉化能源', 31500, 3.48, 17.03, 'jiahuanengyuan', 'jhny', '8.24', 140852, 1.08, NULL, 580042, 130629, NULL),
(2024, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '湖北', 0.39, '600275', -0.039, 4409.85, '农业综合', 14873.4, '武昌鱼', 50883.7, 14.81, 0, 'wuchangyu', 'wcy', '7.30', 13208.4, 0.26, NULL, 39205.6, 50883.7, NULL),
(2025, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 4.54, '600276', 0.542, 138849, '化学制药', 831918, '恒瑞医药', 194839, 9.23, 38.63, 'hengruiyiyao', 'hryy', '46.71', 39782.5, 0.2, NULL, 1023700, 195650, NULL),
(2026, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '内蒙', 4.41, '600277', 0.048, 639708, '化工原料', 664097, '亿利能源', 208959, 3.3, 151.81, 'yilinengyuan', 'ylny', '6.19', 587126, 2.81, NULL, 2095910, 208959, NULL),
(2027, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '上海', 5.8, '600278', 0.168, 88222.1, '商贸代理', 424553, '东方创业', 52224.2, 1.93, 33.24, 'dongfangchuangye', 'dfcy', '14.64', 88008.8, 1.69, NULL, 649534, 52224.2, NULL),
(2028, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '重庆', 7.12, '600279', 0.09, 346584, '港口', 188319, '重庆港九', 34209.2, 1.14, 45.11, 'zhongqinggangjiu', 'zqgj', '7.19', 233895, 5.06, NULL, 753399, 46197.2, NULL),
(2029, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 1.48, '600280', 0.144, 217955, '百货', 1195500, '中央商场', 114833, 8.85, 45.49, 'zhongyangshangchang', 'zysc', '6.66', 1277, 0.01, NULL, 1524830, 114833, NULL),
(2030, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '山西', 1.32, '600281', -0.034, 8168.99, '化工原料', 119892, '太化股份', 51440.2, 3.6, 0, 'taihuagufen', 'thgf', '6.10', 57746.2, 1.12, NULL, 243069, 51440.2, NULL),
(2031, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 2.22, '600282', 0.009, 2217530, '普钢', 1580240, '南钢股份', 387575, 1.39, 171.89, 'nanganggufen', 'nggf', '2.41', 50902.4, 0.13, NULL, 4270580, 387575, NULL),
(2032, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '北京', 4.38, '300271', 0.29, 6371.35, '软件服务', 131085, '华宇软件', 22091.2, 5.82, 45.21, 'huayuruanjian', 'hyrj', '18.84', 48137.5, 1.55, NULL, 217239, 31043.9, NULL),
(2033, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '上海', 1.67, '300272', 0.088, 19431.1, '专用机械', 39201.9, '开能环保', 19721.3, 12.92, 122.29, 'kainenghuanbao', 'knhb', '15.46', 12317.8, 0.37, NULL, 92980.7, 33182.1, NULL),
(2034, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '广东', 1.76, '300273', 0.17, 4218.53, '医疗保健', 149354, '和佳股份', 51294.5, 9.08, 50.37, 'hejiagufen', 'hjgf', '16.39', 1899.64, 0.02, NULL, 274628, 78782.4, NULL),
(2035, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '安徽', 3.81, '300274', 0.253, 28090.6, '电气设备', 475315, '阳光电源', 45392.9, 5.18, 39.09, 'yangguangdianyuan', 'ygdy', '22.48', 100267, 1.52, NULL, 536920, 65827.8, NULL),
(2036, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '重庆', 3.88, '300275', -0.177, 14079.2, '软件服务', 55173.5, '梅安森', 10904.6, 3.41, 0, 'meiansen', 'mas', '19.90', 25836.6, 1.53, NULL, 79858.1, 16910.1, NULL),
(2037, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '湖北', 1.56, '300276', 0.036, 4391.83, '专用机械', 65114.6, '三丰智能', 19415.1, 10.88, 231.95, 'sanfengzhineng', 'sfzn', '20.44', 4049.15, 0.11, NULL, 82702.2, 37440, NULL),
(2038, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '深圳', 3.35, '300277', -0.071, 11697.6, '软件服务', 47756, '海联讯', 5327.83, 4.73, 0, 'hailianxun', 'hlx', '15.82', 28388.1, 2.12, NULL, 63973.1, 13400, NULL),
(2039, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '湖北', 2.64, '300278', 0.111, 23015.8, '专用机械', 173414, '华昌达', 15778, 8.88, 105.67, 'huachangda', 'hcd', '17.01', 69120.8, 1.27, NULL, 288981, 54504.3, NULL),
(2040, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 4.42, '300279', 0.139, 9471.24, '元器件', 54662.4, '和晶科技', 5788.14, 8.64, 137.62, 'hejingkeji', 'hjkj', '41.00', 34852, 2.62, NULL, 111915, 13315.2, NULL),
(2041, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '江苏', 4.91, '300280', 0.017, 20764.3, '专用机械', 30087.2, '南通锻压', 4800, 4.83, 697.22, 'nantongduanya', 'ntdy', '29.50', 42228.3, 3.3, NULL, 80993.2, 12800, NULL),
(2042, '2016-06-05 13:22:16', '2016-06-05 13:22:16', '广东', 2.89, '300281', 0.102, 32099.6, '专用机械', 50270.5, '金明精机', 10612.3, 3.71, 52.36, 'jinmingjingji', 'jmjj', '13.85', 23137.6, 0.95, NULL, 98493.6, 24248.4, NULL),
(2043, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 5.97, '300282', 0.112, 32060.8, '电脑设备', 99732, '汇冠股份', 13643.3, 3.17, 84.31, 'huiguangufen', 'hggf', '0.00', 115421, 5.03, NULL, 221720, 22938, NULL),
(2044, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '浙江', 1.98, '300283', 0.027, 19564, '电气设备', 49258.8, '温州宏丰', 12741.7, 4.16, 153.65, 'wenzhouhongfeng', 'wzhf', '8.65', 15193.1, 0.55, NULL, 86386.2, 27624.1, NULL),
(2045, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '江苏', 4.36, '300284', 0.19, 28245.4, '建筑施工', 344040, '苏交科', 32407.1, 3.85, 46.5, 'sujiaoke', 'sjk', '0.00', 105516, 1.91, NULL, 450716, 55358.7, NULL),
(2046, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '山东', 2.94, '300285', 0.157, 33901.1, '化工原料', 47479.7, '国瓷材料', 24224.1, 8.5, 79.65, 'guocicailiao', 'gccl', '36.05', 22512.5, 0.88, NULL, 102401, 25447.6, NULL),
(2047, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '上海', 3.5, '300286', 0.23, 8651.32, '电器仪表', 45285.4, '安科瑞', 8367.79, 4.68, 35.59, 'ankerui', 'akr', '25.44', 17579.1, 1.23, NULL, 61523.6, 14284.7, NULL),
(2048, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 2.62, '300287', 0.066, 12448.5, '软件服务', 180331, '飞利信', 32749, 20.75, 411.94, 'feilixin', 'flx', '12.33', 62930.1, 1.1, NULL, 255719, 57020.7, NULL),
(2049, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '贵州', 2.71, '300288', 0.103, 1128.41, '软件服务', 42359.6, '朗玛信息', 16318.8, 10.49, 137.49, 'langmaxinxi', 'lmxx', '0.00', 31146.2, 0.92, NULL, 112623, 33794.1, NULL),
(2050, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 5.94, '300289', 0.32, 66838.8, '生物制药', 67076.8, '利德曼', 12197.2, 4.95, 51.11, 'lideman', 'ldm', '14.45', 47804.5, 2.82, NULL, 160846, 16972, NULL),
(2051, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '辽宁', 6.04, '300290', 0.13, 8502.11, '软件服务', 90040.6, '荣科科技', 7664.35, 3.34, 91.76, 'rongkekeji', 'rkkj', '15.86', 45612.8, 2.84, NULL, 101851, 16071.5, NULL),
(2052, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 5.18, '300291', 0.088, 667.92, '影视音像', 220603, '华录百纳', 42174, 3.84, 112.86, 'hualubaina', 'hlbn', '24.30', 245160, 3.46, NULL, 437850, 70853.9, NULL),
(2053, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '江苏', 6.61, '300292', 0.25, 6601.6, '通信设备', 68996.4, '吴通通讯', 9328.26, 3.87, 70.63, 'wutongtongxun', 'wttx', '0.00', 150688, 4.72, NULL, 249741, 31896.8, NULL),
(2054, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '辽宁', 2.57, '300293', 0.117, 15975.7, '专用机械', 104825, '蓝英装备', 11923.9, 5.37, 58.83, 'lanyingzhuangbei', 'lyzb', '17.13', 15907.7, 0.59, NULL, 209945, 27000, NULL),
(2055, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '江西', 7.77, '300294', 0.622, 16130.8, '生物制药', 51314.7, '博雅生物', 7127.25, 7.08, 44.25, 'boyashengwu', 'bysw', '57.69', 43323.8, 3.81, NULL, 109550, 11370, NULL),
(2056, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '江苏', 8.81, '300295', 0.587, 1192.55, '互联网', 93270.2, '三六五网', 7817.81, 5.67, 42.52, 'sanliuwuwang', 'slww', '33.60', 36794.2, 3.83, NULL, 97577.8, 9603, NULL),
(2057, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 1.79, '300296', 0.13, 19655.2, '半导体', 172015, '利亚德', 35902.1, 11.3, 80.99, 'liyade', 'lyd', '32.20', 14242.7, 0.22, NULL, 222077, 65170.6, NULL),
(2058, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '广东', 2.4, '300297', 0.07, 35230.4, '软件服务', 118140, '蓝盾股份', 30752.4, 6.74, 127.68, 'landungufen', 'ldgf', '14.27', 44696.7, 0.92, NULL, 206400, 48534.2, NULL),
(2059, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '湖南', 4.4, '300298', 0.287, 20096.2, '医疗保健', 100808, '三诺生物', 10509.5, 5.48, 41.92, 'sannuoshengwu', 'snsw', '0.00', 49900.6, 1.91, NULL, 128469, 26105.6, NULL),
(2060, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '福建', 3.36, '300299', 0.08, 1611, '通信设备', 56455.6, '富春通信', 14327, 7.12, 198.49, 'fuchuntongxin', 'fctx', '0.00', 80193.4, 2.11, NULL, 153853, 38000.3, NULL),
(2061, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '浙江', 1.97, '300300', 0.119, 8275.69, '软件服务', 109634, '汉鼎股份', 25715.8, 13.44, 111.71, 'handinggufen', 'hdgf', '0.00', 7294.67, 0.19, NULL, 130808, 38280, NULL),
(2062, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '深圳', 1.94, '300301', 0.06, 103253, '半导体', 94099, '长方照明', 23744, 3.02, 57.18, 'zhangfangzhaoming', 'zfzm', '8.41', 44966.6, 0.65, NULL, 293008, 69036.4, NULL),
(2063, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '北京', 2.65, '300302', 0.071, 8084.08, '软件服务', 46850.1, '同有科技', 10718.2, 8.56, 159.83, 'tongyoukeji', 'tykj', '30.28', 19303.6, 0.99, NULL, 57697.3, 19440, NULL),
(2064, '2016-06-05 13:22:17', '2016-06-05 13:22:17', '深圳', 1.73, '300303', 0.109, 35042.8, '半导体', 105340, '聚飞光电', 37209.1, 4.25, 33.7, 'jufeiguangdian', 'jfgd', '8.04', 1803.64, 0.03, NULL, 144637, 62233.6, NULL),
(2065, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '江苏', 4.79, '300304', 0.235, 19946, '汽车配件', 84817, '云意电气', 20000, 2.61, 26.68, 'yunyidianqi', 'yydq', '27.63', 44781.6, 2.24, NULL, 120788, 20000, NULL),
(2066, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '江苏', 8.92, '300305', 0.299, 37153.9, '塑料', 92440.5, '裕兴股份', 6296.49, 1.77, 26.48, 'yuxinggufen', 'yxgf', '13.11', 72045.5, 4.96, NULL, 134812, 14525.5, NULL),
(2067, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '浙江', 4.38, '300306', 0.115, 15130.2, '电器仪表', 81668.1, '远方光电', 9607.65, 2.54, 48.18, 'yuanfangguangdian', 'yfgd', '21.00', 46429.8, 1.93, NULL, 110826, 24000, NULL),
(2068, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '浙江', 4.78, '300307', 0.105, 22192.5, '纺织机械', 329723, '慈星股份', 80200, 1.87, 42.38, 'cixinggufen', 'cxgf', '15.92', 192788, 2.4, NULL, 433044, 80200, NULL),
(2069, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '山东', 2.5, '300308', -0.024, 13288.2, '工程机械', 29400.9, '中际装备', 21601.1, 3.68, 0, 'zhongjizhuangbei', 'zjzb', '0.00', 23233.8, 1.08, NULL, 65413.2, 21601.1, NULL),
(2070, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '北京', 2.99, '300309', 0.051, 21316.9, '专用机械', 108181, '吉艾科技', 21891.8, 5.92, 174.3, 'jiaikeji', 'jakj', '11.37', 48559.3, 1.12, NULL, 232646, 43454.8, NULL),
(2071, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '广东', 3.04, '300310', 0.14, 8107.55, '通信设备', 75115.9, '宜通世纪', 13343.3, 15.61, 169.99, 'yitongshiji', 'ytsj', '24.34', 20915.5, 0.91, NULL, 93589.2, 22880, NULL),
(2072, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '广东', 2.01, '300311', 0.057, 12462.9, '软件服务', 39492.6, '任子行', 13184.3, 12.48, 218.09, 'renzixing', 'rzx', '16.67', 12151.9, 0.52, NULL, 67865.9, 23352.7, NULL),
(2073, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '北京', 4.95, '300312', 0.02, 2626.24, '通信设备', 134637, '邦讯技术', 8616.37, 5.53, 674.29, 'bangxunjishu', 'bxjs', '14.27', 51681.9, 3.23, NULL, 154984, 16002, NULL),
(2074, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '新疆', 2.02, '300313', -0.054, 21650.8, '农业综合', 37800.6, '天山生物', 14412.9, 6.82, 0, 'tianshanshengwu', 'tssw', '19.00', 17392.3, 0.93, NULL, 72469.2, 18695.1, NULL),
(2075, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '浙江', 2.36, '300314', 0.094, 8169.5, '医疗保健', 53047.5, '戴维医疗', 13008, 6.44, 81, 'daiweiyiliao', 'dwyl', '21.26', 17553.4, 0.61, NULL, 72392.5, 28800, NULL),
(2076, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '北京', 1.69, '300315', 0.068, 10497.3, '互联网', 83868, '掌趣科技', 161041, 5.58, 68.91, 'zhangqukeji', 'zqkj', '9.24', 99149.5, 0.4, NULL, 479091, 246761, NULL),
(2077, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '浙江', 1.98, '300316', 0.052, 25798.6, '专用机械', 138756, '晶盛机电', 81081.8, 13.07, 251.21, 'jingshengjidian', 'jsjd', '11.98', 31364.1, 0.36, NULL, 223662, 88343.6, NULL),
(2078, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '深圳', 4.15, '300317', -0.047, 2584.2, '半导体', 114765, '珈伟股份', 11162.9, 6.56, 0, 'jiaweigufen', 'jwgf', '37.16', 37616, 2.69, NULL, 142950, 14000, NULL),
(2079, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '北京', 3.43, '300318', 0.056, 32741.5, '医疗保健', 52243.1, '博晖创新', 20347, 3.54, 107.82, 'bohuichuangxin', 'bhcx', '9.06', 89236.8, 2.18, NULL, 201994, 40910.6, NULL),
(2080, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '深圳', 2.54, '300319', 0.08, 15223.6, '元器件', 29422.5, '麦捷科技', 6315, 10.3, 251.8, 'maijiekeji', 'mjkj', '39.29', 11066.8, 0.51, NULL, 49299.5, 21538.7, NULL),
(2081, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '江苏', 2.54, '300320', 0.152, 33084.4, '橡胶', 68940.1, '海达股份', 23585.6, 3.05, 25.4, 'haidagufen', 'hdgf', '17.56', 6600.5, 0.23, NULL, 105039, 29334.8, NULL),
(2082, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '山东', 12.34, '300321', 0.51, 30869.3, '塑料', 31292.8, '同大股份', 4440, 4.25, 51.39, 'tongdagufen', 'tdgf', '38.60', 28246.3, 6.36, NULL, 72027.6, 4440, NULL),
(2083, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '广东', 1.35, '300322', -0.066, 45568.6, '通信设备', 43467.6, '硕贝德', 35377, 7.49, 0, 'shuobeide', 'sbd', '18.37', 4229.97, 0.1, NULL, 103774, 40521.2, NULL),
(2084, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '湖北', 2.65, '300323', 0.019, 215159, '半导体', 166694, '华灿光电', 67500, 2.44, 174.26, 'huacanguangdian', 'hcgd', '0.00', 81887.2, 1.21, NULL, 409152, 67500, NULL),
(2085, '2016-06-05 13:22:18', '2016-06-05 13:22:18', '北京', 1.63, '300324', 0.09, 8991.37, '软件服务', 70715.7, '旋极信息', 27656.7, 12.5, 237.21, 'xuanjixinxi', 'xjxx', '19.33', 10840.7, 0.23, NULL, 119592, 47254.6, NULL),
(2086, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '江苏', 2.47, '300325', 0.103, 22378.8, '塑料', 138923, '德威新材', 31535.7, 3.37, 40.44, 'deweixincai', 'dwxc', '6.66', 11680.1, 0.37, NULL, 196788, 32000, NULL),
(2087, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '上海', 3.18, '300326', 0.235, 15222.8, '医疗保健', 52148.9, '凯利泰', 27468.6, 5.98, 40.4, 'kailitai', 'klt', '11.12', 51502.4, 1.46, NULL, 153879, 35214.6, NULL),
(2088, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '上海', 3.38, '300327', 0.122, 3406.43, '半导体', 60550.9, '中颖电子', 17036.8, 4.22, 58.35, 'zhongyingdianzi', 'zydz', '48.50', 33788.5, 1.98, NULL, 66459.1, 17036.8, NULL),
(2089, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '广东', 2.83, '300328', 0.091, 30768.9, '铝', 47081.4, '宜安科技', 22400, 6.68, 103.84, 'yiankeji', 'yakj', '11.73', 20754.6, 0.93, NULL, 89094.9, 22400, NULL),
(2090, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '浙江', 4.11, '300329', 0.116, 19714.9, '文教休闲', 44797.5, '海伦钢琴', 13398, 3.8, 67.09, 'hailungangqin', 'hlgq', '21.14', 26056.6, 1.94, NULL, 68145.6, 13398, NULL),
(2091, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '上海', 2.57, '300330', 0.004, 11542.8, '软件服务', 48600.6, '华虹计通', 16745.2, 4.27, 1274.26, 'huahongjitong', 'hhjt', '19.25', 20028.6, 1.18, NULL, 60680.5, 16922.8, NULL),
(2092, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '江苏', 5.19, '300331', 0.01, 19440.3, '元器件', 44341.4, '苏大维格', 6338.33, 4.84, 1251.87, 'sudaweige', 'sdwg', '29.01', 26583.4, 2.86, NULL, 67998.6, 9300, NULL),
(2093, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '北京', 4.29, '300332', 0.19, 82786.5, '环境保护', 50231.3, '天壕节能', 31622.2, 3.65, 50.03, 'tianhaojieneng', 'thjn', '0.00', 72722.2, 1.88, NULL, 237350, 38718.9, NULL),
(2094, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '深圳', 7.36, '300333', 0.195, 7493.37, '元器件', 70332.3, '兆日科技', 11029.8, 7.02, 132.74, 'zhaorikeji', 'zrkj', '23.43', 60932.9, 5.44, NULL, 85676.4, 11200, NULL),
(2095, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '天津', 3.31, '300334', 0.063, 20823.5, '专用机械', 103994, '津膜科技', 25634.8, 5.26, 137.36, 'jinmokeji', 'jmkj', '0.00', 32046.8, 1.23, NULL, 131918, 26100, NULL),
(2096, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '广东', 2.56, '300335', 0.104, 34327.4, '供气供热', 50949.5, '迪森股份', 23593.8, 4.1, 50.37, 'disengufen', 'dsgf', '0.00', 29736.3, 0.94, NULL, 106974, 31654.8, NULL),
(2097, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '上海', 4.7, '300336', 0.204, 11659.5, '影视音像', 201117, '新文化', 41560.2, 4.21, 48.49, 'xinwenhua', 'xwh', '19.65', 149045, 2.77, NULL, 349031, 53754.8, NULL),
(2098, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '江苏', 4.5, '300337', -0.081, 88301.4, '铝', 127785, '银邦股份', 32172.9, 2.84, 0, 'yinbanggufen', 'ybgf', '7.15', 101971, 2.73, NULL, 277036, 37360, NULL),
(2099, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '湖南', 2.97, '300338', 0.014, 19626.5, '电器仪表', 52998.2, '开元仪器', 9671.59, 2.81, 300.01, 'kaiyuanyiqi', 'kyyq', '0.00', 28627.9, 1.14, NULL, 85344.8, 25200, NULL),
(2100, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '江苏', 5.18, '300339', 0.097, 11404.3, '软件服务', 80870.8, '润和软件', 13001, 4.48, 119.51, 'runheruanjian', 'rhrj', '30.38', 92074.8, 3.24, NULL, 218862, 28461.7, NULL),
(2101, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '广东', 8.6, '300340', -0.096, 15939.5, '元器件', 74877.6, '科恒股份', 8025.89, 2.15, 0, 'kehenggufen', 'khgf', '45.91', 51351.6, 5.14, NULL, 97428.9, 10000, NULL),
(2102, '2016-06-05 13:22:19', '2016-06-05 13:22:19', '福建', 3.05, '300341', 0.09, 12192.7, '电气设备', 48005.1, '麦迪电气', 18400, 4.85, 111.4, 'maididianqi', 'mddq', '29.05', 19751.6, 0.77, NULL, 64477.3, 25622.8, NULL),
(2103, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '江苏', 4.04, '300342', 0.293, 13872.5, '元器件', 56199.6, '天银机电', 18898.6, 4.98, 34.25, 'tianyinjidian', 'tyjd', '28.41', 34047.3, 1.7, NULL, 98511.5, 20000, NULL),
(2104, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '山东', 5.83, '300343', 0.04, 26970.8, '化工原料', 89544.4, '联创节能', 2888, 10.01, 1160.37, 'lianchuangjieneng', 'lcjn', '93.00', 22356.6, 1.79, NULL, 260804, 12513.4, NULL),
(2105, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '北京', 2.8, '300344', -0.088, 29712.8, '其他建材', 36152.8, '太空板业', 24124.8, 2.65, 0, 'taikongbanye', 'tkby', '11.12', 33511, 1.39, NULL, 90405.6, 24124.8, NULL),
(2106, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '湖南', 5.13, '300345', 0.173, 17787.5, '钢加工', 54548.5, '红宇新材', 8034.91, 5.42, 80.29, 'hongyuxincai', 'hyxc', '10.34', 37874, 3.03, NULL, 90742.3, 12480, NULL),
(2107, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '上海', 4.74, '600895', 0.184, 27700.5, '园区开发', 825049, '张江高科', 154869, 4, 51.59, 'zhangjianggaoke', 'zjgk', '19.02', 264697, 1.71, NULL, 1781010, 154869, NULL),
(2108, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '海南', 3.33, '600896', 0.182, 395934, '水运', 54565.5, '中海海盛', 58131.6, 3.48, 31.75, 'zhonghaihaisheng', 'zhhs', '10.54', 18700.3, 0.32, NULL, 614975, 58131.6, NULL),
(2109, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '福建', 9.56, '600897', 0.67, 253485, '机场', 76399.8, '厦门空港', 29781, 2.08, 14.82, 'shamenkonggang', 'smkg', '20.99', 18098.8, 0.61, NULL, 374015, 29781, NULL),
(2110, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '山东', 1.42, '600898', 0.055, 11906.3, '电器连锁', 51509.1, '三联商社', 25252.4, 8.46, 109.4, 'sanlianshangshe', 'slss', '13.56', 4507.93, 0.18, NULL, 68907.2, 25252.4, NULL),
(2111, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '北京', 5.18, '600900', 0.315, 12148700, '水力发电', 584939, '长江电力', 974594, 2.77, 22.77, 'zhangjiangdianli', 'zjdl', '12.60', 2783650, 1.69, NULL, 14472800, 1650000, NULL),
(2112, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '重庆', 2.13, '600917', 0.135, 211457, '供气供热', 293915, '重庆燃气', 15600, 5.14, 40.74, 'zhongqingranqi', 'zqrq', '10.12', 99299.9, 0.64, NULL, 753396, 155600, NULL),
(2113, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '上海', 6.42, '600958', 1.23, 41342.8, '证券', 0, '东方证券', 100000, 2.4, 6.91, 'dongfangzhengquan', 'dfzq', '15.53', 1258360, 2.38, NULL, 19184100, 528174, NULL),
(2114, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '江苏', 4.09, '600959', 0.17, 848902, '影视音像', 619846, '江苏有线', 59700, 3.78, 53.83, 'jiangsuyouxian', 'jsyx', '11.24', 735686, 2.46, NULL, 1815430, 298810, NULL),
(2115, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '山东', 3.89, '600960', 0.06, 75348.5, '汽车配件', 202257, '渤海活塞', 51281.2, 2.01, 82.68, 'bohaihuosai', 'bhhs', '8.86', 93120.5, 1.77, NULL, 299864, 52471.9, NULL),
(2116, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '湖南', 1.2, '600961', -0.207, 289242, '铅锌', 301835, '株冶集团', 52745.8, 7.17, 0, 'zhuyejituan', 'zyjt', '11.34', 86723.9, 1.64, NULL, 644524, 52745.8, NULL),
(2117, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '北京', 2.96, '600962', -0.035, 59226.4, '软饮料', 106283, '*ST中鲁', 25402, 3.98, 0, '*STzhonglu', '*STzl', '20.18', 52681.8, 2.01, NULL, 184411, 26221, NULL),
(2118, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '湖南', 4.98, '600963', -0.175, 820391, '造纸', 810558, '岳阳林纸', 84315.9, 1.26, 0, 'yueyanglinzhi', 'yylz', '8.17', 382894, 3.67, NULL, 1711310, 104316, NULL),
(2119, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '河北', 1.77, '600965', 0.08, 49832.1, '农业综合', 59033.7, '福成五丰', 38005.5, 4.98, 85.5, 'fuchengwufeng', 'fcwf', '13.08', 9868.17, 0.12, NULL, 127699, 81870.1, NULL),
(2120, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '山东', 2.94, '600966', 0.038, 637238, '造纸', 587289, '博汇纸业', 133684, 1.12, 43.68, 'bohuizhiye', 'bhzy', '3.74', 131503, 0.98, NULL, 1272760, 133684, NULL),
(2121, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '内蒙', 2.78, '600967', -0.036, 52361.3, '运输设备', 231328, '北方创业', 77302.8, 6.16, 0, 'beifangchuangye', 'bfcy', '13.57', 71455.9, 0.87, NULL, 329275, 82282.8, NULL),
(2122, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '湖南', 9.76, '600969', 0.272, 368930, '水力发电', 280871, '郴电国际', 21026.8, 1.36, 24.44, 'chendianguoji', 'cdgj', '19.06', 183207, 6.93, NULL, 776448, 26432.2, NULL),
(2123, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '江苏', 4.6, '600970', 0.261, 184973, '建筑施工', 2207390, '中材国际', 109330, 2.54, 22.35, 'zhongcaiguoji', 'zcgj', '6.37', 54973.3, 0.5, NULL, 2623980, 109330, NULL),
(2124, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '安徽', 6.47, '600971', -0.542, 527478, '煤炭开采', 354027, '恒源煤电', 100000, 0.83, 0, 'hengyuanmeidian', 'hymd', '6.27', 210436, 2.1, NULL, 1297920, 100000, NULL),
(2125, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '江苏', 5.13, '600973', 0.118, 131607, '电气设备', 742192, '宝胜股份', 41373.6, 1.81, 39.38, 'baoshenggufen', 'bsgf', '8.05', 85967.5, 2.07, NULL, 948318, 41437.1, NULL),
(2126, '2016-06-05 13:22:20', '2016-06-05 13:22:20', '湖南', 3.09, '600975', -0.076, 54499.3, '农业综合', 91433, '新五丰', 23436, 2.6, 0, 'xinwufeng', 'xwf', '8.71', 60635.4, 1.86, NULL, 163040, 32633.8, NULL),
(2127, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '湖北', 6.25, '600976', 0.309, 22424.3, '中成药', 120705, '健民集团', 15322.9, 3.6, 36.46, 'jianminjituan', 'jmjt', '31.93', 32103.6, 2.09, NULL, 156887, 15339.9, NULL),
(2128, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '广东', 4.42, '600978', 0.228, 251593, '家居用品', 682933, '宜华木业', 148287, 5.06, 49.05, 'yihuamuye', 'yhmy', '10.65', 245923, 1.66, NULL, 1148960, 148287, NULL),
(2129, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '四川', 2.07, '600979', 0.129, 359326, '水力发电', 117408, '广安爱众', 71789.2, 4.45, 35.76, 'guanganaizhong', 'gaaz', '7.92', 54893.1, 0.76, NULL, 638733, 71789.2, NULL),
(2130, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '北京', 1.73, '600980', 0.002, 6848.62, '元器件', 13431, '北矿磁材', 13000, 8.68, 3231.75, 'beikuangcicai', 'bkcc', '24.60', 16656.9, 1.28, NULL, 32313.1, 13000, NULL),
(2131, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '江苏', 1.96, '600981', 0.058, 22250.9, '商贸代理', 465978, '汇鸿集团', 51610.6, 3.37, 56.97, 'huihongjituan', 'hhjt', '8.49', 2666.11, 0.05, NULL, 523930, 51610.6, NULL),
(2132, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '浙江', 3.25, '600982', 0.1, 34163.9, '供气供热', 183451, '宁波热电', 67613, 1.67, 27.02, 'ningboredian', 'nbrd', '5.50', 104907, 1.4, NULL, 313786, 74693, NULL),
(2133, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '安徽', 5.57, '600983', 0.265, 76422.5, '家用电器', 641968, '惠而浦', 53280, 2.67, 28.08, 'huierpu', 'hep', '11.66', 171084, 2.23, NULL, 761808, 76643.9, NULL),
(2134, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '陕西', 2.3, '600984', -0.143, 15478.8, '工程机械', 79793.9, '*ST建机', 14155.6, 3.05, 0, '*STjianji', '*STjj', '8.74', 67256.1, 2.78, NULL, 101764, 24155.6, NULL),
(2135, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '安徽', 4.24, '600985', 0.177, 38974.7, '化工原料', 69395.4, '雷鸣科化', 19440, 2.16, 25.9, 'leimingkehua', 'lmkh', '14.91', 52218.2, 1.99, NULL, 153822, 26285.5, NULL),
(2136, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '山东', 2.32, '600986', 0.043, 8842.86, '建筑施工', 442194, '科达股份', 33527, 5.62, 151.34, 'kedagufen', 'kdgf', '15.24', 10636.6, 0.32, NULL, 520941, 33527, NULL),
(2137, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '浙江', 3.92, '600987', 0.335, 142929, '纺织', 188888, '航民股份', 63531, 2.43, 14.21, 'hangmingufen', 'hmgf', '12.34', 10369.9, 0.16, NULL, 377246, 63531, NULL),
(2138, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '内蒙', 2.84, '600988', 0.19, 68994.1, '黄金', 114393, '赤峰黄金', 28100.6, 4.07, 32.98, 'chifenghuangjin', 'cfhj', '15.42', 93213.4, 1.31, NULL, 304535, 71319.1, NULL),
(2139, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '安徽', 6.74, '600990', 0.087, 14380.6, '通信设备', 185840, '四创电子', 13670.2, 9.31, 359.51, 'sichuangdianzi', 'scdz', '72.70', 41637.9, 3.05, NULL, 263646, 13670.2, NULL),
(2140, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '贵州', 5.45, '600992', 0.035, 31443.4, '钢加工', 129240, '贵绳股份', 24509, 1.65, 127.42, 'guishenggufen', 'gsgf', '16.98', 84036.9, 3.43, NULL, 184998, 24509, NULL),
(2141, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '湖北', 3.95, '600993', 0.334, 23421.2, '中成药', 163789, '马应龙', 43023.6, 4.52, 26.79, 'mayinglong', 'myl', '19.97', 11968.9, 0.28, NULL, 224888, 43105.4, NULL),
(2142, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '云南', 3.06, '600995', 0.207, 193336, '水力发电', 39842, '文山电力', 47852.6, 2.51, 18.56, 'wenshandianli', 'wsdl', '13.37', 15522.1, 0.32, NULL, 292942, 47852.6, NULL),
(2143, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '河北', 5.53, '600997', -0.142, 759891, '煤炭开采', 773918, '开滦股份', 123464, 0.9, 0, 'kailuangufen', 'klgf', '7.15', 102664, 0.83, NULL, 2195440, 123464, NULL),
(2144, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '湖北', 4.96, '600998', 0.152, 261388, '医药商业', 2327000, '九州通', 143041, 3.85, 62.84, 'jiuzhoutong', 'jzt', '20.74', 395466, 2.4, NULL, 2820560, 164701, NULL),
(2145, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '深圳', 8.22, '600999', 1.259, 38039.6, '证券', 0, '招商证券', 480310, 2.01, 6.58, 'zhaoshangzhengquan', 'zszq', '16.33', 1940390, 3.34, NULL, 36479500, 580814, NULL),
(2146, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '河北', 4.45, '601000', 0.28, 1107400, '港口', 459600, '唐山港', 203035, 1.56, 13.68, 'tangshangang', 'tsg', '4.01', 369345, 1.64, NULL, 1734500, 224844, NULL),
(2147, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '山西', 3.94, '601001', -0.425, 519537, '煤炭开采', 982207, '大同煤业', 167370, 1.35, 0, 'datongmeiye', 'dtmy', '6.11', 114549, 0.68, NULL, 2493380, 167370, NULL),
(2148, '2016-06-05 13:22:21', '2016-06-05 13:22:21', '浙江', 2.82, '601002', -0.026, 133006, '机械基件', 308736, '晋亿实业', 73847, 2.78, 0, 'jinyishiye', 'jysy', '9.52', 110146, 1.39, NULL, 473002, 79269, NULL),
(2149, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '广西', 1.98, '601003', -0.246, 1047530, '普钢', 1171670, '柳钢股份', 256279, 3.62, 0, 'liuganggufen', 'lggf', '4.76', 20843.6, 0.08, NULL, 2284460, 256279, NULL),
(2150, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '重庆', 1.75, '601005', -0.502, 2910690, '普钢', 1251820, '重庆钢铁', 190171, 2.53, 0, 'zhongqinggangtie', 'zqgt', '2.52', 665584, 1.5, NULL, 4641340, 443602, NULL),
(2151, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '山西', 5.65, '601006', 0.494, 6099090, '铁路', 1576160, '大秦铁路', 1486680, 1.73, 9.89, 'daqintielu', 'dqtl', '6.49', 2488830, 1.67, NULL, 10491600, 1486680, NULL),
(2152, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 4.59, '601007', 0.05, 148272, '酒店餐饮', 98582.9, '金陵饭店', 30000, 2.24, 101.95, 'jinlingfandian', 'jlfd', '14.09', 43726.1, 1.46, NULL, 324574, 30000, NULL),
(2153, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 3.15, '601008', 0.032, 201170, '港口', 62839.1, '连云港', 81163.5, 1.87, 91.92, 'lianyungang', 'lyg', '5.48', 161477, 1.59, NULL, 664693, 101522, NULL),
(2154, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 13.06, '601009', 1.2, 422550, '银行', 0, '南京银行', 296893, 1.18, 7.25, 'nanjingyinxing', 'njyx', '17.94', 1787920, 5.31, NULL, 73130200, 336596, NULL),
(2155, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 2.11, '601010', 0.121, 255600, '超市连锁', 238224, '文峰股份', 184800, 3.5, 30.46, 'wenfenggufen', 'wfgf', '5.26', 81575.7, 0.44, NULL, 650643, 184800, NULL),
(2156, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '黑龙江', 7.75, '601011', 0.16, 163441, '焦炭加工', 179980, '宝泰隆', 38700, 1.62, 40.49, 'baotailong', 'btl', '7.13', 293808, 5.37, NULL, 745053, 54700, NULL),
(2157, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '陕西', 2.94, '601012', 0.066, 213082, '半导体', 538508, '隆基股份', 161557, 3.13, 69.42, 'longjigufen', 'ljgf', '13.39', 252235, 1.42, NULL, 816726, 177149, NULL),
(2158, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '陕西', 4.52, '601015', 0.051, 385696, '焦炭加工', 466457, '陕西黑猫', 12000, 1.92, 84.77, 'shanxiheimao', 'sxhm', '9.54', 91720, 1.48, NULL, 1037870, 62000, NULL),
(2159, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '北京', 1.83, '601016', 0.083, 1027010, '新型电力', 164162, '节能风电', 17778, 11.72, 128.84, 'jienengfengdian', 'jnfd', '8.85', 60417.8, 0.34, NULL, 1426340, 177778, NULL),
(2160, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '浙江', 2.43, '601018', 0.118, 1941060, '港口', 922018, '宁波港', 1280000, 3.36, 34.49, 'ningbogang', 'nbg', '5.06', 785558, 0.61, NULL, 4678760, 1280000, NULL),
(2161, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '上海', 14.58, '601021', 1.62, 537103, '空运', 346511, '春秋航空', 10000, 6.31, 29.7, 'chunqiuhangkong', 'cqhk', '36.74', 193433, 4.84, NULL, 1322910, 40000, NULL),
(2162, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 3.29, '601028', 0.111, 84594.6, '钢加工', 262571, '玉龙股份', 69987.5, 2.49, 36.99, 'yulonggufen', 'ylgf', '10.65', 91305.4, 1.16, NULL, 379292, 78623.8, NULL),
(2163, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '河南', 4.72, '601038', 0.149, 274391, '农用机械', 671852, '一拖股份', 59391, 1.82, 28.74, 'yituogufen', 'ytgf', '11.30', 212425, 2.13, NULL, 1336350, 99590, NULL),
(2164, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '山东', 4, '601058', 0.101, 517567, '汽车配件', 635184, '赛轮金宇', 87080, 1.55, 30.9, 'sailunjinyu', 'sljy', '4.07', 228893, 2.2, NULL, 1371540, 104270, NULL),
(2165, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '新疆', 2.42, '601069', 0.022, 99155.7, '黄金', 62168.9, '西部黄金', 12600, 6.55, 366.02, 'xibuhuangjin', 'xbhj', '22.36', 50813.8, 0.8, NULL, 248508, 63600, NULL),
(2166, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '北京', 14.59, '601088', 0.59, 28083800, '煤炭开采', 14059000, '中国神华', 1649100, 1.14, 14.06, 'zhongguoshenhua', 'zgsh', '13.90', 7773900, 3.91, NULL, 55529800, 1988960, NULL),
(2167, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '湖南', 5.87, '601098', 0.439, 109827, '出版业', 1336260, '中南传媒', 179600, 3.27, 21.89, 'zhongnanchuanmei', 'zncm', '16.66', 444346, 2.47, NULL, 1552430, 179600, NULL),
(2168, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '云南', 2.04, '601099', 0.26, 10424, '证券', 0, '太平洋', 330547, 3.49, 13.68, 'taipingyang', 'tpy', '5.15', 182490, 0.52, NULL, 3685510, 353047, NULL),
(2169, '2016-06-05 13:22:22', '2016-06-05 13:22:22', '江苏', 5.48, '601100', 0.064, 147663, '工程机械', 181338, '恒立油缸', 24727.5, 2.75, 117.94, 'hengliyougang', 'hlyg', '16.06', 208607, 3.31, NULL, 446651, 63000, NULL),
(2170, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 5.64, '601101', 0.026, 269660, '煤炭开采', 324991, '昊华能源', 120000, 1.16, 125.08, 'haohuanengyuan', 'hhny', '6.68', 323487, 2.7, NULL, 1677810, 120000, NULL),
(2171, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '黑龙江', 2.49, '601106', -0.079, 722997, '工程机械', 2808100, '中国一重', 653800, 3.29, 0, 'zhongguoyizhong', 'zgyz', '5.41', 841515, 1.29, NULL, 3893190, 653800, NULL),
(2172, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '四川', 3.95, '601107', 0.182, 54842.9, '路桥', 662050, '四川成渝', 216274, 1.09, 11.79, 'sichuanchengyu', 'sccy', '5.06', 184646, 0.6, NULL, 2983520, 305806, NULL),
(2173, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 4.46, '601111', 0.32, 14727700, '空运', 2097150, '中国国航', 832927, 1.93, 14.27, 'zhongguoguohang', 'zggh', '7.20', 1667370, 1.27, NULL, 21666100, 1308480, NULL),
(2174, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '浙江', 2.56, '601113', -0.024, 154238, '化纤', 156161, '华鼎股份', 64000, 2.15, 0, 'huadinggufen', 'hdgf', '10.58', 71632.6, 1.12, NULL, 360771, 64000, NULL),
(2175, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '浙江', 3.81, '601116', 0.125, 98704.9, '超市连锁', 157245, '三江购物', 40189.3, 2.05, 31.3, 'sanjianggouwu', 'sjgw', '42.55', 66753.5, 1.63, NULL, 274090, 41075.9, NULL),
(2176, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 4.97, '601117', 0.23, 754113, '建筑施工', 6636690, '中国化学', 493300, 1.45, 15.73, 'zhongguohuaxue', 'zghx', '6.77', 551592, 1.12, NULL, 8183110, 493300, NULL),
(2177, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '海南', 2.2, '601118', -0.079, 158148, '橡胶', 635721, '海南橡胶', 393117, 2.93, 0, 'hainanxiangjiao', 'hnxj', '6.96', 378543, 0.96, NULL, 1359710, 393117, NULL),
(2178, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 8.4, '601126', 0.188, 53662.3, '电气设备', 399365, '四方股份', 40658.6, 2.98, 66.53, 'sifanggufen', 'sfgf', '9.73', 181455, 4.46, NULL, 524110, 40658.6, NULL),
(2179, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '浙江', 9.32, '601137', 0.174, 96858.2, '铜', 151449, '博威合金', 21500, 1.48, 39.72, 'boweihejin', 'bwhj', '13.07', 137654, 6.4, NULL, 291472, 21500, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(2180, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '深圳', 3.15, '601139', 0.19, 572383, '供气供热', 459883, '深圳燃气', 217762, 2.59, 22.99, 'shenzhenranqi', 'szrq', '9.09', 246660, 1.13, NULL, 1485120, 217762, NULL),
(2181, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '重庆', 2.69, '601158', 0.183, 680716, '水务', 710414, '重庆水务', 480000, 3.13, 23.04, 'zhongqingshuiwu', 'zqsw', '7.43', 459544, 0.96, NULL, 1862180, 480000, NULL),
(2182, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '福建', 15.12, '601166', 1.45, 1039500, '银行', 0, '兴业银行', 1617960, 0.97, 5.05, 'xingyeyinxing', 'xyyx', '16.14', 5086100, 2.67, NULL, 512590000, 1905230, NULL),
(2183, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '青海', 4.74, '601168', 0.017, 321023, '铜', 820041, '西部矿业', 238300, 1.41, 190.92, 'xibukuangye', 'xbky', '7.83', 526168, 2.21, NULL, 2556550, 238300, NULL),
(2184, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 8.15, '601169', 0.792, 583000, '银行', 0, '北京银行', 1267220, 1.09, 5.61, 'beijingyinxing', 'bjyx', '9.76', 2612800, 2.06, NULL, 162423000, 1267220, NULL),
(2185, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '浙江', 4.35, '601177', 0.02, 105462, '机械基件', 189902, '杭齿前进', 40006, 1.63, 173.04, 'hangchiqianjin', 'hcqj', '10.59', 86056.5, 2.15, NULL, 406328, 40006, NULL),
(2186, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '陕西', 3.49, '601179', 0.08, 494811, '电气设备', 2318320, '中国西电', 435700, 2.03, 44.19, 'zhongguoxidian', 'zgxd', '5.58', 1142090, 2.23, NULL, 3129160, 512588, NULL),
(2187, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 7.68, '601186', 0.43, 4109830, '建筑施工', 53623800, '中国铁建', 1026120, 1.87, 18.34, 'zhongguotiejian', 'zgtj', '12.21', 3134610, 2.31, NULL, 64822900, 1357950, NULL),
(2188, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '黑龙江', 2.62, '601188', 0.108, 171677, '路桥', 158549, '龙江交通', 121320, 1.62, 19.64, 'longjiangjiaotong', 'ljjt', '6.83', 122168, 0.93, NULL, 442035, 131588, NULL),
(2189, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '北京', 5.17, '601198', 0.65, 24054.9, '证券', 0, '东兴证券', 50000, 2.88, 12.33, 'dongxingzhengquan', 'dxzq', '20.22', 529852, 2.12, NULL, 8960180, 250400, NULL),
(2190, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '江苏', 8.72, '601199', 0.482, 132321, '水务', 159800, '江南水务', 23380, 2.71, 24.49, 'jiangnanshuiwu', 'jnsw', '7.82', 109138, 4.67, NULL, 339395, 23380, NULL),
(2191, '2016-06-05 13:22:23', '2016-06-05 13:22:23', '四川', 3.58, '601208', 0.074, 143531, '化工原料', 118603, '东材科技', 61576, 2.07, 49.95, 'dongcaikeji', 'dckj', '7.69', 116985, 1.9, NULL, 324126, 61576, NULL),
(2192, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '上海', 11.97, '601211', 1.54, 287089, '证券', 0, '国泰君安', 152500, 1.56, 7.4, 'guotaijunan', 'gtja', '18.59', 2928720, 3.84, NULL, 59610900, 762500, NULL),
(2193, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '内蒙', 1.87, '601216', 0.107, 573253, '化工原料', 678423, '内蒙君正', 368640, 5.72, 50.05, 'neimengjunzheng', 'nmjz', '4.65', 168469, 0.46, NULL, 1624030, 368640, NULL),
(2194, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '江苏', 2.39, '601218', 0.056, 82880, '机械基件', 281001, '吉鑫科技', 99176, 2.14, 45.72, 'jixinkeji', 'jxkj', '5.37', 58936.3, 0.59, NULL, 389818, 99176, NULL),
(2195, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '江苏', 11.99, '601222', 0.46, 129908, '电器仪表', 443340, '林洋电子', 35517.3, 2.08, 30.06, 'linyangdianzi', 'lydz', '8.07', 309925, 7.62, NULL, 641831, 40660.2, NULL),
(2196, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '陕西', 3.36, '601225', -0.095, 3358080, '煤炭开采', 2141610, '陕西煤业', 271000, 1.44, 0, 'shanximeiye', 'sxmy', '4.85', 734873, 0.73, NULL, 9314570, 1000000, NULL),
(2197, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '北京', 3.11, '601226', 0.139, 103274, '专用机械', 761725, '华电重工', 22500, 4.02, 44.89, 'huadianzhonggong', 'hdzg', '8.21', 122008, 1.06, NULL, 892435, 115500, NULL),
(2198, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '上海', 2.92, '601231', 0.109, 195897, '元器件', 1063040, '环旭电子', 202345, 4.97, 66.65, 'huanxudianzi', 'hxdz', '10.71', 154120, 0.71, NULL, 1339760, 217592, NULL),
(2199, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '浙江', 7.41, '601233', 0.329, 832337, '化纤', 523087, '桐昆股份', 96360, 1.6, 18.03, 'tongkungufen', 'tkgf', '14.36', 282728, 2.93, NULL, 1458740, 96360, NULL),
(2200, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '广东', 5.68, '601238', 0.272, 772496, '汽车整车', 2736440, '广汽集团', 422172, 2.89, 30.17, 'guangqijituan', 'gqjt', '23.17', 891133, 1.38, NULL, 6403070, 643502, NULL),
(2201, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '河北', 1.88, '601258', 0.006, 802397, '汽车服务', 5063590, '庞大集团', 524300, 2.12, 311.57, 'pangdajituan', 'pdjt', '2.77', 337743, 0.52, NULL, 6908810, 648011, NULL),
(2202, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '北京', 3.45, '601288', 0.321, 15024400, '银行', 0, '农业银行', 29405500, 0.98, 5.25, 'nongyeyinxing', 'nyyx', '3.10', 9877300, 0.3, NULL, 1745960000, 32479400, NULL),
(2203, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '湖北', 4.93, '601311', 0.284, 142304, '电气设备', 338256, '骆驼股份', 84839.6, 2.74, 23.72, 'luotuogufen', 'ltgf', '16.33', 104705, 1.23, NULL, 601764, 85163.6, NULL),
(2204, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '江苏', 3.76, '601313', 0.247, 46397.6, '运输设备', 199548, '江南嘉捷', 39448.1, 2.93, 22.35, 'jiangnanjiajie', 'jnjj', '11.82', 38083.4, 0.95, NULL, 261331, 40040.7, NULL),
(2205, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '深圳', 18.12, '601318', 1.895, 2881900, '保险', 0, '中国平安', 1083270, 1.65, 7.91, 'zhongguopingan', 'zgpa', '35.43', 14081400, 7.7, NULL, 463229000, 1828020, NULL),
(2206, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '上海', 6.58, '601328', 0.503, 6188100, '银行', 0, '交通银行', 3925090, 1.06, 6.92, 'jiaotongyinxing', 'jtyx', '5.55', 11344300, 1.53, NULL, 712215000, 7426270, NULL),
(2207, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '深圳', 3.79, '601333', 0.066, 2347610, '铁路', 498503, '广深铁路', 565224, 1.32, 38.03, 'guangshentielu', 'gstl', '5.07', 1156270, 1.63, NULL, 3057240, 708354, NULL),
(2208, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '北京', 18.25, '601336', 2.164, 413000, '保险', 0, '新华保险', 208544, 2.05, 8.64, 'xinhuabaoxian', 'xhbx', '42.01', 2396400, 7.68, NULL, 65984000, 311955, NULL),
(2209, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '浙江', 4.42, '601339', 0.178, 269325, '纺织', 695378, '百隆东方', 150000, 1.37, 17.03, 'bailongdongfang', 'bldf', '6.09', 235927, 1.57, NULL, 1099430, 150000, NULL),
(2210, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '广西', 3.38, '601368', 0.24, 330520, '水务', 222603, '绿城水务', 14700, 4.33, 37.71, 'lvchengshuiwu', 'lcsw', '12.09', 90107.9, 1.22, NULL, 754012, 73581.1, NULL),
(2211, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '陕西', 3.6, '601369', 0.117, 147423, '机械基件', 1169700, '陕鼓动力', 163877, 2.1, 32.23, 'shangudongli', 'sgdl', '6.47', 179967, 1.1, NULL, 1452270, 163877, NULL),
(2212, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '福建', 3.35, '601377', 0.569, 74517.4, '证券', 0, '兴业证券', 520000, 2.45, 7.2, 'xingyezhengquan', 'xyzq', '7.65', 376719, 0.72, NULL, 13898500, 520000, NULL),
(2213, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '江苏', 4.11, '601388', 0.074, 32416.9, '铝', 292091, '怡球资源', 53300, 5.67, 157.69, 'yiqiuziyuan', 'yqzy', '3.83', 111053, 2.08, NULL, 377016, 53300, NULL),
(2214, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '北京', 5.22, '601390', 0.21, 4275790, '建筑施工', 56015900, '中国中铁', 1709250, 2.31, 28.7, 'zhongguozhongtie', 'zgzt', '8.86', 3119220, 1.37, NULL, 70003000, 2284430, NULL),
(2215, '2016-06-05 13:22:24', '2016-06-05 13:22:24', '北京', 4.5, '601398', 0.418, 18003800, '银行', 0, '工商银行', 26961200, 1.1, 5.92, 'gongshangyinxing', 'gsyx', '4.41', 15219300, 0.43, NULL, 2241730000, 35640600, NULL),
(2216, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '广东', 2.91, '601515', 0.343, 93897.2, '广告包装', 267391, '东风股份', 111200, 4.7, 19.95, 'dongfenggufen', 'dfgf', '11.97', 15020.4, 0.14, NULL, 437866, 111200, NULL),
(2217, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '吉林', 2.04, '601518', 0.086, 306396, '路桥', 43309.9, '吉林高速', 121320, 2.08, 24.62, 'jilingaosu', 'jlgs', '3.66', 31718.3, 0.26, NULL, 562955, 121320, NULL),
(2218, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '上海', 1.52, '601519', 0.002, 17742, '软件服务', 198997, '大智慧', 198770, 5.69, 2806.7, 'dazhihui', 'dzh', '9.52', 102244, 0.51, NULL, 322205, 198770, NULL),
(2219, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '江苏', 5.77, '601555', 0.677, 80504.9, '证券', 0, '东吴证券', 259100, 2.12, 9.04, 'dongwuzhengquan', 'dwzq', '13.27', 856468, 3.17, NULL, 10242700, 270000, NULL),
(2220, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '北京', 1.31, '601558', -0.143, 126383, '电气设备', 1321440, '华锐风电', 134916, 2.63, 0, 'huaruifengdian', 'hrfd', '2.34', 533288, 0.88, NULL, 1585170, 603060, NULL),
(2221, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '福建', 7.09, '601566', 0.388, 75277.1, '服饰', 335049, '九牧王', 57463.7, 2.01, 18.4, 'jiumuwang', 'jmw', '17.69', 257580, 4.48, NULL, 521299, 57463.7, NULL),
(2222, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '浙江', 2.21, '601567', 0.18, 69526.6, '电器仪表', 386700, '三星电气', 100812, 3.91, 26.52, 'sanxingdianqi', 'sxdq', '11.48', 44919.9, 0.37, NULL, 726626, 119860, NULL),
(2223, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '浙江', 3.65, '601579', 0.174, 79299.1, '红黄药酒', 105029, '会稽山', 24800, 2.65, 27.86, 'huijishan', 'hjs', '14.28', 52890.9, 1.32, NULL, 225782, 40000, NULL),
(2224, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '北京', 3.29, '601588', 0.113, 307200, '区域地产', 3254660, '北辰实业', 266000, 1.33, 19.33, 'beichenshiye', 'bcsy', '4.17', 369778, 1.1, NULL, 4063640, 336702, NULL),
(2225, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '江苏', 3.91, '601599', 0.171, 95959.5, '纺织', 178197, '鹿港科技', 31800, 2.65, 30.3, 'lugangkeji', 'lgkj', '9.16', 78390.9, 2.08, NULL, 346194, 37742.7, NULL),
(2226, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '北京', 2.43, '601600', 0.002, 8195300, '铝', 6894610, '中国铝业', 958052, 2.08, 1364.62, 'zhongguolvye', 'zgly', '4.22', 2029030, 1.36, NULL, 19567600, 1490380, NULL),
(2227, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '上海', 14.19, '601601', 1.246, 880000, '保险', 0, '中国太保', 628670, 1.62, 9.2, 'zhongguotaibao', 'zgtb', '27.08', 6674200, 7.37, NULL, 91168500, 906200, NULL),
(2228, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '上海', 10.6, '601607', 0.57, 438231, '医药商业', 5228950, '上海医药', 192294, 1.8, 16.7, 'shanghaiyiyao', 'shyy', '19.56', 1404640, 5.22, NULL, 6988580, 268891, NULL),
(2229, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '河南', 1.9, '601608', 0.034, 355449, '专用机械', 1273070, '中信重工', 411000, 3.09, 85.33, 'zhongxinzhonggong', 'zxzg', '5.61', 256791, 0.62, NULL, 1981170, 411000, NULL),
(2230, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '上海', 2.67, '601616', 0.016, 66944.6, '电气设备', 189259, '广电电气', 93330.1, 2.52, 210.56, 'guangdiandianqi', 'gddq', '6.51', 133980, 1.44, NULL, 307952, 93330.1, NULL),
(2231, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '北京', 2.8, '601618', 0.114, 3057140, '建筑施工', 26052500, '中国中冶', 1623900, 2.78, 34.27, 'zhongguozhongye', 'zgzy', '4.66', 1782870, 0.93, NULL, 33752100, 1911000, NULL),
(2232, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '北京', 11, '601628', 1.114, 1811700, '保险', 0, '中国人寿', 2082350, 2.4, 11.86, 'zhongguorenshou', 'zgrs', '21.65', 5464200, 1.93, NULL, 237956000, 2826470, NULL),
(2233, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '河北', 11.75, '601633', 1.55, 1767650, '汽车整车', 3163920, '长城汽车', 200924, 2.49, 9.43, 'zhangchengqiche', 'zcqc', '8.65', 445365, 1.46, NULL, 6136110, 304242, NULL),
(2234, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '湖南', 5.12, '601636', 0.11, 756381, '玻璃', 322543, '旗滨集团', 82198.6, 1.84, 50.77, 'qibinjituan', 'qbjt', '3.88', 289761, 2.87, NULL, 1289980, 101017, NULL),
(2235, '2016-06-05 13:22:25', '2016-06-05 13:22:25', '河南', 4.7, '601666', -0.296, 1181450, '煤炭开采', 910724, '平煤股份', 236116, 1.08, 0, 'pingmeigufen', 'pmgf', '4.87', 272157, 1.15, NULL, 3155120, 236116, NULL),
(2236, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 5.21, '601668', 0.43, 2328970, '建筑施工', 78180200, '中国建筑', 2989970, 1.2, 6.83, 'zhongguojianzhu', 'zgjz', '8.86', 2370590, 0.79, NULL, 101320000, 3000000, NULL),
(2237, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 3.68, '601669', 0.238, 6617840, '建筑施工', 20990000, '中国电建', 330000, 2.28, 17.59, 'zhongguodianjian', 'zgdj', '7.26', 1255710, 0.91, NULL, 36281900, 1375460, NULL),
(2238, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '河南', 6.81, '601677', 0.227, 98227.9, '铝', 263283, '明泰铝业', 40100, 1.48, 22.23, 'mingtailvye', 'mtly', '14.80', 148818, 3.56, NULL, 442695, 41775.6, NULL),
(2239, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '山东', 4.61, '601678', 0.25, 407508, '化工原料', 141301, '滨化股份', 99000, 1.49, 13.73, 'binhuagufen', 'bhgf', '4.94', 147216, 1.49, NULL, 717460, 99000, NULL),
(2240, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '江苏', 10.76, '601688', 1.14, 260358, '证券', 0, '华泰证券', 544372, 1.38, 7.95, 'huataizhengquan', 'htzq', '18.65', 4585600, 6.4, NULL, 58016100, 716277, NULL),
(2241, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '浙江', 4.75, '601689', 0.36, 90359.2, '汽车配件', 245404, '拓普集团', 12910, 3.34, 24.2, 'tuopujituan', 'tpjt', '29.42', 145489, 2.24, NULL, 385138, 64910, NULL),
(2242, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '山西', 6.35, '601699', 0.038, 1097420, '煤炭开采', 1958750, '潞安环能', 299141, 1.07, 89.45, 'luanhuanneng', 'lahn', '8.05', 143936, 0.48, NULL, 5226700, 299141, NULL),
(2243, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '江苏', 2.42, '601700', 0.099, 34653.5, '电气设备', 248466, '风范股份', 111214, 2.66, 32.63, 'fengfangufen', 'ffgf', '8.47', 120653, 1.06, NULL, 391464, 113336, NULL),
(2244, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '河南', 5.83, '601717', 0.036, 152360, '工程机械', 902142, '郑煤机', 137789, 1.04, 83.47, 'zhengmeiji', 'zmj', '7.03', 349334, 2.15, NULL, 1217280, 162112, NULL),
(2245, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 3.28, '601718', 0.231, 307025, '服饰', 1139670, '际华集团', 385700, 4.42, 31.42, 'jihuajituan', 'jhjt', '9.21', 428697, 1.11, NULL, 2143270, 385700, NULL),
(2246, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '上海', 2.88, '601727', 0.104, 1236260, '电气设备', 12413300, '上海电气', 985071, 3.97, 54.79, 'shanghaidianqi', 'shdq', '8.42', 573186, 0.45, NULL, 15670600, 1282360, NULL),
(2247, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 3.44, '601766', 0.172, 5034070, '运输设备', 20544400, '中国中车', 2291770, 3.72, 37.26, 'zhongguozhongche', 'zgzc', '9.77', 3097420, 1.14, NULL, 30746700, 2728880, NULL),
(2248, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '重庆', 5.56, '601777', 0.17, 463698, '摩托车', 1309840, '力帆股份', 97414.3, 1.67, 28.62, 'lifangufen', 'lfgf', '9.56', 482366, 3.84, NULL, 2344380, 125762, NULL),
(2249, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '上海', 8.68, '601788', 1.427, 87027.3, '证券', 0, '光大证券', 341800, 1.95, 5.92, 'guangdazhengquan', 'gdzq', '15.99', 970695, 2.84, NULL, 24089400, 341800, NULL),
(2250, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '浙江', 4.64, '601789', 0.19, 53533.5, '建筑施工', 980080, '宁波建工', 43808, 1.69, 20.63, 'ningbojiangong', 'nbjg', '10.64', 100527, 2.06, NULL, 1097250, 48804, NULL),
(2251, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '甘肃', 5.53, '601798', 0.068, 75267.8, '化工机械', 163055, '蓝科高新', 35452.8, 1.84, 75.35, 'lankegaoxin', 'lkgx', '11.94', 99695.7, 2.81, NULL, 286654, 35452.8, NULL),
(2252, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '江苏', 8.07, '601799', 0.566, 64387.4, '汽车配件', 234059, '星宇股份', 23894, 2.47, 17.63, 'xingyugufen', 'xygf', '38.50', 121676, 5.08, NULL, 327311, 23965.3, NULL),
(2253, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 7.3, '601800', 0.39, 5389610, '建筑施工', 38682500, '中国交建', 1174720, 1.9, 17.18, 'zhongguojiaojian', 'zgjj', '15.19', 2226560, 1.38, NULL, 69552000, 1617470, NULL),
(2254, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '安徽', 5.98, '601801', 0.516, 47067.7, '出版业', 581362, '皖新传媒', 91000, 4.37, 25.33, 'wanxinchuanmei', 'wxcm', '17.57', 154135, 1.69, NULL, 738769, 91000, NULL),
(2255, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '天津', 9.62, '601808', 0.188, 4785140, '石油开采', 2244310, '中海油服', 296047, 1.82, 46.66, 'zhonghaiyoufu', 'zhyf', '12.83', 1237170, 2.59, NULL, 8628690, 477159, NULL),
(2256, '2016-06-05 13:22:26', '2016-06-05 13:22:26', '北京', 4.45, '601818', 0.348, 1273900, '银行', 0, '光大银行', 3981040, 0.98, 6.29, 'guangdayinxing', 'gdyx', '3.91', 3336500, 0.71, NULL, 300034000, 4667910, NULL),
(2257, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '北京', 6.46, '601857', 0.139, 60341500, '石油开采', 40632100, '中国石油', 16192200, 1.35, 31.52, 'zhongguoshiyou', 'zgsy', '7.95', 11547400, 0.63, NULL, 238523000, 18302100, NULL),
(2258, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '上海', 2.12, '601866', 0.001, 3767500, '水运', 1221200, '中海集运', 793212, 4.11, 3557.41, 'zhonghaijiyun', 'zhjy', '4.08', 1716840, 1.47, NULL, 5411160, 1168310, NULL),
(2259, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '河北', 5.75, '600480', 0.289, 165538, '汽车配件', 508349, '凌云股份', 36171.5, 2.17, 21.53, 'lingyungufen', 'lygf', '15.01', 64313.3, 1.78, NULL, 830617, 36171.5, NULL),
(2260, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '江苏', 2.46, '600481', 0.23, 255371, '化工原料', 263500, '双良节能', 81024.8, 6.59, 35.27, 'shuangliangjieneng', 'sljn', '5.92', 66611.7, 0.82, NULL, 593952, 81024.8, NULL),
(2261, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '河北', 3.99, '600482', 0.186, 98628, '电气设备', 216715, '风帆股份', 52434.2, 10.62, 113.96, 'fengfangufen', 'ffgf', '30.54', 129882, 2.42, NULL, 418339, 53650, NULL),
(2262, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '福建', 4.72, '600483', 0.296, 961902, '火力发电', 268888, '福能股份', 28848.4, 2.56, 20.48, 'funenggufen', 'fngf', '11.07', 81703.9, 0.65, NULL, 1421970, 125835, NULL),
(2263, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '北京', 3.65, '600485', 0.117, 44165.6, '通信设备', 1014010, '信威集团', 13858.6, 9.75, 151.79, 'xinweijituan', 'xwjt', '17.89', 505172, 1.73, NULL, 1308540, 292374, NULL),
(2264, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '江苏', 9.6, '600486', 0.809, 101306, '农药化肥', 340481, '扬农化工', 30989.9, 2.54, 15.07, 'yangnonghuagong', 'ynhg', '25.08', 81536.7, 2.63, NULL, 467608, 30989.9, NULL),
(2265, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '江苏', 10.02, '600487', 0.34, 312173, '通信设备', 1078610, '亨通光电', 38375.6, 2.51, 37.06, 'hengtongguangdian', 'htgd', '18.66', 176460, 4.26, NULL, 1569150, 41375.6, NULL),
(2266, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '天津', 2.49, '600488', 0.049, 127254, '化学制药', 148082, '天药股份', 89228.5, 2.5, 63.49, 'tianyaogufen', 'tygf', '6.21', 60856, 0.63, NULL, 299991, 96085.5, NULL),
(2267, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '北京', 3.39, '600489', 0.018, 744648, '黄金', 1099040, '中金黄金', 294323, 2.55, 245.6, 'zhongjinhuangjin', 'zjhj', '12.09', 166052, 0.56, NULL, 3268000, 294323, NULL),
(2268, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '上海', 1.14, '600490', 0.03, 203496, '化工原料', 211600, '鹏欣资源', 147900, 5.8, 109.16, 'pengxinziyuan', 'pxzy', '7.63', 16710.3, 0.11, NULL, 465039, 147900, NULL),
(2269, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '浙江', 3.59, '600491', 0.098, 29203.9, '建筑施工', 2099180, '龙元建设', 94760, 1.88, 34.42, 'longyuanjianshe', 'lyjs', '7.58', 43174.7, 0.46, NULL, 2177850, 94760, NULL),
(2270, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '福建', 2.32, '600493', 0.01, 41031.9, '纺织', 42599.9, '凤竹纺织', 27200, 4.3, 485.21, 'fengzhufangzhi', 'fzfz', '16.88', 19092.6, 0.7, NULL, 105584, 27200, NULL),
(2271, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '山西', 2.51, '600495', 0.025, 73758.5, '运输设备', 269524, '晋西车轴', 110332, 3.38, 170.44, 'jinxichezhou', 'jxcz', '7.08', 169761, 1.41, NULL, 408035, 120819, NULL),
(2272, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '安徽', 2.3, '600496', 0.085, 90070, '钢加工', 803772, '精工钢构', 129045, 2.31, 31.19, 'jinggongganggou', 'jggg', '4.28', 32658.8, 0.22, NULL, 1000270, 151045, NULL),
(2273, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '云南', 4.17, '600497', 0.039, 992708, '铅锌', 417768, '驰宏锌锗', 166756, 1.96, 104.38, 'chihongxinzhe', 'chxz', '7.03', 403815, 2.42, NULL, 3324110, 166756, NULL),
(2274, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '湖北', 6.32, '600498', 0.33, 138746, '通信设备', 1470580, '烽火通信', 96670.5, 3.21, 31.85, 'fenghuotongxin', 'fhtx', '25.21', 311144, 2.97, NULL, 1714060, 104692, NULL),
(2275, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '广东', 5.42, '600499', 0.382, 163374, '专用机械', 412295, '科达洁能', 68873.7, 5.47, 38.83, 'kedajieneng', 'kdjn', '7.56', 119346, 1.69, NULL, 765234, 70573.2, NULL),
(2276, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '上海', 5.24, '600500', 0.181, 578530, '商贸代理', 1415870, '中化国际', 172312, 1.97, 28.5, 'zhonghuaguoji', 'zhgj', '9.08', 445511, 2.14, NULL, 3302080, 208301, NULL),
(2277, '2016-06-05 13:22:27', '2016-06-05 13:22:27', '江苏', 5.21, '600501', 0.065, 93848.5, '汽车配件', 351387, '航天晨光', 38928.4, 2.89, 115.77, 'hangtianchenguang', 'htcg', '18.24', 140982, 3.35, NULL, 507709, 42128.4, NULL),
(2278, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '安徽', 4.6, '600502', 0.216, 81058, '建筑施工', 1076250, '安徽水利', 50193, 2.27, 24.2, 'anhuishuili', 'ahsl', '9.98', 58931.2, 1.11, NULL, 1346010, 53191, NULL),
(2279, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '上海', 2.25, '600503', 0.007, 485.17, '区域地产', 366856, '华丽家族', 156269, 3.48, 525.13, 'hualijiazu', 'hljz', '8.29', 118025, 0.74, NULL, 518236, 160229, NULL),
(2280, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '四川', 2.52, '600505', 0.001, 126044, '水力发电', 21205.5, '西昌电力', 36456.8, 2.97, 5969.99, 'xichangdianli', 'xcdl', '10.15', 7618.86, 0.21, NULL, 181169, 36456.8, NULL),
(2281, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '新疆', 1.83, '600506', -0.012, 4800.41, '种植业', 7487.22, '香梨股份', 14770.7, 7.21, 0, 'xiangligufen', 'xlgf', '34.94', 22398.2, 1.52, NULL, 28550.6, 14770.7, NULL),
(2282, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '江西', 1.56, '600507', 0.111, 276907, '特种钢', 460247, '方大特钢', 132609, 3.73, 26.31, 'fangdategang', 'fdtg', '5.02', 5763.58, 0.04, NULL, 944511, 132609, NULL),
(2283, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '上海', 11.02, '600508', 0.017, 701377, '煤炭开采', 216025, '上海能源', 72271.8, 0.84, 275.52, 'shanghainengyuan', 'shny', '9.24', 89140.2, 1.23, NULL, 1403450, 72271.8, NULL),
(2284, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '新疆', 5.09, '600509', 0.224, 488272, '火力发电', 403261, '天富能源', 83869.6, 1.66, 18.77, 'tianfunengyuan', 'tfny', '7.47', 256671, 2.83, NULL, 1538790, 90569.6, NULL),
(2285, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '江苏', 6.18, '600510', 0.165, 37143.4, '全国地产', 1657110, '黑牡丹', 79552.3, 1.44, 26.88, 'heimudan', 'hmd', '8.63', 167148, 2.1, NULL, 1767550, 79552.3, NULL),
(2286, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '北京', 5.68, '600511', 0.544, 50506.1, '医药商业', 448023, '国药股份', 27764.3, 5.41, 28.25, 'guoyaogufen', 'gygf', '30.10', 2714.65, 0.06, NULL, 566208, 47880, NULL),
(2287, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '浙江', 2.02, '600512', 0.02, 12709.9, '建筑施工', 411223, '腾达建设', 73694.1, 2.04, 164.92, 'tengdajianshe', 'tdjs', '5.30', 63310.8, 0.62, NULL, 508797, 101804, NULL),
(2288, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '江苏', 4.43, '600513', 0.141, 17403.3, '化学制药', 70839.4, '联环药业', 15210, 3.32, 52.2, 'lianhuanyaoye', 'lhyy', '17.46', 37404.6, 2.21, NULL, 95218.7, 16890.9, NULL),
(2289, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '海南', 1.97, '600515', 0.042, 138448, '百货', 97756.4, '海岛建设', 42277.4, 8.26, 192.19, 'haidaojianshe', 'hdjs', '11.60', 55748.8, 1.32, NULL, 345403, 42277.4, NULL),
(2290, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '甘肃', 3.36, '600516', 0.017, 162055, '矿物制品', 624098, '方大炭素', 171916, 2.13, 205.93, 'fangdatansu', 'fdts', '9.26', 167266, 0.97, NULL, 934064, 171916, NULL),
(2291, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '上海', 1.87, '600517', 0.03, 47820.3, '电气设备', 381010, '置信电气', 111367, 5.73, 215.11, 'zhixindianqi', 'zxdq', '8.96', 24982.7, 0.2, NULL, 511471, 124452, NULL),
(2292, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '广东', 3.97, '600518', 0.326, 430394, '中成药', 2452420, '康美药业', 439743, 3.61, 21.96, 'kangmeiyaoye', 'kmyy', '15.24', 365728, 0.83, NULL, 3212030, 439743, NULL),
(2293, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '贵州', 48.8, '600519', 6.279, 1037650, '白酒', 5324000, '贵州茅台', 125620, 3.99, 15.5, 'guizhoumaotai', 'gzmt', '283.89', 137496, 1.09, NULL, 7233770, 125620, NULL),
(2294, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '安徽', 2.91, '600520', -0.083, 16500.8, '机械基件', 40663.9, '中发科技', 15389, 4.18, 0, 'zhongfakeji', 'zfkj', '18.14', 37950.7, 2.4, NULL, 87260.4, 15843, NULL),
(2295, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '浙江', 4.25, '600521', 0.299, 133807, '化学制药', 250582, '华海药业', 78375.6, 5.28, 37.49, 'huahaiyaoye', 'hhyy', '31.89', 91828.2, 1.17, NULL, 499092, 78588.7, NULL),
(2296, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '江苏', 9.5, '600522', 0.444, 233701, '通信设备', 879592, '中天科技', 70450.4, 1.72, 18.43, 'zhongtiankeji', 'ztkj', '22.95', 387045, 4.49, NULL, 1254500, 86276.8, NULL),
(2297, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '贵州', 6.51, '600523', 0.265, 67042.5, '汽车配件', 241352, '贵航股份', 28860.3, 2.31, 28.32, 'guihanggufen', 'ghgf', '16.54', 92585.6, 3.21, NULL, 361503, 28879.4, NULL),
(2298, '2016-06-05 13:22:28', '2016-06-05 13:22:28', '深圳', 3.2, '600525', 0.17, 93445.8, '电气设备', 370257, '长园集团', 86351, 6.57, 76.25, 'zhangyuanjituan', 'zyjt', '16.85', 12078.8, 0.11, NULL, 669390, 109031, NULL),
(2299, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '浙江', 4.68, '600526', 0.1, 54456.1, '专用机械', 509299, '菲达环保', 40688.9, 2.2, 62.37, 'feidahuanbao', 'fdhb', '12.47', 170119, 3.11, NULL, 635638, 54740.5, NULL),
(2300, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '江苏', 2.12, '600527', 0.009, 46589.3, '化纤', 96842.9, '江南高纤', 80208.9, 2.17, 245.66, 'jiangnangaoxian', 'jngx', '6.48', 12842, 0.16, NULL, 182263, 80208.9, NULL),
(2301, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '四川', 4.19, '600528', 0.079, 166532, '建筑施工', 5445780, '中铁二局', 145920, 2.73, 72.39, 'zhongtieerju', 'ztej', '11.25', 159785, 1.1, NULL, 5922110, 145920, NULL),
(2302, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '山东', 8.36, '600529', 0.283, 105748, '玻璃', 161696, '山东药玻', 25738, 2.05, 30.34, 'shandongyaobo', 'sdyb', '17.93', 58667.3, 2.28, NULL, 290919, 25738, NULL),
(2303, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '上海', 6.35, '600530', 0.218, 21675.6, '生物制药', 52307.9, '交大昂立', 31200, 3.37, 48.96, 'jiaodaangli', 'jdal', '20.23', 52828.7, 1.69, NULL, 270687, 31200, NULL),
(2304, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '河南', 4.59, '600531', 0.024, 216755, '铅锌', 583965, '豫光金铅', 29525.1, 2.05, 196.9, 'yuguangjinqian', 'ygjq', '7.64', 76675.1, 2.6, NULL, 850548, 29525.1, NULL),
(2305, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '山东', 2.95, '600532', 0.007, 88661.5, '普钢', 29967.1, '宏达矿业', 16510.2, 4.94, 1058.07, 'hongdakuangye', 'hdky', '15.98', 18538.4, 0.36, NULL, 205687, 51606.6, NULL),
(2306, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '江苏', 3.73, '600533', 0.073, 2032.05, '区域地产', 1135760, '栖霞建设', 105000, 1.41, 36.12, 'qixiajianshe', 'qxjs', '5.09', 104373, 0.99, NULL, 1357220, 105000, NULL),
(2307, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '天津', 6.32, '600535', 0.79, 295942, '中成药', 911569, '天士力', 103284, 5.72, 23.52, 'tianshili', 'tsl', '36.48', 177388, 1.64, NULL, 1443640, 108048, NULL),
(2308, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '北京', 3.69, '600536', -0.156, 32995.3, '软件服务', 319147, '中国软件', 48471.2, 6.39, 0, 'zhongguoruanjian', 'zgrj', '24.34', 96544.5, 1.95, NULL, 407153, 49456.3, NULL),
(2309, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '浙江', 4.33, '600537', 0.057, 248520, '半导体', 345345, '亿晶光电', 48587.1, 2.08, 79.74, 'yijingguangdian', 'yjgd', '7.49', 113435, 1.93, NULL, 686846, 58818, NULL),
(2310, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '广西', 1.46, '600538', 0.002, 32440.5, '农药化肥', 40248.7, '国发股份', 27921.6, 4.82, 2318.06, 'guofagufen', 'gfgf', '11.56', 58689.1, 1.26, NULL, 96792.4, 46440.1, NULL),
(2311, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '山西', 2.04, '600539', 0.005, 74663.4, '水泥', 16500.4, '*ST狮头', 23000, 4.12, 814.42, '*STshitou', '*STst', '10.68', 54635.8, 2.38, NULL, 99903.6, 23000, NULL),
(2312, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '新疆', 3.27, '600540', -0.035, 78478.6, '种植业', 117753, '新赛股份', 30270.8, 2.22, 0, 'xinsaigufen', 'xsgf', '7.78', 91344.7, 2.52, NULL, 274517, 36224.9, NULL),
(2313, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '甘肃', 3.38, '600543', 0.052, 30159.7, '红黄药酒', 68081.2, '莫高股份', 32112, 2.32, 75.48, 'mogaogufen', 'mggf', '13.66', 46593.5, 1.45, NULL, 126845, 32112, NULL),
(2314, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '新疆', 3.05, '600545', -0.003, 45181.1, '建筑施工', 791481, '新疆城建', 67578.6, 3.44, 0, 'xinjiangchengjian', 'xjcj', '6.91', 56168.7, 0.83, NULL, 990529, 67578.6, NULL),
(2315, '2016-06-05 13:22:29', '2016-06-05 13:22:29', '山西', 3.17, '600546', 0.005, 891890, '煤炭开采', 2847890, '山煤国际', 198246, 1.33, 469.83, 'shanmeiguoji', 'smgj', '3.11', 224503, 1.13, NULL, 5120970, 198246, NULL),
(2316, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '山东', 6.4, '600547', 0.034, 798544, '黄金', 251040, '山东黄金', 142307, 2.66, 251.94, 'shandonghuangjin', 'sdhj', '29.34', 3067.95, 0.02, NULL, 2322560, 142307, NULL),
(2317, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '深圳', 5.21, '600548', 0.247, 98930.5, '路桥', 362546, '深高速', 143327, 1.13, 11.92, 'shengaosu', 'sgs', '8.01', 227435, 1.04, NULL, 2420570, 218077, NULL),
(2318, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '福建', 6.76, '600549', 0.031, 503448, '小金属', 805322, '厦门钨业', 88657.4, 2.52, 270.99, 'shamenwuye', 'smwy', '29.78', 335133, 3.1, NULL, 1637030, 108157, NULL),
(2319, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '河北', 0.62, '600550', 0.15, 113013, '电气设备', 617277, '保变电气', 137299, 10.82, 22.4, 'baobiandianqi', 'bbdq', '6.02', 366847, 2.39, NULL, 923217, 153461, NULL),
(2320, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '安徽', 7.75, '600551', 0.458, 77866.5, '出版业', 458467, '时代出版', 50582.5, 2.13, 18.07, 'shidaichuban', 'sdcb', '19.26', 134475, 2.66, NULL, 632814, 50582.5, NULL),
(2321, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '安徽', 4.88, '600552', 0.121, 91934.6, '玻璃', 160798, '方兴科技', 34223.9, 2.83, 57.27, 'fangxingkeji', 'fxkj', '21.24', 94106.6, 2.62, NULL, 282547, 35899.5, NULL),
(2322, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '上海', 1.27, '600555', -0.023, 9923.83, '旅游景点', 178219, '九龙山', 97350, 11.92, 0, 'jiulongshan', 'jls', '6.18', 40388.6, 0.31, NULL, 335393, 130350, NULL),
(2323, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '广西', 0.01, '600556', 0.005, 41.97, '软件服务', 10619.9, '慧球科技', 39479.4, 881.91, 902.28, 'huiqiukeji', 'hqkj', '11.93', 36218.4, 0.92, NULL, 10677.9, 39479.4, NULL),
(2324, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '江苏', 5.13, '600557', 0.37, 107656, '中成药', 217460, '康缘药业', 36852.9, 4.36, 30.3, 'kangyuanyaoye', 'kyyy', '17.57', 52043.3, 1.01, NULL, 419756, 51370.8, NULL),
(2325, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '四川', 3.03, '600558', 0.052, 46265.4, '钢加工', 143665, '大西洋', 55248.3, 1.81, 52.81, 'daxiyang', 'dxy', '6.90', 94696.2, 1.58, NULL, 264059, 59840.3, NULL),
(2326, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '河北', 4.75, '600559', 0.126, 56818.3, '白酒', 159449, '老白干酒', 14000, 9.91, 187.43, 'laobaiganjiu', 'lbgj', '51.40', 16641.5, 1.19, NULL, 235043, 14000, NULL),
(2327, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '北京', 3.18, '600560', 0.06, 15153.6, '电气设备', 150072, '金自天正', 22364.6, 3.48, 91.5, 'jinzitianzheng', 'jztz', '16.18', 20672.1, 0.92, NULL, 190765, 22364.6, NULL),
(2328, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '江西', 6.33, '600561', 0.191, 151298, '公路', 151188, '江西长运', 23706.4, 1.43, 23.71, 'jiangxizhangyun', 'jxzy', '12.07', 47528.2, 2, NULL, 531383, 23706.4, NULL),
(2329, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '江苏', 3.48, '600562', 0.221, 11428.8, '通信设备', 127186, '国睿科技', 16817.8, 9.2, 72.63, 'guoruikeji', 'grkj', '32.32', 2133.63, 0.08, NULL, 143003, 25706.2, NULL),
(2330, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '福建', 7.82, '600563', 0.679, 37364.7, '元器件', 147364, '法拉电子', 22500, 3.28, 18.87, 'faladianzi', 'fldz', '44.49', 26196.9, 1.16, NULL, 198977, 22500, NULL),
(2331, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '重庆', 2.53, '600565', 0.073, 12593.4, '全国地产', 2429600, '迪马股份', 103278, 4.19, 72.01, 'dimagufen', 'dmgf', '7.42', 237058, 1.01, NULL, 2482030, 234586, NULL),
(2332, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '湖北', 2.96, '600566', 0.424, 93053.5, '中成药', 169553, '济川药业', 17063, 7.3, 25.48, 'jichuanyaoye', 'jcyy', '31.26', 98768.4, 1.26, NULL, 344274, 78145.5, NULL),
(2333, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '安徽', 1.61, '600567', 0.036, 973353, '造纸', 703433, '山鹰纸业', 217622, 2.21, 50.18, 'shanyingzhiye', 'syzy', '3.62', 309422, 0.82, NULL, 1897630, 376694, NULL),
(2334, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '湖北', 4.78, '600568', 0.115, 19961.4, '区域地产', 388702, '中珠控股', 36622.6, 5.04, 105.02, 'zhongzhukonggu', 'zzkg', '25.00', 133964, 2.64, NULL, 485489, 50660.4, NULL),
(2335, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '河南', 2.86, '600569', -0.164, 1307380, '普钢', 1480940, '安阳钢铁', 239368, 1.07, 0, 'anyanggangtie', 'aygt', '2.99', 343691, 1.44, NULL, 3381160, 239368, NULL),
(2336, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '浙江', 3.51, '600570', 0.342, 31226.8, '软件服务', 129108, '恒生电子', 61780.5, 13, 66.87, 'hengshengdianzi', 'hsdz', '47.14', 11145.9, 0.18, NULL, 320251, 61780.5, NULL),
(2337, '2016-06-05 13:22:30', '2016-06-05 13:22:30', '浙江', 3.49, '600571', 0.228, 4277.85, '软件服务', 83917.8, '信雅达', 20242, 11.18, 85.57, 'xinyada', 'xyd', '46.23', 12618.5, 0.62, NULL, 113883, 20242, NULL),
(2338, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '浙江', 2.74, '600572', 0.263, 156365, '中成药', 518308, '康恩贝', 119163, 4.31, 22.45, 'kangenbei', 'keb', '7.31', 175160, 1.05, NULL, 951877, 167382, NULL),
(2339, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '福建', 4.34, '600573', 0.042, 52365.3, '啤酒', 60392, '惠泉啤酒', 25000, 2.03, 103.57, 'huiquanpijiu', 'hqpj', '15.55', 50606.6, 2.02, NULL, 122305, 25000, NULL),
(2340, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '安徽', 1.23, '600575', 0.041, 236938, '水运', 313612, '皖江物流', 142320, 3.35, 50.65, 'wanjiangwuliu', 'wjwl', '5.75', 251782, 0.87, NULL, 708214, 288401, NULL),
(2341, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '浙江', 2.17, '600576', -0.066, 7506.68, '综合类', 38302.1, '万好万家', 21809.3, 8.05, 0, 'wanhaowanjia', 'whwj', '18.38', 30513.1, 1.4, NULL, 63971.9, 21809.3, NULL),
(2342, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '安徽', 1.39, '600577', 0.044, 91239.4, '电气设备', 357790, '精达股份', 141913, 2.95, 46.75, 'jingdagufen', 'jdgf', '4.18', 2283.4, 0.01, NULL, 507851, 195532, NULL),
(2343, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '北京', 3.18, '600578', 0.28, 2348210, '火力发电', 571030, '京能电力', 225732, 1.84, 10.42, 'jingnengdianli', 'jndl', '4.20', 358216, 0.78, NULL, 3989570, 461732, NULL),
(2344, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '山东', 1.76, '600579', 0.025, 22025.5, '化工机械', 102459, '天华院', 25560, 5.2, 183.01, 'tianhuayuan', 'thy', '13.62', 112410, 2.87, NULL, 143060, 39207.1, NULL),
(2345, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '浙江', 3.5, '600580', 0.178, 295659, '电气设备', 787841, '卧龙电气', 68772.9, 3.14, 30.81, 'wolongdianqi', 'wldq', '9.10', 102591, 0.92, NULL, 1361430, 111053, NULL),
(2346, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '新疆', 1.04, '600581', -1.058, 1504950, '普钢', 528173, '八一钢铁', 76644.9, 6.21, 0, 'bayigangtie', 'bygt', '6.66', 104487, 1.36, NULL, 2075750, 76644.9, NULL),
(2347, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '北京', 6.28, '600582', 0.257, 363271, '工程机械', 2218270, '天地科技', 121392, 1.58, 19.36, 'tiandikeji', 'tdkj', '4.97', 381062, 1.84, NULL, 3003240, 206929, NULL),
(2348, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '天津', 4.79, '600583', 0.352, 1379200, '石油开采', 1194040, '海油工程', 404901, 1.99, 13.54, 'haiyougongcheng', 'hygc', '7.38', 424794, 0.96, NULL, 2924920, 442135, NULL),
(2349, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '江苏', 3.86, '600584', 0.126, 404416, '半导体', 827532, '长电科技', 85313.4, 3.48, 53.59, 'zhangdiankeji', 'zdkj', '18.48', 193901, 1.97, NULL, 1436260, 98457, NULL),
(2350, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '安徽', 12.79, '600585', 0.888, 6137170, '水泥', 2597590, '海螺水泥', 399970, 1.43, 10.28, 'hailuoshuini', 'hlsn', '16.96', 1068660, 2.02, NULL, 10518000, 529930, NULL),
(2351, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '山东', 2.71, '600586', -0.053, 464870, '玻璃', 301654, '金晶科技', 142271, 1.51, 0, 'jinjingkeji', 'jjkj', '4.43', 187327, 1.32, NULL, 960651, 142271, NULL),
(2352, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '山东', 7.82, '600587', 0.341, 126173, '医疗保健', 530406, '新华医疗', 36370, 3.51, 40.27, 'xinhuayiliao', 'xhyl', '24.11', 164742, 4.05, NULL, 875370, 40642.8, NULL),
(2353, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '北京', 2.49, '600588', -0.116, 115881, '软件服务', 481982, '用友网络', 139711, 9.65, 0, 'yongyouwangluo', 'yywl', '19.68', 54306.8, 0.37, NULL, 876774, 145919, NULL),
(2354, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '广东', 3.39, '600589', 0.035, 75474.8, '塑料', 209406, '广东榕泰', 60173, 2.1, 102.84, 'guangdongrongtai', 'gdrt', '9.20', 56328.1, 0.94, NULL, 378142, 60173, NULL),
(2355, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '江西', 4.28, '600590', 0.03, 104621, '电气设备', 304589, '泰豪科技', 50032.6, 3.24, 320.94, 'taihaokeji', 'thkj', '14.43', 113993, 1.84, NULL, 572007, 61924.5, NULL),
(2356, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '福建', 5.51, '600592', 0.051, 55292.4, '机械基件', 142901, '龙溪股份', 36955.4, 1.59, 86.57, 'longxigufen', 'lxgf', '10.24', 70283.3, 1.76, NULL, 303412, 39955.4, NULL),
(2357, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '辽宁', 3.82, '600593', 0.092, 28533.3, '旅游景点', 13682.4, '大连圣亚', 9200, 7.71, 160.14, 'dalianshengya', 'dlsy', '31.90', 19775.5, 2.15, NULL, 65458, 9200, NULL),
(2358, '2016-06-05 13:22:31', '2016-06-05 13:22:31', '贵州', 4.41, '600594', 0.076, 54864.2, '中成药', 214400, '益佰制药', 78235.8, 3.42, 99.61, 'yibaizhiyao', 'ybzy', '15.62', 116435, 1.47, NULL, 496269, 79192.7, NULL),
(2359, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '河南', 3.1, '600595', -0.043, 935712, '铝', 593352, '中孚实业', 151487, 1.33, 0, 'zhongfushiye', 'zfsy', '5.25', 309118, 1.77, NULL, 2576590, 174154, NULL),
(2360, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '浙江', 6.18, '600596', -0.05, 350393, '农药化肥', 300626, '新安股份', 67918.5, 1.12, 0, 'xinangufen', 'xagf', '7.43', 74429.3, 1.1, NULL, 797105, 67918.5, NULL),
(2361, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 3.2, '600597', 0.163, 415727, '乳制品', 858623, '光明乳业', 122430, 4.87, 47.74, 'guangmingruye', 'gmry', '12.90', 145649, 1.18, NULL, 1531530, 123064, NULL),
(2362, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '黑龙江', 3.15, '600598', 0.342, 402138, '种植业', 413731, '北大荒', 177768, 3.55, 16.36, 'beidahuang', 'bdh', '10.45', 242262, 1.36, NULL, 880048, 177768, NULL),
(2363, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '湖南', 4.15, '600599', 0.037, 4112.99, '日用化工', 46164.6, '熊猫金控', 12600, 6.07, 342.02, 'xiongmaojinkong', 'xmjk', '28.09', 50607.8, 3.05, NULL, 88303, 16600, NULL),
(2364, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '山东', 11.82, '600600', 0.887, 947802, '啤酒', 1363710, '青岛啤酒', 69591.4, 2.88, 19.2, 'qingdaopijiu', 'qdpj', '29.89', 407375, 3.02, NULL, 3055300, 135098, NULL),
(2365, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 1.63, '600601', 0.001, 307574, '电脑设备', 413434, '方正科技', 219489, 3.25, 2067.05, 'fangzhengkeji', 'fzkj', '4.43', 14491.6, 0.07, NULL, 892093, 219489, NULL),
(2366, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 2.25, '600602', 0.031, 16537.1, '元器件', 214626, '仪电电子', 87957.2, 3, 109.67, 'yidiandianzi', 'yddz', '10.45', 108229, 0.92, NULL, 313454, 117294, NULL),
(2367, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '福建', 0.17, '600603', -0.051, 17958.7, '综合类', 8432.37, '大洲兴业', 19464.2, 82.23, 0, 'dazhouxingye', 'dzxy', '11.68', 54597.3, 2.81, NULL, 39887.8, 19464.2, NULL),
(2368, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 3.2, '600604', -0.03, 15313.9, '园区开发', 485558, '市北高新', 33352.4, 2.96, 0, 'shibeigaoxin', 'sbgx', '23.91', 112450, 1.48, NULL, 678428, 76029.7, NULL),
(2369, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 3.33, '600605', 0.051, 32059.5, '商贸代理', 53228.8, '汇通能源', 14734.5, 3.69, 120.97, 'huitongnengyuan', 'htny', '24.01', 11662.5, 0.79, NULL, 119663, 14734.5, NULL),
(2370, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 3.97, '600606', 0.323, 914642, '房产服务', 48155200, '绿地控股', 51832, 3.24, 19.92, 'lvdikonggu', 'ldkg', '8.75', 927297, 0.76, NULL, 53676600, 1216820, NULL),
(2371, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', -0.11, '600608', -0.036, 3601.9, '通信设备', 14810.8, '*ST沪科', 31837.1, -63.29, 0, '*SThuke', '*SThk', '16.32', 43903.6, 1.34, NULL, 19189.3, 32886.1, NULL),
(2372, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '辽宁', 0.25, '600609', 0.011, 75040.8, '汽车整车', 785038, '金杯汽车', 109267, 29.32, 330.92, 'jinbeiqiche', 'jbqc', '4.77', 110021, 1.01, NULL, 983477, 109267, NULL),
(2373, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 0.94, '600610', 0.006, 294.67, '纺织机械', 109074, '中毅达', 11892.2, 7.87, 659.93, 'zhongyida', 'zyd', '10.60', 22257.5, 0.21, NULL, 122391, 107127, NULL),
(2374, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 4.71, '600611', 0.157, 194167, '公共交通', 537174, '大众交通', 104221, 2.02, 30.2, 'dazhongjiaotong', 'dzjt', '11.10', 63474.3, 0.4, NULL, 1291590, 157608, NULL),
(2375, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 8.56, '600612', 1.024, 42562.7, '服饰', 1052370, '老凤祥', 31711, 5.21, 21.79, 'laofengxiang', 'lfx', '39.24', 51037.6, 0.98, NULL, 1182370, 52311.8, NULL),
(2376, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 4.13, '600613', 0.177, 30646.4, '中成药', 159460, '神奇制药', 17723, 4.63, 54.28, 'shenqizhiyao', 'sqzy', '14.58', 105835, 1.98, NULL, 264061, 53407.2, NULL),
(2377, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 3.98, '600614', 0.091, 108424, '综合类', 383413, '鼎立股份', 44675.9, 5.11, 111.95, 'dingligufen', 'dlgf', '8.15', 203673, 2.66, NULL, 656090, 76607.8, NULL),
(2378, '2016-06-05 13:22:32', '2016-06-05 13:22:32', '上海', 2.65, '600615', 0.034, 5764.39, '区域地产', 57245.2, '丰华股份', 18762.4, 4.93, 190.66, 'fenghuagufen', 'fhgf', '18.57', 46003.7, 2.45, NULL, 63659.6, 18802.1, NULL),
(2379, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.72, '600616', 0.072, 41177.4, '红黄药酒', 155564, '金枫酒业', 48803.8, 2.24, 57.86, 'jinfengjiuye', 'jfjy', '9.92', 52993.8, 1.03, NULL, 234523, 51461.9, NULL),
(2380, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '山西', 2.33, '600617', 0.261, 387514, '供气供热', 299237, '国新能源', 22548.2, 6.67, 29.81, 'guoxinnengyuan', 'gxny', '11.71', 4699.74, 0.05, NULL, 1556750, 100816, NULL),
(2381, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 1.84, '600618', -0.042, 256603, '化工原料', 197659, '氯碱化工', 74984, 4.91, 0, 'lvjianhuagong', 'ljhg', '13.76', 168339, 1.46, NULL, 593832, 115640, NULL),
(2382, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.58, '600619', 0.08, 287089, '机械基件', 503545, '海立股份', 31857.4, 2.13, 60.88, 'hailigufen', 'hlgf', '12.90', 82421.7, 1.01, NULL, 874400, 81909.5, NULL),
(2383, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 13, '600620', 0.154, 1992.74, '综合类', 50770.4, '天宸股份', 45778.5, 1.48, 62.72, 'tianchengufen', 'tcgf', '15.26', 574.03, 0.01, NULL, 767882, 45778.5, NULL),
(2384, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.68, '600621', 0.299, 13373.2, '全国地产', 218413, '华鑫股份', 52408.2, 3.45, 21.24, 'huaxingufen', 'hxgf', '9.80', 21753.2, 0.42, NULL, 334936, 52408.2, NULL),
(2385, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 5.96, '600622', 0.357, 723.12, '综合类', 797919, '嘉宝集团', 51430.4, 1.68, 13.97, 'jiabaojituan', 'jbjt', '12.26', 61123.8, 1.19, NULL, 890846, 51430.4, NULL),
(2386, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.35, '600623', -0.103, 528120, '汽车配件', 610070, '双钱股份', 64636.8, 3.76, 0, 'shuangqiangufen', 'sqgf', '21.25', 60699, 0.68, NULL, 1344800, 88946.8, NULL),
(2387, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 1.96, '600624', 0.035, 14357.7, '综合类', 74306, '复旦复华', 44870.2, 4.63, 130.27, 'fudanfuhua', 'fdfh', '12.47', 45212.2, 0.86, NULL, 167202, 52670.2, NULL),
(2388, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.18, '600626', 0.074, 79361, '纺织', 241727, '申达股份', 71024.3, 3.05, 65.44, 'shendagufen', 'sdgf', '10.67', 14215.2, 0.2, NULL, 405126, 71024.3, NULL),
(2389, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 4.89, '600628', 0.066, 272879, '百货', 90324.9, '新世界', 53179.9, 3.44, 127.17, 'xinshijie', 'xsj', '12.20', 46352.1, 0.87, NULL, 476348, 53179.9, NULL),
(2390, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 2.25, '600629', 0.004, 57119.6, '玻璃', 43172.8, '棱光实业', 34800, 8.25, 2259.39, 'lengguangshiye', 'lgsy', '19.08', 60131.9, 1.73, NULL, 154319, 34800, NULL),
(2391, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.89, '600630', 0.092, 31826.7, '纺织', 189772, '龙头股份', 42486.2, 4.3, 91.11, 'longtougufen', 'ltgf', '15.44', 93279.7, 2.2, NULL, 241030, 42486.2, NULL),
(2392, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '浙江', 3.23, '600633', 0.238, 53448.8, '出版业', 208736, '浙报传媒', 113407, 5.58, 37.84, 'zhebaochuanmei', 'zbcm', '17.66', 148057, 1.25, NULL, 695447, 118829, NULL),
(2393, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 4.19, '600634', 0.067, 85924.8, '其他建材', 347440, '中技控股', 39797.9, 8.93, 279.14, 'zhongjikonggu', 'zjkg', '17.74', 112269, 1.95, NULL, 693338, 57573.2, NULL),
(2394, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 2.2, '600635', 0.149, 358263, '供气供热', 308959, '大众公用', 246730, 2.73, 20.24, 'dazhonggongyong', 'dzgy', '6.01', 20881.5, 0.08, NULL, 1411620, 246730, NULL),
(2395, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 3.55, '600636', -0.078, 138113, '化工原料', 297383, '三爱富', 38195.1, 3.1, 0, 'sanaifu', 'saf', '13.86', 8652.17, 0.19, NULL, 520841, 44694.2, NULL),
(2396, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 10.21, '600637', 0.62, 283242, '影视音像', 1915900, '东方明珠', 158038, 2.93, 26.89, 'dongfangmingzhu', 'dfmz', '23.30', 1453660, 5.53, NULL, 3860710, 262654, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(2397, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 6.32, '600638', 0.147, 1068.8, '区域地产', 771167, '新黄浦', 56116.4, 1.6, 34.46, 'xinhuangpu', 'xhp', '17.69', 102758, 1.83, NULL, 1011090, 56116.4, NULL),
(2398, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 8.83, '600639', 0.25, 60521.1, '园区开发', 278131, '浦东金桥', 65664.9, 2.18, 46.27, 'pudongjinqiao', 'pdjq', '18.56', 80870.5, 0.72, NULL, 1575790, 112241, NULL),
(2399, '2016-06-05 13:22:33', '2016-06-05 13:22:33', '上海', 4.75, '600640', 0.08, 75466.6, '酒店餐饮', 254273, '号百控股', 53536.4, 3.75, 112.09, 'haobaikonggu', 'hbkg', '19.98', 135762, 2.54, NULL, 368534, 53536.4, NULL),
(2400, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 4.53, '600641', 0.186, 292.03, '区域地产', 646170, '万业企业', 80615.9, 2.45, 29.74, 'wanyeqiye', 'wyqy', '12.36', 19126.5, 0.24, NULL, 670072, 80615.9, NULL),
(2401, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 5.2, '600642', 0.341, 1735820, '火力发电', 920305, '申能股份', 455204, 1.54, 11.78, 'shennenggufen', 'sngf', '5.83', 322404, 0.71, NULL, 4570750, 455204, NULL),
(2402, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 3.83, '600643', 0.209, 3097.09, '多元金融', 347205, '爱建股份', 143403, 4.36, 39.95, 'aijiangufen', 'ajgf', '9.31', 255417, 1.78, NULL, 990007, 143714, NULL),
(2403, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '四川', 1.73, '600644', 0.069, 114646, '水力发电', 59909.7, '*ST乐电', 32648, 3.81, 47.83, '*STledian', '*STld', '8.25', 137333, 2.55, NULL, 259432, 53840.1, NULL),
(2404, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '天津', 4.13, '600645', 0.747, 24289.2, '生物制药', 151389, '中源协和', 32486.2, 19.2, 53.09, 'zhongyuanxiehe', 'zyxh', '37.90', 105684, 2.74, NULL, 294425, 38625.5, NULL),
(2405, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 1.95, '600647', 0.474, 2093.26, '综合类', 42374.9, '同达创业', 13914.4, 7.72, 15.84, 'tongdachuangye', 'tdcy', '23.92', 68.08, 0, NULL, 56218.4, 13914.4, NULL),
(2406, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 7.89, '600648', 0.275, 153653, '园区开发', 1595770, '外高桥', 93479.1, 3.14, 45.09, 'waigaoqiao', 'wgq', '18.84', 390237, 3.44, NULL, 2787960, 113535, NULL),
(2407, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 6.64, '600649', 0.989, 28031.3, '区域地产', 2513260, '城投控股', 298752, 1.88, 6.31, 'chengtoukonggu', 'ctkg', '14.72', 411148, 1.38, NULL, 4425930, 298752, NULL),
(2408, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 7, '600650', 0.209, 99083, '公共交通', 128197, '锦江投资', 39056, 3.03, 50.91, 'jinjiangtouzi', 'jjtz', '32.79', 39486.9, 0.72, NULL, 564319, 55161, NULL),
(2409, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 3.05, '600651', 0.072, 83714.1, '电器仪表', 317042, '飞乐音响', 73906.5, 3.25, 68.82, 'feileyinxiang', 'flyx', '11.84', 144156, 1.46, NULL, 621144, 98522, NULL),
(2410, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 2.46, '600652', 0.028, 65078.8, '煤炭开采', 89748.6, '游久游戏', 55700.3, 14.83, 658.13, 'youjiuyouxi', 'yjyx', '14.72', 89066.1, 1.07, NULL, 434022, 83270.4, NULL),
(2411, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 1.07, '600653', 0.031, 139147, '汽车服务', 362657, '申华控股', 174638, 4.58, 78.33, 'shenhuakonggu', 'shkg', '3.93', 3940.86, 0.02, NULL, 767129, 174638, NULL),
(2412, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 2.26, '600654', 0.085, 11971.3, '软件服务', 333062, '中安消', 75504.3, 13.68, 181.61, 'zhonganxiao', 'zax', '18.54', 111535, 0.87, NULL, 478427, 128302, NULL),
(2413, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 5.37, '600655', 0.285, 91006.4, '百货', 688810, '豫园商城', 143732, 2.77, 26.13, 'yuyuanshangcheng', 'yysc', '11.42', 87243.4, 0.61, NULL, 1467950, 143732, NULL),
(2414, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '北京', 5.26, '600657', 0.155, 7873.56, '全国地产', 4003100, '信达地产', 152426, 1.18, 20.02, 'xindadichan', 'xddc', '6.10', 162829, 1.07, NULL, 4252930, 152426, NULL),
(2415, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '北京', 5.04, '600658', 0.066, 3645.06, '园区开发', 337883, '电子城', 58009.7, 1.8, 68.98, 'dianzicheng', 'dzc', '10.12', 68017.9, 1.17, NULL, 430370, 58009.7, NULL),
(2416, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '福建', 5.99, '600660', 0.54, 698100, '汽车配件', 1227710, '福耀玻璃', 200299, 2.1, 12.96, 'fuyaoboli', 'fybl', '14.75', 622002, 2.48, NULL, 2323290, 250862, NULL),
(2417, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 3.21, '600661', 0.119, 30990.6, '文教休闲', 77370.3, '新南洋', 17367.7, 5.78, 78.13, 'xinnanyang', 'xny', '29.79', 25417.2, 0.98, NULL, 169549, 25907.7, NULL),
(2418, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 3.03, '600662', 0.085, 203472, '公共交通', 264435, '强生控股', 105336, 3.51, 62.34, 'qiangshengkonggu', 'qskg', '11.79', 76844, 0.73, NULL, 641852, 105336, NULL),
(2419, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '上海', 6.44, '600663', 0.361, 46207.2, '园区开发', 1646710, '陆家嘴', 135808, 6.59, 58.83, 'lujiazui', 'ljz', '22.13', 3889.81, 0.02, NULL, 4876080, 186768, NULL),
(2420, '2016-06-05 13:22:34', '2016-06-05 13:22:34', '黑龙江', 4.49, '600664', 0.196, 443784, '化学制药', 1014920, '哈药股份', 191748, 2.42, 27.8, 'hayaogufen', 'hygf', '8.58', 98945.5, 0.52, NULL, 1571630, 191748, NULL),
(2421, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 2.87, '600665', -0.016, 11668.3, '全国地产', 1417460, '天地源', 86412.2, 1.64, 0, 'tiandiyuan', 'tdy', '5.31', 20109.3, 0.23, NULL, 1484070, 86412.2, NULL),
(2422, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '重庆', 2.51, '600666', 0.25, 102356, '化学制药', 221302, '奥瑞德', 29014.6, 10.38, 89.78, 'aoruide', 'ard', '26.95', 78005.3, 1.02, NULL, 359497, 76707.9, NULL),
(2423, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '江苏', 1.31, '600667', -0.007, 258437, '半导体', 168420, '太极实业', 119127, 3.75, 0, 'taijishiye', 'tjsy', '8.18', 30518.9, 0.26, NULL, 493049, 119127, NULL),
(2424, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '浙江', 6, '600668', 0.267, 122638, '水泥', 87308.6, '尖峰集团', 34385.2, 1.7, 19.12, 'jianfengjituan', 'jfjt', '16.74', 44884.7, 1.3, NULL, 359547, 34408.4, NULL),
(2425, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '浙江', 0.6, '600671', -0.046, 8192.86, '中成药', 10951.7, '天目药业', 12172, 41.23, 0, 'tianmuyaoye', 'tmyy', '30.81', 5093.78, 0.42, NULL, 26897.8, 12177.9, NULL),
(2426, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '广东', 1.44, '600673', 0.04, 339677, '铝', 422188, '东阳光科', 245625, 3.46, 124.79, 'dongyangguangke', 'dygk', '6.65', 14746.5, 0.06, NULL, 1110950, 246887, NULL),
(2427, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '四川', 3.61, '600674', 0.349, 383142, '火力发电', 83488.2, '川投能源', 440214, 2.91, 15.02, 'chuantounengyuan', 'ctny', '8.70', 405406, 0.92, NULL, 2215840, 440214, NULL),
(2428, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 2.45, '600675', -0.396, 25064.5, '区域地产', 3630600, '中华企业', 186706, 2.51, 0, 'zhonghuaqiye', 'zhqy', '5.42', 3959.48, 0.02, NULL, 4185680, 186706, NULL),
(2429, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 4.1, '600676', 0.197, 226759, '汽车配件', 357705, '交运股份', 86237.4, 2.46, 25.61, 'jiaoyungufen', 'jygf', '9.30', 118260, 1.37, NULL, 720388, 86237.4, NULL),
(2430, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '浙江', 3.61, '600677', -0.085, 98433.9, '通信设备', 469181, '航天通信', 39837.7, 4.4, 0, 'hangtiantongxin', 'httx', '18.19', 67265.5, 1.62, NULL, 695385, 41642.8, NULL),
(2431, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '四川', 0.07, '600678', 0.006, 17797.1, '水泥', 2898.66, '四川金顶', 34899, 127.36, 818.76, 'sichuanjinding', 'scjd', '13.31', 30535.4, 0.87, NULL, 35448.2, 34899, NULL),
(2432, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 2.01, '600679', -0.015, 7283.68, '文教休闲', 40884.4, '金山开发', 18202, 5.23, 0, 'jinshankaifa', 'jskf', '35.37', 29421.8, 0.83, NULL, 119571, 35362, NULL),
(2433, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 3.61, '600680', 0.006, 13732.1, '通信设备', 162076, '上海普天', 25742.5, 4.12, 1169.23, 'shanghaiputian', 'shpt', '33.76', 87889, 2.3, NULL, 325645, 38222.5, NULL),
(2434, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '湖北', 0.08, '600681', -0.005, 17.46, '装修装饰', 7627.47, '万鸿集团', 24655.4, 118.52, 0, 'wanhongjituan', 'whjt', '15.98', 45030.1, 1.79, NULL, 20210.5, 25147.8, NULL),
(2435, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '江苏', 2.31, '600682', 0.17, 294261, '百货', 472546, '南京新百', 71613, 16.27, 110.44, 'nanjingxinbai', 'njxb', '36.08', 4789.16, 0.06, NULL, 1402760, 81839.8, NULL),
(2436, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '浙江', 2.36, '600683', -0.161, 5675.22, '区域地产', 2852280, '京投银泰', 74077.8, 2.75, 0, 'jingtouyintai', 'jtyt', '9.12', 32778.1, 0.44, NULL, 2969500, 74077.8, NULL),
(2437, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '广东', 3, '600684', 0.165, 19921.8, '全国地产', 675856, '珠江实业', 71121.7, 2.4, 21.82, 'zhujiangshiye', 'zjsy', '8.04', 8592.11, 0.12, NULL, 712840, 71121.7, NULL),
(2438, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '广东', 6.87, '600685', -0.39, 1060390, '船舶', 2975930, '中船防务', 43846.3, 4.92, 0, 'zhongchuanfangwu', 'zcfw', '30.80', 686758, 4.86, NULL, 4512500, 141351, NULL),
(2439, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '福建', 5.82, '600686', 0.245, 182097, '汽车整车', 1752120, '金龙汽车', 44259.7, 2.56, 30.49, 'jinlongqiche', 'jlqc', '14.62', 112899, 1.86, NULL, 2026850, 60673.9, NULL),
(2440, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '甘肃', 3.56, '600687', 0.283, 41281.7, '综合类', 444758, '刚泰控股', 24625.2, 7.85, 49.35, 'gangtaikonggu', 'gtkg', '16.42', 67246.5, 1.37, NULL, 560282, 49024.5, NULL),
(2441, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 1.7, '600688', 0.16, 1481430, '石油加工', 984340, '上海石化', 292500, 4.06, 21.49, 'shanghaishihua', 'shsh', '6.55', 50582.3, 0.05, NULL, 3034130, 1080000, NULL),
(2442, '2016-06-05 13:22:35', '2016-06-05 13:22:35', '上海', 1.77, '600689', -0.055, 8376.12, '纺织', 38313.9, '上海三毛', 15220.4, 8.57, 0, 'shanghaisanmao', 'shsm', '20.74', 21178.3, 1.05, NULL, 76041.9, 20099.1, NULL),
(2443, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '山东', 4.07, '600690', 0.429, 748454, '家用电器', 5648750, '青岛海尔', 550388, 2.54, 12.05, 'qingdaohaier', 'qdhe', '10.04', 366632, 0.6, NULL, 7541720, 612315, NULL),
(2444, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '四川', 2.62, '600691', 0.023, 1242600, '农药化肥', 1461030, '*ST阳化', 119144, 1.13, 65.61, '*STyanghua', '*STyh', '4.17', 324044, 1.84, NULL, 4047460, 175679, NULL),
(2445, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '上海', 1.57, '600692', 0.019, 9432.05, '水运', 168020, '亚通股份', 25501.1, 6.16, 252.49, 'yatonggufen', 'ytgf', '16.98', 6123.2, 0.17, NULL, 228511, 35176.4, NULL),
(2446, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '福建', 4.03, '600693', 0.12, 30796.6, '百货', 409845, '东百集团', 34216.6, 1.77, 34.94, 'dongbaijituan', 'dbjt', '10.20', 57653.6, 1.28, NULL, 480900, 44911.5, NULL),
(2447, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '辽宁', 21.59, '600694', 2.094, 443215, '百货', 823444, '大商股份', 29371.9, 1.56, 8.02, 'dashanggufen', 'dsgf', '41.27', 143825, 4.9, NULL, 1550720, 29371.9, NULL),
(2448, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '上海', 1.34, '600695', 0.01, 9719.07, '食品', 26221.9, '绿庭投资', 36646.7, 4.31, 279.99, 'lvtingtouzi', 'lttz', '8.59', 39090.1, 0.55, NULL, 130781, 71320, NULL),
(2449, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '上海', 1.68, '600696', -0.069, 1242.17, '区域地产', 131741, '匹凸匹', 34056.6, 6.72, 0, 'pitupi', 'ptp', '11.17', 2989.9, 0.09, NULL, 135435, 34056.6, NULL),
(2450, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '吉林', 10.83, '600697', 0.814, 683811, '百货', 441224, '欧亚集团', 15515.6, 2, 13.28, 'ouyajituan', 'oyjt', '33.43', 29804, 1.87, NULL, 1415370, 15908.8, NULL),
(2451, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '湖南', 0.72, '600698', 0.005, 17638.4, '汽车配件', 97058.8, '湖南天雁', 43019.5, 8.28, 591.97, 'hunantianyan', 'hnty', '8.12', 37418.3, 0.39, NULL, 120417, 97181.7, NULL),
(2452, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '浙江', 3.85, '600699', 0.296, 239414, '汽车配件', 351567, '均胜电子', 44914.5, 5.91, 38.35, 'junshengdianzi', 'jsdz', '33.69', 118625, 1.86, NULL, 767328, 63614.5, NULL),
(2453, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '黑龙江', 1.76, '600701', -0.058, 21855.3, '综合类', 25107.3, '工大高新', 49878.2, 6.59, 0, 'gongdagaoxin', 'gdgx', '14.37', 10693.3, 0.21, NULL, 295079, 49878.2, NULL),
(2454, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '四川', 6.68, '600702', 0.02, 57236.1, '白酒', 261677, '沱牌舍得', 33730, 1.82, 303.76, 'tuopaishede', 'tpsd', '23.18', 79931, 2.37, NULL, 379101, 33730, NULL),
(2455, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '湖北', 4.85, '600703', 0.378, 458493, '半导体', 825998, '三安光电', 237038, 4.41, 28.34, 'sananguangdian', 'sagd', '13.92', 541276, 2.26, NULL, 1688360, 239308, NULL),
(2456, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '浙江', 6.24, '600704', 0.351, 144248, '商贸代理', 2948220, '物产中大', 95489.9, 2.32, 20.61, 'wuchanzhongda', 'wczd', '10.66', 223903, 2.25, NULL, 3658970, 99599.5, NULL),
(2457, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '黑龙江', 5, '600705', 0.386, 303152, '多元金融', 7277400, '中航资本', 373270, 2.91, 18.8, 'zhonghangziben', 'zhzb', '11.76', 445387, 1.19, NULL, 12366300, 373270, NULL),
(2458, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '陕西', 4.52, '600706', 0.151, 90508.9, '旅游服务', 66452.8, '曲江文旅', 17790.9, 2.74, 40.94, 'qujiangwenlv', 'qjwl', '20.17', 44848.1, 2.5, NULL, 179515, 17951, NULL),
(2459, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '陕西', 1.7, '600707', -0.213, 280124, '元器件', 42408.8, '彩虹股份', 73471.8, 8.12, 0, 'caihonggufen', 'chgf', '9.18', 424144, 5.76, NULL, 603691, 73675.8, NULL),
(2460, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '上海', 3.14, '600708', 0.116, 132721, '公共交通', 215887, '海博股份', 50838.3, 2.93, 39.77, 'haibogufen', 'hbgf', '9.09', 7162.62, 0.14, NULL, 639010, 51037, NULL),
(2461, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '江苏', 2.32, '600710', -0.318, 53552.1, '工程机械', 143747, '*ST常林', 64028.4, 2.34, 0, '*STchanglin', '*STcl', '9.36', 55621.6, 0.87, NULL, 251057, 64028.4, NULL),
(2462, '2016-06-05 13:22:36', '2016-06-05 13:22:36', '福建', 2.43, '600711', 0.024, 64389.7, '小金属', 228565, '盛屯矿业', 118921, 2.6, 131.74, 'shengtunkuangye', 'stky', '7.02', 189780, 1.27, NULL, 653898, 149705, NULL),
(2463, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '广西', 1.98, '600712', 0.002, 114276, '百货', 45854, '南宁百货', 53772.9, 2.8, 1118.24, 'nanningbaihuo', 'nnbh', '10.42', 36985.8, 0.68, NULL, 197033, 54465.5, NULL),
(2464, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '江苏', 2.48, '600713', 0.09, 45015, '医药商业', 1126210, '南京医药', 69358.1, 3.12, 43.12, 'nanjingyiyao', 'njyy', '8.06', 108395, 1.21, NULL, 1251440, 89742.6, NULL),
(2465, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '青海', 1.99, '600714', -0.056, 49552, '煤炭开采', 32561.1, '金瑞矿业', 27340.4, 4.4, 0, 'jinruikuangye', 'jrky', '15.61', 21513.2, 0.75, NULL, 127515, 28817.6, NULL),
(2466, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '辽宁', -0.06, '600715', -0.014, 7133.5, '汽车配件', 13172.8, '*ST松辽', 22425.6, -302.52, 0, '*STsongliao', '*STsl', '22.32', 44674.3, 0.54, NULL, 26207.5, 82456.5, NULL),
(2467, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '江苏', 2.75, '600716', -0.12, 1446.93, '区域地产', 718065, '凤凰股份', 74060.1, 2.17, 0, 'fenghuanggufen', 'fhgf', '8.13', 19508, 0.26, NULL, 803438, 74060.1, NULL),
(2468, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '天津', 8.32, '600717', 0.397, 1379260, '港口', 928432, '天津港', 167477, 1.21, 12.66, 'tianjingang', 'tjg', '10.26', 348087, 2.08, NULL, 3301110, 167477, NULL),
(2469, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '辽宁', 4.48, '600718', 0.073, 181496, '软件服务', 539884, '东软集团', 122759, 3.18, 96.92, 'dongruanjituan', 'drjt', '19.90', 34381.6, 0.28, NULL, 964990, 122759, NULL),
(2470, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '辽宁', 3.7, '600719', 0.144, 70887.9, '供气供热', 27887.2, '大连热电', 20230, 2.91, 37.36, 'dalianredian', 'dlrd', '8.36', 30447.3, 1.51, NULL, 112623, 20230, NULL),
(2471, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '甘肃', 6.28, '600720', -0.045, 648073, '水泥', 252650, '祁连山', 77616.3, 1.13, 0, 'qilianshan', 'qls', '8.23', 133112, 1.71, NULL, 1104870, 77629, NULL),
(2472, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '新疆', 2.5, '600721', -0.477, 218822, '焦炭加工', 56054.3, '百花村', 24852.4, 6.68, 0, 'baihuacun', 'bhc', '18.50', 64117, 2.58, NULL, 397635, 24852.4, NULL),
(2473, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '河北', 0.7, '600722', -0.198, 99694.4, '化工原料', 54590, '*ST金化', 42142, 5.84, 0, '*STjinhua', '*STjh', '12.62', 164531, 2.42, NULL, 300559, 68032, NULL),
(2474, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '北京', 4.73, '600723', 0.256, 86472.1, '百货', 445512, '首商股份', 65807, 1.53, 14.2, 'shoushanggufen', 'ssgf', '9.74', 82504.5, 1.25, NULL, 626439, 65840.8, NULL),
(2475, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '浙江', 2.53, '600724', 0.032, 61008.4, '区域地产', 1639270, '宁波富达', 144494, 2.91, 117.09, 'ningbofuda', 'nbfd', '6.07', 26015.1, 0.18, NULL, 1896300, 144524, NULL),
(2476, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '云南', 0.3, '600725', -0.665, 542118, '焦炭加工', 453032, '云维股份', 61623.5, 15.93, 0, 'yunweigufen', 'ywgf', '2.85', 117774, 1.91, NULL, 1220570, 61623.5, NULL),
(2477, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '黑龙江', 1.75, '600726', 0.122, 1576480, '火力发电', 493376, '华电能源', 153468, 4.21, 30.09, 'huadiannengyuan', 'hdny', '5.03', 150069, 0.76, NULL, 2349260, 196668, NULL),
(2478, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '山东', 2.99, '600727', 0.056, 75513.5, '农药化肥', 49590.9, '鲁北化工', 35092.7, 2.11, 56.69, 'lubeihuagong', 'lbhg', '10.91', 87416, 2.49, NULL, 134267, 35098.7, NULL),
(2479, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '广东', 2.43, '600728', 0.029, 7356.37, '软件服务', 210427, '佳都科技', 39691.7, 6.74, 279.07, 'jiadoukeji', 'jdkj', '8.66', 97336.1, 1.95, NULL, 256062, 49976.7, NULL),
(2480, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '重庆', 11.89, '600729', 1.031, 235014, '百货', 731638, '重庆百货', 37231.1, 2.73, 15.7, 'zhongqingbaihuo', 'zqbh', '23.94', 92557.3, 2.28, NULL, 1130400, 40652.9, NULL),
(2481, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '北京', 4.9, '600730', 0.189, 5154.71, '综合类', 183318, '中国高科', 29332.8, 4.13, 53.45, 'zhongguogaoke', 'zggk', '12.66', 5055.5, 0.17, NULL, 262262, 29332.8, NULL),
(2482, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '湖南', 2.29, '600731', 0.034, 68580.1, '农药化肥', 69505.3, '湖南海利', 25565.3, 2.79, 93.46, 'hunanhaili', 'hnhl', '10.81', 48369.7, 1.48, NULL, 167266, 32731.4, NULL),
(2483, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '上海', 1.01, '600732', -0.054, 462.53, '区域地产', 21634.8, '*ST新梅', 44638.3, 7.65, 0, '*STxinmei', '*STxm', '7.67', 685.53, 0.02, NULL, 88485.8, 44638.3, NULL),
(2484, '2016-06-05 13:22:37', '2016-06-05 13:22:37', '四川', 1.53, '600733', -0.034, 1630.6, '区域地产', 37190.4, 'S前锋', 7560, 21.33, 0, 'Sqianfeng', 'Sqf', '50.18', 7322.18, 0.37, NULL, 47128.1, 19758.6, NULL),
(2485, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '福建', 0.27, '600734', -0.061, 6288.6, '电脑设备', 144243, '实达集团', 35110.8, 36.09, 0, 'shidajituan', 'sdjt', '17.49', 18791.2, 0.53, NULL, 159238, 35155.8, NULL),
(2486, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '山东', 1.77, '600735', 0.059, 7884.41, '纺织', 65036.5, '新华锦', 31349.6, 6.34, 94.46, 'xinhuajin', 'xhj', '20.74', 14747.7, 0.39, NULL, 91422.2, 37599.2, NULL),
(2487, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '江苏', 4, '600736', 0.03, 301527, '园区开发', 1812020, '苏州高新', 105788, 2.04, 134.06, 'suzhougaoxin', 'szgx', '8.90', 176791, 1.48, NULL, 2359880, 119429, NULL),
(2488, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '新疆', 2.72, '600737', -0.012, 364164, '食品', 922784, '中粮屯河', 132266, 5.56, 0, 'zhongliangtunhe', 'zlth', '12.86', 412552, 2.01, NULL, 1463050, 205188, NULL),
(2489, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '甘肃', 3.12, '600738', 0.149, 32198.7, '百货', 118390, '兰州民百', 26210.7, 2.06, 21.64, 'lanzhouminbai', 'lzmb', '9.99', 39990.6, 1.08, NULL, 202432, 36886.8, NULL),
(2490, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '辽宁', 11.86, '600739', 0.83, 515238, '商贸代理', 616263, '辽宁成大', 136471, 1.34, 9.82, 'liaoningchengda', 'lncd', '18.40', 611987, 4, NULL, 2541900, 152971, NULL),
(2491, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '山西', 3.38, '600740', -0.31, 427023, '焦炭加工', 389311, '山西焦化', 65683.3, 1.53, 0, 'shanxijiaohua', 'sxjh', '8.10', 225612, 2.95, NULL, 990531, 76570, NULL),
(2492, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '上海', 9.32, '600741', 1, 801282, '汽车配件', 4030710, '华域汽车', 258320, 1.58, 7.35, 'huayuqiche', 'hyqc', '16.23', 487931, 1.89, NULL, 6712000, 258320, NULL),
(2493, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '吉林', 17.65, '600742', 0.919, 145170, '汽车配件', 262145, '一汽富维', 21152.3, 1.13, 10.89, 'yiqifuwei', 'yqfw', '16.78', 54969.6, 2.6, NULL, 658406, 21152.3, NULL),
(2494, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '北京', 2.08, '600743', 0.073, 8911.32, '区域地产', 1975750, '华远地产', 181766, 2.7, 38.47, 'huayuandichan', 'hydc', '4.53', 4000, 0.02, NULL, 2074400, 181766, NULL),
(2495, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '湖南', 1.83, '600744', 0.033, 806282, '火力发电', 442703, '华银电力', 47438.4, 3.61, 101.15, 'huayindianli', 'hydl', '5.34', 175961, 2.47, NULL, 1486050, 71164.8, NULL),
(2496, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '湖北', 5.41, '600745', 0.013, 91280, '区域地产', 370875, '中茵股份', 32737.5, 4.38, 934.77, 'zhongyingufen', 'zygf', '21.73', 183270, 3.79, NULL, 675519, 48332, NULL),
(2497, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '江苏', 1.39, '600746', -0.038, 33079.1, '化工原料', 11176.2, '江苏索普', 30466.1, 5.5, 0, 'jiangsusuopu', 'jssp', '13.13', 6207.23, 0.2, NULL, 55027.8, 30642.1, NULL),
(2498, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '辽宁', 1.43, '600747', -0.025, 9081.8, '元器件', 225707, '大连控股', 106433, 3.19, 0, 'daliankonggu', 'dlkg', '5.20', 99619.9, 0.68, NULL, 254804, 146433, NULL),
(2499, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '上海', 4.55, '600748', 0.151, 2725.26, '全国地产', 1826060, '上实发展', 108337, 2.27, 34.19, 'shangshifazhan', 'ssfz', '8.34', 2273.67, 0.02, NULL, 2077690, 108337, NULL),
(2500, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '西藏', 3.11, '600749', -0.218, 60032, '旅游景点', 11002.5, '西藏旅游', 18913.8, 4.79, 0, 'xizanglvyou', 'xzly', '24.08', 43987.9, 2.33, NULL, 130244, 18913.8, NULL),
(2501, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '江西', 7.09, '600750', 0.464, 69994.1, '中成药', 197194, '江中药业', 30000, 7.05, 53.81, 'jiangzhongyaoye', 'jzyy', '32.75', 54919.1, 1.83, NULL, 320690, 30000, NULL),
(2502, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '天津', 4.14, '600751', 0.033, 13165.1, '水运', 1227230, '天海投资', 38814, 1.56, 98.41, 'tianhaitouzi', 'thtz', '9.02', 1013290, 3.49, NULL, 1240390, 289934, NULL),
(2503, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '河南', 0.78, '600753', -0.01, 0.19, '批发业', 21187.9, '东方银星', 12800, 21.56, 0, 'dongfangyinxing', 'dfyx', '36.10', 14144.5, 1.11, NULL, 22937.1, 12800, NULL),
(2504, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '上海', 10.32, '600754', 0.362, 639829, '酒店餐饮', 928523, '锦江股份', 44724.1, 2.75, 39.2, 'jinjianggufen', 'jjgf', '29.56', 448210, 5.57, NULL, 2674970, 80451.8, NULL),
(2505, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '福建', 4.63, '600755', 0.241, 114285, '商贸代理', 3813750, '厦门国贸', 166447, 1.55, 14.9, 'shamenguomao', 'smgm', '8.48', 201355, 1.21, NULL, 4245690, 166447, NULL),
(2506, '2016-06-05 13:22:38', '2016-06-05 13:22:38', '山东', 3.11, '600756', 0.074, 8672.91, '软件服务', 88672.9, '浪潮软件', 27874.7, 5.12, 107.51, 'langchaoruanjian', 'lcrj', '23.53', 7797.62, 0.28, NULL, 183211, 27874.7, NULL),
(2507, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '湖北', 4.09, '600757', 0.208, 95931, '出版业', 543672, '长江传媒', 121271, 2.02, 19.84, 'zhangjiangchuanmei', 'zjcm', '8.57', 178555, 1.47, NULL, 764181, 121365, NULL),
(2508, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '辽宁', 1.66, '600758', 0.045, 55282.4, '供气供热', 7144.81, '红阳能源', 11505, 5, 92.52, 'hongyangnengyuan', 'hyny', '11.22', 997.87, 0.05, NULL, 70751.4, 20768.2, NULL),
(2509, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '海南', 2.4, '600759', 0.006, 3693.81, '石油开采', 405975, '洲际油气', 158083, 2.95, 570.95, 'zhoujiyouqi', 'zjyq', '10.08', 295760, 1.31, NULL, 1263400, 226351, NULL),
(2510, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '山东', 1.54, '600760', -0.216, 111347, '汽车整车', 143499, '中航黑豹', 34494.5, 8.33, 0, 'zhonghangheibao', 'zhhb', '21.25', 55254.9, 1.6, NULL, 311513, 34494.5, NULL),
(2511, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '安徽', 6.27, '600761', 0.364, 161171, '工程机械', 341030, '安徽合力', 61681.7, 1.65, 14.17, 'anhuiheli', 'ahhl', '12.97', 55772, 0.9, NULL, 556818, 61681.7, NULL),
(2512, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '浙江', 4.35, '600763', 0.42, 17869.2, '医疗保健', 36759, '通策医疗', 16032, 25.37, 130.3, 'tongceyiliao', 'tcyl', '32.16', 19829.9, 1.24, NULL, 85641.6, 16032, NULL),
(2513, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '北京', 1.83, '600764', 0.003, 8565.21, '通信设备', 65052.9, '中电广通', 32972.7, 6.3, 2106.43, 'zhongdianguangtong', 'zdgt', '28.84', 4192.2, 0.13, NULL, 145210, 32972.7, NULL),
(2514, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '贵州', 4.54, '600765', 0.018, 282108, '机械基件', 828807, '中航重机', 77800.3, 3.6, 448.55, 'zhonghangzhongji', 'zhzj', '14.79', 131431, 1.69, NULL, 1354810, 77800.3, NULL),
(2515, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '山东', 0.15, '600766', 0.008, 1106.22, '黄金', 15646, '园城黄金', 22393.2, 72.67, 670.73, 'yuanchenghuangjin', 'ychj', '17.48', 23708.8, 1.06, NULL, 21676.1, 22422.7, NULL),
(2516, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '上海', 1.03, '600767', -0.048, 2114.4, '医疗保健', 44994.3, '运盛医疗', 34091, 13.26, 0, 'yunshengyiliao', 'ysyl', '15.64', 5324.18, 0.16, NULL, 59891.8, 34101, NULL),
(2517, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '浙江', 0.6, '600768', -0.138, 22399.1, '铝', 39923.2, '宁波富邦', 13374.7, 20.07, 0, 'ningbofubang', 'nbfb', '24.42', 404.11, 0.03, NULL, 70311, 13374.7, NULL),
(2518, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '湖北', 0.11, '600769', 0.017, 235.91, '火力发电', 8312.05, '祥龙电业', 37497.7, 63.39, 209.79, 'xianglongdianye', 'xldy', '12.07', 36712.4, 0.98, NULL, 10735.5, 37497.7, NULL),
(2519, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '江苏', 2.6, '600770', 0.018, 149237, '综合类', 198176, '综艺股份', 110460, 3.2, 231.38, 'zongyigufen', 'zygf', '10.41', 213398, 1.64, NULL, 638052, 130000, NULL),
(2520, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '青海', 0.35, '600771', 0.003, 4479.68, '中成药', 43094.5, '广誉远', 24380.8, 60.17, 3769.64, 'guangyuyuan', 'gyy', '33.75', 43616.8, 1.57, NULL, 51515.4, 27780.8, NULL),
(2521, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '西藏', 3.37, '600773', 0.045, 731.34, '区域地产', 971560, '西藏城投', 53963.9, 3.52, 132.25, 'xizangchengtou', 'xzct', '12.56', 115124, 1.58, NULL, 1013440, 72921.4, NULL),
(2522, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '湖北', 3.25, '600774', 0.046, 117250, '百货', 14009.6, '汉商集团', 17442.9, 3.99, 142.09, 'hanshangjituan', 'hsjt', '22.55', 12893.7, 0.74, NULL, 162010, 17457.5, NULL),
(2523, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '江苏', 3.51, '600775', 0.096, 92375, '通信设备', 341990, '南京熊猫', 63262.3, 3.15, 57.72, 'nanjingxiongmao', 'njxm', '14.17', 146434, 1.6, NULL, 510014, 91383.9, NULL),
(2524, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '浙江', 2.28, '600776', 0.061, 21586.5, '通信设备', 293664, '东方通信', 95600, 3.52, 65.92, 'dongfangtongxin', 'dftx', '8.77', 89397.9, 0.71, NULL, 360959, 125600, NULL),
(2525, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '山东', 1.82, '600777', -0.063, 20489.8, '综合类', 389220, '新潮实业', 62530.5, 6.48, 0, 'xinchaoshiye', 'xcsy', '4.11', 48086.1, 0.77, NULL, 432841, 62542.3, NULL),
(2526, '2016-06-05 13:22:39', '2016-06-05 13:22:39', '新疆', 5.36, '600778', 0.281, 213506, '百货', 280001, '友好集团', 31108.7, 2.99, 28.46, 'youhaojituan', 'yhjt', '11.56', 40360.4, 1.3, NULL, 707211, 31149.1, NULL),
(2527, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '四川', 2.57, '600779', 0.103, 47498.2, '白酒', 97162.1, '*ST水井', 29532.3, 2.88, 36.02, '*STshuijing', '*STsj', '20.17', 39950.6, 0.82, NULL, 159315, 48854.6, NULL),
(2528, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '山西', 3.82, '600780', 0.184, 546556, '火力发电', 212910, '通宝能源', 114650, 1.85, 19.2, 'tongbaonengyuan', 'tbny', '5.67', 107220, 0.94, NULL, 883265, 114650, NULL),
(2529, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '河南', 1.99, '600781', 0.077, 48053.7, '中成药', 34880.7, '辅仁药业', 17759.3, 8.22, 106.22, 'furenyaoye', 'fryy', '19.05', 12936.3, 0.73, NULL, 113718, 17759.3, NULL),
(2530, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '江西', 5.67, '600782', -0.099, 1153140, '钢加工', 1632310, '新钢股份', 139345, 0.86, 0, 'xinganggufen', 'xggf', '5.27', 568008, 4.08, NULL, 3027740, 139345, NULL),
(2531, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '山东', 4.71, '600783', 0.301, 10200.5, '矿物制品', 125816, '鲁信创投', 74435.9, 4.09, 32.04, 'luxinchuangtou', 'lxct', '23.30', 109436, 1.47, NULL, 530810, 74435.9, NULL),
(2532, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '山东', 2.65, '600784', 0.001, 36603.8, '普钢', 432156, '鲁银投资', 49661.4, 2.46, 2307.63, 'luyintouzi', 'lytz', '9.87', 46811.6, 0.82, NULL, 574395, 56817.8, NULL),
(2533, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '宁夏', 8.17, '600785', 0.548, 141398, '百货', 169282, '新华百货', 20743.1, 2.68, 19.95, 'xinhuabaihuo', 'xhbh', '27.26', 30933.3, 1.37, NULL, 394299, 22563.1, NULL),
(2534, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '天津', 3.45, '600787', 0.207, 196110, '仓储物流', 717152, '中储股份', 168021, 2.83, 23.58, 'zhongchugufen', 'zcgf', '9.27', 193667, 1.04, NULL, 1274480, 185983, NULL),
(2535, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '山东', 3.12, '600789', 0.001, 158227, '化学制药', 177321, '鲁抗医药', 58157.6, 2.75, 4380.69, 'lukangyiyao', 'lkyy', '9.78', 107988, 1.86, NULL, 399203, 58157.6, NULL),
(2536, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '浙江', 3.42, '600790', 0.163, 21316.5, '商品城', 116762, '轻纺城', 80440.9, 1.96, 20.48, 'qingfangcheng', 'qfc', '7.47', 147586, 1.41, NULL, 728207, 104699, NULL),
(2537, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '北京', 3.22, '600791', 0.055, 1619.62, '全国地产', 465334, '京能置业', 45231.4, 1.8, 52.68, 'jingnengzhiye', 'jnzy', '8.47', 13215.2, 0.29, NULL, 504460, 45288, NULL),
(2538, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '云南', 3.27, '600792', -0.19, 274735, '焦炭加工', 173492, '云煤能源', 95202.9, 1.38, 0, 'yunmeinengyuan', 'ymny', '5.88', 183700, 1.86, NULL, 603792, 98992.4, NULL),
(2539, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '四川', 0.28, '600793', -0.107, 61111.3, '造纸', 94989.5, 'ST宜纸', 10530, 70.2, 0, 'STyizhi', 'STyz', '31.76', 10537.1, 1, NULL, 359591, 10530, NULL),
(2540, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '江苏', 1.53, '600794', 0.062, 88581.8, '仓储物流', 104924, '保税科技', 101321, 3.63, 44.94, 'baoshuikeji', 'bskj', '6.47', 3875.08, 0.03, NULL, 275942, 119157, NULL),
(2541, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '辽宁', 2.55, '600795', 0.174, 14224300, '火力发电', 1864630, '国电电力', 1781550, 1.75, 12.78, 'guodiandianli', 'gddl', '3.22', 640550, 0.33, NULL, 25125800, 1965040, NULL),
(2542, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '浙江', 1.85, '600796', 0.04, 40669.1, '农药化肥', 56398.3, '钱江生化', 30140.2, 4.28, 100.23, 'qianjiangshenghua', 'qjsh', '13.00', 3758.08, 0.12, NULL, 111669, 30140.2, NULL),
(2543, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '浙江', 1.98, '600797', 0.057, 10836.5, '软件服务', 315781, '浙大网新', 82171.2, 4.76, 82.35, 'zhedawangxin', 'zdwx', '18.00', 25234, 0.31, NULL, 472882, 82171.2, NULL),
(2544, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '浙江', 2.54, '600798', 0.004, 214570, '水运', 29059.6, '宁波海运', 103085, 3.25, 969.14, 'ningbohaiyun', 'nbhy', '5.59', 116821, 1.13, NULL, 627312, 103085, NULL),
(2545, '2016-06-05 13:22:40', '2016-06-05 13:22:40', '天津', 0.18, '600800', -0.002, 7251.24, '综合类', 30557.1, '天津磁卡', 61031.1, 34.02, 0, 'tianjincika', 'tjck', '11.37', 13506.8, 0.22, NULL, 64866.6, 61127.1, NULL),
(2546, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '湖北', 6.41, '600801', 0.059, 1498540, '水泥', 598421, '华新水泥', 97277.1, 1.26, 68.03, 'huaxinshuini', 'hxsn', '7.82', 251608, 1.68, NULL, 2641300, 149757, NULL),
(2547, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '福建', 3.28, '600802', -0.327, 267652, '水泥', 82732.4, '福建水泥', 38187.4, 1.85, 0, 'fujianshuini', 'fjsn', '10.39', 21754.1, 0.57, NULL, 529982, 38187.4, NULL),
(2548, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '河北', 3.93, '600803', 0.27, 502729, '农药化肥', 359791, '新奥股份', 53951.9, 3, 21.8, 'xinaogufen', 'xagf', '15.03', 0, 0, NULL, 1077250, 98578.5, NULL),
(2549, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '四川', 3.76, '600804', 0.299, 885324, '电信运营', 343046, '鹏博士', 136112, 4.83, 30.4, 'pengboshi', 'pbs', '21.93', 189578, 1.35, NULL, 1641150, 140045, NULL),
(2550, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '江苏', 7.58, '600805', 0.33, 128314, '综合类', 267287, '悦达投资', 84920.2, 1.35, 15.56, 'yuedatouzi', 'ydtz', '8.66', 41202.3, 0.48, NULL, 1096390, 85089.5, NULL),
(2551, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '云南', 2.01, '600806', -0.036, 52115.3, '机床制造', 184000, '昆明机床', 39018.6, 4.4, 0, 'kunmingjichuang', 'kmjc', '7.90', 1976.5, 0.04, NULL, 291612, 53108.1, NULL),
(2552, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '山东', 0.76, '600807', 0.11, 6509.55, '区域地产', 321443, '天业股份', 49217, 13.11, 55.47, 'tianyegufen', 'tygf', '13.73', 4556.87, 0.06, NULL, 384065, 70468.5, NULL),
(2553, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '安徽', 2.86, '600808', -0.161, 3549640, '普钢', 2560350, '马钢股份', 596775, 1.08, 0, 'maganggufen', 'mggf', '2.90', 832907, 1.08, NULL, 6831940, 770068, NULL),
(2554, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '山西', 4.83, '600809', 0.323, 75527.5, '白酒', 402527, '山西汾酒', 86584.8, 3.3, 24.74, 'shanxifenjiu', 'sxfj', '26.21', 24080.7, 0.28, NULL, 613095, 86584.8, NULL),
(2555, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '河南', 5.26, '600810', 0.013, 227416, '化纤', 377398, '神马股份', 44228, 1.46, 300.63, 'shenmagufen', 'smgf', '11.56', 179641, 4.06, NULL, 849107, 44228, NULL),
(2556, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '黑龙江', 6.24, '600811', 0.255, 49901.1, '综合类', 621159, '东方集团', 166681, 1.6, 19.59, 'dongfangjituan', 'dfjt', '7.26', 221118, 1.33, NULL, 2210650, 166681, NULL),
(2557, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '河北', 3.21, '600812', 0.021, 544432, '化学制药', 603660, '华北制药', 102858, 1.82, 138.4, 'huabeizhiyao', 'hbzy', '6.32', 344494, 2.11, NULL, 1584280, 163080, NULL),
(2558, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '浙江', 2.68, '600814', 0.194, 103052, '百货', 266071, '杭州解百', 31038.3, 2.88, 19.94, 'hangzhoujiebai', 'hzjb', '11.37', 1428.49, 0.02, NULL, 435428, 71502.7, NULL),
(2559, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '福建', 4.06, '600815', -0.189, 137514, '工程机械', 829420, '厦工股份', 95897, 1.65, 0, 'shagonggufen', 'sggf', '6.75', 201774, 2.1, NULL, 1073070, 95897, NULL),
(2560, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 7.79, '600816', 1.83, 891.15, '多元金融', 0, '安信信托', 45411, 4.91, 16.28, 'anxinxintuo', 'axxt', '24.00', 288903, 4.08, NULL, 632914, 70795.6, NULL),
(2561, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 0.67, '600817', 0.001, 27.56, '半导体', 11026.8, 'ST宏盛', 14791.5, 22.85, 13121.9, 'SThongsheng', 'SThs', '21.59', 21228.2, 1.32, NULL, 49891.6, 16091, NULL),
(2562, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 1.28, '600818', 0.123, 10777.2, '文教休闲', 31253.5, '中路股份', 23795.8, 37.17, 194.02, 'zhonglugufen', 'zlgf', '35.62', 430.25, 0.01, NULL, 78784.8, 32144.8, NULL),
(2563, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 3.29, '600819', -0.085, 310180, '玻璃', 399263, '耀皮玻璃', 67247.3, 1.71, 0, 'yaopiboli', 'ypbl', '8.42', 112304, 1.2, NULL, 857231, 93491.6, NULL),
(2564, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 5.17, '600820', 0.203, 204320, '建筑施工', 2963180, '隧道股份', 314410, 1.81, 22.99, 'suidaogufen', 'sdgf', '11.15', 682870, 2.17, NULL, 6017220, 314410, NULL),
(2565, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '天津', 1.45, '600821', 0.009, 79974, '百货', 28356.9, '津劝业', 41626.8, 4.15, 350.96, 'jinquanye', 'jqy', '12.73', 17866.2, 0.43, NULL, 191746, 41626.8, NULL),
(2566, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 1.77, '600822', -0.233, 49180.9, '商贸代理', 776798, '上海物贸', 39614.8, 4.83, 0, 'shanghaiwumao', 'shwm', '20.15', 54260.8, 1.09, NULL, 878999, 49597.3, NULL),
(2567, '2016-06-05 13:22:41', '2016-06-05 13:22:41', '上海', 9.57, '600823', 0.528, 70889.2, '全国地产', 3781170, '世茂股份', 175994, 1.08, 9.76, 'shimaogufen', 'smgf', '7.21', 241455, 1.37, NULL, 6263680, 175994, NULL),
(2568, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 1.77, '600824', 0.116, 16128.5, '百货', 114744, '益民集团', 105403, 3.64, 27.63, 'yiminjituan', 'ymjt', '7.24', 13459.9, 0.13, NULL, 283128, 105403, NULL),
(2569, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 2.44, '600825', 0.031, 38385.1, '出版业', 243477, '新华传媒', 104489, 3.37, 130.88, 'xinhuachuanmei', 'xhcm', '8.79', 55722.4, 0.53, NULL, 478363, 104489, NULL),
(2570, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 9.21, '600826', 1.015, 3210.9, '商贸代理', 190761, '兰生股份', 42064.2, 2.38, 10.82, 'lanshenggufen', 'lsgf', '27.90', 13791.1, 0.33, NULL, 515104, 42064.2, NULL),
(2571, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 9.53, '600827', 0.64, 1214800, '超市连锁', 1575040, '百联股份', 154278, 1.81, 13.48, 'bailiangufen', 'blgf', '14.40', 297998, 1.73, NULL, 4134580, 172250, NULL),
(2572, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '四川', 2.26, '600828', 0.109, 85511.8, '百货', 35187.4, '成商集团', 56981.7, 3.4, 35.28, 'chengshangjituan', 'csjt', '8.64', 2998.07, 0.05, NULL, 234408, 57044, NULL),
(2573, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '黑龙江', 2.39, '600829', 0.18, 40073.3, '化学制药', 322191, '人民同泰', 57988.9, 4.1, 27.25, 'renmintongtai', 'rmtt', '15.45', 0, 0, NULL, 377551, 57988.9, NULL),
(2574, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '浙江', 4.4, '600830', 0.092, 16664, '多元金融', 183017, '香溢融通', 45432.3, 1.93, 46.34, 'xiangyirongtong', 'xyrt', '9.16', 52450.7, 1.15, NULL, 369363, 45432.3, NULL),
(2575, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '陕西', 3.31, '600831', 0.16, 341708, '影视音像', 90316.6, '广电网络', 56343.9, 3.32, 34.31, 'guangdianwangluo', 'gdwl', '13.33', 43286, 0.77, NULL, 526757, 56343.9, NULL),
(2576, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 3.58, '600833', 0.104, 8799.28, '医药商业', 58307.5, '第一医药', 22308.6, 3.69, 63.43, 'diyiyiyao', 'dyyy', '20.81', 6518.93, 0.29, NULL, 124837, 22308.6, NULL),
(2577, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 2.93, '600834', 0.065, 142101, '公共交通', 47995.9, '申通地铁', 47738.2, 4.21, 94.34, 'shentongditie', 'stdt', '13.74', 7974.25, 0.17, NULL, 285780, 47738.2, NULL),
(2578, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 6.74, '600835', 0.539, 142532, '运输设备', 2523530, '上海机电', 80650.4, 3.72, 23.22, 'shanghaijidian', 'shjd', '20.08', 204437, 2, NULL, 3029070, 102274, NULL),
(2579, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 2.6, '600836', 0.011, 53495.9, '广告包装', 304645, '界龙实业', 31356.3, 8.69, 1069.55, 'jielongshiye', 'jlsy', '8.79', 43060.1, 1.3, NULL, 391036, 33137.6, NULL),
(2580, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 8.92, '600837', 1.03, 107475, '证券', 0, '海通证券', 809213, 1.38, 6.97, 'haitongzhengquan', 'htzq', '15.79', 5634170, 4.9, NULL, 62974900, 1150170, NULL),
(2581, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 2.47, '600838', 0.115, 13017.6, '百货', 11959.1, '上海九百', 40088.2, 5.21, 56.06, 'shanghaijiubai', 'shjb', '19.33', 18368.6, 0.46, NULL, 120006, 40088.2, NULL),
(2582, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '四川', 3.01, '600839', -0.041, 583781, '家用电器', 5057590, '四川长虹', 461000, 1.91, 0, 'sichuanzhanghong', 'sczh', '4.26', 389251, 0.84, NULL, 6303690, 461624, NULL),
(2583, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 3.99, '600841', 0.07, 148339, '机械基件', 337396, '上柴股份', 52189.2, 2.47, 70.16, 'shangchaigufen', 'scgf', '16.42', 112447, 1.3, NULL, 539874, 86669, NULL),
(2584, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 3.16, '600843', 0.183, 25533.5, '纺织机械', 224486, '上工申贝', 30464.6, 3.42, 29.52, 'shanggongshenbei', 'sgsb', '19.58', 95761.4, 1.75, NULL, 302978, 54859, NULL),
(2585, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 1.11, '600844', 0.015, 215788, '化工原料', 75922.6, '丹化科技', 58482.7, 5.31, 191.29, 'danhuakeji', 'dhkj', '6.11', 79809.9, 1.03, NULL, 325530, 77862.1, NULL),
(2586, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 7.16, '600845', 0.424, 30630, '软件服务', 421775, '宝信软件', 23684.8, 6.08, 51.35, 'baoxinruanjian', 'bxrj', '18.57', 63480.6, 1.74, NULL, 529349, 36413.2, NULL),
(2587, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 2.7, '600846', 0.068, 21116.3, '综合类', 569519, '同济科技', 62476.1, 2.52, 49.82, 'tongjikeji', 'tjkj', '9.40', 21945.1, 0.35, NULL, 695375, 62476.1, NULL),
(2588, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '重庆', 4.55, '600847', 0.016, 19317, '电气设备', 51074.4, '万里股份', 13371.9, 7.27, 1012.93, 'wanligufen', 'wlgf', '26.69', 67481.1, 4.28, NULL, 86562, 15748.3, NULL),
(2589, '2016-06-05 13:22:42', '2016-06-05 13:22:42', '上海', 0.35, '600848', 0.008, 25127, '电器仪表', 99936.5, '自仪股份', 29214.1, 35.85, 810.44, 'ziyigufen', 'zygf', '19.77', 22458.9, 0.56, NULL, 180272, 39928.7, NULL),
(2590, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '上海', 4.48, '600850', 0.327, 3547.81, '电脑设备', 382120, '华东电脑', 32174.5, 7.6, 51.99, 'huadongdiannao', 'hddn', '24.76', 1063.46, 0.03, NULL, 392368, 32174.5, NULL),
(2591, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '上海', 3.97, '600851', 0.081, 36100.3, '纺织', 118000, '海欣股份', 73820.6, 2.18, 53.18, 'haixingufen', 'hxgf', '12.91', 43664.6, 0.36, NULL, 651006, 120706, NULL),
(2592, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '黑龙江', 1.47, '600853', 0.008, 27201.8, '建筑施工', 576977, '龙建股份', 53680.8, 5.02, 470.02, 'longjiangufen', 'ljgf', '6.98', 10036.2, 0.19, NULL, 704113, 53680.8, NULL),
(2593, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '江苏', 3.72, '600854', 0.039, 39445.8, '家用电器', 118357, '春兰股份', 51945.9, 1.56, 74.24, 'chunlangufen', 'clgf', '7.64', 153355, 2.95, NULL, 251569, 51945.9, NULL),
(2594, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '北京', 2.55, '600855', 0.033, 4787.53, '专用机械', 116288, '航天长峰', 33011.4, 7.71, 295.63, 'hangtianzhangfeng', 'htzf', '28.89', 26077.3, 0.79, NULL, 161173, 33161.7, NULL),
(2595, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '吉林', 2.88, '600856', 0.17, 49427.9, '百货', 127386, '长百集团', 23483.2, 7.71, 83.63, 'zhangbaijituan', 'zbjt', '13.86', 69805.5, 1.23, NULL, 263246, 56716.6, NULL),
(2596, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '浙江', 2.67, '600857', 0.143, 12871.8, '百货', 36443.8, '宁波中百', 22432, 4.07, 37.82, 'ningbozhongbai', 'nbzb', '20.30', 6507.8, 0.29, NULL, 75432.1, 22432, NULL),
(2597, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '山东', 5.73, '600858', 0.185, 400346, '百货', 359385, '银座股份', 51754.8, 1.45, 22.41, 'yinzuogufen', 'yzgf', '9.64', 96548.2, 1.86, NULL, 1214280, 52006.7, NULL),
(2598, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '北京', 16.42, '600859', 1.002, 213826, '百货', 689107, '王府井', 46276.8, 1.27, 10.37, 'wangfujing', 'wfj', '16.28', 320500, 6.93, NULL, 1371210, 46276.8, NULL),
(2599, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '北京', 2.07, '600860', -0.113, 100212, '专用机械', 115370, '京城股份', 32200, 6.43, 0, 'jingchenggufen', 'jcgf', '12.18', 68380.3, 1.62, NULL, 242359, 42200, NULL),
(2600, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '北京', 7.1, '600861', 0.123, 155728, '百货', 232548, '北京城乡', 31680.5, 1.47, 42.64, 'beijingchengxiang', 'bjcx', '15.84', 86134.6, 2.72, NULL, 428193, 31680.5, NULL),
(2601, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '江苏', 1.6, '600862', -0.071, 128955, '全国地产', 420648, '南通科技', 63792.9, 7.4, 0, 'nantongkeji', 'ntkj', '12.48', 25108.7, 0.39, NULL, 602540, 63792.9, NULL),
(2602, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '内蒙', 1.74, '600863', 0.081, 2226770, '火力发电', 328786, '内蒙华电', 580774, 2.95, 31.5, 'neimenghuadian', 'nmhd', '3.12', 82955.8, 0.14, NULL, 3909920, 580774, NULL),
(2603, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '黑龙江', 7.97, '600864', 0.174, 166121, '火力发电', 101250, '哈投股份', 54637.8, 1.29, 29.45, 'hatougufen', 'htgf', '11.25', 2832.05, 0.05, NULL, 645003, 54637.8, NULL),
(2604, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '浙江', 3.73, '600865', 0.176, 16505.7, '百货', 115249, '百大集团', 37624, 2.4, 25.47, 'baidajituan', 'bdjt', '14.06', 23346.4, 0.62, NULL, 185981, 37624, NULL),
(2605, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '广东', 2.11, '600866', -0.167, 93338.9, '食品', 95763.1, '星湖科技', 55039.4, 3.94, 0, 'xinghukeji', 'xhkj', '7.10', 76118.8, 1.18, NULL, 219277, 64539.4, NULL),
(2606, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '吉林', 1.92, '600867', 0.232, 115497, '生物制药', 150716, '通化东宝', 112706, 10.65, 44.14, 'tonghuadongbao', 'thdb', '22.11', 15747.2, 0.14, NULL, 312089, 113311, NULL),
(2607, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '广东', 1.12, '600868', -0.006, 181379, '水力发电', 29035.3, '梅雁吉祥', 189815, 5.15, 0, 'meiyanjixiang', 'myjx', '6.02', 41142.5, 0.22, NULL, 272392, 189815, NULL),
(2608, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '青海', 3.21, '600869', 0.164, 204521, '电气设备', 830182, '智慧能源', 99004.3, 4.04, 39.5, 'zhihuinengyuan', 'zhny', '7.93', 140719, 1.42, NULL, 1175140, 99004.3, NULL),
(2609, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '福建', 0.01, '600870', 0.003, 4.45, '家用电器', 2247.85, '*ST厦华', 37081.9, 610.66, 1397.35, '*STshahua', '*STsh', '9.42', 228411, 4.37, NULL, 3384.37, 52320, NULL),
(2610, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '北京', 1.65, '600871', -0.098, 2841770, '石油开采', 4004210, '石化油服', 45000, 3.7, 0, 'shihuayoufu', 'shyf', '4.15', 889422, 0.63, NULL, 7381280, 1414270, NULL),
(2611, '2016-06-05 13:22:43', '2016-06-05 13:22:43', '广东', 2.98, '600872', 0.129, 125478, '食品', 229803, '中炬高新', 79663.7, 7.27, 83.58, 'zhongjugaoxin', 'zjgx', '14.31', 27916.4, 0.35, NULL, 436290, 79663.7, NULL),
(2612, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '西藏', 2.65, '600873', 0.109, 1216110, '食品', 529548, '梅花生物', 310823, 3.51, 42.8, 'meihuashengwu', 'mhsw', '6.76', 224049, 0.72, NULL, 1931750, 310823, NULL),
(2613, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '天津', 2.98, '600874', 0.127, 47002.4, '环境保护', 329412, '创业环保', 108723, 2.89, 33.86, 'chuangyehuanbao', 'cyhb', '8.29', 38231.1, 0.27, NULL, 1046970, 142723, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(2614, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '四川', 9.75, '600875', 0.08, 812115, '电气设备', 7049410, '东方电气', 199690, 1.34, 90.91, 'dongfangdianqi', 'dfdq', '10.79', 882854, 3.78, NULL, 8287380, 233690, NULL),
(2615, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '河南', -0.13, '600876', -0.228, 32352.8, '玻璃', 51306.3, '洛阳玻璃', 25001.8, -190.78, 0, 'luoyangboli', 'lybl', '25.61', 85745, 1.71, NULL, 119026, 50001.8, NULL),
(2616, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '重庆', 0.16, '600877', -0.119, 56172.2, '摩托车', 91984, '中国嘉陵', 68728.2, 44.29, 0, 'zhongguojialing', 'zgjl', '9.93', 11126.4, 0.16, NULL, 211409, 68728.2, NULL),
(2617, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '湖北', 5.11, '600879', 0.079, 172566, '航空', 790506, '航天电子', 103954, 4.8, 154.53, 'hangtiandianzi', 'htdz', '16.17', 190388, 1.83, NULL, 1104210, 103954, NULL),
(2618, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '四川', 3.28, '600880', 0.066, 50767.2, '广告包装', 170211, '博瑞传播', 73208.1, 2.55, 63.68, 'boruichuanbo', 'brcb', '9.23', 80541.7, 0.74, NULL, 482309, 109333, NULL),
(2619, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '吉林', 4.53, '600881', 0.03, 1305680, '水泥', 3047540, '亚泰集团', 189473, 1.42, 136.22, 'yataijituan', 'ytjt', '5.72', 624947, 2.4, NULL, 5495110, 259995, NULL),
(2620, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '山东', 3.36, '600882', -0.044, 68441.4, '普钢', 55081.9, '华联矿业', 39923.8, 4, 0, 'hualiankuangye', 'hlky', '11.08', 0, 0, NULL, 163159, 39923.8, NULL),
(2621, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '云南', 3.01, '600883', 0.507, 1942.18, '水泥', 38534.3, '博闻科技', 23608.8, 3.21, 9.56, 'bowenkeji', 'bwkj', '16.36', 658.48, 0.03, NULL, 75778.2, 23608.8, NULL),
(2622, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '浙江', 12.12, '600884', 1.488, 73251.2, '服饰', 402441, '杉杉股份', 41085.8, 1.65, 6.74, 'shanshangufen', 'ssgf', '14.53', 48865.6, 1.19, NULL, 962232, 41085.8, NULL),
(2623, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '湖北', 5.09, '600885', 0.514, 115693, '电气设备', 316773, '宏发股份', 29274.6, 5.13, 25.42, 'hongfagufen', 'hfgf', '32.29', 66972.8, 1.26, NULL, 514896, 53197.2, NULL),
(2624, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '北京', 3.48, '600886', 0.361, 12053600, '水力发电', 1549030, '国投电力', 678602, 4.28, 20.59, 'guotoudianli', 'gtdl', '6.73', 646044, 0.95, NULL, 17498400, 678602, NULL),
(2625, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '内蒙', 3.07, '600887', 0.434, 1359940, '乳制品', 2065150, '伊利股份', 601565, 5.22, 18.42, 'yiligufen', 'ylgf', '17.90', 342002, 0.56, NULL, 3921730, 612874, NULL),
(2626, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '新疆', 5.03, '600888', 0.043, 360988, '铝', 429108, '新疆众和', 64122.6, 1.3, 75.82, 'xinjiangzhonghe', 'xjzh', '7.92', 197203, 3.08, NULL, 925669, 64122.6, NULL),
(2627, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '江苏', 3.05, '600889', 0.004, 126654, '化纤', 134777, '南京化纤', 30706.9, 3, 1256.88, 'nanjinghuaxian', 'njhx', '13.59', 21561, 0.7, NULL, 294015, 30706.9, NULL),
(2628, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '北京', 0.52, '600890', -0.021, 80.08, '区域地产', 7220.32, '中房股份', 57919.5, 12.83, 0, 'zhongfanggufen', 'zfgf', '11.27', 2033.78, 0.04, NULL, 39074.1, 57919.5, NULL),
(2629, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '黑龙江', 2.67, '600891', 0.092, 10897.4, '百货', 74412.7, '秋林集团', 32389.8, 3.68, 53.16, 'qiulinjituan', 'qljt', '9.67', 34396.8, 1.06, NULL, 120408, 32552.9, NULL),
(2630, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '深圳', 0.07, '600892', -0.045, 1127.14, '综合类', 2479.9, '宝诚股份', 6282.31, 492.9, 0, 'baochenggufen', 'bcgf', '78.31', 14197.8, 2.25, NULL, 12537.7, 6312.5, NULL),
(2631, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '陕西', 7.33, '600893', 0.193, 1036610, '航空', 2804680, '中航动力', 136514, 5.65, 107.29, 'zhonghangdongli', 'zhdl', '33.63', 969992, 4.98, NULL, 4726080, 194872, NULL),
(2632, '2016-06-05 13:22:44', '2016-06-05 13:22:44', '广东', 5.37, '600894', 0.409, 76359.7, '运输设备', 360547, '广日股份', 85994.7, 2.59, 17, 'guangrigufen', 'grgf', '13.88', 243299, 2.83, NULL, 741575, 85994.7, NULL),
(2633, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '广东', 2.79, '603288', 0.493, 331997, '食品', 517275, '海天味业', 26946, 11.43, 32.33, 'haitianweiye', 'htwy', '29.73', 132011, 0.49, NULL, 930606, 270644, NULL),
(2634, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '浙江', 5.14, '603300', 0.23, 73327.1, '钢加工', 73055.7, '华铁科技', 5067, 3.43, 48, 'huatiekeji', 'htkj', '16.53', 54873.9, 2.71, NULL, 150609, 20267, NULL),
(2635, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '福建', 6.96, '603306', 0.528, 28582.6, '汽车配件', 81158.3, '华懋科技', 3500, 3.73, 24.57, 'huamaokeji', 'hmkj', '36.31', 42391.8, 3.03, NULL, 114091, 14000, NULL),
(2636, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '安徽', 4.63, '603308', 0.126, 181175, '专用机械', 251383, '应流股份', 23982.1, 3.37, 62, 'yingliugufen', 'ylgf', '21.92', 75580.4, 1.89, NULL, 493262, 40001, NULL),
(2637, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '广东', 7.6, '603309', 0.47, 18401.1, '医疗保健', 57959.7, '维力医疗', 2500, 5.58, 49.19, 'weiliyiliao', 'wlyl', '25.96', 40776.6, 4.08, NULL, 86000.7, 10000, NULL),
(2638, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '浙江', 2.65, '603311', 0.19, 11909.7, '专用机械', 58704.7, '金海环境', 5250, 6.48, 56.09, 'jinhaihuanjing', 'jhhj', '23.85', 19490.8, 0.93, NULL, 82913.5, 21000, NULL),
(2639, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '辽宁', 6.11, '603315', 0.33, 40649.6, '机械基件', 51141.6, '福鞍股份', 2500, 4.22, 46.97, 'fuangufen', 'fagf', '41.90', 38825.7, 3.88, NULL, 96353, 10000, NULL),
(2640, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '辽宁', 3.75, '603318', 0.09, 10836.1, '专用机械', 51145.4, '派思股份', 3010, 6.86, 178.62, 'paisigufen', 'psgf', '14.30', 15468.4, 1.28, NULL, 75756.5, 12040, NULL),
(2641, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '广东', 8.33, '603328', 0.385, 86878.2, '元器件', 397347, '依顿电子', 9798, 2.46, 26.66, 'yidundianzi', 'yddz', '32.90', 135860, 2.78, NULL, 487831, 48900, NULL),
(2642, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '四川', 2.84, '603333', 0.001, 62158.6, '电气设备', 91967.6, '明星电缆', 52000.5, 2.11, 2050.68, 'mingxingdianlan', 'mxdl', '10.32', 65478.8, 1.26, NULL, 174797, 52000.5, NULL),
(2643, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '浙江', 5.28, '603338', 0.381, 17475.5, '专用机械', 72655.3, 'DR浙江鼎', 4062.5, 6.44, 44.6, 'DRzhejiangding', 'DRzjd', '51.41', 48636.5, 2.99, NULL, 99838.1, 16250, NULL),
(2644, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '江苏', 5.87, '603355', 0.45, 81934.2, '电气设备', 274008, '莱克电气', 4100, 5.06, 36.08, 'laikedianqi', 'lkdq', '46.88', 79597.6, 1.98, NULL, 375532, 40100, NULL),
(2645, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '江苏', 4.35, '603366', 0.081, 45764.7, '家用电器', 350994, '日出东方', 80000, 2.11, 56.62, 'richudongfang', 'rcdf', '9.81', 191866, 2.4, NULL, 462121, 80000, NULL),
(2646, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '广西', 10.86, '603368', 0.894, 12998.7, '医药商业', 358916, '柳州医药', 2250, 5.28, 32.03, 'liuzhouyiyao', 'lzyy', '82.13', 59387.5, 5.28, NULL, 391672, 11250, NULL),
(2647, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '江苏', 7.61, '603369', 0.933, 66828.1, '白酒', 380972, '今世缘', 21830, 3.52, 14.34, 'jinshiyuan', 'jsy', '13.30', 99361.4, 1.98, NULL, 522925, 50180, NULL),
(2648, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '辽宁', 2.93, '603399', -0.132, 44611.5, '小金属', 146487, '新华龙', 35470.4, 2.59, 0, 'xinhualong', 'xhl', '11.21', 35047.4, 0.7, NULL, 223193, 49925.1, NULL),
(2649, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '浙江', 7.97, '603456', 0.538, 118784, '化学制药', 114102, '九洲药业', 5196, 5.32, 39.42, 'jiuzhouyaoye', 'jzyy', '21.74', 70090.5, 3.37, NULL, 279948, 20778, NULL),
(2650, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '江苏', 9.04, '603518', 0.498, 3158.33, '服饰', 132840, '维格娜丝', 3699.5, 2.74, 24.82, 'weigenasi', 'wgns', '33.05', 74053.2, 5, NULL, 143247, 14798, NULL),
(2651, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '江苏', 7.89, '603519', 0.4, 8773.86, '家用电器', 72889.4, '立霸股份', 2000, 4.58, 51.35, 'libagufen', 'lbgf', '30.64', 26148, 3.27, NULL, 84223.7, 8000, NULL),
(2652, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '福建', 3.63, '603555', 0.284, 54072.3, '服饰', 316939, '贵人鸟', 11388.5, 6.25, 39.9, 'guirenniao', 'grn', '30.76', 83873.8, 1.37, NULL, 430359, 61400, NULL),
(2653, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '浙江', 6.1, '603558', 0.51, 36749.1, '纺织', 57681.6, '健盛集团', 3000, 5.01, 30.58, 'jianshengjituan', 'jsjt', '30.97', 34680.7, 2.89, NULL, 116471, 12000, NULL),
(2654, '2016-06-05 13:22:45', '2016-06-05 13:22:45', '河南', 7.91, '603566', 0.56, 25529.9, '生物制药', 96808.1, '普莱柯', 4000, 4.79, 42.94, 'pulaike', 'plk', '24.65', 57297.9, 3.58, NULL, 141413, 16000, NULL),
(2655, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '黑龙江', 8.61, '603567', 0.63, 112430, '化学制药', 361008, '珍宝岛', 6458, 4.22, 32.27, 'zhenbaodao', 'zbd', '20.17', 164974, 3.89, NULL, 525024, 42458, NULL),
(2656, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 3.39, '603568', 0.37, 4722.5, '环境保护', 70559.6, '伟明环保', 4580, 17.57, 89.21, 'weiminghuanbao', 'wmhb', '23.68', 40807.8, 0.9, NULL, 311221, 45380, NULL),
(2657, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '北京', 10.77, '603588', 0.096, 10142.1, '环境保护', 154352, '高能环境', 4040, 4.46, 250.45, 'gaonenghuanjing', 'gnhj', '31.00', 95938.5, 5.94, NULL, 293136, 16160, NULL),
(2658, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '安徽', 5.56, '603589', 0.5, 96294.9, '白酒', 315215, '口子窖', 6000, 5.56, 34.12, 'kouzijiao', 'kzj', '33.39', 97688.2, 1.63, NULL, 467824, 60000, NULL),
(2659, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '北京', 4.16, '603598', 0.22, 330.32, '影视音像', 80618.9, '引力传媒', 3334, 6.09, 70.55, 'yinlichuanmei', 'ylcm', '22.99', 19597.6, 1.47, NULL, 83887.8, 13334, NULL),
(2660, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '安徽', 11.61, '603599', 0.59, 89643.2, '农药化肥', 161539, '广信股份', 4706, 2.36, 29.6, 'guangxingufen', 'gxgf', '40.63', 103364, 5.49, NULL, 292061, 18824, NULL),
(2661, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 5.08, '603600', 0.49, 17001.2, '家居用品', 50040.9, '永艺股份', 2500, 26.65, 144.95, 'yongyigufen', 'yygf', '53.19', 20287.8, 2.03, NULL, 69954.4, 10000, NULL),
(2662, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '重庆', 2.02, '603601', 0.099, 11859, '玻璃', 21314.1, '再升科技', 3740, 11.63, 119.12, 'zaishengkeji', 'zskj', '17.10', 8746.38, 0.58, NULL, 35970.2, 14960, NULL),
(2663, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 2.51, '603606', 0.13, 30514.4, '电气设备', 135662, '东方电缆', 7777, 4.56, 77.99, 'dongfangdianlan', 'dfdl', '15.28', 12030.8, 0.39, NULL, 173358, 31097, NULL),
(2664, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '辽宁', 4.45, '603609', 0.214, 114612, '饲料', 227421, '禾丰牧业', 27892.8, 2.89, 30.01, 'hefengmuye', 'hfmy', '13.20', 38123.9, 0.69, NULL, 411743, 55411.8, NULL),
(2665, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 5.03, '603611', 0.27, 19194.8, '运输设备', 84880.4, '诺力股份', 4000, 3.63, 34.75, 'nuoligufen', 'nlgf', '38.81', 24166.2, 1.51, NULL, 118736, 16000, NULL),
(2666, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '北京', 5.64, '603616', 0.09, 35951, '其他建材', 103544, '韩建河山', 3668, 4.54, 184.94, 'hanjianheshan', 'hjhs', '18.75', 40295.4, 2.75, NULL, 152718, 14668, NULL),
(2667, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 6.7, '603618', 0.28, 30595, '电气设备', 249588, '杭电股份', 5335, 2.68, 34.52, 'hangdiangufen', 'hdgf', '12.26', 85567.1, 4.01, NULL, 299691, 21335, NULL),
(2668, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '福建', 8.09, '603636', 0.23, 8375.5, '软件服务', 90067.1, '南威软件', 2500, 4.03, 71.08, 'nanweiruanjian', 'nwrj', '90.91', 40682.3, 4.07, NULL, 109410, 10000, NULL),
(2669, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '西藏', 4, '603669', 0.35, 26037.3, '中成药', 89641.8, '灵康药业', 6500, 7, 51.05, 'lingkangyaoye', 'lkyy', '30.64', 64725.1, 2.49, NULL, 128373, 26000, NULL),
(2670, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '福建', 6.33, '603678', 0.46, 13661.5, '元器件', 124884, '火炬电子', 4160, 10.12, 72.29, 'huojudianzi', 'hjdz', '73.28', 34340.3, 2.06, NULL, 152766, 16640, NULL),
(2671, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '福建', 7.25, '603686', 0.63, 5170.71, '环境保护', 138563, '龙马环卫', 3335, 10.92, 65.47, 'longmahuanwei', 'lmhw', '32.40', 41839.5, 3.14, NULL, 149006, 13335, NULL),
(2672, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '江苏', 4.93, '603688', 0.172, 29991.6, '矿物制品', 71271.9, '石英股份', 5595, 2.83, 40.58, 'shiyinggufen', 'sygf', '22.18', 56206.9, 2.51, NULL, 118945, 22380, NULL),
(2673, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '北京', 5.14, '603698', 0.38, 71732.9, '专用机械', 298510, '航天工程', 8230, 5.07, 35.5, 'hangtiangongcheng', 'htgc', '28.59', 105721, 2.56, NULL, 389987, 41230, NULL),
(2674, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '江苏', 3.1, '603699', 0.312, 49796.6, '专用机械', 332132, '纽威股份', 15500, 5.89, 29.29, 'niuweigufen', 'nwgf', '16.84', 78919.6, 1.05, NULL, 422479, 75000, NULL),
(2675, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '浙江', 5.49, '603703', 0.15, 23044, '电气设备', 41708.2, '盛洋科技', 2300, 5.81, 128.79, 'shengyangkeji', 'sykj', '35.99', 22414.9, 2.44, NULL, 71442, 9188, NULL),
(2676, '2016-06-05 13:22:46', '2016-06-05 13:22:46', '上海', 3.15, '603718', 0.24, 16418.3, '生物制药', 66952.8, '海利生物', 7000, 7.45, 62.25, 'hailishengwu', 'hlsw', '17.90', 48294.3, 1.72, NULL, 100157, 28000, NULL),
(2677, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '上海', 14.55, '603729', 0.61, 532.07, '广告包装', 107272, '龙韵股份', 1667, 5.31, 72.88, 'longyungufen', 'lygf', '77.72', 45691.8, 6.85, NULL, 123497, 6667, NULL),
(2678, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '重庆', 5.23, '603766', 0.438, 164104, '摩托车', 329278, '隆鑫通用', 79874.5, 2.79, 16.7, 'longxintongyong', 'lxty', '21.23', 66281.4, 0.83, NULL, 626854, 79874.5, NULL),
(2679, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 4.79, '603788', 0.43, 11062.4, '汽车配件', 73204.8, '宁波高发', 3420, 4.32, 24.95, 'ningbogaofa', 'nbgf', '42.86', 29877.6, 2.18, NULL, 86835.6, 13680, NULL),
(2680, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 5.45, '603789', 0.35, 20138.5, '农用机械', 105376, '星光农机', 5000, 4.42, 41.23, 'xingguangnongji', 'xgnj', '28.37', 57458.9, 2.87, NULL, 133832, 20000, NULL),
(2681, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 4.82, '603799', 0.027, 223077, '小金属', 544547, '华友钴业', 9100, 2.53, 229.79, 'huayouguye', 'hygy', '36.91', 121737, 2.27, NULL, 935825, 53519, NULL),
(2682, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 9.68, '603806', 0.67, 38912.1, '塑料', 374037, '福斯特', 6000, 2.86, 20.67, 'fusite', 'fst', '47.47', 151183, 3.76, NULL, 433792, 40200, NULL),
(2683, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '深圳', 8.82, '603808', 0.49, 22157.2, '服饰', 120225, '歌力思', 4000, 4.85, 52.05, 'gelisi', 'gls', '32.32', 90781.6, 5.67, NULL, 159574, 16000, NULL),
(2684, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '北京', 4.72, '603818', 0.19, 37315.1, '家居用品', 78302.3, '曲美家居', 6052, 4.16, 62.31, 'qumeijiaju', 'qmjj', '17.99', 57091, 2.36, NULL, 139757, 24206, NULL),
(2685, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '江苏', 8.5, '603828', 0.31, 9557.35, '装修装饰', 197100, '柯利达', 3000, 2.92, 45.41, 'kelida', 'kld', '24.43', 60062.7, 4.85, NULL, 214309, 12378.5, NULL),
(2686, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '广东', 4.45, '603838', 0.23, 10032.6, '陶瓷', 47124.2, '四通股份', 3334, 5.82, 72.1, 'sitonggufen', 'stgf', '16.20', 27323.6, 2.05, NULL, 66654.9, 13334, NULL),
(2687, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '广西', 3.39, '603869', 0.19, 37987, '旅游服务', 37837.1, '北部湾旅', 5406, 4.61, 46.41, 'beibuwanlv', 'bbwl', '30.64', 30624.6, 1.42, NULL, 91713, 21624, NULL),
(2688, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '湖南', 7.86, '603883', 0.54, 18090.8, '医药商业', 244481, '老百姓', 6700, 6.42, 55.95, 'laobaixing', 'lbx', '47.32', 108511, 4.06, NULL, 331427, 26700, NULL),
(2689, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '上海', 5.59, '603885', 1.01, 429684, '空运', 305570, '吉祥航空', 6800, 7.66, 23.51, 'jixianghangkong', 'jxhk', '23.75', 113512, 2, NULL, 1103400, 56800, NULL),
(2690, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 6.23, '603889', 0.514, 32802.1, '纺织', 92124.4, '新澳股份', 4002, 3.1, 18.78, 'xinaogufen', 'xagf', '15.43', 35914.9, 2.24, NULL, 140693, 16002, NULL),
(2691, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '广东', 8.52, '603898', 0.55, 39332.8, '家居用品', 55148.6, '好莱客', 2450, 16.14, 135.99, 'haolaike', 'hlk', '32.79', 42499.3, 4.34, NULL, 101370, 9800, NULL),
(2692, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '上海', 4.25, '603899', 0.46, 62693.4, '文教休闲', 164122, '晨光文具', 6000, 7.24, 34.11, 'chenguangwenju', 'cgwj', '18.23', 73484.3, 1.6, NULL, 255114, 46000, NULL),
(2693, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '浙江', 7.82, '603901', 0.49, 19788.3, '专用机械', 106348, '永创智能', 2500, 5.38, 53.79, 'yongchuangzhineng', 'yczn', '14.61', 46188.3, 4.62, NULL, 129867, 10000, NULL),
(2694, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '上海', 4.85, '603918', 0.003, 5583.08, '软件服务', 64944.1, '金桥信息', 2200, 6.01, 4925.1, 'jinqiaoxinxi', 'jqxx', '30.33', 20950.4, 2.38, NULL, 71570, 8800, NULL),
(2695, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '湖南', 8.77, '603939', 0.6, 15802.1, '医药商业', 172810, '益丰药房', 4000, 5.4, 43.11, 'yifengyaofang', 'yfyf', '29.72', 88311.3, 5.52, NULL, 210719, 16000, NULL),
(2696, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '江苏', 10.24, '603968', 0.81, 58168.1, '化工原料', 103810, '醋化股份', 2556, 4.01, 31.92, 'cuhuagufen', 'chgf', '24.26', 49921.4, 4.88, NULL, 172197, 10224, NULL),
(2697, '2016-06-05 13:22:47', '2016-06-05 13:22:47', '天津', 3.62, '603969', 0.18, 19934.4, '其他建材', 132170, '银龙股份', 10000, 3.48, 36.92, 'yinlonggufen', 'ylgf', '14.41', 67153.4, 1.68, NULL, 165731, 40000, NULL),
(2698, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '北京', 9.15, '603979', 0.45, 75897.7, '建筑施工', 410932, '金诚信', 9500, 2.57, 34.69, 'jinchengxin', 'jcx', '18.26', 181955, 4.85, NULL, 500868, 37500, NULL),
(2699, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '江苏', 7.71, '603988', 0.295, 8398.8, '电气设备', 67825.9, '中电电机', 2000, 4.81, 62.91, 'zhongdiandianji', 'zddj', '78.28', 32804.3, 4.1, NULL, 79996.3, 8000, NULL),
(2700, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '湖南', 8.95, '603989', 0.56, 43998.1, '元器件', 152512, '艾华集团', 5000, 3.71, 37.25, 'aihuajituan', 'ahjt', '37.40', 102641, 5.13, NULL, 204743, 20000, NULL),
(2701, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '河南', 2.76, '603993', 0.09, 450282, '小金属', 1677590, '洛阳钼业', 252132, 4.43, 74.4, 'luoyangmuye', 'lymy', '3.80', 995667, 1.77, NULL, 3247230, 562907, NULL),
(2702, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '浙江', 2.96, '603997', 0.22, 41465.6, '汽车配件', 86004.8, '继峰股份', 6000, 4.87, 34.88, 'jifenggufen', 'jfgf', '19.92', 40594.5, 0.97, NULL, 139216, 42000, NULL),
(2703, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '湖南', 5.94, '603998', 0.336, 14847.2, '化学制药', 63954.8, '方盛制药', 3543.8, 5.18, 45.8, 'fangshengzhiyao', 'fszy', '17.96', 39710.6, 2.8, NULL, 97292.2, 14173.2, NULL),
(2704, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '广东', -2.08, '600656', -0.072, 3.01, '综合类', 2465.43, '*ST博元', 19032.8, 0, 0, '*STboyuan', '*STby', '0.00', 19593.1, 1.03, NULL, 11935.1, 19034.4, NULL),
(2705, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '上海', 2.23, '601872', 0.12, 1797470, '水运', 766540, '招商轮船', 472092, 2.74, 29.04, 'zhaoshanglunchuan', 'zslc', '5.03', 593312, 1.12, NULL, 2994490, 529946, NULL),
(2706, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '浙江', 4.96, '601877', 0.596, 231251, '电气设备', 939995, '正泰电器', 131491, 6.17, 25.7, 'zhengtaidianqi', 'ztdq', '18.90', 182029, 1.38, NULL, 1281320, 131491, NULL),
(2707, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '辽宁', 3.12, '601880', 0.065, 1451880, '港口', 571685, '大连港', 336340, 1.81, 43.7, 'daliangang', 'dlg', '2.85', 611802, 1.38, NULL, 2842980, 442600, NULL),
(2708, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '北京', 4.73, '601886', 0.174, 96417.4, '装修装饰', 1706190, '江河创建', 94128.5, 1.94, 26.42, 'jianghechuangjian', 'jhcj', '10.83', 216588, 1.88, NULL, 1974580, 115405, NULL),
(2709, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '北京', 10.91, '601888', 1.041, 156191, '旅游服务', 1189570, '中国国旅', 97623.8, 4.99, 26.17, 'zhongguoguolv', 'zggl', '43.47', 481147, 4.93, NULL, 1585800, 97623.8, NULL),
(2710, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '江苏', 2.93, '601890', 0.053, 67825.8, '船舶', 276848, '亚星锚链', 95940, 3.58, 99.47, 'yaxingmaolian', 'yxml', '8.94', 138463, 1.44, NULL, 378364, 95940, NULL),
(2711, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '北京', 6.44, '601898', -0.073, 8933480, '煤炭开采', 6798750, '中煤能源', 915200, 1.01, 0, 'zhongmeinengyuan', 'zmny', '4.83', 3714180, 2.8, NULL, 25922200, 1325870, NULL),
(2712, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '福建', 1.28, '601899', 0.062, 2382210, '黄金', 2159980, '紫金矿业', 1580380, 2.79, 28.59, 'zijinkuangye', 'zjky', '3.37', 722887, 0.34, NULL, 7775740, 2154320, NULL),
(2713, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '湖南', 4.08, '601901', 0.355, 25353.6, '证券', 0, '方正证券', 628985, 1.79, 10.25, 'fangzhengzhengquan', 'fzzq', '7.28', 1663460, 2.02, NULL, 17595800, 823210, NULL),
(2714, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '北京', 4.49, '601908', 0.156, 317623, '半导体', 221478, '京运通', 28451.5, 2.68, 38.5, 'jingyuntong', 'jyt', '7.15', 189923, 2.21, NULL, 684418, 85977, NULL),
(2715, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '安徽', 2.26, '601918', -0.352, 1317640, '煤炭开采', 435831, '国投新集', 259054, 4.38, 0, 'guotouxinji', 'gtxj', '4.83', 166260, 0.64, NULL, 3037660, 259054, NULL),
(2716, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '天津', 2.56, '601919', 0.186, 7691200, '水运', 5630740, '中国远洋', 763567, 4.54, 31.32, 'zhongguoyuanyang', 'zgyy', '5.33', 2788600, 2.73, NULL, 15520500, 1021630, NULL),
(2717, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '江苏', 4.21, '601928', 0.258, 308107, '出版业', 969957, '凤凰传媒', 70878.4, 3.19, 26.1, 'fenghuangchuanmei', 'fhcm', '10.57', 284001, 1.12, NULL, 1743130, 254490, NULL),
(2718, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '吉林', 3.69, '601929', 0.14, 366456, '影视音像', 305116, '吉视传媒', 155540, 2.87, 40.28, 'jishichuanmei', 'jscm', '4.24', 194477, 1.25, NULL, 936855, 155540, NULL),
(2719, '2016-06-05 13:22:48', '2016-06-05 13:22:48', '福建', 2.99, '601933', 0.14, 272528, '超市连锁', 1240410, '永辉超市', 307160, 3.26, 37.66, 'yonghuichaoshi', 'yhcs', '5.02', 567416, 1.39, NULL, 1973640, 406754, NULL),
(2720, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 5.21, '601939', 0.528, 14897900, '银行', 0, '建设银行', 959366, 1.14, 5.61, 'jiansheyinxing', 'jsyx', '4.90', 13511800, 0.54, NULL, 1821920000, 25001100, NULL),
(2721, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '陕西', 4.04, '601958', 0.002, 288748, '小金属', 654363, '金钼股份', 322660, 1.76, 2060.36, 'jinmugufen', 'jmgf', '8.48', 674416, 2.09, NULL, 1584060, 322660, NULL),
(2722, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '重庆', 3.72, '601965', 0.11, 131060, '汽车服务', 224885, '中国汽研', 96118, 2.15, 36.12, 'zhongguoqiyan', 'zgqy', '11.68', 141141, 1.47, NULL, 412092, 96118, NULL),
(2723, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '上海', 2.36, '601968', 0.08, 246106, '广告包装', 281716, '宝钢包装', 20833.3, 4.97, 94.71, 'baogangbaozhuang', 'bgbz', '9.80', 75259.7, 0.9, NULL, 556319, 83333.3, NULL),
(2724, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '海南', 2.32, '601969', 0.003, 93597.1, '普钢', 273977, '海南矿业', 18667, 5.88, 2197.39, 'hainankuangye', 'hnky', '12.36', 185412, 0.99, NULL, 550166, 186667, NULL),
(2725, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 2.33, '601985', 0.21, 8588270, '新型电力', 3410820, '中国核电', 389100, 3.5, 25.68, 'zhongguohedian', 'zghd', '7.12', 1289460, 0.83, NULL, 24444200, 1556540, NULL),
(2726, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 3.81, '601988', 0.308, 17011200, '银行', 0, '中国银行', 21076600, 1.11, 6.88, 'zhongguoyinxing', 'zgyx', '3.47', 14022500, 0.48, NULL, 1629860000, 29438800, NULL),
(2727, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 3.24, '601989', 0.01, 3503260, '船舶', 15164600, '中国重工', 1795790, 3.51, 573.85, 'zhongguozhonggong', 'zgzg', '7.37', 2384210, 1.3, NULL, 20787400, 1836170, NULL),
(2728, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 3.33, '601991', 0.154, 15960300, '火力发电', 2664220, '大唐发电', 999436, 1.91, 20.77, 'datangfadian', 'dtfd', '3.85', 1084420, 0.81, NULL, 30404000, 1331000, NULL),
(2729, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 6.59, '601992', 0.219, 1816850, '水泥', 7552690, '金隅股份', 311140, 1.35, 20.25, 'jinyugufen', 'jygf', '4.44', 750667, 1.57, NULL, 11714400, 478464, NULL),
(2730, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '广西', 3.63, '601996', 0.083, 56527.8, '林业', 117329, '丰林集团', 46891.2, 1.86, 40.84, 'fenglinjituan', 'fljt', '9.38', 72104, 1.54, NULL, 201156, 46891.2, NULL),
(2731, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 6.05, '601998', 0.483, 1474800, '银行', 0, '中信银行', 3190520, 1.03, 6.45, 'zhongxinyinxing', 'zxyx', '6.75', 4929600, 1.05, NULL, 456128000, 4678730, NULL),
(2732, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '辽宁', 3.29, '601999', 0.048, 17585.3, '出版业', 220519, '出版传媒', 55091.5, 2.75, 93.82, 'chubanchuanmei', 'cbcm', '11.57', 55926.1, 1.02, NULL, 276573, 55091.5, NULL),
(2733, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '北京', 2.26, '603000', 0.053, 14138.7, '互联网', 239522, '人民网', 110569, 7.77, 166.29, 'renminwang', 'rmw', '17.94', 129785, 1.17, NULL, 351593, 110569, NULL),
(2734, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '浙江', 9.75, '603001', 0.544, 24367.8, '服饰', 384755, '奥康国际', 34113, 2.26, 20.28, 'aokangguoji', 'akgj', '23.57', 192974, 4.81, NULL, 493291, 40098, NULL),
(2735, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '广东', 2.36, '603002', 0.072, 7213.02, '化工原料', 118039, '宏昌电子', 40000, 3.23, 52.94, 'hongchangdianzi', 'hcdz', '6.79', 25379.8, 0.63, NULL, 131109, 40000, NULL),
(2736, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '上海', 3.63, '603003', -0.251, 15531.3, '石油贸易', 209331, '龙宇燃油', 20200, 4.33, 0, 'longyuranyou', 'lyry', '20.81', 34416.1, 1.7, NULL, 232678, 20200, NULL),
(2737, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '江苏', 7.07, '603005', 0.305, 96056, '半导体', 68685.6, '晶方科技', 9963.91, 4.29, 49.78, 'jingfangkeji', 'jfkj', '30.60', 81391.1, 3.59, NULL, 189027, 22669.7, NULL),
(2738, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '上海', 7.28, '603006', 0.359, 29585.2, '汽车配件', 29009.1, '联明股份', 3383.25, 3.3, 33.44, 'lianminggufen', 'lmgf', '32.79', 17618.8, 2.2, NULL, 74406, 8000, NULL),
(2739, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '浙江', 3.83, '603008', 0.178, 76115.2, '家居用品', 116196, '喜临门', 19827.2, 3.03, 32.47, 'xilinmen', 'xlm', '18.30', 46672.6, 1.48, NULL, 297742, 31500, NULL),
(2740, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '上海', 4.15, '603009', 0.21, 28238.2, '汽车配件', 53396.2, '北特科技', 2680.23, 5.81, 57.3, 'beitekeji', 'btkj', '52.68', 13628, 1.28, NULL, 99952.4, 10667, NULL),
(2741, '2016-06-05 13:22:49', '2016-06-05 13:22:49', '浙江', 5.4, '603010', 0.41, 18050.5, '化工原料', 39364.5, '万盛股份', 2500, 5.37, 35.32, 'wanshenggufen', 'wsgf', '40.59', 27871, 2.79, NULL, 68374.7, 10000, NULL),
(2742, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '安徽', 3.15, '603011', 0.07, 22402.2, '机床制造', 69584.6, '合锻股份', 4500, 8.6, 194.21, 'heduangufen', 'hdgf', '11.86', 21402, 1.19, NULL, 100457, 17950, NULL),
(2743, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '上海', 7.21, '603012', 0.28, 16627.4, '专用机械', 252213, '创力集团', 7960, 2.36, 34.47, 'chuanglijituan', 'cljt', '10.71', 117737, 3.7, NULL, 304256, 31828, NULL),
(2744, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '浙江', 5.21, '603015', 0.26, 4400.99, '电气设备', 100884, '弘讯科技', 5010, 3.37, 37.45, 'hongxunkeji', 'hxkj', '12.72', 61616.4, 3.08, NULL, 119769, 20010, NULL),
(2745, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '江苏', 7.11, '603017', 0.39, 2659.8, '建筑施工', 63598.7, '中衡设计', 3000, 8.23, 77.38, 'zhonghengsheji', 'zhsj', '21.87', 54040.6, 4.42, NULL, 104109, 12234, NULL),
(2746, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '江苏', 15.95, '603018', 0.717, 36528.2, '建筑施工', 255660, '设计股份', 2600, 3.33, 37.05, 'shejigufen', 'sjgf', '35.49', 93581.3, 9, NULL, 330226, 10400, NULL),
(2747, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '天津', 3.98, '603019', 0.12, 73759.5, '电脑设备', 183580, '中科曙光', 7500, 11.53, 190.8, 'zhongkeshuguang', 'zksg', '27.64', 39481.4, 1.32, NULL, 309939, 30000, NULL),
(2748, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '上海', 10.55, '603020', 0.73, 13045.5, '食品', 170429, '爱普股份', 4000, 3.96, 32.92, 'aipugufen', 'apgf', '20.61', 97064.9, 6.07, NULL, 192531, 16000, NULL),
(2749, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '山东', 6.54, '603021', 0.32, 48034.2, '玻璃', 54518.6, '山东华鹏', 2640, 6.79, 83.17, 'shandonghuapeng', 'sdhp', '51.73', 21148.7, 2.01, NULL, 171395, 10540, NULL),
(2750, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '上海', 6.82, '603022', 0.31, 4631.12, '广告包装', 49755.1, '新通联', 2000, 5.07, 70.23, 'xintonglian', 'xtl', '23.22', 25474.8, 3.18, NULL, 69825.8, 8000, NULL),
(2751, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '黑龙江', 5.1, '603023', 0.49, 1748.39, '汽车配件', 42531.9, '威帝股份', 2000, 6.16, 40.88, 'weidigufen', 'wdgf', '15.14', 22662, 2.83, NULL, 44784.2, 8000, NULL),
(2752, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '北京', 3.08, '603025', 0.25, 19081.2, '电脑设备', 118234, '大豪科技', 5100, 7.77, 52.66, 'dahaokeji', 'dhkj', '39.14', 46907.1, 1.05, NULL, 149613, 44700, NULL),
(2753, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '山东', 6.54, '603026', 0.22, 117999, '化工原料', 101306, '石大胜华', 5068, 2.47, 46.04, 'shidashenghua', 'sdsh', '42.31', 41812.1, 2.06, NULL, 242411, 20268, NULL),
(2754, '2016-06-05 13:22:50', '2016-06-05 13:22:50', '上海', 4.95, '603030', 0.16, 1975.65, '装修装饰', 185549, '全筑股份', 4000, 3.91, 74.98, 'quanzhugufen', 'qzgf', '31.10', 34780.4, 2.17, NULL, 203107, 16000, NULL),
(2755, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '江苏', 6.93, '603066', 0.33, 9899.2, '专用机械', 71669.6, '音飞储存', 2500, 3.93, 54.43, 'yinfeichucun', 'yfcc', '55.92', 37175.4, 3.72, NULL, 86909.9, 10000, NULL),
(2756, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '四川', 1.87, '603077', 0.041, 291000, '化工原料', 271152, 'XR和邦生', 185410, 3.36, 76.11, 'XRhebangsheng', 'XRhbs', '5.18', 326631, 0.99, NULL, 1030650, 331224, NULL),
(2757, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '浙江', 3.86, '603085', 0.22, 7664.77, '专用机械', 39483.4, '天成自控', 2500, 7.24, 84.79, 'tianchengzikong', 'tczk', '38.93', 14228.1, 1.42, NULL, 58572.5, 10000, NULL),
(2758, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '浙江', 5.62, '603088', 0.187, 15011.2, '专用机械', 31900.5, '宁波精达', 2000, 6.55, 98.36, 'ningbojingda', 'nbjd', '53.91', 23585, 2.95, NULL, 57482.1, 8000, NULL),
(2759, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '吉林', 2.86, '603099', -0.013, 18027.4, '旅游服务', 43034.3, '长白山', 10267, 6.04, 0, 'zhangbaishan', 'zbs', '20.10', 28555.8, 1.07, NULL, 80642.9, 26667, NULL),
(2760, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '重庆', 4.45, '603100', 0.186, 44064.9, '电器仪表', 298415, '川仪股份', 23138.1, 2.63, 31.46, 'chuanyigufen', 'cygf', '16.00', 70549.5, 1.79, NULL, 402140, 39500, NULL),
(2761, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '上海', 9.22, '603108', 0.48, 26445.2, '医药商业', 124070, '润达医疗', 2360, 5.42, 66.51, 'rundayiliao', 'rdyl', '32.44', 43876.6, 4.66, NULL, 159362, 9412.62, NULL),
(2762, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '江苏', 3.69, '603111', 0.316, 18526.6, '运输设备', 173945, '康尼机电', 14830, 10.46, 61.11, 'kangnijidian', 'knjd', '14.70', 47050.2, 1.59, NULL, 203029, 29535.3, NULL),
(2763, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '浙江', 6.79, '603116', 0.38, 53730.5, '纺织', 245951, '红蜻蜓', 5880, 3.9, 41.13, 'hongqingting', 'hqt', '22.34', 91502.5, 2.24, NULL, 353721, 40880, NULL),
(2764, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '江苏', 3.23, '603117', 0.12, 72540.9, '仓储物流', 290953, '万林股份', 6000, 6.48, 103.64, 'wanlingufen', 'wlgf', '16.95', 41188, 1, NULL, 387927, 41050, NULL),
(2765, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '广东', 7.36, '603118', 0.5, 54181.9, '元器件', 382967, '共进股份', 7500, 3.98, 32.27, 'gongjingufen', 'gjgf', '40.22', 135762, 4.53, NULL, 478223, 30000, NULL),
(2766, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '北京', 5.32, '603123', 0.139, 225227, '百货', 184122, '翠微股份', 30800, 1.57, 29.95, 'cuiweigufen', 'cwgf', '10.70', 172232, 3.29, NULL, 474535, 52414.4, NULL),
(2767, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '天津', 2.14, '603126', 0.067, 56238.7, '环境保护', 174490, '中材节能', 21804, 5.07, 81.4, 'zhongcaijieneng', 'zcjn', '11.04', 7176.16, 0.12, NULL, 301473, 61050, NULL),
(2768, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '上海', 1.74, '603128', 0.077, 25559.8, '仓储物流', 248347, '华贸物流', 80000, 6, 68.12, 'huamaowuliu', 'hmwl', '8.73', 24596.9, 0.31, NULL, 310474, 80000, NULL),
(2769, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '江苏', 6.9, '603158', 0.55, 10407, '汽车配件', 72907.6, '腾龙股份', 2667, 6.77, 48.32, 'tenglonggufen', 'tlgf', '29.65', 33913.1, 3.18, NULL, 92101.9, 10667, NULL),
(2770, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '广西', 2.28, '603166', 0.071, 135190, '汽车配件', 100943, '福达股份', 4350, 13.2, 213.13, 'fudagufen', 'fdgf', '16.22', 17507.2, 0.4, NULL, 283976, 43350, NULL),
(2771, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '山东', 5.71, '603167', 0.215, 330565, '水运', 32794.9, '渤海轮渡', 30451.6, 1.52, 20.26, 'bohailundu', 'bhld', '11.05', 106257, 2.21, NULL, 369030, 48140, NULL),
(2772, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '浙江', 4.9, '603168', 0.521, 29387, '化学制药', 45946, '莎普爱思', 9558.95, 6.98, 32.79, 'shapuaisi', 'spas', '42.13', 29834.5, 1.83, NULL, 94437.3, 16337.5, NULL),
(2773, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '甘肃', 2.01, '603169', 0.695, 216431, '专用机械', 379505, '兰石重装', 16000, 7.41, 10.72, 'lanshizhongzhuang', 'lszz', '13.36', 4457.43, 0.05, NULL, 621982, 94584.8, NULL),
(2774, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '江苏', 4.98, '603188', 0.762, 85028.1, '染料涂料', 228414, '亚邦股份', 14400, 3.95, 12.9, 'yabanggufen', 'ybgf', '18.32', 118114, 2.05, NULL, 361775, 57600, NULL),
(2775, '2016-06-05 13:22:51', '2016-06-05 13:22:51', '安徽', 4.65, '603198', 0.38, 129157, '白酒', 322396, '迎驾贡酒', 8000, 8.34, 55.29, 'yingjiagongjiu', 'yjgj', '21.90', 126307, 1.58, NULL, 471985, 80000, NULL),
(2776, '2016-06-05 13:22:52', '2016-06-05 13:22:52', '安徽', 7.82, '603199', 0.42, 68251.9, '旅游服务', 16909.8, '九华旅游', 2768, 6.55, 70.12, 'jiuhualvyou', 'jhly', '40.82', 33329.4, 3.01, NULL, 100793, 11068, NULL),
(2777, '2016-06-05 13:22:52', '2016-06-05 13:22:52', '浙江', 4.32, '603222', 0.15, 17034.8, '化学制药', 48895.6, '济民制药', 4000, 4.25, 65.66, 'jiminzhiyao', 'jmzy', '16.95', 35974, 2.25, NULL, 77536.4, 16000, NULL),
(2778, '2016-06-05 13:22:52', '2016-06-05 13:22:52', '山东', 4.63, '603223', 0.18, 32096.4, '公路', 45796.1, '恒通股份', 3000, 6.5, 113.25, 'hengtonggufen', 'htgf', '33.53', 28106.4, 2.34, NULL, 97180.8, 12000, NULL),
(2779, '2016-06-05 13:22:52', '2016-06-05 13:22:52', '新疆', 3.62, '603227', 0.26, 36159.7, '化工原料', 139425, '雪峰科技', 8235, 6.35, 53.76, 'xuefengkeji', 'xfkj', '8.32', 65589, 1.99, NULL, 249607, 32935, NULL),
(2780, '2016-06-05 13:22:52', '2016-06-05 13:22:52', '广东', 5.88, '603268', 0.25, 10018.8, '陶瓷', 44291.2, '松发股份', 2200, 5.52, 74.47, 'songfagufen', 'sfgf', '53.26', 24349, 2.77, NULL, 60683.3, 8800, NULL),
(2781, '2016-09-15 11:05:30', '2016-09-15 11:05:30', '1', 0, '603569', 0, 0, '1', 0, '长久物流', 0, 0, 1, 'zhangjiuwuliu', 'zjwl', '44.48', 0, 0, NULL, 0, 0, NULL),
(2782, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600001', 0, 0, NULL, 0, '邯郸钢铁', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2783, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600002', 0, 0, NULL, 0, '齐鲁石化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2784, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600003', 0, 0, NULL, 0, 'ST东北高', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2785, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600025', 0, 0, NULL, 0, '华能水电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2786, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600065', 0, 0, NULL, 0, '*ST联谊', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2787, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600087', 0, 0, NULL, 0, '退市长油', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2788, '2018-05-21 08:52:21', '2018-05-21 08:52:21', NULL, 0, '600092', 0, 0, NULL, 0, 'S*ST精密', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2789, '2018-05-21 08:52:22', '2018-05-21 08:52:22', NULL, 0, '600102', 0, 0, NULL, 0, '莱钢股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2790, '2018-05-21 08:52:22', '2018-05-21 08:52:22', NULL, 0, '600181', 0, 0, NULL, 0, 'S*ST云大', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2791, '2018-05-21 08:52:22', '2018-05-21 08:52:22', NULL, 0, '600205', 0, 0, NULL, 0, 'S山东铝', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2792, '2018-05-21 08:52:23', '2018-05-21 08:52:23', NULL, 0, '600253', 0, 0, NULL, 0, '天方药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2793, '2018-05-21 08:52:23', '2018-05-21 08:52:23', NULL, 0, '600263', 0, 0, NULL, 0, '路桥建设', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2794, '2018-05-21 08:52:23', '2018-05-21 08:52:23', NULL, 0, '600286', 0, 0, NULL, 0, 'S*ST国瓷', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2795, '2018-05-21 08:52:23', '2018-05-21 08:52:23', NULL, 0, '600296', 0, 0, NULL, 0, 'S兰铝', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2796, '2018-05-21 08:52:24', '2018-05-21 08:52:24', NULL, 0, '600349', 0, 0, NULL, 0, '富通昭和', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2797, '2018-05-21 08:52:24', '2018-05-21 08:52:24', NULL, 0, '600357', 0, 0, NULL, 0, '承德钒钛', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2798, '2018-05-21 08:52:25', '2018-05-21 08:52:25', NULL, 0, '600472', 0, 0, NULL, 0, '包头铝业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2799, '2018-05-21 08:52:25', '2018-05-21 08:52:25', NULL, 0, '600553', 0, 0, NULL, 0, '太行水泥', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2800, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600591', 0, 0, NULL, 0, '*ST上航', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2801, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600607', 0, 0, NULL, 0, '上实医药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2802, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600625', 0, 0, NULL, 0, 'PT水仙', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2803, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600627', 0, 0, NULL, 0, '上电股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2804, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600631', 0, 0, NULL, 0, '百联股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2805, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600632', 0, 0, NULL, 0, '华联商厦', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2806, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600646', 0, 0, NULL, 0, 'ST国嘉', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2807, '2018-05-21 08:52:26', '2018-05-21 08:52:26', NULL, 0, '600659', 0, 0, NULL, 0, '*ST花雕', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2808, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600669', 0, 0, NULL, 0, '*ST鞍成', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2809, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600670', 0, 0, NULL, 0, '*ST斯达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2810, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600672', 0, 0, NULL, 0, '*ST华圣', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2811, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600700', 0, 0, NULL, 0, '*ST数码', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2812, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600709', 0, 0, NULL, 0, 'ST生态', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2813, '2018-05-21 08:52:27', '2018-05-21 08:52:27', NULL, 0, '600752', 0, 0, NULL, 0, '*ST哈慈', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2814, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600762', 0, 0, NULL, 0, 'S*ST金荔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2815, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600772', 0, 0, NULL, 0, 'S*ST龙昌', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2816, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600786', 0, 0, NULL, 0, '东方锅炉', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2817, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600788', 0, 0, NULL, 0, '*ST达曼', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2818, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600799', 0, 0, NULL, 0, '*ST龙科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2819, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600813', 0, 0, NULL, 0, 'ST鞍一工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2820, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600832', 0, 0, NULL, 0, '东方明珠', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2821, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600840', 0, 0, NULL, 0, '新湖创业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2822, '2018-05-21 08:52:28', '2018-05-21 08:52:28', NULL, 0, '600842', 0, 0, NULL, 0, '中西药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2823, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600849', 0, 0, NULL, 0, '上药转换', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2824, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600852', 0, 0, NULL, 0, '*ST中川', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2825, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600878', 0, 0, NULL, 0, '*ST北科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2826, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600899', 0, 0, NULL, 0, '*ST信联', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2827, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600901', 0, 0, NULL, 0, '江苏租赁', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2828, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600903', 0, 0, NULL, 0, '贵州燃气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2829, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600908', 0, 0, NULL, 0, '无锡银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2830, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600909', 0, 0, NULL, 0, '华安证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2831, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600919', 0, 0, NULL, 0, '江苏银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2832, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600926', 0, 0, NULL, 0, '杭州银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2833, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600929', 0, 0, NULL, 0, '湖南盐业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2834, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600933', 0, 0, NULL, 0, '爱柯迪', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2835, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600936', 0, 0, NULL, 0, '广西广电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2836, '2018-05-21 08:52:29', '2018-05-21 08:52:29', NULL, 0, '600939', 0, 0, NULL, 0, '重庆建工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2837, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '600977', 0, 0, NULL, 0, '中国电影', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2838, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '600991', 0, 0, NULL, 0, '广汽长丰', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2839, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '600996', 0, 0, NULL, 0, '贵广网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2840, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601019', 0, 0, NULL, 0, '山东出版', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2841, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601020', 0, 0, NULL, 0, '华钰矿业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2842, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601086', 0, 0, NULL, 0, '国芳集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2843, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601108', 0, 0, NULL, 0, '财通证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2844, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601127', 0, 0, NULL, 0, '小康股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2845, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601128', 0, 0, NULL, 0, '常熟银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2846, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601138', 0, 0, NULL, 0, '工业富联', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2847, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601155', 0, 0, NULL, 0, 'XD新城控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2848, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601163', 0, 0, NULL, 0, '三角轮胎', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2849, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601200', 0, 0, NULL, 0, '上海环境', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2850, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601206', 0, 0, NULL, 0, '海尔施', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2851, '2018-05-21 08:52:30', '2018-05-21 08:52:30', NULL, 0, '601212', 0, 0, NULL, 0, '白银有色', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2852, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601228', 0, 0, NULL, 0, '广州港', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2853, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601229', 0, 0, NULL, 0, '上海银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2854, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601268', 0, 0, NULL, 0, '*ST二重', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2855, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601299', 0, 0, NULL, 0, '中国北车', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2856, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601326', 0, 0, NULL, 0, '秦港股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2857, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601330', 0, 0, NULL, 0, '绿色动力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2858, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601360', 0, 0, NULL, 0, '三六零', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(2859, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601366', 0, 0, NULL, 0, '利群股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2860, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601375', 0, 0, NULL, 0, '中原证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2861, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601500', 0, 0, NULL, 0, '通用股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2862, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601595', 0, 0, NULL, 0, '上海电影', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2863, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601611', 0, 0, NULL, 0, '中国核建', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2864, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601619', 0, 0, NULL, 0, '嘉泽新能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2865, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601811', 0, 0, NULL, 0, '新华文轩', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2866, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601828', 0, 0, NULL, 0, '美凯龙', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2867, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601838', 0, 0, NULL, 0, '成都银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2868, '2018-05-21 08:52:31', '2018-05-21 08:52:31', NULL, 0, '601858', 0, 0, NULL, 0, '中国科传', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2869, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601878', 0, 0, NULL, 0, '浙商证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2870, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601881', 0, 0, NULL, 0, '中国银河', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2871, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601882', 0, 0, NULL, 0, '海天精工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2872, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601900', 0, 0, NULL, 0, '南方传媒', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2873, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601949', 0, 0, NULL, 0, '中国出版', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2874, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601952', 0, 0, NULL, 0, '苏垦农发', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2875, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601966', 0, 0, NULL, 0, '玲珑轮胎', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2876, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601990', 0, 0, NULL, 0, '南京证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2877, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '601997', 0, 0, NULL, 0, '贵阳银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2878, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603007', 0, 0, NULL, 0, '花王股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2879, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603013', 0, 0, NULL, 0, '亚普股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2880, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603016', 0, 0, NULL, 0, '新宏泰', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2881, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603027', 0, 0, NULL, 0, '千禾味业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2882, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603028', 0, 0, NULL, 0, '赛福天', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2883, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603029', 0, 0, NULL, 0, '天鹅股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2884, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603031', 0, 0, NULL, 0, '安德利', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2885, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603032', 0, 0, NULL, 0, '德新交运', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2886, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603033', 0, 0, NULL, 0, 'XD三维股', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2887, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603035', 0, 0, NULL, 0, '常熟汽饰', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2888, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603036', 0, 0, NULL, 0, '如通股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2889, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603037', 0, 0, NULL, 0, '凯众股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2890, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603038', 0, 0, NULL, 0, '华立股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2891, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603039', 0, 0, NULL, 0, '泛微网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2892, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603040', 0, 0, NULL, 0, '新坐标', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2893, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603041', 0, 0, NULL, 0, '美思德', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2894, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603042', 0, 0, NULL, 0, '华脉科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2895, '2018-05-21 08:52:32', '2018-05-21 08:52:32', NULL, 0, '603043', 0, 0, NULL, 0, '广州酒家', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2896, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603045', 0, 0, NULL, 0, '福达合金', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2897, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603050', 0, 0, NULL, 0, '科林电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2898, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603055', 0, 0, NULL, 0, '台华新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2899, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603056', 0, 0, NULL, 0, '德邦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2900, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603058', 0, 0, NULL, 0, '永吉股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2901, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603059', 0, 0, NULL, 0, '倍加洁', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2902, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603060', 0, 0, NULL, 0, '国检集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2903, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603063', 0, 0, NULL, 0, '禾望电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2904, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603067', 0, 0, NULL, 0, '振华股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2905, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603069', 0, 0, NULL, 0, '海汽集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2906, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603076', 0, 0, NULL, 0, '乐惠国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2907, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603078', 0, 0, NULL, 0, '江化微', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2908, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603079', 0, 0, NULL, 0, '圣达生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2909, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603080', 0, 0, NULL, 0, '新疆火炬', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2910, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603081', 0, 0, NULL, 0, '大丰实业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2911, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603083', 0, 0, NULL, 0, '剑桥科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2912, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603086', 0, 0, NULL, 0, '先达股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2913, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603089', 0, 0, NULL, 0, '正裕工业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2914, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603090', 0, 0, NULL, 0, '宏盛股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2915, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603096', 0, 0, NULL, 0, '新经典', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2916, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603098', 0, 0, NULL, 0, '森特股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2917, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603101', 0, 0, NULL, 0, '汇嘉时代', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2918, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603103', 0, 0, NULL, 0, '横店影视', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2919, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603106', 0, 0, NULL, 0, '恒银金融', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2920, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603110', 0, 0, NULL, 0, '东方材料', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2921, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603113', 0, 0, NULL, 0, '金能科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2922, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603127', 0, 0, NULL, 0, '昭衍新药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2923, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603129', 0, 0, NULL, 0, '春风动力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2924, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603131', 0, 0, NULL, 0, '上海沪工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2925, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603133', 0, 0, NULL, 0, '碳元科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2926, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603136', 0, 0, NULL, 0, '天目湖', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2927, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603138', 0, 0, NULL, 0, '海量数据', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2928, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603139', 0, 0, NULL, 0, '康惠制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2929, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603156', 0, 0, NULL, 0, '养元饮品', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2930, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603157', 0, 0, NULL, 0, '拉夏贝尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2931, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603159', 0, 0, NULL, 0, '上海亚虹', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2932, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603160', 0, 0, NULL, 0, '汇顶科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2933, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603161', 0, 0, NULL, 0, '科华控股', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2934, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603165', 0, 0, NULL, 0, '荣晟环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2935, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603177', 0, 0, NULL, 0, '德创环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2936, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603178', 0, 0, NULL, 0, '圣龙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2937, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603179', 0, 0, NULL, 0, '新泉股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2938, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603180', 0, 0, NULL, 0, '金牌厨柜', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2939, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603181', 0, 0, NULL, 0, '皇马科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2940, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603183', 0, 0, NULL, 0, '建研院', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2941, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603186', 0, 0, NULL, 0, '华正新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2942, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603189', 0, 0, NULL, 0, '网达软件', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2943, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603196', 0, 0, NULL, 0, '日播时尚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2944, '2018-05-21 08:52:33', '2018-05-21 08:52:33', NULL, 0, '603197', 0, 0, NULL, 0, '保隆科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2945, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603200', 0, 0, NULL, 0, '上海洗霸', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2946, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603203', 0, 0, NULL, 0, '快克股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2947, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603208', 0, 0, NULL, 0, '江山欧派', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2948, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603214', 0, 0, NULL, 0, '爱婴室', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2949, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603218', 0, 0, NULL, 0, '日月股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2950, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603225', 0, 0, NULL, 0, '新凤鸣', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2951, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603226', 0, 0, NULL, 0, '菲林格尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2952, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603228', 0, 0, NULL, 0, '景旺电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2953, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603229', 0, 0, NULL, 0, '奥翔药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2954, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603232', 0, 0, NULL, 0, '格尔软件', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2955, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603233', 0, 0, NULL, 0, '大参林', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2956, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603238', 0, 0, NULL, 0, '诺邦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2957, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603239', 0, 0, NULL, 0, '浙江仙通', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2958, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603258', 0, 0, NULL, 0, '电魂网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2959, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603259', 0, 0, NULL, 0, '药明康德', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2960, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603260', 0, 0, NULL, 0, '合盛硅业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2961, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603266', 0, 0, NULL, 0, '天龙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2962, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603269', 0, 0, NULL, 0, '海鸥股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2963, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603277', 0, 0, NULL, 0, '银都股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2964, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603278', 0, 0, NULL, 0, '大业股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2965, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603283', 0, 0, NULL, 0, '赛腾股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2966, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603286', 0, 0, NULL, 0, '日盈电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2967, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603289', 0, 0, NULL, 0, '泰瑞机器', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2968, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603298', 0, 0, NULL, 0, '杭叉集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2969, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603299', 0, 0, NULL, 0, '井神股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2970, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603301', 0, 0, NULL, 0, '振德医疗', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2971, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603302', 0, 0, NULL, 0, '鑫广绿环', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2972, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603303', 0, 0, NULL, 0, '得邦照明', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2973, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603305', 0, 0, NULL, 0, '旭升股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2974, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603313', 0, 0, NULL, 0, '梦百合', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2975, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603316', 0, 0, NULL, 0, '诚邦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2976, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603319', 0, 0, NULL, 0, '湘油泵', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2977, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603320', 0, 0, NULL, 0, '迪贝电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2978, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603321', 0, 0, NULL, 0, '梅轮电梯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2979, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603322', 0, 0, NULL, 0, '超讯通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2980, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603323', 0, 0, NULL, 0, '吴江银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2981, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603326', 0, 0, NULL, 0, '我乐家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2982, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603329', 0, 0, NULL, 0, '上海雅仕', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2983, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603330', 0, 0, NULL, 0, '上海天洋', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2984, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603331', 0, 0, NULL, 0, '百达精工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2985, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603335', 0, 0, NULL, 0, '迪生力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2986, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603336', 0, 0, NULL, 0, '宏辉果蔬', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2987, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603337', 0, 0, NULL, 0, '杰克股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2988, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603339', 0, 0, NULL, 0, '四方冷链', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2989, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603345', 0, 0, NULL, 0, '安井食品', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2990, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603348', 0, 0, NULL, 0, '文灿股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2991, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603356', 0, 0, NULL, 0, '华菱精工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2992, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603357', 0, 0, NULL, 0, '设计总院', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2993, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603358', 0, 0, NULL, 0, '华达科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2994, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603359', 0, 0, NULL, 0, '东珠景观', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2995, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603360', 0, 0, NULL, 0, '百傲化学', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2996, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603363', 0, 0, NULL, 0, '傲农生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2997, '2018-05-21 08:52:34', '2018-05-21 08:52:34', NULL, 0, '603365', 0, 0, NULL, 0, '水星家纺', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2998, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603367', 0, 0, NULL, 0, '辰欣药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(2999, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603377', 0, 0, NULL, 0, '东方时尚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3000, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603378', 0, 0, NULL, 0, '亚士创能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3001, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603380', 0, 0, NULL, 0, '易德龙', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3002, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603383', 0, 0, NULL, 0, '顶点软件', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3003, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603385', 0, 0, NULL, 0, '惠达卫浴', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3004, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603386', 0, 0, NULL, 0, '广东骏亚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3005, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603387', 0, 0, NULL, 0, '基蛋生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3006, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603388', 0, 0, NULL, 0, '元成股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3007, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603389', 0, 0, NULL, 0, '亚振家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3008, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603393', 0, 0, NULL, 0, '新天然气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3009, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603396', 0, 0, NULL, 0, '金辰股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3010, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603398', 0, 0, NULL, 0, '邦宝益智', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3011, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603416', 0, 0, NULL, 0, '信捷电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3012, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603421', 0, 0, NULL, 0, '鼎信通讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3013, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603429', 0, 0, NULL, 0, '集友股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3014, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603444', 0, 0, NULL, 0, '吉比特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3015, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603458', 0, 0, NULL, 0, '勘设股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3016, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603466', 0, 0, NULL, 0, '风语筑', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3017, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603477', 0, 0, NULL, 0, '振静股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3018, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603486', 0, 0, NULL, 0, '科沃斯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3019, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603488', 0, 0, NULL, 0, '展鹏科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3020, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603496', 0, 0, NULL, 0, '恒为科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3021, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603499', 0, 0, NULL, 0, '翔港科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3022, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603500', 0, 0, NULL, 0, '祥和实业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3023, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603501', 0, 0, NULL, 0, '韦尔股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3024, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603505', 0, 0, NULL, 0, '金石资源', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3025, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603506', 0, 0, NULL, 0, '南都物业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3026, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603507', 0, 0, NULL, 0, '振江股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3027, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603508', 0, 0, NULL, 0, '思维列控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3028, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603515', 0, 0, NULL, 0, '欧普照明', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3029, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603516', 0, 0, NULL, 0, '淳中科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3030, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603517', 0, 0, NULL, 0, '绝味食品', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3031, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603520', 0, 0, NULL, 0, '司太立', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3032, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603527', 0, 0, NULL, 0, '众源新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3033, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603528', 0, 0, NULL, 0, '多伦科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3034, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603533', 0, 0, NULL, 0, '掌阅科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3035, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603535', 0, 0, NULL, 0, '嘉诚国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3036, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603536', 0, 0, NULL, 0, '惠发股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3037, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603538', 0, 0, NULL, 0, '美诺华', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3038, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603556', 0, 0, NULL, 0, '海兴电力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3039, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603557', 0, 0, NULL, 0, '起步股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3040, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603559', 0, 0, NULL, 0, '中通国脉', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3041, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603577', 0, 0, NULL, 0, '汇金通', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3042, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603578', 0, 0, NULL, 0, '三星新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3043, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603579', 0, 0, NULL, 0, '荣泰健康', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3044, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603580', 0, 0, NULL, 0, '艾艾精工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3045, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603585', 0, 0, NULL, 0, '苏利股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3046, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603586', 0, 0, NULL, 0, '金麒麟', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3047, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603587', 0, 0, NULL, 0, '地素时尚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3048, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603595', 0, 0, NULL, 0, '东尼电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3049, '2018-05-21 08:52:35', '2018-05-21 08:52:35', NULL, 0, '603596', 0, 0, NULL, 0, '伯特利', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3050, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603602', 0, 0, NULL, 0, '纵横通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3051, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603603', 0, 0, NULL, 0, '博天环境', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3052, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603605', 0, 0, NULL, 0, '珀莱雅', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3053, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603607', 0, 0, NULL, 0, '京华激光', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3054, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603608', 0, 0, NULL, 0, '天创时尚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3055, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603612', 0, 0, NULL, 0, '索通发展', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3056, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603615', 0, 0, NULL, 0, '茶花股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3057, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603617', 0, 0, NULL, 0, '君禾股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3058, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603619', 0, 0, NULL, 0, '中曼石油', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3059, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603626', 0, 0, NULL, 0, '科森科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3060, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603628', 0, 0, NULL, 0, '清源股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3061, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603630', 0, 0, NULL, 0, '拉芳家化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3062, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603633', 0, 0, NULL, 0, '徕木股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3063, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603637', 0, 0, NULL, 0, '镇海股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3064, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603638', 0, 0, NULL, 0, '艾迪精密', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3065, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603639', 0, 0, NULL, 0, '海利尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3066, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603648', 0, 0, NULL, 0, '畅联股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3067, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603655', 0, 0, NULL, 0, '朗博科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3068, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603656', 0, 0, NULL, 0, '泰禾光电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3069, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603658', 0, 0, NULL, 0, '安图生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3070, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603659', 0, 0, NULL, 0, '璞泰来', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3071, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603660', 0, 0, NULL, 0, '苏州科达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3072, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603661', 0, 0, NULL, 0, '恒林股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3073, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603663', 0, 0, NULL, 0, 'XD三祥新', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3074, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603665', 0, 0, NULL, 0, '康隆达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3075, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603667', 0, 0, NULL, 0, '五洲新春', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3076, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603668', 0, 0, NULL, 0, '天马科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3077, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603676', 0, 0, NULL, 0, '卫信康', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3078, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603677', 0, 0, NULL, 0, '奇精机械', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3079, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603679', 0, 0, NULL, 0, '华体科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3080, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603680', 0, 0, NULL, 0, '今创集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3081, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603683', 0, 0, NULL, 0, '晶华新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3082, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603685', 0, 0, NULL, 0, '晨丰科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3083, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603689', 0, 0, NULL, 0, '皖天然气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3084, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603690', 0, 0, NULL, 0, '至纯科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3085, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603696', 0, 0, NULL, 0, '安记食品', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3086, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603701', 0, 0, NULL, 0, '德宏股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3087, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603707', 0, 0, NULL, 0, '健友股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3088, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603708', 0, 0, NULL, 0, '家家悦', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3089, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603709', 0, 0, NULL, 0, '中源家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3090, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603711', 0, 0, NULL, 0, '香飘飘', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3091, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603712', 0, 0, NULL, 0, '七一二', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3092, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603716', 0, 0, NULL, 0, '塞力斯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3093, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603717', 0, 0, NULL, 0, '天域生态', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3094, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603721', 0, 0, NULL, 0, '中广天择', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3095, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603722', 0, 0, NULL, 0, '阿科力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3096, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603725', 0, 0, NULL, 0, '天安新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3097, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603726', 0, 0, NULL, 0, '朗迪集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3098, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603727', 0, 0, NULL, 0, '博迈科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3099, '2018-05-21 08:52:36', '2018-05-21 08:52:36', NULL, 0, '603728', 0, 0, NULL, 0, '鸣志电器', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3100, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603730', 0, 0, NULL, 0, '岱美股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3101, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603733', 0, 0, NULL, 0, '仙鹤股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3102, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603737', 0, 0, NULL, 0, '三棵树', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3103, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603738', 0, 0, NULL, 0, 'DR泰晶科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3104, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603757', 0, 0, NULL, 0, '大元泵业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3105, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603758', 0, 0, NULL, 0, '秦安股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3106, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603767', 0, 0, NULL, 0, '中马传动', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3107, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603768', 0, 0, NULL, 0, '常青股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3108, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603773', 0, 0, NULL, 0, '沃格光电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3109, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603776', 0, 0, NULL, 0, '永安行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3110, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603777', 0, 0, NULL, 0, '来伊份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3111, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603778', 0, 0, NULL, 0, '乾景园林', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3112, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603779', 0, 0, NULL, 0, '威龙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3113, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603787', 0, 0, NULL, 0, '新日股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3114, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603797', 0, 0, NULL, 0, '联泰环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3115, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603798', 0, 0, NULL, 0, '康普顿', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3116, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603800', 0, 0, NULL, 0, '道森股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3117, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603801', 0, 0, NULL, 0, '志邦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3118, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603803', 0, 0, NULL, 0, '瑞斯康达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3119, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603809', 0, 0, NULL, 0, '豪能股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3120, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603811', 0, 0, NULL, 0, '诚意药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3121, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603813', 0, 0, NULL, 0, '原尚股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3122, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603816', 0, 0, NULL, 0, '顾家家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3123, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603817', 0, 0, NULL, 0, '海峡环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3124, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603819', 0, 0, NULL, 0, '神力股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3125, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603822', 0, 0, NULL, 0, '嘉澳环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3126, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603823', 0, 0, NULL, 0, '百合花', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3127, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603825', 0, 0, NULL, 0, '华扬联众', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3128, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603826', 0, 0, NULL, 0, '坤彩科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3129, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603829', 0, 0, NULL, 0, '洛凯股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3130, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603833', 0, 0, NULL, 0, '欧派家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3131, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603839', 0, 0, NULL, 0, '安正时尚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3132, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603843', 0, 0, NULL, 0, '正平股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3133, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603848', 0, 0, NULL, 0, '好太太', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3134, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603855', 0, 0, NULL, 0, '华荣股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3135, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603856', 0, 0, NULL, 0, '东宏股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3136, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603858', 0, 0, NULL, 0, '步长制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3137, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603859', 0, 0, NULL, 0, '能科股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3138, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603860', 0, 0, NULL, 0, '中公高科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3139, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603861', 0, 0, NULL, 0, '白云电器', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3140, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603866', 0, 0, NULL, 0, '桃李面包', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3141, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603868', 0, 0, NULL, 0, '飞科电器', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3142, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603871', 0, 0, NULL, 0, '嘉友国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3143, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603876', 0, 0, NULL, 0, '鼎胜新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3144, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603877', 0, 0, NULL, 0, '太平鸟', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3145, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603878', 0, 0, NULL, 0, '武进不锈', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3146, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603879', 0, 0, NULL, 0, '永悦科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3147, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603880', 0, 0, NULL, 0, '南卫股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3148, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603881', 0, 0, NULL, 0, '数据港', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3149, '2018-05-21 08:52:37', '2018-05-21 08:52:37', NULL, 0, '603882', 0, 0, NULL, 0, '金域医学', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3150, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603886', 0, 0, NULL, 0, '元祖股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3151, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603887', 0, 0, NULL, 0, '城地股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3152, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603888', 0, 0, NULL, 0, '新华网', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3153, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603890', 0, 0, NULL, 0, '春秋电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3154, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603895', 0, 0, NULL, 0, '天永智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3155, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603896', 0, 0, NULL, 0, '寿仙谷', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3156, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603897', 0, 0, NULL, 0, '长城科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3157, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603900', 0, 0, NULL, 0, '莱绅通灵', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3158, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603903', 0, 0, NULL, 0, '中持股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3159, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603906', 0, 0, NULL, 0, '龙蟠科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3160, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603908', 0, 0, NULL, 0, '牧高笛', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3161, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603909', 0, 0, NULL, 0, '合诚股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3162, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603912', 0, 0, NULL, 0, '佳力图', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3163, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603916', 0, 0, NULL, 0, '苏博特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3164, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603917', 0, 0, NULL, 0, '合力科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3165, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603919', 0, 0, NULL, 0, '金徽酒', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3166, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603920', 0, 0, NULL, 0, '世运电路', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3167, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603922', 0, 0, NULL, 0, '金鸿顺', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3168, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603926', 0, 0, NULL, 0, '铁流股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3169, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603928', 0, 0, NULL, 0, '兴业股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3170, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603929', 0, 0, NULL, 0, '亚翔集成', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3171, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603933', 0, 0, NULL, 0, '睿能科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3172, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603936', 0, 0, NULL, 0, '博敏电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3173, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603937', 0, 0, NULL, 0, '丽岛新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3174, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603938', 0, 0, NULL, 0, '三孚股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3175, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603955', 0, 0, NULL, 0, '大千生态', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3176, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603958', 0, 0, NULL, 0, '哈森股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3177, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603959', 0, 0, NULL, 0, '百利科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3178, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603960', 0, 0, NULL, 0, '克来机电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3179, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603963', 0, 0, NULL, 0, '大理药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3180, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603966', 0, 0, NULL, 0, '法兰泰克', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3181, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603970', 0, 0, NULL, 0, '中农立华', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3182, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603976', 0, 0, NULL, 0, '正川股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3183, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603977', 0, 0, NULL, 0, '国泰集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(3184, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603978', 0, 0, NULL, 0, '深圳新星', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3185, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603980', 0, 0, NULL, 0, '吉华集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3186, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603985', 0, 0, NULL, 0, '恒润股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3187, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603986', 0, 0, NULL, 0, 'DR兆易创', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3188, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603987', 0, 0, NULL, 0, '康德莱', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3189, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603990', 0, 0, NULL, 0, '麦迪科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3190, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603991', 0, 0, NULL, 0, '至正股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3191, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603996', 0, 0, NULL, 0, '中新科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3192, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '603999', 0, 0, NULL, 0, '读者传媒', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3193, '2018-05-21 08:52:38', '2018-05-21 08:52:38', NULL, 0, '000003', 0, 0, NULL, 0, 'PT金田A', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3194, '2018-05-21 08:52:39', '2018-05-21 08:52:39', NULL, 0, '000013', 0, 0, NULL, 0, '*ST石化A', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3195, '2018-05-21 08:52:39', '2018-05-21 08:52:39', NULL, 0, '000015', 0, 0, NULL, 0, 'PT中浩A', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3196, '2018-05-21 08:52:39', '2018-05-21 08:52:39', NULL, 0, '000047', 0, 0, NULL, 0, 'ST中侨', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3197, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000405', 0, 0, NULL, 0, 'ST鑫光', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3198, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000406', 0, 0, NULL, 0, '石油大明', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3199, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000412', 0, 0, NULL, 0, 'ST五环', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3200, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000508', 0, 0, NULL, 0, '琼民源A', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3201, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000515', 0, 0, NULL, 0, '攀渝钛业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3202, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000522', 0, 0, NULL, 0, '白云山A', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3203, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000527', 0, 0, NULL, 0, '美的电器', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3204, '2018-05-21 08:52:40', '2018-05-21 08:52:40', NULL, 0, '000535', 0, 0, NULL, 0, '*ST猴王', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3205, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000542', 0, 0, NULL, 0, 'TCL通讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3206, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000549', 0, 0, NULL, 0, 'S湘火炬', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3207, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000556', 0, 0, NULL, 0, 'PT南洋', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3208, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000562', 0, 0, NULL, 0, '宏源证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3209, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000569', 0, 0, NULL, 0, '长城股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3210, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000578', 0, 0, NULL, 0, '盐湖集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3211, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000583', 0, 0, NULL, 0, 'S*ST托普', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3212, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000588', 0, 0, NULL, 0, 'PT粤金曼', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3213, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000594', 0, 0, NULL, 0, '国恒退', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3214, '2018-05-21 08:52:41', '2018-05-21 08:52:41', NULL, 0, '000602', 0, 0, NULL, 0, '金马集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3215, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000618', 0, 0, NULL, 0, '吉林化工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3216, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000621', 0, 0, NULL, 0, '*ST比特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3217, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000653', 0, 0, NULL, 0, 'ST九州', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3218, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000658', 0, 0, NULL, 0, 'ST海洋', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3219, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000660', 0, 0, NULL, 0, '*ST南华', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3220, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000675', 0, 0, NULL, 0, 'ST银山', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3221, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000689', 0, 0, NULL, 0, 'ST宏业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3222, '2018-05-21 08:52:42', '2018-05-21 08:52:42', NULL, 0, '000699', 0, 0, NULL, 0, 'S*ST佳纸', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3223, '2018-05-21 08:52:43', '2018-05-21 08:52:43', NULL, 0, '000730', 0, 0, NULL, 0, '*ST环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3224, '2018-05-21 08:52:43', '2018-05-21 08:52:43', NULL, 0, '000763', 0, 0, NULL, 0, '锦州石化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3225, '2018-05-21 08:52:43', '2018-05-21 08:52:43', NULL, 0, '000765', 0, 0, NULL, 0, '*ST华信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3226, '2018-05-21 08:52:43', '2018-05-21 08:52:43', NULL, 0, '000769', 0, 0, NULL, 0, '*ST大菲', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3227, '2018-05-21 08:52:43', '2018-05-21 08:52:43', NULL, 0, '000787', 0, 0, NULL, 0, '*ST创智', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3228, '2018-05-21 08:52:44', '2018-05-21 08:52:44', NULL, 0, '000805', 0, 0, NULL, 0, '*ST炎黄', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3229, '2018-05-21 08:52:44', '2018-05-21 08:52:44', NULL, 0, '000817', 0, 0, NULL, 0, '辽河油田', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3230, '2018-05-21 08:52:44', '2018-05-21 08:52:44', NULL, 0, '000827', 0, 0, NULL, 0, '*ST长兴', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3231, '2018-05-21 08:52:44', '2018-05-21 08:52:44', NULL, 0, '000832', 0, 0, NULL, 0, '*ST龙涤', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3232, '2018-05-21 08:52:44', '2018-05-21 08:52:44', NULL, 0, '000866', 0, 0, NULL, 0, '扬子石化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3233, '2018-05-21 08:52:45', '2018-05-21 08:52:45', NULL, 0, '000956', 0, 0, NULL, 0, '中原油气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3234, '2018-05-21 08:52:46', '2018-05-21 08:52:46', NULL, 0, '000991', 0, 0, NULL, 0, '通海高科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3235, '2018-05-21 08:52:46', '2018-05-21 08:52:46', NULL, 0, '001965', 0, 0, NULL, 0, '招商公路', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3236, '2018-05-21 08:52:46', '2018-05-21 08:52:46', NULL, 0, '001979', 0, 0, NULL, 0, '招商蛇口', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3237, '2018-05-21 08:52:50', '2018-05-21 08:52:50', NULL, 0, '002257', 0, 0, NULL, 0, '立立电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3238, '2018-05-21 08:52:54', '2018-05-21 08:52:54', NULL, 0, '002525', 0, 0, NULL, 0, '胜景山河', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3239, '2018-05-21 08:52:57', '2018-05-21 08:52:57', NULL, 0, '002710', 0, 0, NULL, 0, '慈铭体检', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3240, '2018-05-21 08:52:57', '2018-05-21 08:52:57', NULL, 0, '002720', 0, 0, NULL, 0, '宏良股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3241, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002774', 0, 0, NULL, 0, '快意电梯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3242, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002777', 0, 0, NULL, 0, '久远银海', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3243, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002778', 0, 0, NULL, 0, '高科石化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3244, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002779', 0, 0, NULL, 0, '中坚科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3245, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002780', 0, 0, NULL, 0, '三夫户外', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3246, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002781', 0, 0, NULL, 0, '奇信股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3247, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002782', 0, 0, NULL, 0, '可立克', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3248, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002783', 0, 0, NULL, 0, '凯龙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3249, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002785', 0, 0, NULL, 0, '万里石', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3250, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002786', 0, 0, NULL, 0, '银宝山新', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3251, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002787', 0, 0, NULL, 0, '华源控股', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3252, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002788', 0, 0, NULL, 0, '鹭燕医药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3253, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002789', 0, 0, NULL, 0, '建艺集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3254, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002790', 0, 0, NULL, 0, '瑞尔特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3255, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002791', 0, 0, NULL, 0, '坚朗五金', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3256, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002792', 0, 0, NULL, 0, '通宇通讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3257, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002793', 0, 0, NULL, 0, '东音股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3258, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002795', 0, 0, NULL, 0, '永和智控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3259, '2018-05-21 08:52:58', '2018-05-21 08:52:58', NULL, 0, '002796', 0, 0, NULL, 0, '世嘉科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3260, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002797', 0, 0, NULL, 0, '第一创业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3261, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002798', 0, 0, NULL, 0, '帝欧家居', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3262, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002799', 0, 0, NULL, 0, '环球印务', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3263, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002800', 0, 0, NULL, 0, '天顺股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3264, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002801', 0, 0, NULL, 0, '微光股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3265, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002802', 0, 0, NULL, 0, '洪汇新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3266, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002803', 0, 0, NULL, 0, '吉宏股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3267, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002805', 0, 0, NULL, 0, '丰元股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3268, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002806', 0, 0, NULL, 0, '华锋股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3269, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002807', 0, 0, NULL, 0, '江阴银行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3270, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002808', 0, 0, NULL, 0, '苏州恒久', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3271, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002809', 0, 0, NULL, 0, '红墙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3272, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002810', 0, 0, NULL, 0, '山东赫达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3273, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002811', 0, 0, NULL, 0, '亚泰国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3274, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002812', 0, 0, NULL, 0, '创新股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3275, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002813', 0, 0, NULL, 0, '路畅科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3276, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002815', 0, 0, NULL, 0, '崇达技术', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3277, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002816', 0, 0, NULL, 0, '和科达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3278, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002817', 0, 0, NULL, 0, '黄山胶囊', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3279, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002818', 0, 0, NULL, 0, '富森美', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3280, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002819', 0, 0, NULL, 0, '东方中科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3281, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002820', 0, 0, NULL, 0, '桂发祥', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3282, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002821', 0, 0, NULL, 0, '凯莱英', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3283, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002822', 0, 0, NULL, 0, '中装建设', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3284, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002823', 0, 0, NULL, 0, '凯中精密', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3285, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002824', 0, 0, NULL, 0, '和胜股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3286, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002825', 0, 0, NULL, 0, '纳尔股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3287, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002826', 0, 0, NULL, 0, '易明医药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3288, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002827', 0, 0, NULL, 0, '高争民爆', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3289, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002828', 0, 0, NULL, 0, '贝肯能源', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3290, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002829', 0, 0, NULL, 0, '星网宇达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3291, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002830', 0, 0, NULL, 0, '名雕股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3292, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002831', 0, 0, NULL, 0, '裕同科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3293, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002832', 0, 0, NULL, 0, '比音勒芬', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3294, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002833', 0, 0, NULL, 0, '弘亚数控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3295, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002835', 0, 0, NULL, 0, '同为股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3296, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002836', 0, 0, NULL, 0, '新宏泽', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3297, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002837', 0, 0, NULL, 0, '英维克', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3298, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002838', 0, 0, NULL, 0, '道恩股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3299, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002839', 0, 0, NULL, 0, '张家港行', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3300, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002840', 0, 0, NULL, 0, '华统股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3301, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002841', 0, 0, NULL, 0, '视源股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3302, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002842', 0, 0, NULL, 0, '翔鹭钨业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3303, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002843', 0, 0, NULL, 0, '泰嘉股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3304, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002845', 0, 0, NULL, 0, '同兴达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3305, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002846', 0, 0, NULL, 0, '英联股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3306, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002847', 0, 0, NULL, 0, '盐津铺子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3307, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002848', 0, 0, NULL, 0, '高斯贝尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3308, '2018-05-21 08:52:59', '2018-05-21 08:52:59', NULL, 0, '002849', 0, 0, NULL, 0, '威星智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3309, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002850', 0, 0, NULL, 0, '科达利', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3310, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002851', 0, 0, NULL, 0, '麦格米特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3311, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002852', 0, 0, NULL, 0, '道道全', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3312, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002853', 0, 0, NULL, 0, '皮阿诺', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3313, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002855', 0, 0, NULL, 0, '捷荣技术', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3314, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002856', 0, 0, NULL, 0, '美芝股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3315, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002857', 0, 0, NULL, 0, '三晖电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3316, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002858', 0, 0, NULL, 0, '力盛赛车', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3317, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002859', 0, 0, NULL, 0, '洁美科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3318, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002860', 0, 0, NULL, 0, '星帅尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3319, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002861', 0, 0, NULL, 0, '瀛通通讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3320, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002862', 0, 0, NULL, 0, '实丰文化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3321, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002863', 0, 0, NULL, 0, '今飞凯达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3322, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002864', 0, 0, NULL, 0, '盘龙药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3323, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002865', 0, 0, NULL, 0, '钧达股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3324, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002866', 0, 0, NULL, 0, '传艺科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3325, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002867', 0, 0, NULL, 0, '周大生', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3326, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002868', 0, 0, NULL, 0, '绿康生化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3327, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002869', 0, 0, NULL, 0, '金溢科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3328, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002870', 0, 0, NULL, 0, '香山股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3329, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002871', 0, 0, NULL, 0, '伟隆股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3330, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002872', 0, 0, NULL, 0, '天圣制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3331, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002873', 0, 0, NULL, 0, '新天药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3332, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002875', 0, 0, NULL, 0, '安奈儿', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3333, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002876', 0, 0, NULL, 0, '三利谱', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3334, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002877', 0, 0, NULL, 0, '智能自控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3335, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002878', 0, 0, NULL, 0, '元隆雅图', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3336, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002879', 0, 0, NULL, 0, '长缆科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3337, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002880', 0, 0, NULL, 0, '卫光生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3338, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002881', 0, 0, NULL, 0, '美格智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3339, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002882', 0, 0, NULL, 0, '金龙羽', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3340, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002883', 0, 0, NULL, 0, '中设股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3341, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002884', 0, 0, NULL, 0, '凌霄泵业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3342, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002885', 0, 0, NULL, 0, '京泉华', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3343, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002886', 0, 0, NULL, 0, '沃特股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3344, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002887', 0, 0, NULL, 0, '绿茵生态', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3345, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002888', 0, 0, NULL, 0, '惠威科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3346, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002889', 0, 0, NULL, 0, '东方嘉盛', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3347, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002890', 0, 0, NULL, 0, '弘宇股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3348, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002891', 0, 0, NULL, 0, '中宠股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3349, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002892', 0, 0, NULL, 0, '科力尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3350, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002893', 0, 0, NULL, 0, '华通热力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3351, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002895', 0, 0, NULL, 0, '川恒股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3352, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002896', 0, 0, NULL, 0, '中大力德', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3353, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002897', 0, 0, NULL, 0, '意华股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3354, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002898', 0, 0, NULL, 0, '赛隆药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3355, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002899', 0, 0, NULL, 0, '英派斯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3356, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002900', 0, 0, NULL, 0, '哈三联', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3357, '2018-05-21 08:53:00', '2018-05-21 08:53:00', NULL, 0, '002901', 0, 0, NULL, 0, '大博医疗', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3358, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002902', 0, 0, NULL, 0, '铭普光磁', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3359, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002903', 0, 0, NULL, 0, '宇环数控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3360, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002905', 0, 0, NULL, 0, '金逸影视', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3361, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002906', 0, 0, NULL, 0, '华阳集团', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3362, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002907', 0, 0, NULL, 0, '华森制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3363, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002908', 0, 0, NULL, 0, '德生科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3364, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002909', 0, 0, NULL, 0, '集泰股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3365, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002910', 0, 0, NULL, 0, '庄园牧场', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3366, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002911', 0, 0, NULL, 0, '佛燃股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3367, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002912', 0, 0, NULL, 0, '中新赛克', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3368, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002913', 0, 0, NULL, 0, '奥士康', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3369, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002915', 0, 0, NULL, 0, '中欣氟材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3370, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002916', 0, 0, NULL, 0, '深南电路', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3371, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002917', 0, 0, NULL, 0, '金奥博', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3372, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002918', 0, 0, NULL, 0, '蒙娜丽莎', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3373, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002919', 0, 0, NULL, 0, '名臣健康', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3374, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002920', 0, 0, NULL, 0, '德赛西威', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3375, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002921', 0, 0, NULL, 0, '联诚精密', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3376, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002922', 0, 0, NULL, 0, '伊戈尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3377, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002923', 0, 0, NULL, 0, '润都股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3378, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002925', 0, 0, NULL, 0, '盈趣科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3379, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002926', 0, 0, NULL, 0, '华西证券', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3380, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002927', 0, 0, NULL, 0, '泰永长征', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3381, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002928', 0, 0, NULL, 0, '华夏航空', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3382, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002929', 0, 0, NULL, 0, '润建通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3383, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002930', 0, 0, NULL, 0, '宏川智慧', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3384, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '002931', 0, 0, NULL, 0, '锋龙股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3385, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '031005', 0, 0, NULL, 0, '国安GAC1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3386, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '031007', 0, 0, NULL, 0, '阿胶EJC1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3387, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '038011', 0, 0, NULL, 0, '攀钢AGP1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3388, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '038014', 0, 0, NULL, 0, '钾肥JFP1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3389, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '038015', 0, 0, NULL, 0, '盐湖YHP1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3390, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '038016', 0, 0, NULL, 0, '集琦JQP1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3391, '2018-05-21 08:53:01', '2018-05-21 08:53:01', NULL, 0, '038017', 0, 0, NULL, 0, '深发SFP1', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3392, '2018-05-21 08:53:08', '2018-05-21 08:53:08', NULL, 0, '300361', 0, 0, NULL, 0, '奥赛康', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3393, '2018-05-21 08:53:09', '2018-05-21 08:53:09', NULL, 0, '300454', 0, 0, NULL, 0, '深信服', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3394, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300474', 0, 0, NULL, 0, '景嘉微', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3395, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300484', 0, 0, NULL, 0, '蓝海华腾', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3396, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300490', 0, 0, NULL, 0, '华自科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3397, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300491', 0, 0, NULL, 0, '通合科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3398, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300492', 0, 0, NULL, 0, '山鼎设计', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3399, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300493', 0, 0, NULL, 0, '润欣科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3400, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300494', 0, 0, NULL, 0, '盛天网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3401, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300495', 0, 0, NULL, 0, '美尚生态', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3402, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300496', 0, 0, NULL, 0, '中科创达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3403, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300497', 0, 0, NULL, 0, '富祥股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3404, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300498', 0, 0, NULL, 0, '温氏股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3405, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300499', 0, 0, NULL, 0, '高澜股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3406, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300500', 0, 0, NULL, 0, '启迪设计', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3407, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300501', 0, 0, NULL, 0, '海顺新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3408, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300502', 0, 0, NULL, 0, '新易盛', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3409, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300503', 0, 0, NULL, 0, '昊志机电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3410, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300504', 0, 0, NULL, 0, '天邑股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3411, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300505', 0, 0, NULL, 0, '川金诺', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3412, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300506', 0, 0, NULL, 0, '名家汇', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3413, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300507', 0, 0, NULL, 0, '苏奥传感', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3414, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300508', 0, 0, NULL, 0, '维宏股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3415, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300509', 0, 0, NULL, 0, '新美星', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3416, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300510', 0, 0, NULL, 0, '金冠电气', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3417, '2018-05-21 08:53:10', '2018-05-21 08:53:10', NULL, 0, '300511', 0, 0, NULL, 0, '雪榕生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3418, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300512', 0, 0, NULL, 0, '中亚股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3419, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300513', 0, 0, NULL, 0, '恒泰实达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3420, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300514', 0, 0, NULL, 0, '友讯达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3421, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300515', 0, 0, NULL, 0, '三德科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3422, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300516', 0, 0, NULL, 0, '久之洋', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3423, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300517', 0, 0, NULL, 0, '海波重科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3424, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300518', 0, 0, NULL, 0, '盛讯达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3425, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300519', 0, 0, NULL, 0, '新光药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3426, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300520', 0, 0, NULL, 0, '科大国创', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3427, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300521', 0, 0, NULL, 0, '爱司凯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3428, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300522', 0, 0, NULL, 0, '世名科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3429, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300523', 0, 0, NULL, 0, '辰安科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3430, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300525', 0, 0, NULL, 0, '博思软件', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3431, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300526', 0, 0, NULL, 0, '中潜股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3432, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300527', 0, 0, NULL, 0, '华舟应急', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3433, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300528', 0, 0, NULL, 0, '幸福蓝海', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3434, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300529', 0, 0, NULL, 0, '健帆生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3435, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300530', 0, 0, NULL, 0, '达志科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3436, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300531', 0, 0, NULL, 0, '优博讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3437, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300532', 0, 0, NULL, 0, '今天国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3438, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300533', 0, 0, NULL, 0, '冰川网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3439, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300534', 0, 0, NULL, 0, '陇神戎发', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3440, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300535', 0, 0, NULL, 0, '达威股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3441, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300536', 0, 0, NULL, 0, '农尚环境', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3442, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300537', 0, 0, NULL, 0, '广信材料', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3443, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300538', 0, 0, NULL, 0, '同益股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3444, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300539', 0, 0, NULL, 0, '横河模具', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3445, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300540', 0, 0, NULL, 0, '深冷股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3446, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300541', 0, 0, NULL, 0, '先进数通', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3447, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300542', 0, 0, NULL, 0, '新晨科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3448, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300543', 0, 0, NULL, 0, '朗科智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3449, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300545', 0, 0, NULL, 0, '联得装备', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3450, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300546', 0, 0, NULL, 0, '雄帝科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3451, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300547', 0, 0, NULL, 0, '川环科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3452, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300548', 0, 0, NULL, 0, '博创科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3453, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300549', 0, 0, NULL, 0, '优德精密', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3454, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300550', 0, 0, NULL, 0, '和仁科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3455, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300551', 0, 0, NULL, 0, '古鳌科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3456, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300552', 0, 0, NULL, 0, '万集科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3457, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300553', 0, 0, NULL, 0, '集智股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3458, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300554', 0, 0, NULL, 0, '三超新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3459, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300555', 0, 0, NULL, 0, '路通视信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3460, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300556', 0, 0, NULL, 0, '丝路视觉', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3461, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300557', 0, 0, NULL, 0, '理工光科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3462, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300558', 0, 0, NULL, 0, '贝达药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3463, '2018-05-21 08:53:11', '2018-05-21 08:53:11', NULL, 0, '300559', 0, 0, NULL, 0, '佳发安泰', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3464, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300560', 0, 0, NULL, 0, '中富通', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3465, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300561', 0, 0, NULL, 0, '汇金科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3466, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300562', 0, 0, NULL, 0, '乐心医疗', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3467, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300563', 0, 0, NULL, 0, '神宇股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3468, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300565', 0, 0, NULL, 0, '科信技术', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3469, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300566', 0, 0, NULL, 0, '激智科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3470, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300567', 0, 0, NULL, 0, '精测电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3471, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300568', 0, 0, NULL, 0, '星源材质', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3472, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300569', 0, 0, NULL, 0, '天能重工', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3473, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300570', 0, 0, NULL, 0, '太辰光', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3474, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300571', 0, 0, NULL, 0, '平治信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3475, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300572', 0, 0, NULL, 0, '安车检测', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3476, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300573', 0, 0, NULL, 0, '兴齐眼药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3477, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300575', 0, 0, NULL, 0, '中旗股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3478, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300576', 0, 0, NULL, 0, '容大感光', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3479, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300577', 0, 0, NULL, 0, '开润股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3480, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300578', 0, 0, NULL, 0, '会畅通讯', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3481, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300579', 0, 0, NULL, 0, '数字认证', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3482, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300580', 0, 0, NULL, 0, '贝斯特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3483, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300581', 0, 0, NULL, 0, '晨曦航空', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3484, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300582', 0, 0, NULL, 0, '英飞特', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3485, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300583', 0, 0, NULL, 0, '赛托生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3486, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300584', 0, 0, NULL, 0, '海辰药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3487, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300585', 0, 0, NULL, 0, '奥联电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3488, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300586', 0, 0, NULL, 0, '美联新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3489, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300587', 0, 0, NULL, 0, '天铁股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3490, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300588', 0, 0, NULL, 0, '熙菱信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3491, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300589', 0, 0, NULL, 0, '江龙船艇', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3492, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300590', 0, 0, NULL, 0, '移为通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3493, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300591', 0, 0, NULL, 0, '万里马', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3494, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300592', 0, 0, NULL, 0, '华凯创意', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3495, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300593', 0, 0, NULL, 0, '新雷能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3496, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300595', 0, 0, NULL, 0, '欧普康视', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3497, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300596', 0, 0, NULL, 0, '利安隆', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3498, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300597', 0, 0, NULL, 0, '吉大通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3499, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300598', 0, 0, NULL, 0, '诚迈科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3500, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300599', 0, 0, NULL, 0, '雄塑科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3501, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300600', 0, 0, NULL, 0, '瑞特股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3502, '2018-05-21 08:53:12', '2018-05-21 08:53:12', NULL, 0, '300601', 0, 0, NULL, 0, '康泰生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3503, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300602', 0, 0, NULL, 0, '飞荣达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3504, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300603', 0, 0, NULL, 0, '立昂技术', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3505, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300604', 0, 0, NULL, 0, '长川科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3506, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300605', 0, 0, NULL, 0, '恒锋信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3507, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300606', 0, 0, NULL, 0, '金太阳', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3508, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300607', 0, 0, NULL, 0, '拓斯达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3509, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300608', 0, 0, NULL, 0, '思特奇', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL);
INSERT INTO `stock` (`id`, `addDate`, `lastDate`, `area`, `bvps`, `code`, `eps`, `fixedassets`, `industry`, `liquidassets`, `name`, `outstanding`, `pb`, `pe`, `pinyin`, `pinyinHead`, `price`, `reserved`, `reservedpershare`, `timetomarket`, `totalassets`, `totals`, `catalog_id`) VALUES
(3510, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300609', 0, 0, NULL, 0, '汇纳科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3511, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300610', 0, 0, NULL, 0, '晨化股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3512, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300611', 0, 0, NULL, 0, '美力科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3513, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300612', 0, 0, NULL, 0, '宣亚国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3514, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300613', 0, 0, NULL, 0, '富瀚微', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3515, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300615', 0, 0, NULL, 0, '欣天科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3516, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300616', 0, 0, NULL, 0, '尚品宅配', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3517, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300617', 0, 0, NULL, 0, '安靠智电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3518, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300618', 0, 0, NULL, 0, '寒锐钴业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3519, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300619', 0, 0, NULL, 0, '金银河', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3520, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300620', 0, 0, NULL, 0, '光库科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3521, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300621', 0, 0, NULL, 0, '维业股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3522, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300622', 0, 0, NULL, 0, '博士眼镜', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3523, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300623', 0, 0, NULL, 0, '捷捷微电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3524, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300624', 0, 0, NULL, 0, '万兴科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3525, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300625', 0, 0, NULL, 0, '三雄极光', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3526, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300626', 0, 0, NULL, 0, '华瑞股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3527, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300627', 0, 0, NULL, 0, '华测导航', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3528, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300628', 0, 0, NULL, 0, '亿联网络', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3529, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300629', 0, 0, NULL, 0, '新劲刚', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3530, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300630', 0, 0, NULL, 0, '普利制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3531, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300631', 0, 0, NULL, 0, '久吾高科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3532, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300632', 0, 0, NULL, 0, '光莆股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3533, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300633', 0, 0, NULL, 0, '开立医疗', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3534, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300634', 0, 0, NULL, 0, '彩讯股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3535, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300635', 0, 0, NULL, 0, '达安股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3536, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300636', 0, 0, NULL, 0, '同和药业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3537, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300637', 0, 0, NULL, 0, '扬帆新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3538, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300638', 0, 0, NULL, 0, '广和通', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3539, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300639', 0, 0, NULL, 0, '凯普生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3540, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300640', 0, 0, NULL, 0, '德艺文创', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3541, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300641', 0, 0, NULL, 0, '正丹股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3542, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300642', 0, 0, NULL, 0, '透景生命', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3543, '2018-05-21 08:53:13', '2018-05-21 08:53:13', NULL, 0, '300643', 0, 0, NULL, 0, '万通智控', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3544, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300644', 0, 0, NULL, 0, '南京聚隆', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3545, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300645', 0, 0, NULL, 0, '正元智慧', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3546, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300646', 0, 0, NULL, 0, '侨源气体', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3547, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300647', 0, 0, NULL, 0, '超频三', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3548, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300648', 0, 0, NULL, 0, '星云股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3549, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300649', 0, 0, NULL, 0, '杭州园林', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3550, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300650', 0, 0, NULL, 0, '太龙照明', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3551, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300651', 0, 0, NULL, 0, '金陵体育', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3552, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300652', 0, 0, NULL, 0, '雷迪克', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3553, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300653', 0, 0, NULL, 0, '正海生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3554, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300654', 0, 0, NULL, 0, '世纪天鸿', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3555, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300655', 0, 0, NULL, 0, '晶瑞股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3556, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300656', 0, 0, NULL, 0, '民德电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3557, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300657', 0, 0, NULL, 0, '弘信电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3558, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300658', 0, 0, NULL, 0, '延江股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3559, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300659', 0, 0, NULL, 0, '中孚信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3560, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300660', 0, 0, NULL, 0, '江苏雷利', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3561, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300661', 0, 0, NULL, 0, '圣邦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3562, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300662', 0, 0, NULL, 0, '科锐国际', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3563, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300663', 0, 0, NULL, 0, '科蓝软件', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3564, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300664', 0, 0, NULL, 0, '鹏鹞环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3565, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300665', 0, 0, NULL, 0, '飞鹿股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3566, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300666', 0, 0, NULL, 0, '江丰电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3567, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300667', 0, 0, NULL, 0, '必创科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3568, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300668', 0, 0, NULL, 0, '杰恩设计', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3569, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300669', 0, 0, NULL, 0, '沪宁股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3570, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300670', 0, 0, NULL, 0, '大烨智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3571, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300671', 0, 0, NULL, 0, '富满电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3572, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300672', 0, 0, NULL, 0, '国科微', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3573, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300673', 0, 0, NULL, 0, '佩蒂股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3574, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300675', 0, 0, NULL, 0, '建科院', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3575, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300676', 0, 0, NULL, 0, '华大基因', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3576, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300677', 0, 0, NULL, 0, '英科医疗', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3577, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300678', 0, 0, NULL, 0, '中科信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3578, '2018-05-21 08:53:14', '2018-05-21 08:53:14', NULL, 0, '300679', 0, 0, NULL, 0, '电连技术', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3579, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300680', 0, 0, NULL, 0, '隆盛科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3580, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300681', 0, 0, NULL, 0, '英搏尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3581, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300682', 0, 0, NULL, 0, '朗新科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3582, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300683', 0, 0, NULL, 0, '海特生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3583, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300684', 0, 0, NULL, 0, '中石科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3584, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300685', 0, 0, NULL, 0, '艾德生物', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3585, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300686', 0, 0, NULL, 0, '智动力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3586, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300687', 0, 0, NULL, 0, '赛意信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3587, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300688', 0, 0, NULL, 0, '创业黑马', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3588, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300689', 0, 0, NULL, 0, '澄天伟业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3589, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300690', 0, 0, NULL, 0, '双一科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3590, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300691', 0, 0, NULL, 0, '联合光电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3591, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300692', 0, 0, NULL, 0, '中环环保', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3592, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300693', 0, 0, NULL, 0, '盛弘股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3593, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300695', 0, 0, NULL, 0, '兆丰股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3594, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300696', 0, 0, NULL, 0, '爱乐达', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3595, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300697', 0, 0, NULL, 0, '电工合金', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3596, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300698', 0, 0, NULL, 0, '万马科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3597, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300699', 0, 0, NULL, 0, '光威复材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3598, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300700', 0, 0, NULL, 0, '岱勒新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3599, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300701', 0, 0, NULL, 0, '森霸传感', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3600, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300702', 0, 0, NULL, 0, '天宇股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3601, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300703', 0, 0, NULL, 0, '创源文化', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3602, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300705', 0, 0, NULL, 0, '九典制药', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3603, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300706', 0, 0, NULL, 0, '阿石创', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3604, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300707', 0, 0, NULL, 0, '威唐工业', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3605, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300708', 0, 0, NULL, 0, '聚灿光电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3606, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300709', 0, 0, NULL, 0, '精研科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3607, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300710', 0, 0, NULL, 0, '万隆光电', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3608, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300711', 0, 0, NULL, 0, '广哈通信', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3609, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300712', 0, 0, NULL, 0, '永福股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3610, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300713', 0, 0, NULL, 0, '英可瑞', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3611, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300715', 0, 0, NULL, 0, '凯伦股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3612, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300716', 0, 0, NULL, 0, '国立科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3613, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300717', 0, 0, NULL, 0, '华信新材', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3614, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300718', 0, 0, NULL, 0, '长盛轴承', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3615, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300719', 0, 0, NULL, 0, '安达维尔', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3616, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300720', 0, 0, NULL, 0, '海川智能', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3617, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300721', 0, 0, NULL, 0, '怡达股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3618, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300722', 0, 0, NULL, 0, '新余国科', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3619, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300723', 0, 0, NULL, 0, '一品红', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3620, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300725', 0, 0, NULL, 0, '药石科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3621, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300726', 0, 0, NULL, 0, '宏达电子', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3622, '2018-05-21 08:53:15', '2018-05-21 08:53:15', NULL, 0, '300727', 0, 0, NULL, 0, '润禾材料', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3623, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300728', 0, 0, NULL, 0, '天常股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3624, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300729', 0, 0, NULL, 0, '乐歌股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3625, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300730', 0, 0, NULL, 0, '科创信息', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3626, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300731', 0, 0, NULL, 0, '科创新源', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3627, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300732', 0, 0, NULL, 0, '设研院', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3628, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300733', 0, 0, NULL, 0, '西菱动力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3629, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300735', 0, 0, NULL, 0, '光弘科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3630, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300736', 0, 0, NULL, 0, '百华悦邦', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3631, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300737', 0, 0, NULL, 0, '科顺股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3632, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300738', 0, 0, NULL, 0, '奥飞数据', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3633, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300739', 0, 0, NULL, 0, '明阳电路', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3634, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300740', 0, 0, NULL, 0, '御家汇', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3635, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300741', 0, 0, NULL, 0, '华宝股份', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3636, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300742', 0, 0, NULL, 0, '越博动力', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3637, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300743', 0, 0, NULL, 0, '天地数码', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3638, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300745', 0, 0, NULL, 0, '欣锐科技', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(3639, '2018-05-21 08:53:16', '2018-05-21 08:53:16', NULL, 0, '300746', 0, 0, NULL, 0, '汉嘉设计', 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `stock_catalog`
--

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
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1xbak41g3p45h9007alv7qd5u` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `stock_day`
--

CREATE TABLE IF NOT EXISTS `stock_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `OpenningPrice` decimal(19,2) DEFAULT NULL,
  `auctionPrice` decimal(19,2) DEFAULT NULL,
  `buyFive` decimal(19,2) DEFAULT NULL,
  `buyFivePrice` decimal(19,2) DEFAULT NULL,
  `buyFour` decimal(19,2) DEFAULT NULL,
  `buyFourPrice` decimal(19,2) DEFAULT NULL,
  `buyOne` decimal(19,2) DEFAULT NULL,
  `buyOnePrice` decimal(19,2) DEFAULT NULL,
  `buyThree` decimal(19,2) DEFAULT NULL,
  `buyThreePrice` decimal(19,2) DEFAULT NULL,
  `buyTwo` decimal(19,2) DEFAULT NULL,
  `buyTwoPrice` decimal(19,2) DEFAULT NULL,
  `closingPrice` decimal(19,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `competitivePrice` decimal(19,2) DEFAULT NULL,
  `currentPrice` decimal(19,2) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `hPrice` decimal(19,2) DEFAULT NULL,
  `lPrice` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sellFive` decimal(19,2) DEFAULT NULL,
  `sellFivePrice` decimal(19,2) DEFAULT NULL,
  `sellFour` decimal(19,2) DEFAULT NULL,
  `sellFourPrice` decimal(19,2) DEFAULT NULL,
  `sellOne` decimal(19,2) DEFAULT NULL,
  `sellOnePrice` decimal(19,2) DEFAULT NULL,
  `sellThree` decimal(19,2) DEFAULT NULL,
  `sellThreePrice` decimal(19,2) DEFAULT NULL,
  `sellTwo` decimal(19,2) DEFAULT NULL,
  `sellTwoPrice` decimal(19,2) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `totalNumber` decimal(19,2) DEFAULT NULL,
  `turnover` decimal(19,2) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `lprive` float NOT NULL,
  `price` float NOT NULL,
  `volume` int(11) NOT NULL,
  `yestPrice` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK81rtcqs6iavvbxgw5cyxdb2pm` (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `stock_day`
--

INSERT INTO `stock_day` (`id`, `addDate`, `lastDate`, `OpenningPrice`, `auctionPrice`, `buyFive`, `buyFivePrice`, `buyFour`, `buyFourPrice`, `buyOne`, `buyOnePrice`, `buyThree`, `buyThreePrice`, `buyTwo`, `buyTwoPrice`, `closingPrice`, `code`, `competitivePrice`, `currentPrice`, `date`, `hPrice`, `lPrice`, `name`, `sellFive`, `sellFivePrice`, `sellFour`, `sellFourPrice`, `sellOne`, `sellOnePrice`, `sellThree`, `sellThreePrice`, `sellTwo`, `sellTwoPrice`, `time`, `totalNumber`, `turnover`, `stock_id`, `day`, `lprive`, `price`, `volume`, `yestPrice`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15.49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2772, '20180518', 15.05, 15.4, 2930508, 15.37);

-- --------------------------------------------------------

--
-- 表的结构 `stock_day_time`
--

CREATE TABLE IF NOT EXISTS `stock_day_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avg` float NOT NULL,
  `price` float NOT NULL,
  `size` int(11) NOT NULL,
  `time` varchar(4) DEFAULT NULL,
  `day_id` bigint(20) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2d7a9x588ugybj1ijsaopm8sb` (`day_id`),
  KEY `FKmjcrsqo0wj859bfiub1ptyrnf` (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=243 ;

--
-- 转存表中的数据 `stock_day_time`
--

INSERT INTO `stock_day_time` (`id`, `avg`, `price`, `size`, `time`, `day_id`, `stock_id`) VALUES
(1, 15.37, 15.37, 0, '0930', 1, 2772),
(2, 15.35, 15.33, 28200, '0931', 1, 2772),
(3, 15.333, 15.3, 29300, '0932', 1, 2772),
(4, 15.338, 15.35, 14700, '0933', 1, 2772),
(5, 15.35, 15.4, 5500, '0934', 1, 2772),
(6, 15.37, 15.47, 18700, '0935', 1, 2772),
(7, 15.38, 15.44, 22600, '0936', 1, 2772),
(8, 15.394, 15.49, 20100, '0937', 1, 2772),
(9, 15.403, 15.48, 41500, '0938', 1, 2772),
(10, 15.408, 15.45, 19100, '0939', 1, 2772),
(11, 15.411, 15.44, 14100, '0940', 1, 2772),
(12, 15.417, 15.48, 15800, '0941', 1, 2772),
(13, 15.418, 15.44, 9200, '0942', 1, 2772),
(14, 15.42, 15.44, 15000, '0943', 1, 2772),
(15, 15.419, 15.4, 22800, '0944', 1, 2772),
(16, 15.419, 15.43, 13500, '0945', 1, 2772),
(17, 15.416, 15.36, 24100, '0946', 1, 2772),
(18, 15.414, 15.38, 4200, '0947', 1, 2772),
(19, 15.413, 15.4, 15500, '0948', 1, 2772),
(20, 15.411, 15.38, 8900, '0949', 1, 2772),
(21, 15.409, 15.35, 19300, '0950', 1, 2772),
(22, 15.406, 15.36, 17700, '0951', 1, 2772),
(23, 15.405, 15.38, 13400, '0952', 1, 2772),
(24, 15.403, 15.36, 14600, '0953', 1, 2772),
(25, 15.401, 15.34, 9400, '0954', 1, 2772),
(26, 15.398, 15.34, 5100, '0955', 1, 2772),
(27, 15.395, 15.31, 22200, '0956', 1, 2772),
(28, 15.392, 15.3, 40900, '0957', 1, 2772),
(29, 15.387, 15.26, 15600, '0958', 1, 2772),
(30, 15.382, 15.23, 35800, '0959', 1, 2772),
(31, 15.377, 15.23, 36700, '1000', 1, 2772),
(32, 15.374, 15.27, 33000, '1001', 1, 2772),
(33, 15.371, 15.28, 14700, '1002', 1, 2772),
(34, 15.369, 15.3, 10600, '1003', 1, 2772),
(35, 15.367, 15.3, 10700, '1004', 1, 2772),
(36, 15.365, 15.31, 5600, '1005', 1, 2772),
(37, 15.364, 15.32, 6500, '1006', 1, 2772),
(38, 15.363, 15.33, 2600, '1007', 1, 2772),
(39, 15.362, 15.3, 27000, '1008', 1, 2772),
(40, 15.359, 15.28, 15700, '1009', 1, 2772),
(41, 15.358, 15.28, 24200, '1010', 1, 2772),
(42, 15.356, 15.28, 11000, '1011', 1, 2772),
(43, 15.354, 15.27, 3300, '1012', 1, 2772),
(44, 15.352, 15.27, 4100, '1013', 1, 2772),
(45, 15.35, 15.29, 8900, '1014', 1, 2772),
(46, 15.349, 15.27, 31300, '1015', 1, 2772),
(47, 15.347, 15.29, 5700, '1016', 1, 2772),
(48, 15.346, 15.28, 5800, '1017', 1, 2772),
(49, 15.345, 15.28, 10900, '1018', 1, 2772),
(50, 15.343, 15.27, 19400, '1019', 1, 2772),
(51, 15.342, 15.28, 7900, '1020', 1, 2772),
(52, 15.34, 15.26, 13400, '1021', 1, 2772),
(53, 15.339, 15.26, 44500, '1022', 1, 2772),
(54, 15.337, 15.26, 15200, '1023', 1, 2772),
(55, 15.336, 15.27, 12700, '1024', 1, 2772),
(56, 15.335, 15.27, 9400, '1025', 1, 2772),
(57, 15.334, 15.27, 4200, '1026', 1, 2772),
(58, 15.333, 15.28, 400, '1027', 1, 2772),
(59, 15.332, 15.27, 2800, '1028', 1, 2772),
(60, 15.331, 15.27, 11300, '1029', 1, 2772),
(61, 15.33, 15.26, 8800, '1030', 1, 2772),
(62, 15.329, 15.29, 7500, '1031', 1, 2772),
(63, 15.328, 15.29, 2100, '1032', 1, 2772),
(64, 15.328, 15.29, 6400, '1033', 1, 2772),
(65, 15.328, 15.32, 4500, '1034', 1, 2772),
(66, 15.328, 15.36, 7700, '1035', 1, 2772),
(67, 15.329, 15.36, 6100, '1036', 1, 2772),
(68, 15.329, 15.32, 12900, '1037', 1, 2772),
(69, 15.329, 15.35, 3800, '1038', 1, 2772),
(70, 15.329, 15.36, 5700, '1039', 1, 2772),
(71, 15.33, 15.35, 1600, '1040', 1, 2772),
(72, 15.33, 15.34, 6700, '1041', 1, 2772),
(73, 15.33, 15.33, 2800, '1042', 1, 2772),
(74, 15.33, 15.34, 5400, '1043', 1, 2772),
(75, 15.33, 15.34, 5000, '1044', 1, 2772),
(76, 15.33, 15.33, 3100, '1045', 1, 2772),
(77, 15.33, 15.33, 2300, '1046', 1, 2772),
(78, 15.33, 15.32, 5400, '1047', 1, 2772),
(79, 15.33, 15.32, 3000, '1048', 1, 2772),
(80, 15.33, 15.32, 100, '1049', 1, 2772),
(81, 15.33, 15.32, 3300, '1050', 1, 2772),
(82, 15.329, 15.32, 5000, '1051', 1, 2772),
(83, 15.329, 15.3, 4800, '1052', 1, 2772),
(84, 15.329, 15.31, 12900, '1053', 1, 2772),
(85, 15.328, 15.3, 900, '1054', 1, 2772),
(86, 15.328, 15.31, 10800, '1055', 1, 2772),
(87, 15.328, 15.31, 3300, '1056', 1, 2772),
(88, 15.328, 15.33, 9000, '1057', 1, 2772),
(89, 15.328, 15.31, 5100, '1058', 1, 2772),
(90, 15.328, 15.33, 1200, '1059', 1, 2772),
(91, 15.328, 15.34, 4800, '1100', 1, 2772),
(92, 15.328, 15.32, 3600, '1101', 1, 2772),
(93, 15.328, 15.34, 500, '1102', 1, 2772),
(94, 15.328, 15.33, 1600, '1103', 1, 2772),
(95, 15.328, 15.31, 9900, '1104', 1, 2772),
(96, 15.327, 15.28, 15500, '1105', 1, 2772),
(97, 15.327, 15.29, 5900, '1106', 1, 2772),
(98, 15.327, 15.28, 500, '1107', 1, 2772),
(99, 15.326, 15.31, 800, '1108', 1, 2772),
(100, 15.326, 15.31, 9100, '1109', 1, 2772),
(101, 15.326, 15.3, 500, '1110', 1, 2772),
(102, 15.326, 15.29, 2000, '1111', 1, 2772),
(103, 15.325, 15.29, 100, '1112', 1, 2772),
(104, 15.325, 15.3, 1100, '1113', 1, 2772),
(105, 15.325, 15.29, 4200, '1114', 1, 2772),
(106, 15.324, 15.27, 37300, '1115', 1, 2772),
(107, 15.324, 15.26, 36400, '1116', 1, 2772),
(108, 15.323, 15.26, 8200, '1117', 1, 2772),
(109, 15.323, 15.28, 6400, '1118', 1, 2772),
(110, 15.322, 15.3, 9500, '1119', 1, 2772),
(111, 15.322, 15.3, 0, '1120', 1, 2772),
(112, 15.322, 15.28, 2400, '1121', 1, 2772),
(113, 15.321, 15.28, 800, '1122', 1, 2772),
(114, 15.321, 15.28, 6800, '1123', 1, 2772),
(115, 15.321, 15.28, 4100, '1124', 1, 2772),
(116, 15.32, 15.29, 2400, '1125', 1, 2772),
(117, 15.32, 15.29, 4600, '1126', 1, 2772),
(118, 15.32, 15.28, 5000, '1127', 1, 2772),
(119, 15.319, 15.28, 4200, '1128', 1, 2772),
(120, 15.319, 15.28, 4700, '1129', 1, 2772),
(121, 15.319, 15.28, 0, '1130', 1, 2772),
(122, 15.319, 15.28, 11800, '1300', 1, 2772),
(123, 15.318, 15.27, 1500, '1301', 1, 2772),
(124, 15.318, 15.28, 1500, '1302', 1, 2772),
(125, 15.317, 15.27, 7400, '1303', 1, 2772),
(126, 15.317, 15.27, 0, '1304', 1, 2772),
(127, 15.317, 15.27, 2200, '1305', 1, 2772),
(128, 15.316, 15.26, 4000, '1306', 1, 2772),
(129, 15.316, 15.27, 2100, '1307', 1, 2772),
(130, 15.316, 15.28, 100, '1308', 1, 2772),
(131, 15.315, 15.26, 5400, '1309', 1, 2772),
(132, 15.315, 15.27, 2000, '1310', 1, 2772),
(133, 15.315, 15.27, 900, '1311', 1, 2772),
(134, 15.314, 15.27, 2700, '1312', 1, 2772),
(135, 15.314, 15.26, 2800, '1313', 1, 2772),
(136, 15.313, 15.27, 11000, '1314', 1, 2772),
(137, 15.313, 15.26, 7300, '1315', 1, 2772),
(138, 15.313, 15.26, 3800, '1316', 1, 2772),
(139, 15.312, 15.27, 3400, '1317', 1, 2772),
(140, 15.312, 15.26, 9200, '1318', 1, 2772),
(141, 15.312, 15.25, 8000, '1319', 1, 2772),
(142, 15.311, 15.25, 45628, '1320', 1, 2772),
(143, 15.311, 15.25, 40000, '1321', 1, 2772),
(144, 15.31, 15.24, 7372, '1322', 1, 2772),
(145, 15.31, 15.24, 17400, '1323', 1, 2772),
(146, 15.309, 15.24, 4400, '1324', 1, 2772),
(147, 15.309, 15.24, 21300, '1325', 1, 2772),
(148, 15.308, 15.24, 7300, '1326', 1, 2772),
(149, 15.308, 15.24, 13600, '1327', 1, 2772),
(150, 15.307, 15.23, 1000, '1328', 1, 2772),
(151, 15.307, 15.23, 29800, '1329', 1, 2772),
(152, 15.306, 15.24, 700, '1330', 1, 2772),
(153, 15.306, 15.24, 10628, '1331', 1, 2772),
(154, 15.306, 15.25, 17200, '1332', 1, 2772),
(155, 15.305, 15.23, 1000, '1333', 1, 2772),
(156, 15.305, 15.22, 33900, '1334', 1, 2772),
(157, 15.304, 15.2, 55672, '1335', 1, 2772),
(158, 15.303, 15.15, 34300, '1336', 1, 2772),
(159, 15.302, 15.1, 51400, '1337', 1, 2772),
(160, 15.3, 15.05, 36600, '1338', 1, 2772),
(161, 15.299, 15.13, 29500, '1339', 1, 2772),
(162, 15.298, 15.12, 47100, '1340', 1, 2772),
(163, 15.297, 15.13, 20200, '1341', 1, 2772),
(164, 15.296, 15.1, 17200, '1342', 1, 2772),
(165, 15.295, 15.11, 21240, '1343', 1, 2772),
(166, 15.294, 15.13, 15000, '1344', 1, 2772),
(167, 15.293, 15.14, 15100, '1345', 1, 2772),
(168, 15.292, 15.11, 17800, '1346', 1, 2772),
(169, 15.291, 15.12, 14500, '1347', 1, 2772),
(170, 15.29, 15.12, 23400, '1348', 1, 2772),
(171, 15.289, 15.12, 14300, '1349', 1, 2772),
(172, 15.288, 15.12, 11100, '1350', 1, 2772),
(173, 15.287, 15.12, 13100, '1351', 1, 2772),
(174, 15.286, 15.11, 29400, '1352', 1, 2772),
(175, 15.285, 15.11, 22700, '1353', 1, 2772),
(176, 15.284, 15.11, 6200, '1354', 1, 2772),
(177, 15.283, 15.12, 9588, '1355', 1, 2772),
(178, 15.282, 15.12, 4300, '1356', 1, 2772),
(179, 15.281, 15.11, 21412, '1357', 1, 2772),
(180, 15.28, 15.12, 8200, '1358', 1, 2772),
(181, 15.279, 15.13, 800, '1359', 1, 2772),
(182, 15.278, 15.14, 16988, '1400', 1, 2772),
(183, 15.278, 15.2, 3600, '1401', 1, 2772),
(184, 15.277, 15.19, 13600, '1402', 1, 2772),
(185, 15.277, 15.17, 4600, '1403', 1, 2772),
(186, 15.276, 15.16, 10200, '1404', 1, 2772),
(187, 15.276, 15.19, 3580, '1405', 1, 2772),
(188, 15.275, 15.18, 4000, '1406', 1, 2772),
(189, 15.275, 15.22, 12900, '1407', 1, 2772),
(190, 15.275, 15.22, 3400, '1408', 1, 2772),
(191, 15.274, 15.21, 2500, '1409', 1, 2772),
(192, 15.274, 15.21, 2100, '1410', 1, 2772),
(193, 15.274, 15.21, 10600, '1411', 1, 2772),
(194, 15.273, 15.23, 8203, '1412', 1, 2772),
(195, 15.273, 15.23, 11100, '1413', 1, 2772),
(196, 15.273, 15.24, 8197, '1414', 1, 2772),
(197, 15.273, 15.24, 14603, '1415', 1, 2772),
(198, 15.273, 15.25, 6700, '1416', 1, 2772),
(199, 15.273, 15.24, 3897, '1417', 1, 2772),
(200, 15.272, 15.2, 25600, '1418', 1, 2772),
(201, 15.272, 15.23, 13600, '1419', 1, 2772),
(202, 15.272, 15.23, 9300, '1420', 1, 2772),
(203, 15.272, 15.23, 2000, '1421', 1, 2772),
(204, 15.271, 15.24, 9600, '1422', 1, 2772),
(205, 15.271, 15.27, 9603, '1423', 1, 2772),
(206, 15.271, 15.26, 5300, '1424', 1, 2772),
(207, 15.271, 15.28, 10300, '1425', 1, 2772),
(208, 15.271, 15.29, 13800, '1426', 1, 2772),
(209, 15.272, 15.3, 15200, '1427', 1, 2772),
(210, 15.272, 15.3, 15600, '1428', 1, 2772),
(211, 15.272, 15.31, 13700, '1429', 1, 2772),
(212, 15.272, 15.31, 11800, '1430', 1, 2772),
(213, 15.272, 15.3, 7300, '1431', 1, 2772),
(214, 15.272, 15.29, 7100, '1432', 1, 2772),
(215, 15.272, 15.28, 8500, '1433', 1, 2772),
(216, 15.272, 15.27, 9400, '1434', 1, 2772),
(217, 15.272, 15.26, 16100, '1435', 1, 2772),
(218, 15.272, 15.24, 7297, '1436', 1, 2772),
(219, 15.272, 15.24, 6100, '1437', 1, 2772),
(220, 15.272, 15.27, 10400, '1438', 1, 2772),
(221, 15.272, 15.26, 10300, '1439', 1, 2772),
(222, 15.272, 15.26, 17700, '1440', 1, 2772),
(223, 15.272, 15.26, 11200, '1441', 1, 2772),
(224, 15.272, 15.29, 4200, '1442', 1, 2772),
(225, 15.272, 15.3, 6900, '1443', 1, 2772),
(226, 15.272, 15.28, 8100, '1444', 1, 2772),
(227, 15.272, 15.27, 11700, '1445', 1, 2772),
(228, 15.272, 15.28, 10600, '1446', 1, 2772),
(229, 15.272, 15.29, 4900, '1447', 1, 2772),
(230, 15.272, 15.29, 4600, '1448', 1, 2772),
(231, 15.272, 15.29, 12000, '1449', 1, 2772),
(232, 15.272, 15.29, 17400, '1450', 1, 2772),
(233, 15.273, 15.31, 26700, '1451', 1, 2772),
(234, 15.273, 15.33, 15900, '1452', 1, 2772),
(235, 15.273, 15.35, 14800, '1453', 1, 2772),
(236, 15.274, 15.37, 24000, '1454', 1, 2772),
(237, 15.274, 15.4, 62700, '1455', 1, 2772),
(238, 15.275, 15.41, 35100, '1456', 1, 2772),
(239, 15.275, 15.4, 30800, '1457', 1, 2772),
(240, 15.276, 15.41, 26100, '1458', 1, 2772),
(241, 15.276, 15.4, 30600, '1459', 1, 2772),
(242, 15.277, 15.4, 1000, '1500', 1, 2772);

-- --------------------------------------------------------

--
-- 表的结构 `stock_detail`
--

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
  KEY `FK5hpba5xjvduisruknvsvmvlum` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `stock_like`
--

CREATE TABLE IF NOT EXISTS `stock_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ghcyfr8kmang43p1twveytkm` (`stock_id`),
  KEY `FK5bp6iyjnol1xg9rhc76su3byk` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `stock_note`
--

CREATE TABLE IF NOT EXISTS `stock_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKee461td1sbgr6lr5il0yiop66` (`stock_id`),
  KEY `FKih8mh2mms7elcb7fsuc7rqtce` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `stock_record`
--

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
  KEY `FKbc0h7youp6l1ifnchkwajsx8` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_account`
--

CREATE TABLE IF NOT EXISTS `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `accountType` int(11) DEFAULT NULL,
  `loginSize` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3e0dpuhumaxr3s9wm6idy3r3v` (`username`),
  KEY `FKloyhlvrn82g8811wyjaa8ehm0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `user_account`
--

INSERT INTO `user_account` (`id`, `addDate`, `lastDate`, `accountType`, `loginSize`, `password`, `salt`, `username`, `user_id`) VALUES
(1, '2017-05-30 16:49:55', '2018-05-25 10:52:00', 2, 96, 'be1a388a5b5d1c5aba9150f3e955f0c1252575ae', 'fdab67879de7c88a', 'admin', 4),
(2, '2017-06-30 11:14:52', '2017-06-30 11:14:52', 2, NULL, '93ae44436ab635e179fc8ad2fd599e0f51835256', 'ae223e26584149f3', 'blackfyre@163.com', 9),
(3, '2017-08-08 09:54:38', '2017-08-08 09:54:38', 2, NULL, '98fe8cde65895db401843f940779e03ea0b14152', 'cb464d5d7436d335', 'zhangsan', 13),
(4, '2017-08-18 12:08:34', '2017-08-18 12:08:34', 2, NULL, 'bf0a8c6deb12199548355c4291d7cc04314f1b00', '8f0ab5a51d74b266', '376720803@qq.com', 14),
(5, '2017-10-19 21:34:53', '2017-10-19 21:34:53', 2, NULL, '363788da537f30ac0d215539c185504c956d7853', 'dfea5058333d11ad', 'sovathana', 16),
(6, '2017-11-01 20:26:29', '2017-11-01 20:26:29', 2, NULL, '3096d8a2b2e43fc42c2d23a0d397825a8866070d', '617f71762daad817', '465060874@qq.com', 17),
(7, '2017-11-16 11:03:51', '2017-11-16 11:03:51', 2, NULL, 'd3f46b95988c3f22b07f127b97e896e69499b858', '14cd20d5a0d71b77', '854585212@qq.com', 18),
(8, '2017-11-17 09:49:05', '2017-11-17 09:49:05', 2, NULL, '84b24694235a360444e6b392ee15a7abaa21e37c', '9159dbb93a3ed263', 'hqz8812@126.com', 19),
(10, '2017-12-25 14:52:59', '2017-12-25 14:53:03', 2, 2, '12409a8fe12508f332fa873cda87e4251cfa4739', 'c97569bd7dc98cba', '1281715978@qq.com', 40),
(11, '2017-12-30 15:58:59', '2017-12-30 15:59:16', 2, 2, '13a3d393f91a43478b5551f3a0fb3ddcd0fa5993', 'ddc4520c5db2cc80', '471313478@qq.com', 50),
(12, '2018-01-03 05:52:16', '2018-01-03 05:52:35', 2, 2, '328b3962658048965fe6561e72cde8374b402679', '4d6a787b75de6a9b', '53665367@163.com', 52),
(13, '2018-01-17 21:17:27', '2018-01-17 21:17:46', 2, 2, '9f6aa0667a2bda170633309a10d78a78adf2887e', 'a2c1ec2f6a62f014', '1766006229@qq.com', 66),
(14, '2018-02-02 22:22:16', '2018-02-02 22:22:27', 2, 2, 'd7a19d5a8ed613bc614066ac76b62ce83bbd4b9c', 'bf8295ed0df65e32', 'liwei@163.com', 67),
(15, '2018-03-07 15:45:58', '2018-04-13 09:30:18', 2, 3, '22b37028f3cd7508938ba75e2ffe21ef7bc3a628', 'fe400df44f278fd7', '346811850@qq.com', 71),
(16, '2018-03-27 18:10:25', '2018-03-27 18:10:25', 2, NULL, '8c09d17bf7760ee15a456f987a6634b3320b25da', '78cdab4f24b1ed43', '575389364@qq.com', 75),
(17, '2018-04-04 11:50:02', '2018-04-04 11:50:54', 2, 2, '7dac7b17ec9ac4b2a5fd970d04a45ab3c55d8c83', '17671782ddcb9b65', '1289164@qq.com', 76),
(18, '2018-04-11 14:16:40', '2018-04-11 14:16:59', 2, 2, 'eff5b1fdb461760e89ac298ac911568c9384baa6', '557b18cc64f8c707', '2363830288@qq.com', 77),
(19, '2018-04-18 23:17:15', '2018-04-18 23:17:34', 2, 2, 'ff1150aca5e15800b5f9c986f38162fb106db6b8', 'ae3f2e0f7ed76b5e', '254176349@qq.com', 78),
(20, '2018-04-19 22:30:06', '2018-04-19 22:30:20', 2, 2, 'cb842f6e1ce8a844dfd5b6d694554cff8084d8d2', '60f0ce019856827b', 'qhrking@163.com', 79),
(21, '2018-04-25 12:54:48', '2018-04-25 12:55:21', 2, 2, 'c084767712d342c0bd8de5cb7a2187f1a5feadb3', '1304f344b1d8d35d', 'kong6001@qq.com', 81),
(22, '2018-05-04 12:41:50', '2018-05-04 12:41:57', 2, 2, 'beda34c9a967bb8d9f77433909e8b56196259bd5', '215b7533bd5bfa57', '1767311@qq.com', 83),
(23, '2018-05-04 17:09:39', '2018-05-07 15:35:57', 2, 9, 'eb4be238b9c176bac89d5bd1b656126bbc40af86', 'd7d36fccb5959971', '123@qq.com', 84),
(24, '2018-05-05 12:56:45', '2018-05-05 12:56:56', 2, 2, '833610d102f3de25fed809007954033edc46b750', '536a0285e2fbd3ff', 'alonxiong@qq.com', 85),
(25, '2018-05-08 10:50:00', '2018-05-08 10:50:08', 2, 2, 'e3db582843f376d2635e9dfaf48b137ca0f0a3c5', 'f5d0ff7b861261dd', '1137206648@qq.com', 86),
(26, '2018-05-22 11:21:35', '2018-05-22 11:21:44', 2, 2, 'f9df0f1017431d9cb5aa2f0cdd0c5fce5450e8f6', '50d05bfb5b02fd4a', '1533992543@qq.com', 88),
(27, '2018-05-26 11:37:53', '2018-05-26 11:38:00', 2, 2, '49cffcfc74760179a452680c78e5f953948472aa', '9e28200233991081', '5502758@qq.com', 90);

-- --------------------------------------------------------

--
-- 表的结构 `user_code`
--

CREATE TABLE IF NOT EXISTS `user_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `loginSize` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfulmxb2y8nrres564ymc2kqr4` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_device`
--

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
  KEY `FK7pbdo1j8ksdxaa6mkka1oi1r5` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_feedback`
--

CREATE TABLE IF NOT EXISTS `user_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `contents` varchar(5000) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `exts` varchar(5000) DEFAULT NULL,
  `feedContent` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfjxq06hj1obi36glqqlbimt4g` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `followid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsvkcr4aud3e9vq85mrrrys0mr` (`followid`),
  KEY `FK8neem6q3gq9drr17pbrdp642k` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_friend`
--

CREATE TABLE IF NOT EXISTS `user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `friendid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKio66ta2p6fg6x0ykd3osfnjl4` (`friendid`),
  KEY `FK39h0uev157c0oigcd85ugeefh` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_friend_request`
--

CREATE TABLE IF NOT EXISTS `user_friend_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `friendid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnr0n3evlg1nquiyna2t44m1ft` (`friendid`),
  KEY `FKafdxg26cqlsrvxobfulab2afv` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_github`
--

CREATE TABLE IF NOT EXISTS `user_github` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar_url` varchar(255) DEFAULT NULL,
  `blog` varchar(255) DEFAULT NULL,
  `collaborators` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `disk_usage` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `events_url` varchar(255) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `followers_url` varchar(255) DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  `following_url` varchar(255) DEFAULT NULL,
  `gists_url` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(255) DEFAULT NULL,
  `html_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organizations_url` varchar(255) DEFAULT NULL,
  `owned_private_repos` int(11) DEFAULT NULL,
  `private_gists` int(11) DEFAULT NULL,
  `public_gists` int(11) DEFAULT NULL,
  `public_repos` int(11) DEFAULT NULL,
  `received_events_url` varchar(255) DEFAULT NULL,
  `repos_url` varchar(255) DEFAULT NULL,
  `site_admin` varchar(255) DEFAULT NULL,
  `starred_url` varchar(255) DEFAULT NULL,
  `subscriptions_url` varchar(255) DEFAULT NULL,
  `total_private_repos` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9u0xasuywdhvahb0g9sfn1w6q` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `user_github`
--

INSERT INTO `user_github` (`id`, `avatar_url`, `blog`, `collaborators`, `company`, `disk_usage`, `email`, `events_url`, `followers`, `followers_url`, `following`, `following_url`, `gists_url`, `gravatar_id`, `html_url`, `location`, `login`, `name`, `organizations_url`, `owned_private_repos`, `private_gists`, `public_gists`, `public_repos`, `received_events_url`, `repos_url`, `site_admin`, `starred_url`, `subscriptions_url`, `total_private_repos`, `type`, `url`, `userid`) VALUES
(1, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(2, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(3, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(4, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(5, 'https://avatars2.githubusercontent.com/u/2127135?v=3', '', 0, NULL, 0, NULL, 'https://api.github.com/users/zhangyud/events{/privacy}', 0, 'https://api.github.com/users/zhangyud/followers', 0, 'https://api.github.com/users/zhangyud/following{/other_user}', 'https://api.github.com/users/zhangyud/gists{/gist_id}', '', 'https://github.com/zhangyud', NULL, 'zhangyud', NULL, 'https://api.github.com/users/zhangyud/orgs', 0, 0, 0, 10, 'https://api.github.com/users/zhangyud/received_events', 'https://api.github.com/users/zhangyud/repos', 'false', 'https://api.github.com/users/zhangyud/starred{/owner}{/repo}', 'https://api.github.com/users/zhangyud/subscriptions', 0, 'User', 'https://api.github.com/users/zhangyud', 5),
(6, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(7, 'https://avatars1.githubusercontent.com/u/302495?v=3', 'http://www.yichisancun.com/', 0, '陕西同纳信息技术有限公司', 149122, '735529126@qq.com', 'https://api.github.com/users/cng1985/events{/privacy}', 17, 'https://api.github.com/users/cng1985/followers', 52, 'https://api.github.com/users/cng1985/following{/other_user}', 'https://api.github.com/users/cng1985/gists{/gist_id}', '', 'https://github.com/cng1985', '中国西安', 'cng1985', 'ada.young', 'https://api.github.com/users/cng1985/orgs', 0, 1, 0, 80, 'https://api.github.com/users/cng1985/received_events', 'https://api.github.com/users/cng1985/repos', 'false', 'https://api.github.com/users/cng1985/starred{/owner}{/repo}', 'https://api.github.com/users/cng1985/subscriptions', 0, 'User', 'https://api.github.com/users/cng1985', 2),
(8, 'https://avatars2.githubusercontent.com/u/10429917?v=4', '', 0, NULL, 15085, NULL, 'https://api.github.com/users/xkcoding/events{/privacy}', 0, 'https://api.github.com/users/xkcoding/followers', 1, 'https://api.github.com/users/xkcoding/following{/other_user}', 'https://api.github.com/users/xkcoding/gists{/gist_id}', '', 'https://github.com/xkcoding', NULL, 'xkcoding', NULL, 'https://api.github.com/users/xkcoding/orgs', 0, 5, 0, 30, 'https://api.github.com/users/xkcoding/received_events', 'https://api.github.com/users/xkcoding/repos', 'false', 'https://api.github.com/users/xkcoding/starred{/owner}{/repo}', 'https://api.github.com/users/xkcoding/subscriptions', 0, 'User', 'https://api.github.com/users/xkcoding', 10),
(9, 'https://avatars2.githubusercontent.com/u/4142729?v=4', '', 0, 'sona.inc', 365387, 'sovathana.phat@gmail.com', 'https://api.github.com/users/sophatvathana/events{/privacy}', 5, 'https://api.github.com/users/sophatvathana/followers', 23, 'https://api.github.com/users/sophatvathana/following{/other_user}', 'https://api.github.com/users/sophatvathana/gists{/gist_id}', '', 'https://github.com/sophatvathana', 'Cambodia', 'sophatvathana', 'Sophat Vathana', 'https://api.github.com/users/sophatvathana/orgs', 0, 0, 9, 96, 'https://api.github.com/users/sophatvathana/received_events', 'https://api.github.com/users/sophatvathana/repos', 'false', 'https://api.github.com/users/sophatvathana/starred{/owner}{/repo}', 'https://api.github.com/users/sophatvathana/subscriptions', 0, 'User', 'https://api.github.com/users/sophatvathana', 12);

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `loginSize` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registerType` varchar(20) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- 转存表中的数据 `user_info`
--

INSERT INTO `user_info` (`id`, `addDate`, `lastDate`, `avatar`, `catalog`, `loginSize`, `name`, `password`, `registerType`, `salt`, `username`, `email`, `note`, `qq`, `sex`, `state`, `phone`) VALUES
(1, '2017-12-18 10:47:17', '2017-12-19 09:35:24', 'https://static.oschina.net/uploads/user/60/121058_50.jpg?t=1462921757000', 0, 5, 'adayoung', '69f0df8216414ac28754253c91d789dd5bc77bf4', '账号', 'cd76849b22a938c6', 'oschina_121058', '735529126@qq.com', '写代码是一件很愉快的事情！', '735529126', '男', NULL, NULL),
(2, '2017-06-12 21:39:53', '2017-06-12 21:39:53', 'https://avatars1.githubusercontent.com/u/302495?v=3', NULL, 0, 'ada.young', '0fbf4b70d6ba178c9c5dfd7a99cfbff0bfb39f0c', '账号', '4a21a878a9ea3eb2', 'github_302495', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2017-05-30 16:09:09', '2017-05-30 16:09:09', NULL, NULL, 0, NULL, 'c635a6a9fcdb4c661ea8f2acf6f056b32ce5558f', '账号', 'dfcf956d0e501559', 'admin', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2017-12-06 18:25:12', '2018-05-25 10:52:00', 'http://image.yichisancun.com/8a3010d9320fcb9e94b5f71cd2564a5f', 0, 68, '代码人', NULL, '账号', NULL, NULL, 'cng1985@gmail.com', '写代码是一件愉快的事情，用心写好每一行代码！', '735529126', '男', NULL, NULL),
(5, '2017-06-08 10:41:00', '2017-06-08 10:41:00', 'https://avatars2.githubusercontent.com/u/2127135?v=3', NULL, 0, NULL, '8aec58a7040da07dfb03138a5b5ce2fafb05bfe5', 'github', '16a879dd850d2b2e', 'github_2127135', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2017-06-12 21:18:32', '2017-11-23 08:46:45', 'http://tva4.sinaimg.cn/crop.0.336.864.864.180/466fe82ajw8emm6haacasj20o016oq5z.jpg', NULL, 4, '阿里话费', '3fb64d0bba669756493601c15014f49cec230c78', 'weibo', '58ff7eef6fa7cced', 'weibo_1181739050', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2017-06-21 12:19:09', '2017-06-21 12:19:09', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'tsony', 'a93bdd7044aa4b1723517fc2d1e068fbc6d4c656', 'oschina', '23cd240c9c04380c', 'oschina_2299033', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2017-06-29 17:23:42', '2017-06-29 17:23:42', 'http://tva4.sinaimg.cn/crop.0.0.100.100.180/0065cx5hjw8eqj40i8c6aj302s02sweb.jpg', NULL, 0, 'wl_2015', 'e64c2419b736b7c9e902953e17b3b4bf5c7504a0', 'weibo', 'b41b5064e2bde405', 'weibo_5573665787', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2017-06-30 11:14:52', '2017-06-30 11:14:52', NULL, NULL, 0, 'blackfyre@163.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2017-07-21 15:01:32', '2017-07-21 15:01:32', 'https://avatars2.githubusercontent.com/u/10429917?v=4', NULL, 0, NULL, 'a12c9c891fa6290afe29087242fe9fdf59c3c28c', 'github', '863eabed99f12b46', 'github_10429917', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2017-07-21 15:02:42', '2017-07-21 15:02:42', 'https://static.oschina.net/uploads/user/1231/2462117_50.jpg?t=1445117532000', NULL, 0, '妞妞的傻小孑', 'd6e9ff6f4948182e7d3c7b857128e9de0c1f916d', 'oschina', 'c8eea95f05dbc20c', 'oschina_2462117', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2017-07-25 10:15:03', '2017-07-25 10:15:03', 'https://avatars2.githubusercontent.com/u/4142729?v=4', NULL, 0, 'Sophat Vathana', '1b4b89f22faad230b2dd1880710841ff7d467002', 'github', 'efc429597be4f849', 'github_4142729', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2017-08-08 09:54:38', '2017-08-08 09:54:38', NULL, NULL, 0, 'zhangsan', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2017-08-18 12:08:34', '2017-08-18 12:08:34', NULL, NULL, 0, '376720803@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2017-09-19 14:04:00', '2017-09-19 14:04:00', 'http://tva4.sinaimg.cn/crop.0.0.640.640.180/bd6a4942jw8f9iwhdz5s2j20hs0hs75g.jpg', NULL, 0, '闹钟Mr', '9239696d30f0530fd113a7c4d8d2458e96610057', 'weibo', '68d86cec48c65fa7', 'weibo_3177859394', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2017-10-19 21:34:53', '2017-10-19 21:34:53', NULL, NULL, 0, 'sovathana', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2017-11-01 20:26:34', '2017-11-01 20:26:34', NULL, NULL, 0, '465060874@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2017-11-16 11:04:41', '2017-11-16 11:04:41', '', NULL, 0, '854585212@qq.com', NULL, '账号', NULL, NULL, '854585212@qq.com', '', '854585212', '男', NULL, NULL),
(19, '2017-11-17 09:49:05', '2017-11-17 09:49:05', NULL, NULL, 0, 'hqz8812@126.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2017-11-21 11:56:49', '2017-11-24 08:56:45', 'https://avatars2.githubusercontent.com/u/302495?v=4', NULL, 2, 'ada.young', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2017-12-06 14:24:41', '2017-12-06 14:24:41', 'https://static.oschina.net/uploads/user/1859/3719801_50.jpeg?t=1509531285000', NULL, 0, '狐扯', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2017-12-06 14:25:17', '2017-12-06 14:25:17', 'https://static.oschina.net/uploads/user/287/575269_50.jpg?t=1384152034000', NULL, 0, 'tubexu', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2017-12-06 14:28:16', '2017-12-06 14:28:16', 'https://static.oschina.net/uploads/user/1825/3651930_50.jpeg?t=1502866324000', NULL, 0, '东尼大兔', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2017-12-06 14:28:25', '2017-12-06 14:28:25', 'https://static.oschina.net/uploads/user/718/1437288_50.jpg?t=1389257419000', NULL, 0, 'Maxium_R', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2017-12-06 14:29:47', '2017-12-06 14:29:47', 'https://static.oschina.net/uploads/user/1241/2482647_50.jpeg?t=1508115697000', NULL, 0, 'devotion', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2017-12-06 14:31:11', '2017-12-06 14:31:11', 'https://static.oschina.net/uploads/user/1653/3306257_50.jpeg?t=1512354256000', NULL, 0, '朩朩童鞋', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2017-12-06 14:31:48', '2017-12-06 14:31:48', 'https://static.oschina.net/uploads/user/292/584851_50.jpg?t=1376279122000', NULL, 0, 'springsky', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '2017-12-06 14:33:58', '2017-12-06 14:33:58', 'https://static.oschina.net/uploads/user/50/100941_50.jpg?t=1422767030000', NULL, 0, '7月', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2017-12-06 14:48:27', '2017-12-06 14:48:27', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'zhangjian81', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2017-12-06 15:21:51', '2017-12-06 15:21:51', 'https://static.oschina.net/uploads/user/1767/3535604_50.jpeg?t=1509620709000', NULL, 0, '高书记', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '2017-12-06 15:30:34', '2017-12-06 15:30:34', 'https://static.oschina.net/uploads/user/494/988298_50.png?t=1400725084000', NULL, 0, '麦琪', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2017-12-06 15:31:17', '2017-12-06 15:31:17', 'https://static.oschina.net/uploads/user/1841/3683339_50.jpeg?t=1505890119000', NULL, 0, 'Transient', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '2017-12-06 15:58:04', '2017-12-06 15:58:19', NULL, NULL, 2, '123@123.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2017-12-06 18:12:24', '2017-12-06 18:12:24', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'jspzhao', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '2017-12-09 09:25:57', '2017-12-09 09:25:57', 'https://static.oschina.net/uploads/user/407/815843_50.jpeg?t=1503988641000', NULL, 0, '罗马的王', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '2017-12-11 11:23:05', '2017-12-11 11:23:05', 'https://static.oschina.net/uploads/user/1756/3513299_50.jpg?t=1505690836000', NULL, 0, '开源第一芒果儿', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '2017-12-14 21:09:02', '2017-12-14 21:09:02', 'http://tvax4.sinaimg.cn/crop.0.1.1242.1242.180/62f17243ly8ffybiyo75jj20yi0ykgnn.jpg', NULL, 0, '幽默内涵搞笑', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '2017-12-17 21:43:49', '2017-12-17 21:43:49', 'https://static.oschina.net/uploads/user/110/221613_50.png?t=1467865789000', NULL, 0, '淡泊', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '2017-12-25 14:46:12', '2017-12-25 14:46:12', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'ada66', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '2017-12-25 14:52:59', '2017-12-25 14:53:03', NULL, NULL, 2, '1281715978@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2017-12-27 03:42:18', '2017-12-27 03:42:18', 'https://avatars3.githubusercontent.com/u/23079709?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '2017-12-29 09:40:50', '2017-12-29 09:40:50', 'https://www.oschina.net/img/portrait.gif', NULL, 0, '21-th', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '2017-12-29 09:50:54', '2017-12-29 09:50:54', 'https://static.oschina.net/uploads/user/582/1164691_50.jpeg?t=1486458477000', NULL, 0, '滔哥', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '2017-12-29 10:36:48', '2017-12-29 10:36:48', 'https://static.oschina.net/uploads/user/457/914132_50.jpg?t=1374649179000', NULL, 0, 'beiqiu', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '2017-12-29 12:06:46', '2017-12-29 12:06:46', 'https://avatars3.githubusercontent.com/u/6356362?v=4', NULL, 0, 'pine zhao', NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '2017-12-29 14:13:08', '2017-12-29 14:13:08', 'http://tva1.sinaimg.cn/crop.0.0.394.394.180/62161b08gw1e8blgvc1tgj20az0azjsd.jpg', NULL, 0, '男人微生活', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '2017-12-29 15:38:36', '2017-12-29 15:38:36', 'https://www.oschina.net/img/portrait.gif', 0, 0, 'Tesumers', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '2017-12-29 17:11:50', '2017-12-29 17:11:50', 'https://static.oschina.net/uploads/user/699/1399767_50.jpg?t=1384341959000', NULL, 0, 'binfenworld', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '2017-12-29 23:53:04', '2017-12-29 23:53:04', 'http://tva3.sinaimg.cn/crop.0.0.1328.1328.180/006flqFVjw8eye728vlubj310w10wjwz.jpg', NULL, 0, '心安勿宇Love王', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '2017-12-30 15:58:59', '2017-12-30 15:59:17', NULL, NULL, 2, '471313478@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '2018-01-02 11:41:30', '2018-01-02 11:41:30', 'https://avatars2.githubusercontent.com/u/26998327?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '2018-01-03 05:52:16', '2018-01-03 05:52:35', NULL, NULL, 2, '53665367@163.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '2018-01-03 11:21:48', '2018-01-03 11:21:48', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'qjl0528', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '2018-01-03 13:49:30', '2018-01-03 13:49:30', 'https://static.oschina.net/uploads/user/308/617839_50.jpg?t=1373253529000', NULL, 0, 'chw8219', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '2018-01-03 16:04:59', '2018-01-03 16:04:59', 'https://static.oschina.net/uploads/user/1003/2007115_50.jpg?t=1416554028000', NULL, 0, 'jackyzfq', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '2018-01-03 17:38:48', '2018-01-03 17:38:48', 'https://avatars0.githubusercontent.com/u/34534739?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '2018-01-09 15:35:42', '2018-01-09 15:35:42', 'https://static.oschina.net/uploads/user/1143/2286478_50.jpg?t=1418007123000', NULL, 0, '吴Yuan_小森森', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '2018-01-09 16:29:27', '2018-01-09 16:29:27', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'zhangbinyu', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '2018-01-10 08:59:12', '2018-01-10 08:59:12', 'https://avatars0.githubusercontent.com/u/1118329?v=4', NULL, 0, 'Zaric', NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '2018-01-10 21:17:16', '2018-01-10 21:17:16', NULL, NULL, 0, 'admin', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '2018-01-12 09:36:47', '2018-01-12 09:36:47', 'https://avatars3.githubusercontent.com/u/36474?v=4', NULL, 0, '李鹏宇', NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '2018-01-12 09:39:50', '2018-01-12 09:39:50', 'https://www.oschina.net/img/portrait.gif', NULL, 0, 'harrylin2012', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '2018-01-12 13:46:45', '2018-01-12 13:46:45', 'https://www.oschina.net/img/portrait.gif', NULL, 0, '纳新', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '2018-01-16 14:17:30', '2018-01-16 14:17:30', 'https://avatars2.githubusercontent.com/u/23467531?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '2018-01-16 20:32:33', '2018-01-16 20:32:33', 'http://tvax4.sinaimg.cn/crop.13.0.723.723.180/005w31Qqly8fmpgibeqk4j30ku0k3wf6.jpg', NULL, 0, '永之诚', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '2018-01-17 21:17:27', '2018-01-17 21:17:46', NULL, NULL, 2, '1766006229@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '2018-02-02 22:22:16', '2018-02-02 22:22:27', NULL, NULL, 2, 'liwei@163.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '2018-02-05 22:21:42', '2018-02-05 22:21:42', 'https://static.oschina.net/uploads/user/1748/3497579_50.jpeg?t=1503245009000', NULL, 0, 'SethOS', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '2018-02-08 16:36:40', '2018-02-08 16:36:40', 'https://avatars2.githubusercontent.com/u/36095770?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '2018-02-10 11:35:07', '2018-02-10 11:35:07', 'https://static.oschina.net/uploads/user/48/96491_50.jpg?t=1453526158000', NULL, 0, 'wdl1003', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '2018-03-07 15:45:58', '2018-04-13 09:30:19', NULL, NULL, 4, '346811850@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '2018-03-10 22:30:24', '2018-03-10 22:30:24', 'https://avatars3.githubusercontent.com/u/30191281?v=4', NULL, 0, 'debuggor', NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, '2018-03-14 08:15:08', '2018-03-14 08:15:08', 'https://static.oschina.net/uploads/user/1344/2688131_50.jpg?t=1458882130000', NULL, 0, '腾龙问天', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2018-03-23 10:16:47', '2018-03-23 10:16:47', 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/67e20b52jw1e8qgp5bmzyj2050050aa8.jpg', NULL, 0, '山区来的狐', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2018-03-27 18:10:25', '2018-03-27 18:10:25', NULL, NULL, 0, '575389364@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '2018-04-04 11:52:04', '2018-04-04 11:52:04', '', 0, 0, '无敌花生', NULL, '账号', NULL, NULL, '1289164@qq.com', '走过路过不会错过', '1289164', '男', NULL, NULL),
(77, '2018-04-11 14:18:06', '2018-04-11 14:18:06', '', 0, 0, '2363830288@qq.com', NULL, '账号', NULL, NULL, '', '', '', '男', NULL, NULL),
(78, '2018-04-18 23:17:15', '2018-04-18 23:17:34', NULL, NULL, 2, '254176349@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '2018-04-19 22:30:06', '2018-04-19 22:30:20', NULL, NULL, 2, 'qhrking@163.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '2018-04-21 01:32:58', '2018-04-21 01:32:58', 'https://avatars1.githubusercontent.com/u/13794500?v=4', NULL, 0, 'PengZhiwu', NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2018-04-25 12:54:48', '2018-04-25 12:55:21', NULL, NULL, 2, 'kong6001@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '2018-05-03 16:30:35', '2018-05-03 16:30:35', 'https://avatars3.githubusercontent.com/u/18073663?v=4', NULL, 0, NULL, NULL, 'github', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '2018-05-04 12:42:07', '2018-05-04 12:42:07', '', 0, 0, '1767311@qq.com', NULL, '账号', NULL, NULL, '', '', '', '男', NULL, NULL),
(84, '2018-05-07 15:35:43', '2018-05-07 15:35:58', '', 0, 2, 'admin', NULL, '账号', NULL, NULL, '767@qq.com', '', '', '男', NULL, NULL),
(85, '2018-05-05 12:58:02', '2018-05-05 12:58:02', '', 0, 0, 'alonxiong@qq.com', NULL, '账号', NULL, NULL, '', '', '', '男', NULL, NULL),
(86, '2018-05-08 10:50:00', '2018-05-08 10:50:08', NULL, NULL, 2, '1137206648@qq.com', NULL, '账号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2018-05-21 01:05:43', '2018-05-21 01:05:43', 'https://static.oschina.net/uploads/user/585/1170156_50.jpeg?t=1479397712000', NULL, 0, '明天以后', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '2018-05-22 11:21:59', '2018-05-22 11:21:59', '', 0, 0, '1533992543@qq.com', NULL, '账号', NULL, NULL, '', '', '', '男', NULL, NULL),
(89, '2018-05-22 16:25:57', '2018-05-22 16:25:57', 'https://static.oschina.net/uploads/user/1696/3392984_50.jpeg?t=1490711178000', NULL, 0, '宇宙家的小胡椒', NULL, 'oschina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '2018-05-26 11:38:48', '2018-05-26 11:38:48', '', 0, 0, '550275', NULL, '账号', NULL, NULL, '5502758@qq.com', '123123', '', '男', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_info_attribute`
--

CREATE TABLE IF NOT EXISTS `user_info_attribute` (
  `user_id` bigint(20) NOT NULL,
  `attr` varchar(100) DEFAULT NULL,
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_label`
--

CREATE TABLE IF NOT EXISTS `user_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cal21cv5bdi7ee791jvtvji3t` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `user_label`
--

INSERT INTO `user_label` (`id`, `addDate`, `lastDate`, `name`) VALUES
(2, '2018-01-03 19:48:24', '2018-01-03 19:48:24', 'java'),
(3, '2018-01-10 21:16:28', '2018-01-10 21:16:28', 'test'),
(4, '2018-01-10 21:16:47', '2018-01-10 21:16:47', 'Csharp');

-- --------------------------------------------------------

--
-- 表的结构 `user_label_links`
--

CREATE TABLE IF NOT EXISTS `user_label_links` (
  `user_id` bigint(20) NOT NULL,
  `labels_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`labels_id`),
  KEY `FKe69vxi1aiq7ww12d8pf03hrn1` (`labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_login_log`
--

CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj91w0nnfocpdp796lr3ot4lxs` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_message`
--

CREATE TABLE IF NOT EXISTS `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKprww0bw44m48y4xxbkv13u5g7` (`subject_id`),
  KEY `FKcu2q6axhu3g31g1vbuosec525` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_message_member`
--

CREATE TABLE IF NOT EXISTS `user_message_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `subjectid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq810ie1390jw6r2umbsvtpusf` (`subjectid`),
  KEY `FK2lven49o6lj1fnlb47lwjs9g9` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_message_subject`
--

CREATE TABLE IF NOT EXISTS `user_message_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `lastMessage` varchar(255) DEFAULT NULL,
  `members` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1i9f2ekhf4y4xk5cqwr0unb1i` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_notification`
--

CREATE TABLE IF NOT EXISTS `user_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `imageType` int(11) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `taxonomy` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `top` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `authorid` bigint(20) DEFAULT NULL,
  `catalogid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK25yxc2g4kt2wk510uy05nr10f` (`catalogid`),
  KEY `FKen7mn6n9j4ach4hyewfjakkg2` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_notification_catalog`
--

CREATE TABLE IF NOT EXISTS `user_notification_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelinfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgftt45f6mnajuk0k4c8aya4ew` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_notification_member`
--

CREATE TABLE IF NOT EXISTS `user_notification_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `notificationid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKolldeppu9xw9we1jwgcvpc6m7` (`notificationid`),
  KEY `FKlatb6olq7rthe83lg86qovdqh` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_notification_num`
--

CREATE TABLE IF NOT EXISTS `user_notification_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `mid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmi0949b37eayfjjpvv421bmvy` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_notification_time`
--

CREATE TABLE IF NOT EXISTS `user_notification_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5co2x7rgocx6fmbfptaknqxh8` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_config`
--

CREATE TABLE IF NOT EXISTS `user_oauth_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `appKey` varchar(255) DEFAULT NULL,
  `appSecret` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_info_oschina`
--

CREATE TABLE IF NOT EXISTS `user_oauth_info_oschina` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjb6v7f52g5jjbpl4dvper40it` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `user_oauth_info_oschina`
--

INSERT INTO `user_oauth_info_oschina` (`id`, `avatar`, `email`, `gender`, `location`, `name`, `url`, `userid`) VALUES
(1, 'https://static.oschina.net/uploads/user/60/121058_50.jpg?t=1462921757000', 'cng1985@gmail.com', 'male', '陕西 西安', 'ada_young', 'https://my.oschina.net/cng1985', 1),
(2, 'https://www.oschina.net/img/portrait.gif', 'yzh_adam@sina.com', 'male', '北京 东城', 'tsony', 'https://my.oschina.net/u/2299033', 7),
(3, 'https://static.oschina.net/uploads/user/1231/2462117_50.jpg?t=1445117532000', 'xkcoding@163.com', 'male', '浙江 台州', '妞妞的傻小孑', 'https://my.oschina.net/xkcoding', 11);

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_info_qq`
--

CREATE TABLE IF NOT EXISTS `user_oauth_info_qq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL,
  `figureurl1` varchar(255) DEFAULT NULL,
  `figureurl2` varchar(255) DEFAULT NULL,
  `figureurl_qq_1` varchar(255) DEFAULT NULL,
  `figureurl_qq_2` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `yellow_vip` int(11) DEFAULT NULL,
  `yellow_year_vip` int(11) DEFAULT NULL,
  `level_info` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `ret` int(11) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `yellow_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_info_weibo`
--

CREATE TABLE IF NOT EXISTS `user_oauth_info_weibo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar_hd` varchar(255) DEFAULT NULL,
  `avatar_large` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cover_image_phone` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `favourites_count` int(11) DEFAULT NULL,
  `followers_count` int(11) DEFAULT NULL,
  `friends_count` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `idstr` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pagefriends_count` int(11) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `screen_name` varchar(255) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `weihao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `user_oauth_info_weibo`
--

INSERT INTO `user_oauth_info_weibo` (`id`, `avatar_hd`, `avatar_large`, `city`, `cover_image_phone`, `description`, `domain`, `favourites_count`, `followers_count`, `friends_count`, `gender`, `idstr`, `location`, `name`, `pagefriends_count`, `profile_image_url`, `profile_url`, `province`, `screen_name`, `statuses_count`, `url`, `weihao`) VALUES
(1, 'http://tva4.sinaimg.cn/crop.0.336.864.864.1024/466fe82ajw8emm6haacasj20o016oq5z.jpg', 'http://tva4.sinaimg.cn/crop.0.336.864.864.180/466fe82ajw8emm6haacasj20o016oq5z.jpg', '1', 'http://ww1.sinaimg.cn/crop.0.0.640.640.640/549d0121tw1egm1kjly3jj20hs0hsq4f.jpg', '我就是想帮你充话费', 'iyoungmin', 2, 66, 43, 'm', '1181739050', '陕西 西安', '阿里话费', 0, 'http://tva4.sinaimg.cn/crop.0.336.864.864.50/466fe82ajw8emm6haacasj20o016oq5z.jpg', '778912599', '61', '阿里话费', 304, 'http://blog.sina.com.cn/cng1985', '778912599'),
(2, 'http://tva4.sinaimg.cn/crop.0.0.100.100.1024/0065cx5hjw8eqj40i8c6aj302s02sweb.jpg', 'http://tva4.sinaimg.cn/crop.0.0.100.100.180/0065cx5hjw8eqj40i8c6aj302s02sweb.jpg', '1', NULL, '', '', 1, 5, 31, 'm', '5573665787', '北京 东城区', 'wl_2015', 0, 'http://tva4.sinaimg.cn/crop.0.0.100.100.50/0065cx5hjw8eqj40i8c6aj302s02sweb.jpg', 'u/5573665787', '11', 'wl_2015', 29, '', ''),
(3, 'http://tva4.sinaimg.cn/crop.0.0.640.640.1024/bd6a4942jw8f9iwhdz5s2j20hs0hs75g.jpg', 'http://tva4.sinaimg.cn/crop.0.0.640.640.180/bd6a4942jw8f9iwhdz5s2j20hs0hs75g.jpg', '1', NULL, '再多半生余韵。', '', 14, 1941, 379, 'm', '3177859394', '广东 广州', '闹钟Mr', 7, 'http://tva4.sinaimg.cn/crop.0.0.640.640.50/bd6a4942jw8f9iwhdz5s2j20hs0hs75g.jpg', 'u/3177859394', '44', '闹钟Mr', 276, 'http://zhangguozhong.cn', '');

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_info_weixin`
--

CREATE TABLE IF NOT EXISTS `user_oauth_info_weixin` (
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
  `unionid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_oauth_token`
--

CREATE TABLE IF NOT EXISTS `user_oauth_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_in` bigint(20) DEFAULT NULL,
  `loginSize` int(11) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhco9s5j1bhp44w3mpt19kmi21` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `user_oauth_token`
--

INSERT INTO `user_oauth_token` (`id`, `addDate`, `lastDate`, `access_token`, `expires_in`, `loginSize`, `refresh_token`, `token_type`, `uid`, `userid`) VALUES
(1, '2017-05-30 16:05:33', '2017-06-12 18:33:46', 'ec47b278-f5a8-4f86-92a7-d3199fa08491', 604799, NULL, '9e1749e7-751c-4212-9c8f-f7f31d972a79', 'oschina', '121058', 1),
(2, '2017-06-12 21:18:32', '2017-06-26 20:45:32', '2.00Q_9yRB4QiCXC1c6110eca385yVeD', NULL, NULL, NULL, 'weibo', '1181739050', 6),
(3, '2017-06-21 12:19:08', '2017-06-21 12:19:08', '1ca4cc38-24d8-417e-b5e8-05a6e742bcff', 604799, NULL, '1935fd58-8639-42d7-83bd-64d7a9007322', 'oschina', '2299033', 7),
(4, '2017-06-29 17:23:42', '2017-06-29 17:23:42', '2.00RFXMFG4QiCXCf2210a822aNp_6HC', NULL, NULL, NULL, 'weibo', '5573665787', 8),
(5, '2017-07-21 15:02:42', '2017-07-21 15:02:42', '44456343-01a5-4727-a6ba-8aca3fde490a', 604799, NULL, 'e245db15-aba3-46e7-afc8-76bee13ae7e6', 'oschina', '2462117', 11),
(6, '2017-09-19 14:04:00', '2017-09-19 14:04:00', '2.00g5yDTD4QiCXCfadb8e2b0f1B8odC', NULL, NULL, NULL, 'weibo', '3177859394', 15),
(7, '2017-11-21 11:56:49', '2017-11-21 11:56:49', NULL, NULL, NULL, NULL, 'github', '302495', 20),
(8, '2017-12-06 14:24:41', '2017-12-06 14:24:41', NULL, NULL, NULL, NULL, 'oschina', '3719801', 21),
(9, '2017-12-06 14:25:17', '2017-12-06 14:25:17', NULL, NULL, NULL, NULL, 'oschina', '575269', 22),
(10, '2017-12-06 14:28:16', '2017-12-06 14:28:16', NULL, NULL, NULL, NULL, 'oschina', '3651930', 23),
(11, '2017-12-06 14:28:25', '2017-12-06 14:28:25', NULL, NULL, NULL, NULL, 'oschina', '1437288', 24),
(12, '2017-12-06 14:29:47', '2017-12-06 14:29:47', NULL, NULL, NULL, NULL, 'oschina', '2482647', 25),
(13, '2017-12-06 14:31:11', '2017-12-06 14:31:11', NULL, NULL, NULL, NULL, 'oschina', '3306257', 26),
(14, '2017-12-06 14:31:48', '2017-12-06 14:31:48', NULL, NULL, NULL, NULL, 'oschina', '584851', 27),
(15, '2017-12-06 14:33:58', '2017-12-06 14:33:58', NULL, NULL, NULL, NULL, 'oschina', '100941', 28),
(16, '2017-12-06 14:48:27', '2017-12-06 14:48:27', NULL, NULL, NULL, NULL, 'oschina', '554474', 29),
(17, '2017-12-06 15:21:51', '2017-12-06 15:21:51', NULL, NULL, NULL, NULL, 'oschina', '3535604', 30),
(18, '2017-12-06 15:30:34', '2017-12-06 15:30:34', NULL, NULL, NULL, NULL, 'oschina', '988298', 31),
(19, '2017-12-06 15:31:17', '2017-12-06 15:31:17', NULL, NULL, NULL, NULL, 'oschina', '3683339', 32),
(20, '2017-12-06 18:12:24', '2017-12-06 18:12:24', NULL, NULL, NULL, NULL, 'oschina', '225498', 34),
(21, '2017-12-09 09:25:57', '2017-12-09 09:25:57', NULL, NULL, NULL, NULL, 'oschina', '815843', 35),
(22, '2017-12-11 11:23:05', '2017-12-11 11:23:05', NULL, NULL, NULL, NULL, 'oschina', '3513299', 36),
(23, '2017-12-14 21:09:02', '2017-12-14 21:09:02', NULL, NULL, NULL, NULL, 'weibo', '1659990595', 37),
(24, '2017-12-17 21:43:49', '2017-12-17 21:43:49', NULL, NULL, NULL, NULL, 'oschina', '221613', 38),
(25, '2017-12-25 14:46:12', '2017-12-25 14:46:12', NULL, NULL, NULL, NULL, 'oschina', '3758515', 39),
(26, '2017-12-27 03:42:18', '2017-12-27 03:42:18', NULL, NULL, NULL, NULL, 'github', '23079709', 41),
(27, '2017-12-29 09:40:50', '2017-12-29 09:40:50', NULL, NULL, NULL, NULL, 'oschina', '2610000', 42),
(28, '2017-12-29 09:50:54', '2017-12-29 09:50:54', NULL, NULL, NULL, NULL, 'oschina', '1164691', 43),
(29, '2017-12-29 10:36:48', '2017-12-29 10:36:48', NULL, NULL, NULL, NULL, 'oschina', '914132', 44),
(30, '2017-12-29 12:06:46', '2017-12-29 12:06:46', NULL, NULL, NULL, NULL, 'github', '6356362', 45),
(31, '2017-12-29 14:13:08', '2017-12-29 14:13:08', NULL, NULL, NULL, NULL, 'weibo', '1645615880', 46),
(32, '2017-12-29 14:14:38', '2017-12-29 14:14:38', NULL, NULL, NULL, NULL, 'oschina', '3760234', 47),
(33, '2017-12-29 17:11:50', '2017-12-29 17:11:50', NULL, NULL, NULL, NULL, 'oschina', '1399767', 48),
(34, '2017-12-29 23:53:04', '2017-12-29 23:53:04', NULL, NULL, NULL, NULL, 'weibo', '5723549463', 49),
(35, '2018-01-02 11:41:30', '2018-01-02 11:41:30', NULL, NULL, NULL, NULL, 'github', '26998327', 51),
(36, '2018-01-03 11:21:48', '2018-01-03 11:21:48', NULL, NULL, NULL, NULL, 'oschina', '3135654', 53),
(37, '2018-01-03 13:49:30', '2018-01-03 13:49:30', NULL, NULL, NULL, NULL, 'oschina', '617839', 54),
(38, '2018-01-03 16:04:59', '2018-01-03 16:04:59', NULL, NULL, NULL, NULL, 'oschina', '2007115', 55),
(39, '2018-01-03 17:38:48', '2018-01-03 17:38:48', NULL, NULL, NULL, NULL, 'github', '34534739', 56),
(40, '2018-01-09 15:35:42', '2018-01-09 15:35:42', NULL, NULL, NULL, NULL, 'oschina', '2286478', 57),
(41, '2018-01-09 16:29:27', '2018-01-09 16:29:27', NULL, NULL, NULL, NULL, 'oschina', '3204407', 58),
(42, '2018-01-10 08:59:12', '2018-01-10 08:59:12', NULL, NULL, NULL, NULL, 'github', '1118329', 59),
(43, '2018-01-12 09:36:47', '2018-01-12 09:36:47', NULL, NULL, NULL, NULL, 'github', '36474', 61),
(44, '2018-01-12 09:39:50', '2018-01-12 09:39:50', NULL, NULL, NULL, NULL, 'oschina', '2616842', 62),
(45, '2018-01-12 13:46:45', '2018-01-12 13:46:45', NULL, NULL, NULL, NULL, 'oschina', '3296708', 63),
(46, '2018-01-16 14:17:30', '2018-01-16 14:17:30', NULL, NULL, NULL, NULL, 'github', '23467531', 64),
(47, '2018-01-16 20:32:33', '2018-01-16 20:32:33', NULL, NULL, NULL, NULL, 'weibo', '5054228990', 65),
(48, '2018-02-05 22:21:42', '2018-02-05 22:21:42', NULL, NULL, NULL, NULL, 'oschina', '3497579', 68),
(49, '2018-02-08 16:36:40', '2018-02-08 16:36:40', NULL, NULL, NULL, NULL, 'github', '36095770', 69),
(50, '2018-02-10 11:35:07', '2018-02-10 11:35:07', NULL, NULL, NULL, NULL, 'oschina', '96491', 70),
(51, '2018-03-10 22:30:24', '2018-03-10 22:30:24', NULL, NULL, NULL, NULL, 'github', '30191281', 72),
(52, '2018-03-14 08:15:08', '2018-03-14 08:15:08', NULL, NULL, NULL, NULL, 'oschina', '2688131', 73),
(53, '2018-03-23 10:16:47', '2018-03-23 10:16:47', NULL, NULL, NULL, NULL, 'weibo', '1742867282', 74),
(54, '2018-04-21 01:32:58', '2018-04-21 01:32:58', NULL, NULL, NULL, NULL, 'github', '13794500', 80),
(55, '2018-05-03 16:30:35', '2018-05-03 16:30:35', NULL, NULL, NULL, NULL, 'github', '18073663', 82),
(56, '2018-05-21 01:05:43', '2018-05-21 01:05:43', NULL, NULL, NULL, NULL, 'oschina', '1170156', 87),
(57, '2018-05-22 16:25:57', '2018-05-22 16:25:57', NULL, NULL, NULL, NULL, 'oschina', '3392984', 89);

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isSystem` bit(1) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `roleType` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrwtb6ktd4x1qi6sjjiu3134a1` (`catalog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `user_role`
--

INSERT INTO `user_role` (`id`, `addDate`, `lastDate`, `alias`, `catalog`, `description`, `isSystem`, `name`, `roleType`, `catalog_id`) VALUES
(1, '2018-05-21 08:52:04', '2018-05-21 08:52:04', '后台管理', NULL, '后台管理', NULL, '管理员', 0, 2),
(2, '2017-04-15 14:24:40', '2017-04-15 14:24:40', '普通管理员', NULL, NULL, NULL, '普通管理员', NULL, NULL),
(3, '2017-11-27 14:04:21', '2017-11-27 14:04:21', '后台编辑', NULL, '', NULL, '后台编辑', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `user_role_authority`
--

CREATE TABLE IF NOT EXISTS `user_role_authority` (
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(100) DEFAULT NULL,
  KEY `FKo6xok4ngrsuacqkyjpqbykn9l` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_role_authority`
--

INSERT INTO `user_role_authority` (`role_id`, `permission`) VALUES
(3, '12'),
(3, 'articlecatalog'),
(3, 'article'),
(3, '15'),
(3, 'forum'),
(3, 'forumpost'),
(1, '18'),
(1, '21'),
(1, 'userinfo'),
(1, 'useraccount'),
(1, 'userlabel'),
(1, '15'),
(1, 'forum'),
(1, 'forumpost'),
(1, '19'),
(1, 'questioncatalog'),
(1, 'question'),
(1, '20'),
(1, 'activitycatalog'),
(1, 'activity'),
(1, '12'),
(1, 'articlecatalog'),
(1, 'article'),
(1, '32'),
(1, 'stock'),
(1, 'stockdaytime'),
(1, '2'),
(1, 'menu'),
(1, 'userrole'),
(1, 'useroauthconfig'),
(1, 'linktype'),
(1, 'link'),
(1, 'userrolecatalog'),
(1, 'app'),
(1, '10'),
(1, 'tmpl'),
(1, '29'),
(1, 'storage_plugin');

-- --------------------------------------------------------

--
-- 表的结构 `user_role_catalog`
--

CREATE TABLE IF NOT EXISTS `user_role_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `levelInfo` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `sortNum` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkk8xoshxnvrtd39dd20k4vi85` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `user_role_catalog`
--

INSERT INTO `user_role_catalog` (`id`, `addDate`, `code`, `ids`, `lastDate`, `levelInfo`, `lft`, `name`, `rgt`, `sortNum`, `pid`) VALUES
(1, '2017-11-02 09:00:46', '', '1', '2017-11-02 09:00:46', 1, 1, '根节点', 6, 0, NULL),
(2, '2017-11-27 14:03:48', '001', '1,2', '2017-11-27 14:03:48', 2, 2, '系统角色', 3, NULL, 1),
(3, '2017-11-27 14:03:58', '002', '1,3', '2017-11-27 14:03:58', 2, 4, '职位角色', 5, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user_role_links`
--

CREATE TABLE IF NOT EXISTS `user_role_links` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKpm1oweb01msxxqf212qmd0984` (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_role_links`
--

INSERT INTO `user_role_links` (`user_id`, `roles_id`) VALUES
(1, 1),
(2, 1),
(4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7thxe31laycyvm1gq3ftkwnbt` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_verification`
--

CREATE TABLE IF NOT EXISTS `user_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `FK24r943kdkhofv6euw05a66v83` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK5astwo4df6pjyrl6b6u84nnu1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKj0xhtuxsig80ijl8y2m9qlm8x` FOREIGN KEY (`catalog_id`) REFERENCES `activity_catalog` (`id`);

--
-- 限制表 `activity_catalog`
--
ALTER TABLE `activity_catalog`
  ADD CONSTRAINT `FKi9yn9gnn9djfomgppfos0sogc` FOREIGN KEY (`pid`) REFERENCES `activity_catalog` (`id`);

--
-- 限制表 `album_album`
--
ALTER TABLE `album_album`
  ADD CONSTRAINT `FK1vrf0jp8481sxh60p12tbqvwn` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKb28j7s432btfaynlc2ft12o0o` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `album_feed`
--
ALTER TABLE `album_feed`
  ADD CONSTRAINT `FK867e395vayv607srm5dijy9jo` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKfn0kq50r4kyp1p66jafttcnth` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `album_photo`
--
ALTER TABLE `album_photo`
  ADD CONSTRAINT `FK716u4nm9v4ib2c154jxwl6ov` FOREIGN KEY (`album_id`) REFERENCES `album_album` (`id`),
  ADD CONSTRAINT `FK97568qnjxn4vjkif2gs7dbihc` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKci8lm9bfx09ohlyn94inyid14` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKeyyfgnxyndk5e3iaebdqegn4f` FOREIGN KEY (`category_id`) REFERENCES `album_category` (`id`);

--
-- 限制表 `album_photo_feeds`
--
ALTER TABLE `album_photo_feeds`
  ADD CONSTRAINT `FKa1xuj0vapw409bsb7t5dt9bjd` FOREIGN KEY (`PhotoFeed_id`) REFERENCES `album_feed` (`id`),
  ADD CONSTRAINT `FKk0vl5583gj2ij15crk6wqvk59` FOREIGN KEY (`photos_id`) REFERENCES `album_photo` (`id`);

--
-- 限制表 `album_photo_tags`
--
ALTER TABLE `album_photo_tags`
  ADD CONSTRAINT `FK8bjxnv5i8setjy93980v6msw8` FOREIGN KEY (`tags_name`) REFERENCES `album_tag` (`name`),
  ADD CONSTRAINT `FKj0h4wvaqnuix18mbprm73aj13` FOREIGN KEY (`Photo_id`) REFERENCES `album_photo` (`id`);

--
-- 限制表 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK2aptines4lfv2116021bh53gs` FOREIGN KEY (`catalog_id`) REFERENCES `article_catalog` (`id`),
  ADD CONSTRAINT `FKgfkys9w7qv3xcubq0drrayuu3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKmn2qxicijpxfpfo9dsd98hmnh` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `article_catalog`
--
ALTER TABLE `article_catalog`
  ADD CONSTRAINT `FKeltrcktceyicg6so4kxa1muy5` FOREIGN KEY (`pid`) REFERENCES `article_catalog` (`id`);

--
-- 限制表 `article_comment`
--
ALTER TABLE `article_comment`
  ADD CONSTRAINT `FKghmocqkgqs5tkmucf5putw64t` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FKng7pu6cu7u60myh95qpkueoje` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKq2u0dy36tq655hnhxal16of7k` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `article_like`
--
ALTER TABLE `article_like`
  ADD CONSTRAINT `FK13bn3spxe6xfy318i80669hon` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKabthli6g1qjriusniw93pbesw` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- 限制表 `article_link_tag`
--
ALTER TABLE `article_link_tag`
  ADD CONSTRAINT `FK3n4k9pr1q03p0ars5qsudil6a` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK8cbs5lfskjdpwpae5p48um1gr` FOREIGN KEY (`tags_id`) REFERENCES `article_tag` (`id`);

--
-- 限制表 `article_sensitive_category`
--
ALTER TABLE `article_sensitive_category`
  ADD CONSTRAINT `FK6yr0lp832885ybn738e80wlp4` FOREIGN KEY (`parent_id`) REFERENCES `article_sensitive_category` (`id`);

--
-- 限制表 `article_sensitive_word`
--
ALTER TABLE `article_sensitive_word`
  ADD CONSTRAINT `FK4jx243akswqmswta87kwsr4wb` FOREIGN KEY (`category_id`) REFERENCES `article_sensitive_category` (`id`),
  ADD CONSTRAINT `FK60j3fh8jt4ppq4pgiliuhhgax` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKebq1aflt9h1l0hki7qu3292yj` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `bbs_froum`
--
ALTER TABLE `bbs_froum`
  ADD CONSTRAINT `FK6mx1hhg43ldsargqke4vnyp48` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK99cbquciodl5d60fv27360ey0` FOREIGN KEY (`pid`) REFERENCES `bbs_froum` (`id`),
  ADD CONSTRAINT `FKcpeqv28x1i4pp9fraf175v9bf` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `bbs_froum_like`
--
ALTER TABLE `bbs_froum_like`
  ADD CONSTRAINT `FKjcpxxoemhrqpoiqgpcylflqqc` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKq69g1l1r0cvjlktxqcxx7xbh2` FOREIGN KEY (`forum_id`) REFERENCES `bbs_froum` (`id`),
  ADD CONSTRAINT `FKqlqxr9cuxaai5byaqfqgk9wxy` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `bbs_froum_post`
--
ALTER TABLE `bbs_froum_post`
  ADD CONSTRAINT `FKb3tmeksmb6d1j8vpn3nbgbobf` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKgj7qy7909dd2ol6jyqsng4vma` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKibbpsgu59dqb2pn93frws97ue` FOREIGN KEY (`forum_id`) REFERENCES `bbs_froum` (`id`);

--
-- 限制表 `bbs_froum_post_comment`
--
ALTER TABLE `bbs_froum_post_comment`
  ADD CONSTRAINT `FK7c99tgmo41xp25p806yb3td7f` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKl3609kpq1ndm8sj537g0n4h52` FOREIGN KEY (`post_id`) REFERENCES `bbs_froum_post` (`id`),
  ADD CONSTRAINT `FKlay37i2vhfvyjv3u94uq1hmpg` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `bbs_froum_post_like`
--
ALTER TABLE `bbs_froum_post_like`
  ADD CONSTRAINT `FK54q1j1txofkjnp86488hg4bmt` FOREIGN KEY (`post_id`) REFERENCES `bbs_froum_post` (`id`),
  ADD CONSTRAINT `FKjcn6xba9mu8vilcweu1w94prb` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKpjxwd5j68bgpp0ca3t47pdr9u` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `bbs_froum_post_text`
--
ALTER TABLE `bbs_froum_post_text`
  ADD CONSTRAINT `FKwm5wd5qoe1gldvyqrnsnncg6` FOREIGN KEY (`post_id`) REFERENCES `bbs_froum_post` (`id`);

--
-- 限制表 `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FKqcf9gem97gqa5qjm4d3elcqt5` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`);

--
-- 限制表 `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FKfy0n186b8arfdbdkkwp2h5cc5` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKs24cjdu0snsm1m2d512h84uqi` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `plugin_config_attribute`
--
ALTER TABLE `plugin_config_attribute`
  ADD CONSTRAINT `FK9s4k66fykxc5x1oo58bg0ku82` FOREIGN KEY (`PluginConfig_id`) REFERENCES `plugin_config` (`id`);

--
-- 限制表 `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK1qppmll4xo1lc5mo29t1btl4p` FOREIGN KEY (`catalog_id`) REFERENCES `question_catalog` (`id`),
  ADD CONSTRAINT `FKglt9wlox75ksa4w01xlqtkrii` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKtish917q79dtiyfly6coc9080` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `question_answer`
--
ALTER TABLE `question_answer`
  ADD CONSTRAINT `FKflwcda2rengsndju5f1deywok` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FKktm8m60ed0hoguu2e0ajiukps` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKqywdip0nvnrxt1ticvl3kydnw` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `question_answer_vote`
--
ALTER TABLE `question_answer_vote`
  ADD CONSTRAINT `FKhsa1983i7cqux1n53eojxwx4x` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKl4eaxmxp38b602u7slx5wpvqy` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKm1h5ifaa0uijbicdhjgspbcxh` FOREIGN KEY (`answer_id`) REFERENCES `question_answer` (`id`);

--
-- 限制表 `question_catalog`
--
ALTER TABLE `question_catalog`
  ADD CONSTRAINT `FKcsqfog6i2c9dluroqo1e5dwdd` FOREIGN KEY (`pid`) REFERENCES `question_catalog` (`id`);

--
-- 限制表 `question_favorite`
--
ALTER TABLE `question_favorite`
  ADD CONSTRAINT `FK8hhuq1wpts17ibsm3hpojs0bw` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKclt463wvm2gf9s4rl8ldjq8w1` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKhsljtebjn3ao1k2dihn89flu5` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- 限制表 `question_points`
--
ALTER TABLE `question_points`
  ADD CONSTRAINT `FKcp6ky2ygv6jcaokw12xxeg2gi` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKsiy6oq5wy41x0v2becwc4624u` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `question_vote`
--
ALTER TABLE `question_vote`
  ADD CONSTRAINT `FKast4xiggbs08xfqm2oltcl32l` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FKcm7sblt50ckv72bup6cgpp9xu` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKmepf1jggv0klnbk6ctaprihdh` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `site_app_version`
--
ALTER TABLE `site_app_version`
  ADD CONSTRAINT `FK9rgjxw6r5h7gf0e7ijfbademt` FOREIGN KEY (`app_id`) REFERENCES `site_app` (`id`);

--
-- 限制表 `site_link`
--
ALTER TABLE `site_link`
  ADD CONSTRAINT `FK1316ht5o7bmu4jbixoso45paa` FOREIGN KEY (`linkType_id`) REFERENCES `site_link_type` (`id`);

--
-- 限制表 `site_link_type`
--
ALTER TABLE `site_link_type`
  ADD CONSTRAINT `FKsve8aryqrci3acgot8k7rt6ix` FOREIGN KEY (`pid`) REFERENCES `site_link_type` (`id`);

--
-- 限制表 `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FKrg26e7f0ce0ha3393rmsypakq` FOREIGN KEY (`catalog_id`) REFERENCES `stock_catalog` (`id`),
  ADD CONSTRAINT `FK_by13tliqb2rowq8kgawcxy8a` FOREIGN KEY (`catalog_id`) REFERENCES `stock_catalog` (`id`);

--
-- 限制表 `stock_catalog`
--
ALTER TABLE `stock_catalog`
  ADD CONSTRAINT `FK1xbak41g3p45h9007alv7qd5u` FOREIGN KEY (`pid`) REFERENCES `stock_catalog` (`id`);

--
-- 限制表 `stock_day`
--
ALTER TABLE `stock_day`
  ADD CONSTRAINT `FK81rtcqs6iavvbxgw5cyxdb2pm` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- 限制表 `stock_day_time`
--
ALTER TABLE `stock_day_time`
  ADD CONSTRAINT `FKmjcrsqo0wj859bfiub1ptyrnf` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `FK2d7a9x588ugybj1ijsaopm8sb` FOREIGN KEY (`day_id`) REFERENCES `stock_day` (`id`);

--
-- 限制表 `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD CONSTRAINT `FK5hpba5xjvduisruknvsvmvlum` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- 限制表 `stock_like`
--
ALTER TABLE `stock_like`
  ADD CONSTRAINT `FK5bp6iyjnol1xg9rhc76su3byk` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK5ghcyfr8kmang43p1twveytkm` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `FKg6kgkp9k2upf70pg6lhbkuvaa` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `stock_note`
--
ALTER TABLE `stock_note`
  ADD CONSTRAINT `FKdye6ekfx6bkepwrisa2v4aeqt` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKee461td1sbgr6lr5il0yiop66` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `FKih8mh2mms7elcb7fsuc7rqtce` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `stock_record`
--
ALTER TABLE `stock_record`
  ADD CONSTRAINT `FKbc0h7youp6l1ifnchkwajsx8` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- 限制表 `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `FK2qnkifr1gf1i0ru8jru7c3y26` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKloyhlvrn82g8811wyjaa8ehm0` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_code`
--
ALTER TABLE `user_code`
  ADD CONSTRAINT `FKfulmxb2y8nrres564ymc2kqr4` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKhl59ydgsrne3klfrm0qa3kv90` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_device`
--
ALTER TABLE `user_device`
  ADD CONSTRAINT `FK7pbdo1j8ksdxaa6mkka1oi1r5` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKj1l1y3ohj369aq3u6gb7fr6p7` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_feedback`
--
ALTER TABLE `user_feedback`
  ADD CONSTRAINT `FKfjxq06hj1obi36glqqlbimt4g` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKjophgaybnc4xcgxybd71q3toj` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `FK8neem6q3gq9drr17pbrdp642k` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKavvn2n1cv6qqxh1t2c49m7ta7` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKok5m3y3tqfk4hte82xa0s2twh` FOREIGN KEY (`followid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKsvkcr4aud3e9vq85mrrrys0mr` FOREIGN KEY (`followid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_friend`
--
ALTER TABLE `user_friend`
  ADD CONSTRAINT `FK39h0uev157c0oigcd85ugeefh` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKa3tlib4de0iog0m2nyqknoj4e` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKio66ta2p6fg6x0ykd3osfnjl4` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKng9pd4bqcnmpxow28v6aerdnb` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_friend_request`
--
ALTER TABLE `user_friend_request`
  ADD CONSTRAINT `FKafdxg26cqlsrvxobfulab2afv` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKm5kn6kt0cp72cwebhgmbvvet4` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKnjw6m8a3uw3umlkvno0kj5mnv` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKnr0n3evlg1nquiyna2t44m1ft` FOREIGN KEY (`friendid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_github`
--
ALTER TABLE `user_github`
  ADD CONSTRAINT `FK9u0xasuywdhvahb0g9sfn1w6q` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKbxnb0ygb4ef60ud3voqene56q` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_info_attribute`
--
ALTER TABLE `user_info_attribute`
  ADD CONSTRAINT `FK2k9wd2mn3jh6g1wqq2c2b02xl` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKjf8g1vng9lpmniy8u187j7t0` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_label_links`
--
ALTER TABLE `user_label_links`
  ADD CONSTRAINT `FK5njpwjktgb87ggnjm63vejdwc` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKe69vxi1aiq7ww12d8pf03hrn1` FOREIGN KEY (`labels_id`) REFERENCES `user_label` (`id`);

--
-- 限制表 `user_login_log`
--
ALTER TABLE `user_login_log`
  ADD CONSTRAINT `FKj91w0nnfocpdp796lr3ot4lxs` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKq1wyinji5bvwearcopg9x5ipu` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_message`
--
ALTER TABLE `user_message`
  ADD CONSTRAINT `FK843q4824idh2vkngwwamvidel` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKcu2q6axhu3g31g1vbuosec525` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKprww0bw44m48y4xxbkv13u5g7` FOREIGN KEY (`subject_id`) REFERENCES `user_message_subject` (`id`);

--
-- 限制表 `user_message_member`
--
ALTER TABLE `user_message_member`
  ADD CONSTRAINT `FK2lven49o6lj1fnlb47lwjs9g9` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKik0cncmywqgej7e1memege57i` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKq810ie1390jw6r2umbsvtpusf` FOREIGN KEY (`subjectid`) REFERENCES `user_message_subject` (`id`);

--
-- 限制表 `user_message_subject`
--
ALTER TABLE `user_message_subject`
  ADD CONSTRAINT `FK1i9f2ekhf4y4xk5cqwr0unb1i` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK91f6ad7nyqokfft2mxq3oc79g` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `FK25yxc2g4kt2wk510uy05nr10f` FOREIGN KEY (`catalogid`) REFERENCES `user_notification_catalog` (`id`),
  ADD CONSTRAINT `FKen7mn6n9j4ach4hyewfjakkg2` FOREIGN KEY (`authorid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKgyrdi6od1ol1b89rv6cjmegw8` FOREIGN KEY (`authorid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_notification_catalog`
--
ALTER TABLE `user_notification_catalog`
  ADD CONSTRAINT `FKgftt45f6mnajuk0k4c8aya4ew` FOREIGN KEY (`pid`) REFERENCES `user_notification_catalog` (`id`);

--
-- 限制表 `user_notification_member`
--
ALTER TABLE `user_notification_member`
  ADD CONSTRAINT `FKlatb6olq7rthe83lg86qovdqh` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKnjtrfb6q35ja368lkcl1fwume` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKolldeppu9xw9we1jwgcvpc6m7` FOREIGN KEY (`notificationid`) REFERENCES `user_notification` (`id`);

--
-- 限制表 `user_notification_num`
--
ALTER TABLE `user_notification_num`
  ADD CONSTRAINT `FK70rnp6y24q70m5px6hvjmjoh3` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKmi0949b37eayfjjpvv421bmvy` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_notification_time`
--
ALTER TABLE `user_notification_time`
  ADD CONSTRAINT `FK3y342m36l9l8l79adp3taic3k` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK5co2x7rgocx6fmbfptaknqxh8` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_oauth_info_oschina`
--
ALTER TABLE `user_oauth_info_oschina`
  ADD CONSTRAINT `FKjb6v7f52g5jjbpl4dvper40it` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKpsmg1gm8l8oelyb0bcvfcowhl` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_oauth_token`
--
ALTER TABLE `user_oauth_token`
  ADD CONSTRAINT `FK652cq94oppkulkshghmjiudci` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKhco9s5j1bhp44w3mpt19kmi21` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

--
-- 限制表 `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKrwtb6ktd4x1qi6sjjiu3134a1` FOREIGN KEY (`catalog_id`) REFERENCES `user_role_catalog` (`id`);

--
-- 限制表 `user_role_authority`
--
ALTER TABLE `user_role_authority`
  ADD CONSTRAINT `FK831pgrqk3uemmfgm1u55o1oly` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`),
  ADD CONSTRAINT `FKo6xok4ngrsuacqkyjpqbykn9l` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

--
-- 限制表 `user_role_catalog`
--
ALTER TABLE `user_role_catalog`
  ADD CONSTRAINT `FKkk8xoshxnvrtd39dd20k4vi85` FOREIGN KEY (`pid`) REFERENCES `user_role_catalog` (`id`);

--
-- 限制表 `user_role_links`
--
ALTER TABLE `user_role_links`
  ADD CONSTRAINT `FK3r2sf8531lbjt40y3qjhkg2an` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKjs7bulftjcyvg4law45typ5v4` FOREIGN KEY (`roles_id`) REFERENCES `user_role` (`id`),
  ADD CONSTRAINT `FKors5gr65efwj93j0yxk4u02j7` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FKpm1oweb01msxxqf212qmd0984` FOREIGN KEY (`roles_id`) REFERENCES `user_role` (`id`);

--
-- 限制表 `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `FK78jw8we5cvtlg3ggeotefnfi2` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `FK7thxe31laycyvm1gq3ftkwnbt` FOREIGN KEY (`userid`) REFERENCES `user_info` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
