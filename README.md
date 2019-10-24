# SSM实现选课系统
### 基于Spring + SpringMVC + MyBatis搭建选课系统 
#### 项目描述
本项目是基于Spring + SpringMVC + MyBatis对选课系统的实现。主要实现了以下功能
1. 用户登录功能，可用于学生用户、教师用户和超级管理员用户登录,流程如下：
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse0.JPG)
2. 学生、教师用户修改个人信息的功能。
3. 用户操作日志查询功能，当用户在登录系统，修改信息，修改密码等操作的时候，会调用保存日志信息接口将主要信息保存到数据库。
4. 管理员用户帐号管理功能，超级管理员登录后可对学生和教师的账号信息进行管理。
5. 管理员课程管理功能，包括开设新课程和控制开放选课系统等功能。
#### 技术栈
   + 后端：Spring + SpringMVC + MyBatis + MySQL
   + 前端：JSP + Bootstrap + Layui + jQuery
   + 开发环境：Java 8 + IntelliJ IDEA + Maven + Tomcat + Git + Linux
### 项目目录结构
```$xslt
├─db
├─src
│  └─main
│      ├─java
│      │  └─com
│      │      └─hyn
│      │          └─selectcourse
│      │              ├─controller
│      │              ├─dao
│      │              ├─model
│      │              ├─scheduler
│      │              ├─service
│      │              │  └─impl
│      │              └─util
│      ├─resources
│      │  └─mapper
│      └─webapp
│          ├─common
│          ├─css
│          ├─images
│          ├─js
│          ├─jsp
│          └─WEB-INF   
├─pom.xml
└─README.md
```
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse1.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse2.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse3.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse4.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse5.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse6.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse7.JPG)
