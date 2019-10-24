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
	<script type="text/javascript" src="../common/layer/layer.js"></script>
	<script type="text/javascript">

 		function updateUserInfo() {
            layer.confirm('确认提交吗？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                document.form1.submit();
            });
            return false;
        }
<%
String message = request.getParameter("message");
if(message == null) {
    message = "";
}
%>

	</script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>个人信息</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><font color="red"> <%= message%></font></span>
		</header>
		<div class="larry-personal-body clearfix">
			<form name="form1" class="layui-form col-lg-5" action="../updateUserInfo" method="post" onsubmit="return updateUserInfo()">
				<input type="hidden" name="status" value="${user.status}">
				<div class="layui-form-item">
					<label class="layui-form-label">登录名</label>
					<div class="layui-input-block">  
						<input type="text" name="loginName" class="layui-input layui-disabled" value="${user.loginName}" readonly="true" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属角色</label>
					<div class="layui-input-block">
						<input id="role" type="text" class="layui-input layui-disabled" value="${user.role}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="userName"  class="layui-input  layui-disabled" value="${user.userName}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学院</label>
					<div class="layui-input-block">
						<input type="text" name="college"  class="layui-input  layui-disabled" value="${user.college}" readonly="true">
					</div>
				</div>
				<c:if test="${user.status == 1}">
					<div class="layui-form-item">
						<label class="layui-form-label">年级</label>
						<div class="layui-input-block">
							<input type="text" name="grade" class="layui-input  layui-disabled" value="${user.grade}" readonly="true">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">专业</label>
						<div class="layui-input-block">
							<input type="text" name="profession"  class="layui-input layui-disabled" value="${user.profession}" readonly="true">
						</div>
					</div>
				</c:if>
				<div class="layui-form-item">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-block">
						<input type="text" name="phone" class="layui-input" value="${user.phone}" placeholder="输入手机号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系地址</label>
					<div class="layui-input-block">
						<input type="text" name="address" class="layui-input" value="${user.address}" placeholder="输入联系地址">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">备注</label>
					<div class="layui-input-block">
						<textarea value="" name="remark" class="layui-textarea" placeholder="输入备注信息"></textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button  class="layui-btn">立即提交</button>
						<%--<input id="submit" class="layui-btn" type="button" value="提交" onclick="updateUserInfo()">--%>
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
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
</script>
</body>
</html>