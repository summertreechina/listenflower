#生活服务分类表
CREATE TABLE `o2o_category`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(50) NOT NULL  default '',
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#城市表
CREATE TABLE `o2o_city`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(50) NOT NULL  default '',
    `uname` varchar(50) NOT NULL  default '',
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    UNIQUE KEY uname(`uname`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#商圈表
CREATE TABLE `o2o_area`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(50) NOT NULL  default '',
    `city_id` int(11) unsigned NOT NULL default 0,
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    KEY city_id(`city_id`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#商户表
CREATE TABLE `o2o_bis`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(50) NOT NULL  default '',
    `email` varchar(50) NOT NULL  default '',
    `logo` varchar(255) NOT NULL  default '',
    `licence_logo` varchar(255) NOT NULL  default '',
    `description` text NOT NULL,
    `city_id` int(11) unsigned NOT NULL default 0,
    `city_path` varchar(50) NOT NULL  default '',
    `bank_info` varchar(50) NOT NULL  default '',
    `money` decimal(20,2) NOT NULL default '0.00',
    `bank_name` varchar(50) NOT NULL  default '',
    `bank_user` varchar(50) NOT NULL  default '',
    `faren` varchar(20) NOT NULL  default '',
    `faren_tel` varchar(20) NOT NULL  default '',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY name(`name`),
    KEY city_id(`city_id`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;




#商户账号表
CREATE TABLE `o2o_bis_account`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `username` varchar(50) NOT NULL  default '',
    `password` char(32) NOT NULL default '',
    `code` varchar(10) NOT NULL  default '',
    `bis_id` int(11) unsigned NOT NULL default 0,
    `last_login_ip` varchar(20) NOT NULL  default '',
    `last_login_time` int(11) unsigned NOT NULL default 0,
    `is_main` tinyint(1) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY username(`username`),
    KEY bis_id(`bis_id`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#商户门店表
CREATE TABLE `o2o_bis_location`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(50) NOT NULL default '',
    `logo` varchar(255) NOT NULL default '',
    `address` varchar(255) NOT NULL default '',
    `tel` varchar(20) NOT NULL default '',
    `contact` varchar(20) NOT NULL default '',
    `xpoint` varchar(20) NOT NULL default '',
    `ypoint` varchar(20) NOT NULL default '',
    `bis_id` int(11) unsigned NOT NULL default 0,
    `open_time`int(11) unsigned NOT NULL default 0,
    `content` text NOT NULL,
    `is_main` tinyint(1) unsigned NOT NULL default 0,
    `api_address` varchar(255) NOT NULL default '',
    `city_id` int(11) unsigned NOT NULL default 0,
    `city_path` varchar(50) NOT NULL  default '',
    `category` int(11) unsigned NOT NULL default 0,
    `cvtegoty_path` varchar(50) NOT NULL default '',
    `bank_info` varchar(50) NOT NULL default '',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY name(`name`),
    KEY city_id(`city_id`),
    KEY bis_id(`bis_id`),
    KEY categoty(`category`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#团购商品表
CREATE TABLE `o2o_deal`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(100) NOT NULL  default '',
    `category_id` int(11) NOT NULL default 0,
    `se_category_id` int(11) NOT NULL default 0,
    `bis_id` int(11) NOT NULL default 0,
    `location-ids` varchar(100) NOT NULL default '',
    `image` varchar(200) NOT NULL default '',
    `description` text NOT NULL,
    `start_time` int(11) unsigned NOT NULL default 0,
    `end_time` int(11) unsigned NOT NULL default 0,
    `origin_price` decimal(20,2) NOT NULL default '0.00',
    `current_price` decimal(20,2) NOT NULL default '0.00',
    `city_id` int(11) unsigned NOT NULL default 0,
    `buy_count` int(11) unsigned NOT NULL default 0,
    `total_count` int(11) unsigned NOT NULL default 0,
    `coupons_begin_time` int(11) unsigned NOT NULL default 0,
    `coupons_end_time` int(11) unsigned NOT NULL default 0,
    `xpoint` varchar(20) NOT NULL  default '',
    `ypoint` varchar(20) NOT NULL  default '',
    `bis_account_id` int(11) unsigned NOT NULL default 0,
    `balance_price` decimal(20,2) NOT NULL default '0.00',
    `notes` text NOT NULL,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY category_id(`category_id`),
    KEY se_category_id(`se_category_id`),
    KEY city_id(`city_id`),
    KEY start_time(`start_time`),
    KEY end_time(`end_time`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#用户表
CREATE TABLE `o2o_user`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `username` varchar(20) NOT NULL  default '',
    `password` char(32) NOT NULL default '',
    `code` varchar(10) NOT NULL  default '',
    `last_login_ip` varchar(20) NOT NULL  default '',
    `last_login_time` int(11) unsigned NOT NULL default 0,
    `email` varchar(30) NOT NULL  default '',
    `mobile` varchar(10) NOT NULL  default '',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY username(`username`),
    UNIQUE KEY email(`email`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#推荐位表
CREATE TABLE `o2o_featured`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `type` tinyint(1) NOT NULL default 0,
    `title` varchar(32) NOT NULL default '',
    `image` varchar(255) NOT NULL default '',
    `url` varchar(255) NOT NULL default '',
    `description` varchar(255) NOT NULL default '',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL default 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#订单表
CREATE TABLE `o2o_order`(
    `id` int(11) unsigned NOT NULL auto_increment,
	`out_trade_no` varchar(100) NOT NULL default '',
	`transaction_id` varchar(100) NOT NULL default '',
	`user_id` int(11) unsigned NOT NULL default 0,
	`username` varchar(32) NOT NULL default '',
	`pay_time` varchar(32) NOT NULL default '',
	`payment_id` tinyint(1) NOT NULL default 1,
	`deal_id` int(11) unsigned NOT NULL default 0,
	`deal_ount` int(11) unsigned NOT NULL default 0,
	`pay_status` tinyint(1) NOT NULL default 1,
	`total_price` decimal(20,2) NOT NULL default '0.00',
	`pay_amount` decimal(20,2) NOT NULL default '0.00',
    `referer` varchar(255) NOT NULL default '',
    `status` tinyint(1) NOT NULL default 1,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
	UNIQUE KEY `out_trade_no`(`out_trade_no`),
	key user_id(`user_id`),
	key create_time(`create_time`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;


#消费券表
CREATE TABLE `o2o_coupons`(
    `id` int(11) unsigned NOT NULL auto_increment,	
	`sn` varchar(100) NOT NULL default '',
	`password` varchar(100) NOT NULL default '',
	`user_id` int(11) unsigned NOT NULL default 0,	
	`deal_id` int(11) unsigned NOT NULL default 0,
	`order_id` int(11) unsigned NOT NULL default 0,	
    `status` tinyint(1) NOT NULL default 1,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
	UNIQUE KEY `sn`(`sn`),
	key user_id(`user_id`),
	key deal_id(`deal_id`),
	key create_time(`create_time`)
)ENGINE=InnoDB auto_increment=1 default CHARSET=UTF8;



