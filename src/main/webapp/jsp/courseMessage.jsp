<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程交流</title>
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
<%
	int pageNo = (int) request.getAttribute("page");
	int count = (int) request.getAttribute("count");
	int pageCount = (int) request.getAttribute("pageCount");

%>
<body>
<section class="layui-larry-box">
	<blockquote class="layui-elem-quote news_search">
		<div align="center">${course.id}&nbsp;&nbsp;&nbsp;&nbsp;${course.name}&nbsp;&nbsp;&nbsp;&nbsp;任课教师(${course.teaName})</div>
	</blockquote>
</section>
<div class="larry-personal">
<header class="larry-personal-tit">
	<span>留言记录</span>
</header>
</div>
<fieldset class="layui-elem-field">
</fieldset>

<c:forEach items="${messages}" var="message">
<div class="layui-form news_list">
	<table class="layui-table">
		<colgroup>
			<col width="10%">
			<col width="33%">
			<col width="33%">
		</colgroup>
		<thead>
		<tr>
			<th style="text-align:left;color: #DD691D" colspan="3">${message.get('login_name')}(${message.get('user_name')})</th>
		</tr>
		</thead>
		<tbody class="news_content">
		<tr>
			<td style="text-align:left;">留言内容:</td>
			<td style="text-align:left;">${message.get('message')}</td>
			<td style="text-align:right;">${message.get('time')}</td>
		</tr>

		</tbody>
	</table>
</div>
</c:forEach>
<form name="form1" method="post" action="courseMessage">
	<input name="courseId" type="hidden" value="${course.id}">
	<input name="loginName" type="hidden" value="">
	<input name="message" type="hidden" value="">
	<select name="page" onchange="document.form1.submit()">
		<%
			for(int i=1; i<=pageCount; i++) {
		%>
		<option value="<%=i%>" <%=pageNo == i ? "selected" : "" %>>第<%= i%>页</option>
		<%
			}
		%>
	</select>
	&nbsp;&nbsp;&nbsp;<font color="red">共<%= count%>条留言</font>

</form>
<br/>
<br/>
<br/>
<br/>
<form class="layui-form layui-form-pane" action="courseMessage">
	<input name="courseId" type="hidden" value="${course.id}">
	<input name="page" type="hidden" value="1">
	<input name="loginName" type="hidden" value="${user.loginName}">
	<div class="layui-form-item layui-form-text">
		<div class="layui-input-block">
			<textarea name="message" placeholder="请输入留言内容" class="layui-textarea"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<button class="layui-btn" lay-submit="" lay-filter="demo2">留言</button>
	</div>
</form>
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