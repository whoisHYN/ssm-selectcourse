<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>华南理工大学外国语学院选课管理系统</title>
    <link href="css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="common/layer/layer.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var $tab_li = $('#tab ul li');
            $tab_li.hover(function (){
                $(this).addClass('selected').siblings().removeClass('selected');
                var index = $tab_li.index(this);
                $('div.tab_box > div').eq(index).show().siblings().hide();
            });
        });
        $(function(){
            chooseTab();
        });
        function chooseTab() {
            var status = '${status}';
            if(!status){
                status = 1;
            };
            if(status == 1) {
                $('#tab1').addClass('selected').siblings().removeClass('selected');
                $('div.tab_box > div').eq(0).show().siblings().hide();
            } else if(status == 2) {
                $('#tab2').addClass('selected').siblings().removeClass('selected');
                $('div.tab_box > div').eq(1).show().siblings().hide();
            } else if(status == 3) {
                $('#tab3').addClass('selected').siblings().removeClass('selected');
                $('div.tab_box > div').eq(2).show().siblings().hide();
            }
        };
        function checkStuData() {
            var loginName = $(".stu_loginName").val();
            var password = $(".stu_password").val();
            var code = $("#stu_code").val();
            var msg = "";
            if(!/^\d{6,15}$/.test(loginName)){
                $('.stu_error_loginName').text("请输入6~15位数字");
                $('.stu_loginName').focus();
                return false;
            }
            if(password.length < 6 || password.length > 15){
                $('.stu_error_password').text("请输入6~15位密码");
                $('.stu_password').focus();
                return false;
            }
            if(code.length != 4) {
                $('.stu_error_code').text("请输入4位验证码");
                $('#stu_code').focus();
                return false;
            }
            $(".stu_login").submit();
        };
        function checkTeaData() {
            var loginName = $(".tea_loginName").val();
            var password = $(".tea_password").val();
            var code = $("#tea_code").val();
            var msg = "";
            if(!/^\d{6,15}$/.test(loginName)){
                $('.tea_error_loginName').text("请输入6~15位数字");
                $('.tea_loginName').focus();
                return false;
            }
            if(password.length < 6 || password.length > 15){
                $('.tea_error_password').text("请输入6~15位密码");
                $('.tea_password').focus();
                return false;
            }
            if(code.length != 4) {
                $('.tea_error_code').text("请输入4位验证码");
                $('#tea_code').focus();
                return false;
            }
            $(".tea_login").submit();
        };
        function checkSysData() {
            var loginName = $(".sys_loginName").val();
            var password = $(".sys_password").val();
            var code = $("#sys_code").val();
            var msg = "";
            if(!/^\w{5,10}$/.test(loginName)){
                $('.sys_error_loginName').text("请输入6~15位账号");
                $('.sys_loginName').focus();
                return false;
            }
            if(password.length < 6 || password.length > 15){
                $('.sys_error_password').text("请输入6~15位密码");
                $('.sys_password').focus();
                return false;
            }
            if(code.length != 4) {
                $('.sys_error_code').text("请输入4位验证码");
                $('#sys_code').focus();
                return false;
            }
            $(".sys_login").submit();
        };
        function clearStuMessage() {
            $('.stu_error_loginName').text("");
            $('.stu_error_password').text("");
        }
        function clearTeaMessage() {
            $('.tea_error_loginName').text("");
            $('.tea_error_password').text("");
        }
        function clearSysMessage() {
            $('.sys_error_loginName').text("");
            $('.sys_error_password').text("");
        }

        function StuChangeCode(){
            //链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
            $('#codeImageStu').attr('src','authCode?source=stu&abc='+Math.random());
        }
        function TeaChangeCode(){
            //链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
            $('#codeImageTea').attr('src','authCode?source=tea&abc='+Math.random());
        }
        function SysChangeCode(){
            //链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
            $('#codeImageSys').attr('src','authCode?source=sys&abc='+Math.random());
        }
    </script>
