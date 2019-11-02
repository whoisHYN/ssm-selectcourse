# SSM实现选课系统
### 基于Spring + SpringMVC + MyBatis搭建选课系统 
#### 项目描述
本项目是基于Spring + SpringMVC + MyBatis对选课系统的实现，该选课系统可以针对不同类型的用户开放不同的功能，学生、教师和管理员都可以通过此系统执行各自的操作，如选课和课程管理等。主要实现了以下功能
1. 用户登录功能，可用于学生用户、教师用户和超级管理员用户登录,流程如下：
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse0.JPG)
2. 学生、教师用户修改个人信息的功能。
3. 用户操作日志查询功能，当用户在登录系统，修改信息，修改密码等操作的时候，会调用保存日志信息接口将主要信息保存到数据库。
4. 管理员用户帐号管理功能，超级管理员登录后可对学生和教师的账号信息进行管理。
5. 管理员课程管理功能，包括开设新课程和控制开放选课系统等功能。
6. 学生选课功能，包括选课列表、我的选课、我的课表和我的成绩等模块。
#### 技术栈
   + 后端：Spring + SpringMVC + MyBatis + MySQL
   + 前端：JSP + Bootstrap + Layui + jQuery
   + 开发环境：Java 8 + IntelliJ IDEA + Maven + Tomcat + Git + Linux
### 项目目录结构
```$xslt
├─db  -- 数据库相关文件
├─src
│  └─main
│      ├─java
│      │  └─com
│      │      └─hyn
│      │          └─selectcourse
│      │              ├─controller -- MVC的web层
│      │              ├─dao  -- 数据访问层
│      │              ├─model  -- 实体类
│      │              ├─scheduler  -- 控制自动开放和关闭选课的类
│      │              ├─service  -- 业务层
│      │              │  └─impl  -- 业务层实现类
│      │              └─util  -- 工具类
│      ├─resources  -- 资源文件
│      │  └─mapper  -- MyBatis映射文件
│      └─webapp
│          ├─common  -- 前端依赖文件
│          ├─css  -- css文件
│          ├─images  -- 图片文件
│          ├─js  -- js文件
│          ├─jsp  -- JSP文件，显示前端页面
│          └─WEB-INF 
├─pom.xml  -- 项目依赖
└─README.md  -- 项目说明
```
### 前端页面效果预览
#### 首页登录页面
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse1.JPG)

#### 学生用户登录效果
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse2.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse3.JPG)

#### 教师用户登录效果
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse4.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse5.JPG)

#### 管理员用户登录效果
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse6.JPG)
![无法加载图片](https://github.com/whoisHYN/aloe/blob/master/selectcourse7.JPG)
