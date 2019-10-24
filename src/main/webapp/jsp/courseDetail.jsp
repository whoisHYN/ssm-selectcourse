<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程信息</title>
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
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>
				<div align="center">${course.name}</div>
			</span>
		</header>
		<div class="larry-personal-body clearfix">
			<form name="form1" class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">课程编号</label>
					<div class="layui-input-block">  
						<input type="text" name="loginName" class="layui-input" value="${course.id}" readonly="true" >
					</div>
				</div>
				<c:if test="${course.required == '1'}">
				<div class="layui-form-item">
					<label class="layui-form-label">课程性质</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="必修" readonly="true">
					</div>
				</div>
				</c:if>
				<c:if test="${course.required == '0'}">
					<div class="layui-form-item">
						<label class="layui-form-label">课程性质</label>
						<div class="layui-input-block">
							<input type="text" class="layui-input" value="选修" readonly="true">
						</div>
					</div>
				</c:if>
				<div class="layui-form-item">
					<label class="layui-form-label">课程教师</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.teaName}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学分</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.credit}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程时间</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.time}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程地点</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.place}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程起始周</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="第${course.startWeek}-${course.endWeek}周" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">容纳学生数</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.stuCount}" readonly="true">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">已选人数</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" value="${course.chooseCount}" readonly="true">
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