</head>
<body>
<div id="tab">
    <ul class="tab_menu">
        <li id="tab1">学生登录</li>
        <li id="tab2">教师登录</li>
        <li id="tab3">管理员登录</li>
    </ul>
    <div class="tab_box">
        <!-- 学生登录开始 -->
        <div>
            <div></div>
            <c:if test="${status == 1}">
                <c:choose>
                    <c:when test="${message != null}">
                        <span class="stu_box"><font color="red"> ${message}</font></span>
                    </c:when>
                </c:choose>
            </c:if>
            <form action="login" method="post" class="stu_login">
                <input type="hidden" name="status" value="1">
                <div class="stu_loginName_all">
                    <label>学&nbsp;&nbsp;&nbsp;号：</label>
                    <input type="text" class="stu_loginName" name="loginName" placeholder="学号" onchange="clearStuMessage()">
                </div>
                <span class="stu_error_loginName"></span>
                <div class="stu_password_all">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="stu_password" name="password" placeholder="密码" onchange="clearStuMessage()">
                </div>
                <span class="stu_error_password"></span>
                <div class="code">
                    <label>验证码：</label>
                    <input type="text" id="stu_code" name="code" placeholder="验证码">
                    <img type="image" src="authCode?source=stu&abc=0.1" id="codeImageStu" onclick="StuChangeCode()" title="点击更换" >
                </div>
                <span class="stu_error_code"></span>
                <div class="stu_login">
                    <input class="denglu" type="button" value="登录" onclick="checkStuData()">
                </div>
            </form>
        </div>
        <!-- 学生登录结束-->
        <!-- 导师登录开始-->
        <div class="hide">
            <div></div>
            <c:if test="${status == 2}">
                <c:choose>
                    <c:when test="${message != null}">
                        <span class="stu_box"><font color="red"> ${message}</font></span>
                    </c:when>
                </c:choose>
            </c:if>
            <form action="login" method="post" class="tea_login">
                <input type="hidden" name="status" value="2">
                <div class="tea_loginName_all">
                    <label>教工号：</label>
                    <input type="text" class="tea_loginName" name="loginName" placeholder="工号" onchange="clearTeaMessage()">
                </div>
                <span class="tea_error_loginName"></span>
                <div class="tea_password_all">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="tea_password" name="password" placeholder="密码" onchange="clearTeaMessage()">
                </div>
                <span class="tea_error_password"></span>
                <div class="code">
                    <label>验证码：</label>
                    <input type="text" id="tea_code" name="code" placeholder="验证码">
                    <img src="authCode?source=tea&abc=0.2" id="codeImageTea" onclick="TeaChangeCode()" title="点击更换">
                </div>
                <span class="tea_error_code"></span>
                <div class="tea_login">
                    <input class="denglu" type="button" value="登录" onclick="checkTeaData()">
                </div>
            </form>
        </div>
        <!-- 导师登录结束-->
        <!-- 教务登录开始-->
        <div class="hide">
            <div></div>
            <c:if test="${status == 3}">
                <c:choose>
                    <c:when test="${message != null}">
                        <span class="sys_box"><font color="red"> ${message}</font></span>
                    </c:when>
                </c:choose>
            </c:if>
            <form action="login" method="post" class="sys_login">
                <input type="hidden" name="status" value="3">
                <div class="sys_loginName_all">
                    <label>管理员：</label>
                    <input type="text" class="sys_loginName" name="loginName" placeholder="管理员" onchange="clearSysMessage()">
                </div>
                <span class="sys_error_loginName"></span>
                <div class="sys_password_all">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="sys_password" name="password" placeholder="密码" onchange="clearSysMessage()">
                </div>
                <span class="sys_error_password"></span>
                <div class="code">
                    <label>验证码：</label>
                    <input type="text" id="sys_code" name="code" placeholder="验证码">
                    <img src="authCode?source=sys&abc=0.3" title="点击更换" id="codeImageSys" onclick="SysChangeCode()">
                </div>
                <span class="sys_error_code"></span>
                <div class="sys_login">
                    <input class="denglu" type="button" value="登录" onclick="checkSysData()">
                </div>
            </form>
        </div>
        <!-- 教务登录结束-->
    </div>
</div>
<div class="bottom">版权所有©华南理工大学<a href="https://www.scut.edu.cn/new/" target="_blank">关于</a> <span>粤ICP备05084312号-1</span></div>
<div>
    <img class="screenbg" src="images/bg.jpg">
</div>


</body></html>
