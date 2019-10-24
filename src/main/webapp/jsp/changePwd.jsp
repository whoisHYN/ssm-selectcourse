<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>

	<script type="text/javascript">
        function updatePassword() {
            var password = $("#password").val();
            var newOnePassword = $("#newOnePassword").val();
            var newTwoPassword = $("#newTwoPassword").val();
            if(password.length < 6 || password.length > 15){
                $('.password_error').text("请输入6~15位原密码");
                $('#password').focus();
                return false;
            }
            if(newOnePassword.length < 6 || newOnePassword.length > 15){
                $('.newOnePassword_error').text("请输入6~15位新密码");
                $('#newOnePassword').focus();
                return false;
            }
            if(newTwoPassword.length < 6 || newTwoPassword.length > 15){
                $('.newTwoPassword_error').text("请输入6~15位新密码");
                $('#newTwoPassword').focus();
                return false;
            }
            if(newOnePassword != newTwoPassword) {
                $('.newTwoPassword_error').text("两次密码输入不正确,请重新输入");
                return false;
			}
			return true;
        }

        function clearMessage() {
            $('.password_error').text("");
            $('.newOnePassword_error').text("");
            $('.newTwoPassword_error').text("");
        }

	</script>
	<style>
		.newOnePassword_error,.newTwoPassword_error,.password_error{
			font-size:10px;
			color:red;
		}
	</style>

	<%
		String message = request.getParameter("message");
		if(message == null) {
			message = "";
		}
	%>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>修改密码</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><font color="red"> <%= message%></font></span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action="../updateUserPassword" onsubmit="return updatePassword()">
				<input type="hidden" name="status" value="${user.status}">
				<div class="layui-form-item">
					<label class="layui-form-label">登录名</label>
					<div class="layui-input-block">
						<input type="text" name="loginName" class="layui-input layui-disabled" value="${user.loginName}" readonly="true" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-block">  
					  	<input id="password" type="password" name="password"  autocomplete="off"  class="layui-input" value="" placeholder="请输入旧密码" onchange="clearMessage()">
					</div>
					<span class="password_error"></span>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-block">  
					  	<input id="newOnePassword" type="password" name="newOnePassword"  autocomplete="off"  class="layui-input" value="" placeholder="请输入新密码" onchange="clearMessage()">
					</div>
					<span class="newOnePassword_error"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">  
					  	<input id="newTwoPassword" type="password" name="newTwoPassword"  autocomplete="off"  class="layui-input" value="" placeholder="请输入确认新密码" onchange="clearMessage()">
					</div>
					<span class="newTwoPassword_error"></span>
				</div>
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn">立即提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});
</script>
</body>
</html>