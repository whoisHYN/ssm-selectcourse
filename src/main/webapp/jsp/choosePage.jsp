<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的选课</title>
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
</head>

<script type="text/javascript">
    function deleteCourse(pdata){
        layer.confirm('确定要退选这门课吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            window.location.href = "getChoosePage?page=1&content&courseId=" + pdata;
        });
    }

    function courseChat(pdata){
        layer.open({
            type: 2,
            title: '课程交流',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['800px', '450px'],
            content: 'courseMessage?page=1&loginName=&message&courseId=' + pdata
        });

    }
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

		<form action="getChoosePage" method="post">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="courseId" value="0">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input value="<%= content%>" name="content" placeholder="请输入关键字查询" class="layui-input search_input" type="text">
				</div>

			<button class="layui-btn search_btn">查询课程</button>
			</div>
			<div class="layui-inline">
				<div class="layui-form-mid layui-word-aux"><font color="red">支持课程编号,课程名称,教师姓名模糊查询</font></div>
			</div>
			<a href="getSelectCoursePage?page=1&content=&courseId=0" class="layui-btn layui-btn-normal newsAdd_btn">前往选课</a>
			<div class="layui-inline">
				<a href="myTimeTable" class="layui-btn layui-btn-danger batchDel">我的课表</a>
			</div>
		</form>

	</blockquote>
			<span style="color: red">${message}</span>
			<!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="7%">
						<col width="13%">
						<col width="9%">
						<col width="11%">
						<col width="9%">
						<col width="9%">
						<col width="9%">
						<col width="18%">
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
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
						<c:forEach items="${courseLists}" var="list">
						<tr>
							<td align="left">${list.id}</td>
							<td>${list.name}
								<c:if test="${list.required == '1'}">(必修)</c:if>
							</td>
							<td>${list.credit}</td>
							<td>${list.time}</td>
							<td>${list.place}</td>
							<td>${list.teaName}</td>
							<td>第${list.startWeek}-${list.endWeek}周</td>
							<td>
								<c:if test="${openFlag != 'false'}">
									<c:if test="${list.required != '1'}">
									<a onclick="deleteCourse(${list.id})" class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 退选</a>
									</c:if>
								</c:if>
								<a onclick="courseChat(${list.id})" class="layui-btn layui-btn-normal layui-btn-mini news_collect"><i class="layui-icon"></i> 课程交流</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
			    </div>
		    </div>
		<form name="form1" method="post" action="getChoosePage">
			<input name="content" type="hidden" value="<%= content%>">
			<input type="hidden" name="courseId" value="0">
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