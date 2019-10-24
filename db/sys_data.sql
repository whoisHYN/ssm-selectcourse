/*
-- insert data
Date: 2019-04-20 00:07:29
*/

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '系统标记', '0', null, null, null, null, '-1', null, null, '0');
INSERT INTO `t_course` VALUES ('1001', '文学翻译', '1', '李老师', '3', '周五:第1,2节', 'B110', '1', '16', '40', '3');
INSERT INTO `t_course` VALUES ('1002', '应用翻译', '1', '王老师', '3', '周五:第3,4节', 'A109', '1', '16', '40', '3');
INSERT INTO `t_course` VALUES ('1003', '欧美文学', '0', '李老师', '3', '周五:第7,8节', 'C104', '1', '16', '40', '1');
INSERT INTO `t_course` VALUES ('1004', '大学英语听说', '1', '王老师', '2', '周二:第7,8节', 'A101', '1', '16', '40', '3');
INSERT INTO `t_course` VALUES ('1005', '大学英语读写', '1', '李老师', '2', '周四:第3,4节', 'A109', '1', '16', '40', '3');
INSERT INTO `t_course` VALUES ('1006', '文体学概论', '0', '李老师', '2', '周一:第7,8节', 'A102', '1', '16', '40', '0');
INSERT INTO `t_course` VALUES ('1007', '跨文化交际', '0', '李老师', '2', '周一:第9,10节', 'A102', '1', '16', '40', '1');
INSERT INTO `t_course` VALUES ('1008', '体育', '0', '王老师', '2', '周二:第5,6节', 'A101', '1', '16', '40', '1');
INSERT INTO `t_course` VALUES ('1009', '音乐鉴赏', '0', '王老师', '2', '周四:第9,10节', 'C103', '1', '16', '40', '0');
INSERT INTO `t_course` VALUES ('1010', '美术鉴赏', '0', '王老师', '2', '周五:第9,10节', 'A104', '1', '16', '40', '0');
INSERT INTO `t_course` VALUES ('1011', '自然辩证法概论', '0', '王老师', '2', '周二:第9,10节', 'C102', '1', '16', '40', '0');
INSERT INTO `t_course` VALUES ('1012', '国际关系导论', '0', '王老师', '2', '周一:第9,10节', 'C101', '1', '16', '40', '0');
INSERT INTO `t_course` VALUES ('1013', '专业实践', '0', '王老师', '3', '周一:第1,2节', 'A103', '1', '16', '40', '1');


-- ----------------------------
-- Records of t_course_message
-- ----------------------------
INSERT INTO `t_course_message` VALUES ('1013', '201821030398', '大家好,很高兴能和大家在这里相遇', '2019-04-19 23:56:37');


-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '3', '超级管理员', '', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('2', '1401122001', 'E10ADC3949BA59ABBE56E057F20F883E', '李老师', '2', '教师', '外国语学院', null, null, '', '', '');
INSERT INTO `t_user` VALUES ('3', '1401122002', 'E10ADC3949BA59ABBE56E057F20F883E', '王老师', '2', '教师', '外国语学院', null, null, '', null, null);
INSERT INTO `t_user` VALUES ('4', '140112200101', 'E10ADC3949BA59ABBE56E057F20F883E', '黄亚宁', '1', '学生', '外国语学院', '英语笔译', '1', '15767574846', '华南理工大学五山校区', '好人');
INSERT INTO `t_user` VALUES ('19', '140112200201', 'E10ADC3949BA59ABBE56E057F20F883E', '张三', '1', '学生', '外国语学院', '英语笔译', '1', '15767574847', '华南理工大学五山校区', '');
INSERT INTO `t_user` VALUES ('20', '140112200102', 'E10ADC3949BA59ABBE56E057F20F883E', '李四', '1', '学生', '外国语学院', '英语笔译', '1', '15767574848', '华南理工大学五山校区', '');


-- ----------------------------
-- Records of t_user_course
-- ----------------------------
INSERT INTO `t_user_course` VALUES ('90', '1001', '李老师', '140112200101', null);
INSERT INTO `t_user_course` VALUES ('73', '1001', '李老师', '140112200201', null);
INSERT INTO `t_user_course` VALUES ('13', '1001', '李老师', '140112200102', null);
INSERT INTO `t_user_course` VALUES ('59', '1002', '王老师', '140112200101', null);
INSERT INTO `t_user_course` VALUES ('96', '1002', '王老师', '140112200201', null);
INSERT INTO `t_user_course` VALUES ('21', '1002', '王老师', '140112200102', null);
INSERT INTO `t_user_course` VALUES ('64', '1004', '王老师', '140112200101', '59');
INSERT INTO `t_user_course` VALUES ('97', '1004', '王老师', '140112200201', null);
INSERT INTO `t_user_course` VALUES ('24', '1004', '王老师', '140112200102', null);
INSERT INTO `t_user_course` VALUES ('19', '1005', '李老师', '140112200101', null);
INSERT INTO `t_user_course` VALUES ('26', '1005', '李老师', '140112200201', null);
INSERT INTO `t_user_course` VALUES ('30', '1005', '李老师', '140112200102', null);
INSERT INTO `t_user_course` VALUES ('0', '1007', '李老师', '140112200101', null);
INSERT INTO `t_user_course` VALUES ('4', '1008', '王老师', '140112200101', '80');
INSERT INTO `t_user_course` VALUES ('52', '1003', '李老师', '140112200101', null);
INSERT INTO `t_user_course` VALUES ('8', '1013', '王老师', '140112200101', '90');

-- ----------------------------
-- Records of t_user_log
-- ----------------------------
INSERT INTO `t_user_log` VALUES ('416', 'admin', '2018-04-19 22:40:20', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('417', '1401122001', '2018-04-19 22:49:54', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('418', '140112200101', '2018-04-19 22:50:46', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('419', '1401122001', '2018-04-19 22:57:50', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('420', 'admin', '2018-04-19 23:32:04', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('421', 'admin', '2018-04-19 23:33:27', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('422', '140112200101', '2018-04-19 23:37:03', '登录', '登录系统', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('423', '140112200101', '2018-04-19 23:41:38', '修改密码', '修改登录密码', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('424', '140112200101', '2018-04-19 23:42:07', '修改信息', '修改个人信息', '192.168.223.1');
INSERT INTO `t_user_log` VALUES ('425', '1401122002', '2018-04-19 23:57:18', '登录', '登录系统', '192.168.223.1');
