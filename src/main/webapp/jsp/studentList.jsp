<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hyn.selectcourse.model.User" %>
<%@ page import="java.util.List" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>学生列表</title>
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
	String content = (String) request.getAttribute("content");
	int pageNo = (int) request.getAttribute("page");
	int count = (int) request.getAttribute("count");
	int pageCount = (int) request.getAttribute("pageCount");

%>
<script type="text/javascript">
	function inputScore(pdata1,pdata2,pdata3) {
        layer.open({
            type: 2,
            title: '课程详细信息',
            shadeClose: true,
            shade: 0.8,
            area: ['500px', '90%'],
            content: 'inputScore?userName=&courseId=' + pdata1 + '&stuId=' + pdata2 + '&score='+pdata3
        });
    }
</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">

		<form action="studentList" method="post">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="courseId" value="${courseId}">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input value="<%= content%>" name="content" placeholder="请按姓名查询" class="layui-input search_input" type="text">
				</div>

				<button class="layui-btn search_btn">查询学生帐号</button>
			</div>
		</form>

	</blockquote>

		         <!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="5%">
						<col width="13%">
						<col width="18%">
						<col width="18%">
						<col width="18%">
						<col width="12%">
						<col width="15%">
					</colgroup>
					<thead>

						<tr>
							<th></th>
							<th style="text-align:left;">登录名</th>
							<th>姓名</th>
							<th>学院</th>
							<th>专业</th>
							<th>联系方式</th>
							<th>成绩</th>
							<th>操作</th>
						</tr>

					</thead>
					<tbody class="news_content">
					<c:forEach items="${studentLists}" var="student">
						<tr>
							<td></td>
							<td align="left">${student.get('login_name')}</td>
							<td>${student.get('user_name')}</td>
							<td>${student.get('college')}</td>
							<td>${student.get('profession')}</td>
							<td>${student.get('phone')}</td>
							<td>${student.get('score')}</td>
							<td>
								<c:if test="${openFlag == 'false'}">
								<a onclick="inputScore(${courseId},'${student.get('login_name')}','${student.get('score')}')" class="layui-btn layui-btn-normal layui-btn-mini news_collect"><i class="layui-icon"></i> 成绩录入</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
					</table>
			    </div>
		    </div>
		<form name="form1" method="post" action="studentList">
			<input name="content" type="hidden" value="<%= content%>">
			<input type="hidden" name="courseId" value="${courseId}">
			<select name="page" onchange="document.form1.submit()">
				<%
					for(int i=1; i<=pageCount; i++) {
				%>
				<option value="<%=i%>" <%=pageNo == i ? "selected" : "" %>>第<%= i%>页</option>
				<%
					}
				%>
			</select>
			&nbsp;&nbsp;&nbsp;<font color="red">共<%= count%>条记录</font>

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