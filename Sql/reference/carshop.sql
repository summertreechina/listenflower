-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 05 月 07 日 13:00
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `carshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_admin`
--

CREATE TABLE IF NOT EXISTS `cs_admin` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `roleid` mediumint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `cs_admin`
--

INSERT INTO `cs_admin` (`id`, `username`, `password`, `roleid`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(13, 'guanliyuan', 'e10adc3949ba59abbe56e057f20f883e', 1),
(12, 'tp', 'e10adc3949ba59abbe56e057f20f883e', 8),
(11, 'tongpan', 'e10adc3949ba59abbe56e057f20f883e', 7);

-- --------------------------------------------------------

--
-- 表的结构 `cs_article`
--

CREATE TABLE IF NOT EXISTS `cs_article` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `atype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:列表 1：车型 2：招聘',
  `rizu` mediumint(6) NOT NULL COMMENT '日租价格',
  `num` varchar(3) NOT NULL COMMENT '招聘人数',
  `author` varchar(20) NOT NULL,
  `pic` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `rem` tinyint(1) NOT NULL DEFAULT '0',
  `cateid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `cs_article`
--

INSERT INTO `cs_article` (`id`, `title`, `atype`, `rizu`, `num`, `author`, `pic`, `content`, `keywords`, `des`, `rem`, `cateid`, `time`) VALUES
(1, '1', 0, 0, '', '2', './Public/Uploads/2016-04-07/570650c43db3b.jpg', '&lt;p&gt;123456778&lt;br/&gt;&lt;/p&gt;', '3', '4', 1, 75, 1461511847),
(12, '测试新闻资讯1', 0, 0, '', '', '', '', '', '', 0, 69, 1461727928),
(13, '测试新闻资讯2', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727944),
(7, '测试文章2', 1, 1000, '', '', '', '&lt;p&gt;测试文章2测试文章2测试文章2&lt;/p&gt;', '', '', 0, 68, 1461732611),
(8, '测试文章5', 0, 0, '', '', '', '', '', '', 0, 69, 1461511830),
(9, '测试文章6', 0, 0, '', '', './Public/Uploads/2016-05-03/5728bb5fc39d9.jpg', '&lt;p&gt;测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6&lt;/p&gt;', '', '', 0, 70, 1462287199),
(10, '车型展示1', 1, 100, '', '1', '', '&lt;p&gt;车型展示1车型展示1车型展示1&lt;br/&gt;&lt;/p&gt;', '2', '3', 1, 68, 1461909821),
(11, 'UI设计师1', 2, 0, '21', '', '', '&lt;p&gt;1、收集和分析用户界面需求；&lt;br/&gt;2、结合用户体验及技术可行性确定线框图；&lt;br/&gt;3、将线框图设计为平面效果图；&lt;br/&gt;4、跟踪开发和测试；&lt;br/&gt;5、根据数据分析，对页面进行优化。111&lt;/p&gt;', '', '', 0, 27, 1460435581),
(14, '测试新闻资讯3', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727959),
(15, '测试车辆展示1', 0, 0, '', '', './Public/Uploads/2016-04-27/572043b5b427e.jpg', '&lt;p&gt;测试车辆展示1测试车辆展示1测试车辆展示1测试车辆展示1&lt;/p&gt;', '', '', 0, 68, 1461732277),
(16, '测试车辆展示2', 1, 100, '', '', './Public/Uploads/2016-04-27/5720440116c2c.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 0, 68, 1461732353),
(17, '测试车辆展示3', 1, 234, '', '', './Public/Uploads/2016-04-27/5720442390d32.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 1, 68, 1461732387),
(18, '测试荣誉1', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e25f1d53e.jpg', '&lt;p&gt;测试荣誉1测试荣誉1测试荣誉1&lt;/p&gt;', '', '', 0, 80, 1461772895),
(19, '测试荣誉2', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e284db8d7.jpg', '&lt;p&gt;测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2&lt;/p&gt;', '', '', 0, 80, 1461772932),
(20, '荣誉3', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e29cd839b.jpg', '&lt;p&gt;荣誉3荣誉3荣誉3荣誉3&lt;/p&gt;', '', '', 0, 80, 1461772956),
(21, '招聘设计师', 2, 0, '3', '', '', '', '', '01、收集和分析用户界面需求；&lt;br&gt;\r\n02、结合用户体验及技术可行性确定线框图；&lt;br&gt;\r\n03、将线框图设计为平面效果图；&lt;br&gt;\r\n04、跟踪开发和测试；&lt;br&gt;\r\n05、根据数据分析，对页面进行优化。&lt;br&gt;', 0, 85, 1461773834),
(22, 'php工程师', 2, 0, '10', '', '', '', '', '1、收集和分析用户界面需求1；\r\n2、结合用户体验及技术可行性确定线框图2；\r\n3、将线框图设计为平面效果图3；\r\n4、跟踪开发和测试4；\r\n5、根据数据分析，对页面进行优化5。', 0, 85, 1461773597),
(23, '招聘前端', 2, 0, '4', '', '', '', '', '1、收集和分析用户界面需求；\r\n2、结合用户体验及技术可行性确定线框图；\r\n3、将线框图设计为平面效果图；\r\n4、跟踪开发和测试；\r\n5、根据数据分析，对页面进行优化。', 0, 85, 1461773624),
(24, '费用说明测试文章1', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章1费用说明测试文章1&lt;/p&gt;', '', '', 0, 91, 1462463649),
(25, '费用说明测试文章2', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章2费用说明测试文章2费用说明测试文章2&lt;/p&gt;', '', '', 0, 91, 1462463677),
(26, '费用说明测试文章3', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3&lt;/p&gt;', '', '', 0, 91, 1462463699),
(27, '费用说明测试文章4', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章4费用说明测试文章4费用说明测试文章4费用说明测试文章4&lt;/p&gt;', '', '', 0, 91, 1462463716),
(28, '费用说明测试文章5', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5&lt;/p&gt;', '', '', 0, 91, 1462463744),
(29, '费用说明测试文章6', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6&lt;/p&gt;', '', '', 0, 91, 1462463765),
(30, '费用说明测试文章7', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7&lt;/p&gt;', '', '', 0, 91, 1462463783),
(31, '车辆展示1', 0, 0, '', '', './Public/Uploads/2016-05-06/572c25f280ede.jpg', '&lt;p&gt;车辆展示1车辆展示1车辆展示1车辆展示1车辆展示1&lt;/p&gt;', '', '', 0, 93, 1462511090),
(32, '车辆展示2', 0, 0, '', '', './Public/Uploads/2016-05-06/572c260d27369.jpg', '&lt;p&gt;车辆展示2车辆展示2车辆展示2车辆展示2&lt;/p&gt;', '', '', 0, 93, 1462511117),
(33, '车辆展示3', 0, 0, '', '', './Public/Uploads/2016-05-06/572c262a12607.jpg', '&lt;p&gt;车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511146),
(34, '车辆展示4', 0, 0, '', '', './Public/Uploads/2016-05-06/572c2644de5d6.jpg', '&lt;p&gt;车辆展示3车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511172),
(35, '车辆展示5', 0, 0, '', '', './Public/Uploads/2016-05-06/572c265c62ab5.jpg', '&lt;p&gt;车辆展示5车辆展示5车辆展示5车辆展示5车辆展示5&lt;/p&gt;', '', '', 0, 93, 1462511196);

-- --------------------------------------------------------

--
-- 表的结构 `cs_cate`
--

CREATE TABLE IF NOT EXISTS `cs_cate` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是pc端栏目',
  `class` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//栏目级别',
  `sort` mediumint(5) DEFAULT '50',
  `pic` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `parentid` mediumint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `cs_cate`
--

INSERT INTO `cs_cate` (`id`, `name`, `type`, `pc`, `class`, `sort`, `pic`, `content`, `keywords`, `des`, `parentid`) VALUES
(67, '关于我们', 2, 1, 1, 1, NULL, '&lt;p&gt;关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;3235ac20f8f58f91831c93c0580e7a3a.jpg&quot; src=&quot;/ueditor/php/upload/image/20160428/1461858352351741.jpg&quot; title=&quot;1461858352351741.jpg&quot;/&gt;&lt;/p&gt;', '', '', 0),
(68, '车辆展示', 5, 1, 1, 2, NULL, '', '', '', 0),
(69, '新闻资讯', 1, 1, 1, 3, NULL, '', '', '', 0),
(70, '主要车型', 5, 1, 1, 4, NULL, '', '', '', 0),
(71, '热门车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(72, '豪华车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(73, '小车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(74, '紧凑车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(75, '大众', 5, 1, 3, 50, NULL, '', '', '', 71),
(76, '寒假班', 5, 1, 3, 50, NULL, '', '', '', 71),
(77, '宝马', 5, 1, 3, 50, NULL, '', '', '', 72),
(78, '奔驰', 5, 1, 3, 50, NULL, '', '', '', 72),
(79, '测试新闻', 1, 1, 2, 50, NULL, '', '', '', 69),
(80, '资质荣誉', 6, 1, 1, 5, NULL, '', '', '', 0),
(81, '测试新闻2', 1, 1, 2, 50, NULL, '', '', '', 69),
(82, '测试三级1', 1, 1, 3, 50, NULL, '', '', '', 79),
(83, '测试三级2', 1, 1, 3, 50, NULL, '', '', '', 79),
(84, '租车须知', 2, 1, 1, 6, NULL, '&lt;p&gt;租车须知租车须知租车须知租车须知租车须知租车须知&lt;/p&gt;', '', '', 0),
(85, '人才招聘', 4, 1, 1, 7, NULL, '', '', '', 0),
(86, '在线留言', 3, 1, 1, 8, NULL, '', '', '', 0),
(87, '联系我们', 2, 1, 1, 9, NULL, '&lt;p&gt;&lt;img src=&quot;http://api.map.baidu.com/staticimage?center=116.450111,39.927669&amp;zoom=13&amp;width=530&amp;height=340&amp;markers=116.450111,39.927669&quot; height=&quot;340&quot; width=&quot;530&quot;/&gt;&lt;/p&gt;', '', '', 0),
(88, '公司简介', 2, 0, 1, 10, NULL, '&lt;p&gt;关于我们关于我们关于我们&lt;/p&gt;', '', '', 0),
(89, '如何租车', 2, 0, 1, 11, NULL, '&lt;p&gt;如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车&lt;/p&gt;', '', '', 0),
(90, '如何还车', 2, 0, 1, 12, NULL, '&lt;p&gt;如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车&lt;/p&gt;', '', '', 0),
(91, '费用说明', 1, 0, 1, 13, NULL, '', '', '', 0),
(92, '优惠活动', 5, 0, 1, 14, NULL, '', '', '', 0),
(93, '展示车辆', 5, 0, 1, 15, NULL, '', '', '', 0),
(94, '车辆保养', 1, 0, 1, 16, NULL, '', '', '', 0),
(95, '联系方式', 2, 0, 1, 17, NULL, '&lt;p&gt;联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们&lt;/p&gt;', '', '', 0),
(96, '招聘人才', 2, 0, 1, 18, NULL, '&lt;p&gt;招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘&lt;/p&gt;', '', '', 0),
(97, '客户评价', 3, 0, 1, 19, NULL, '                                                                    ', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_job`
--

CREATE TABLE IF NOT EXISTS `cs_job` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sex` varchar(10) NOT NULL DEFAULT '男',
  `nation` varchar(30) NOT NULL COMMENT '民族',
  `age` varchar(15) NOT NULL COMMENT '生日',
  `marry` varchar(10) NOT NULL DEFAULT '未婚',
  `child` varchar(10) NOT NULL DEFAULT '无' COMMENT '有无子女',
  `bplace` varchar(20) NOT NULL COMMENT '籍贯',
  `address` varchar(100) NOT NULL COMMENT '户口所在地',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `foreign` varchar(150) NOT NULL COMMENT '外语语种及程度',
  `mobile` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `idnums` varchar(30) NOT NULL COMMENT '身份证号',
  `address_now` varchar(255) NOT NULL COMMENT '住址',
  `slim` varchar(20) NOT NULL COMMENT '可到职日期',
  `content` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `cs_job`
--

INSERT INTO `cs_job` (`id`, `title`, `name`, `sex`, `nation`, `age`, `marry`, `child`, `bplace`, `address`, `education`, `foreign`, `mobile`, `email`, `idnums`, `address_now`, `slim`, `content`) VALUES
(1, '招聘前端', '中国', '男', '蒙古族', '', '未婚', '', '', '', '硕士', '', '', '', '', '', '随时', ''),
(5, 'php工程师', '童攀', '男', '蒙古族', '', '', '有', '北京市', '天津市', '博士', '', '13781652589', '', '', '', '随时', ''),
(6, 'php工程师', '童攀', '男', '汉族', '1990-03-06', '未婚', '有', '天津市', '北京市', '博士', '英语', '13781652457', 'tongpan@163.com', '411425199002259159', '北京朝阳区', '1周内', '这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍这里是我的个人介绍');

-- --------------------------------------------------------

--
-- 表的结构 `cs_link`
--

CREATE TABLE IF NOT EXISTS `cs_link` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `url` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `sort` mediumint(5) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `cs_link`
--

INSERT INTO `cs_link` (`id`, `title`, `url`, `des`, `sort`) VALUES
(5, '360', 'http://www.360.cn', 'http://www.baidu.com', 1),
(7, '百度', 'http://www.baidu.com', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `cs_message`
--

CREATE TABLE IF NOT EXISTS `cs_message` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1pc端发布0移动端发布',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `cs_message`
--

INSERT INTO `cs_message` (`id`, `nickname`, `telephone`, `email`, `content`, `checked`, `type`, `time`) VALUES
(14, '手机留言', '', '', '手机留言手机留言手机留言手机留言手机留言手机留言', 1, 0, 0),
(15, '手机留言2', '', '', '手机留言2手机留言2手机留言2', 1, 0, 0),
(16, '手机留言3', '', '', '手机留言3手机留言3手机留言3手机留言3', 1, 0, 0),
(17, '新增留言测试', '', '', '新增留言测试新增留言测试新增留言测试', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_privilege`
--

CREATE TABLE IF NOT EXISTS `cs_privilege` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(20) NOT NULL COMMENT '//权限名称',
  `mname` varchar(20) NOT NULL COMMENT '//模块名称',
  `cname` varchar(20) NOT NULL COMMENT '//控制器名称',
  `aname` varchar(20) NOT NULL COMMENT '//方法名称',
  `parentid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '//上级权限的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `cs_privilege`
--

INSERT INTO `cs_privilege` (`id`, `pri_name`, `mname`, `cname`, `aname`, `parentid`) VALUES
(22, '文章添加', 'Admin', 'Article', 'add', 21),
(18, '栏目管理', 'Admin', 'Cate', 'lst', 17),
(19, '栏目添加', 'Admin', 'Cate', 'add', 18),
(20, '栏目删除', 'Admin', 'Cate', 'del', 18),
(17, '常用操作', 'admin', 'cycz', 'cycz', 0),
(21, '文章管理', 'Admin', 'Article', 'lst', 17),
(23, '文章修改', 'Admin', 'Article', 'edit', 21),
(24, '友情链接管理', 'Admin', 'Link', 'lst', 17),
(25, '友情链接添加', 'Admin', 'Link', 'add', 24),
(26, '友情链接删除', 'Admin', 'Link', 'del', 24),
(27, '友情链接批量删除', 'Admin', 'Link', 'bdel', 24),
(28, '栏目批量删除', 'Admin', 'Cate', 'bdel', 18),
(29, '文章批量删除', 'Admin', 'Article', 'bdel', 21),
(30, '系统管理', 'Admin', 'Admin', 'system', 0),
(31, '系统设置', 'Admin', 'System', 'lst', 30),
(32, '管理员管理', 'Admin', 'Admin', 'lst', 30),
(33, '管理员添加', 'Admin', 'Admin', 'add', 32),
(34, '管理员删除', 'Admin', 'Admin', 'del', 32),
(35, '管理员批量删除', 'Admin', 'Admin', 'bdel', 32),
(36, '管理员修改', 'Admin', 'Admin', 'edit', 32),
(37, '链接批量更新', 'Admin', 'Link', 'sortlink', 24);

-- --------------------------------------------------------

--
-- 表的结构 `cs_reply`
--

CREATE TABLE IF NOT EXISTS `cs_reply` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `mid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `cs_reply`
--

INSERT INTO `cs_reply` (`id`, `content`, `mid`, `time`) VALUES
(19, '谢谢留言', 14, 1462526670),
(20, '测试回复', 15, 1462526716),
(18, '感谢您的支持', 14, 1462526659);

-- --------------------------------------------------------

--
-- 表的结构 `cs_role`
--

CREATE TABLE IF NOT EXISTS `cs_role` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) NOT NULL,
  `pri_id_list` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `cs_role`
--

INSERT INTO `cs_role` (`id`, `rolename`, `pri_id_list`) VALUES
(1, '超级管理员', '*'),
(6, '栏目管理员', '17,18,19,20'),
(7, '文章管理员', '17,21,22,23'),
(8, '友情链接管理员', '17,24,25,26,27,37'),
(9, '管理员', '17,18,19,20,21,22,23,24,25,26,27');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
