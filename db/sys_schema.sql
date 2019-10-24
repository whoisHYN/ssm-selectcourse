/*
-- 创建数据库
-- CREATE DATABASE selectcourse DEFAULT CHARACTER SET utf8;
Date: 2019-04-20 00:07:29
*/
# 创建表格
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
                          `id` int(8) NOT NULL COMMENT '课程编号',
                          `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
                          `required` varchar(255) DEFAULT '0' COMMENT '是否为必修课 0-否 1-是',
                          `tea_name` varchar(255) DEFAULT NULL COMMENT '教师名',
                          `credit` varchar(255) DEFAULT NULL COMMENT '学分',
                          `time` varchar(255) DEFAULT NULL COMMENT '上课时间 用字符表示',
                          `place` varchar(255) DEFAULT NULL COMMENT '上课地点',
                          `start_week` varchar(255) DEFAULT NULL COMMENT 'id为1的是否开放选课标识字段 -1 -未开放 0-开放',
                          `end_week` varchar(255) DEFAULT NULL COMMENT '结束周',
                          `stu_count` varchar(255) DEFAULT NULL COMMENT '最大容纳学生数',
                          `choose_count` int(255) DEFAULT '0' COMMENT '已选人数',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_course_message
-- ----------------------------
DROP TABLE IF EXISTS `t_course_message`;
CREATE TABLE `t_course_message` (
                                  `course_id` int(255) NOT NULL COMMENT '课程id',
                                  `login_name` varchar(255) NOT NULL COMMENT '登陆者id',
                                  `message` varchar(255) NOT NULL COMMENT '信息',
                                  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名 学号',
                        `password` varchar(255) DEFAULT NULL COMMENT '密码',
                        `user_name` varchar(255) DEFAULT NULL COMMENT '用户真实姓名',
                        `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '所属角色 1-学生 2-老师 3-管理员 默认1',
                        `role` varchar(255) NOT NULL COMMENT '角色',
                        `college` varchar(255) NOT NULL DEFAULT '' COMMENT '学院',
                        `profession` varchar(255) DEFAULT NULL COMMENT '专业',
                        `grade` varchar(1) DEFAULT NULL COMMENT '年级',
                        `phone` varchar(255) DEFAULT NULL,
                        `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
                        `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='学生信息表';


-- ----------------------------
-- Table structure for t_user_course
-- ----------------------------
DROP TABLE IF EXISTS `t_user_course`;
CREATE TABLE `t_user_course` (
                               `random` int(255) NOT NULL,
                               `course_id` int(255) NOT NULL,
                               `tea_name` varchar(255) NOT NULL,
                               `stu_id` varchar(255) NOT NULL,
                               `score` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_log`;
CREATE TABLE `t_user_log` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `login_name` varchar(255) DEFAULT NULL,
                            `time` datetime DEFAULT NULL,
                            `type` varchar(255) DEFAULT NULL,
                            `detail` varchar(255) DEFAULT NULL,
                            `ip` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;
