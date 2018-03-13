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

/* 问题表 `nn_ask` */
DROP TABLE IF EXISTS `nn_ask`;
CREATE TABLE `nn_ask` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(900) NOT NULL DEFAULT '' COMMENT '问题内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '问题状态，1审过，0待审，2软删除',
  `explain` varchar(900) DEFAULT '' COMMENT '答案解读',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '问题提供者',
  `update_time` int(11) unsigned COMMENT '更新时间',
  `create_time` int(11) unsigned COMMENT '创建时间',
  `delete_time` int(11) unsigned COMMENT '软删除时间',
  `operate_log_id` int(11) unsigned NOT NULL COMMENT '操作记录的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题表';

CREATE TABLE `nn_ask` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(900) NOT NULL DEFAULT '' COMMENT '问题内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '问题状态，1审过，0待审，2软删除',
  `explain` varchar(900) DEFAULT '' COMMENT '答案解读',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '问题提供者',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '软删除时间',
  `operate_log_id` int(11) unsigned NOT NULL COMMENT '操作记录的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='问题表';

/* 答案表 `nn_ans` */
DROP TABLE IF EXISTS `nn_ans`;
CREATE TABLE `nn_ans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL DEFAULT '' COMMENT '分类名称',
  `ask_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属的问题的id',
  `isRight` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1正确，0错误',
  `update_time` int(11) unsigned COMMENT '更新时间',
  `create_time` int(11) unsigned COMMENT '创建时间',
  `operate_log_id` int(11) unsigned NOT NULL COMMENT '操作记录的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答案表';

/* 用户表 `TR用户表` */
DROP TABLE IF EXISTS `nn_truser`;
CREATE TABLE `nn_truser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `corpid` int(11) NOT NULL DEFAULT '0' COMMENT '单位的id',
  `idcard` bigint(20) DEFAULT '' COMMENT '身份证号码',
  `role` varchar(30) DEFAULT '' COMMENT '会员角色',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `update_time` timestamp DEFAULT '' COMMENT '更新时间',
  `create_time` timestamp DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8 COMMENT='TR用户表';

/* TR用户成绩表 `nn_TRUserScore` */
DROP TABLE IF EXISTS `nn_truserScore`;
CREATE TABLE `nn_truserScore` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '成绩id',
  `score` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '成绩',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TR用户成绩表';

/* TR用明日题库 `nn_TRTomorrow` */
DROP TABLE IF EXISTS `nn_TRTomorrow`;
CREATE TABLE `nn_TRTomorrow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '题库id',
  `items` varchar(600) NOT NULL DEFAULT '' COMMENT '试题id',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `use_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TR明日试题';


/* 用户表 `TR公司信息表` */
DROP TABLE IF EXISTS `nn_trcorp`;
CREATE TABLE `nn_trcorp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司id',
  `corpname` varchar(60) NOT NULL DEFAULT '' COMMENT '公司名称',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '公司昵称',
  `address` varchar(60) NOT NULL DEFAULT '' COMMENT '地址',
  `corpuser` varchar(60) NOT NULL DEFAULT '' COMMENT '企业联系人',
  `contact` varchar(300) NOT NULL DEFAULT '' COMMENT '各种联系方式',
  `other` varchar(900) NOT NULL DEFAULT '' COMMENT '其他信息',
  `uppercorpid` int(11) NOT NULL DEFAULT '0' COMMENT '上级单位的id',
  `isactive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '企业状态',
  `create_time` int(11) unsigned COMMENT '创建时间',
  `update_time` int(11) unsigned COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8 COMMENT='TR公司信息表';


