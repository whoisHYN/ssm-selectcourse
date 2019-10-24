<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>成绩录入</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="common/layer/layer.js"></script>

</head>
<script type="text/javascript">
	function saveScore() {
        var score = $("#score").val();
        if(!/^\d{0,3}$/.test(score)){
            $('.score_error').text("请输入0~3位数字");
            $('#score').focus();
            return false;
        }
        layer.confirm('确认保存吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            document.form1.submit();
        });
        return false;
    }
</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>
				<div align="center">${course.name}</div>
			</span>
		</header>
		<div class="larry-personal-body clearfix">
			<form name="form1" class="layui-form col-lg-5" action="inputScore" method="post" onsubmit="return saveScore()">
				<div class="layui-form-item">
					<label class="layui-form-label">课程编号</label>
					<div class="layui-input-block">  
						<input type="text" name="courseId" class="layui-input" value="${course.id}" readonly="true" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学生学号</label>
					<div class="layui-input-block">
						<input name="stuId" type="text" class="layui-input" value="${user.loginName}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学生姓名</label>
					<div class="layui-input-block">
						<input name="userName" type="text" class="layui-input" value="${user.userName}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">成绩录入</label>
					<div class="layui-input-block">
						<input id="score" name="score" type="text" class="layui-input" value="${score}">
					</div>
					<span style="color: red" class="score_error"></span>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button  class="layui-btn">立即提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
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