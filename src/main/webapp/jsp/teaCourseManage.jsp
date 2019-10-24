<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程管理</title>
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

</script>
<%
	String content = (String) request.getAttribute("content");
	int pageNo = (int) request.getAttribute("page");
	int count = (int) request.getAttribute("count");
	int pageCount = (int) request.getAttribute("pageCount");

%>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">

		<form action="teaCourseManage" method="post">
			<input type="hidden" name="page" value="1">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input value="<%= content%>" name="content" placeholder="请输入关键字查询" class="layui-input search_input" type="text">
				</div>

			<button class="layui-btn search_btn">查询课程</button>
			</div>
			<div class="layui-inline">
				<div class="layui-form-mid layui-word-aux"><font color="red">支持课程编号,课程名称,教师姓名模糊查询</font></div>
			</div>
		</form>

	</blockquote>
			<span style="color: red">${message}</span>
		         <!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="6%">
						<col width="13%">
						<col width="8%">
						<col width="12%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="10%">
						<col width="8%">
						<col width="17%">
						</colgroup>
					<thead>
						<tr>
							<th style="text-align:left;">课程编号</th>
							<th>课程名称</th>
							<th>学分</th>
							<th>上课时间</th>
							<th>上课地点</th>
							<th>教师</th>
							<th>起始周</th>
							<th>容纳最大数</th>
							<th>已选人数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
						<c:forEach items="${courseLists}" var="list">
						<tr>
							<td align="left">${list.id}</td>
							<td>${list.name}</td>
							<td>${list.credit}</td>
							<td>${list.time}</td>
							<td>${list.place}</td>
							<td>${list.teaName}</td>
							<td>第${list.startWeek}-${list.endWeek}周</td>
							<td>${list.stuCount}</td>
							<td>${list.chooseCount}</td>
							<td>
								<a href="studentList?page=1&content=&courseId=${list.id}" class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 学生详情</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
			    </div>
		    </div>
		<form name="form1" method="post" action="teaCourseManage">
			<input name="content" type="hidden" value="<%= content%>">
			<select name="page" onchange="document.form1.submit()">
				<%
					for(int i=1; i<=pageCount; i++) {
				%>
				<option value="<%=i%>" <%=pageNo == i ? "selected" : "" %>>第<%= i%>页</option>
				<%
					}
				%>
			</select>
			&nbsp;&nbsp;&nbsp;<font color="red">共<%= count%>条记录
		</form>
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