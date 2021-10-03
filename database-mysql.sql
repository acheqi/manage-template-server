-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-10-04 01:20:08
-- 服务器版本： 5.7.34-log
-- PHP 版本： 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `mail`
--

-- --------------------------------------------------------

--
-- 表的结构 `z_menu`
--

CREATE TABLE `z_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL COMMENT '菜单图标',
  `roter_command` varchar(100) NOT NULL DEFAULT 'roter_command' COMMENT '模块路由命令',
  `component` varchar(100) NOT NULL COMMENT '菜单加载VUE模块',
  `parent_id` int(10) NOT NULL COMMENT '父级菜单ID',
  `sort` int(10) NOT NULL COMMENT '菜单排序',
  `hidden` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否在菜单中隐藏',
  `system` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是系统菜单，系统菜单不能删除',
  `note` varchar(100) NOT NULL DEFAULT 'module_name' COMMENT '说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `z_menu`
--

INSERT INTO `z_menu` (`id`, `name`, `icon`, `roter_command`, `component`, `parent_id`, `sort`, `hidden`, `system`, `note`) VALUES
(5, '用户修改', 'dashboard', 'user.info.modify', 'form/index1', 6, 2, 1, 1, '修改用户信息'),
(6, '用户列表', 'el-icon-s-grid', 'user.list', 'user/list', 11, 0, 0, 1, '用户列表'),
(10, '用户分组', 'el-icon-s-grid', 'user.group.list', 'user/group', 11, 1, 0, 1, '用户分组列表'),
(11, '系统配置', 'dashboard', 'user.modify', 'system1', 0, 2, 0, 1, '系统配置'),
(12, '菜单管理', 'dashboard', 'sys.menu.list', 'system/menu', 11, 2, 0, 1, '菜单管理'),
(13, '菜单编辑', 'dashboard', 'sys.menu.modify', 'system', 12, 2, 1, 1, '菜单编辑'),
(32, '菜单删除', '1', 'sys.menu.remove', 'sys.menu.remove', 12, 0, 1, 1, ''),
(34, '分组权限', '2', 'user.group.permission', 'user3', 10, 2, 1, 1, ''),
(35, '分组删除', '4', 'user.group.remove', 'user1', 10, 1, 1, 1, ''),
(36, '分组编辑', '1', 'user.group.modify', 'user.group.save', 10, 0, 1, 1, ''),
(39, '用户删除', '1', 'user.remove', 'user.remove', 6, 0, 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `z_user`
--

CREATE TABLE `z_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(200) NOT NULL,
  `nick_name` varchar(50) NOT NULL COMMENT '昵称',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户组',
  `system` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统账户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `z_user`
--

INSERT INTO `z_user` (`id`, `username`, `password`, `token`, `nick_name`, `group_id`, `system`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', 'bcd5ef89-ac1d-4354-a96f-098729dc05dc', 'evan.qi', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `z_user_group`
--

CREATE TABLE `z_user_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL DEFAULT 'group_name' COMMENT '分组名称',
  `system` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统分组'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `z_user_group`
--

INSERT INTO `z_user_group` (`id`, `group_name`, `system`) VALUES
(4, '超级管理员', 1);

-- --------------------------------------------------------

--
-- 表的结构 `z_user_group_permission`
--

CREATE TABLE `z_user_group_permission` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT 'roter id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `z_user_group_permission`
--

INSERT INTO `z_user_group_permission` (`id`, `group_id`, `menu_id`) VALUES
(34, 4, 11),
(52, 4, 5),
(56, 4, 6),
(58, 4, 10),
(59, 4, 34),
(63, 4, 36),
(64, 4, 35),
(65, 4, 12),
(78, 4, 32),
(79, 4, 13),
(80, 4, 39);

--
-- 转储表的索引
--

--
-- 表的索引 `z_menu`
--
ALTER TABLE `z_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `z_user`
--
ALTER TABLE `z_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `z_user_group`
--
ALTER TABLE `z_user_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `z_user_group_permission`
--
ALTER TABLE `z_user_group_permission`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `z_menu`
--
ALTER TABLE `z_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `z_user`
--
ALTER TABLE `z_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `z_user_group`
--
ALTER TABLE `z_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `z_user_group_permission`
--
ALTER TABLE `z_user_group_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
