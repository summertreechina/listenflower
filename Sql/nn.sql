/* 用户表 `nn_user` */
DROP TABLE IF EXISTS `nn_user`;
CREATE TABLE `nn_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` int(11) unsigned COMMENT '手机号码',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是admin',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`uid`),
  KEY `name` (`uname`) USING BTREE,
  UNIQUE KEY uname(`uname`)
) ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8 COMMENT='用户表';

/* 用户信息表 `nn_userinfo` */
DROP TABLE IF EXISTS `nn_userinfo`;
CREATE TABLE `nn_userinfo` (
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `join_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间都',
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';

/* 角色表 `nn_role` */
DROP TABLE IF EXISTS `nn_role`;
CREATE TABLE `nn_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间都',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='泛角色表';

/* 管理类角色表 `nn_manager_role` */
DROP TABLE IF EXISTS `nn_manager_role`;
CREATE TABLE `nn_manager_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间都',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理类角色表';

/* 分类表 `nn_category` */
DROP TABLE IF EXISTS `nn_category`;
CREATE TABLE `nn_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类的id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类状态',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间都',
  `operater_id` int(11) unsigned NOT NULL COMMENT '操作人的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

/* 通用分类表 `nn_cates` */
DROP TABLE IF EXISTS `nn_cates`;
CREATE TABLE `nn_cates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `explain` varchar(200) DEFAULT '' COMMENT '说明',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类的id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类状态',
  `update_time` int(11) unsigned COMMENT '更新时间',
  `create_time` int(11) unsigned COMMENT '创建时间都',
  `operate_log_id` int(11) unsigned NOT NULL COMMENT '操作记录的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用分类表';


