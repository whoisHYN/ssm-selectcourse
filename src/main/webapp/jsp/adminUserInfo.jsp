<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hyn.selectcourse.model.User" %>
<%@ page import="java.util.List" %>
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
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="common/layer/layer.js"></script>
</head>
<%
	List<User> userLists = (List<User>) request.getAttribute("lists");
	User oneUser = userLists.get(0);
	String status = oneUser.getStatus();
	String content = (String) request.getAttribute("content");
	int pageNo = (int) request.getAttribute("page");
	int count = (int) request.getAttribute("count");
	int pageCount = (int) request.getAttribute("pageCount");

%>
<script type="text/javascript">
    function deleteUser(pdata){
        layer.confirm('确定要删除这个用户吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                url:'deleteUser',
                type:'post',
                data:{loginName:pdata},
            });
            window.location.reload();
        });
        return false;

    }
    function resetPassword(pdata){
        layer.confirm('确定要重置密码吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                url:'resetPassword',
                type:'post',
                data:{loginName:pdata},
            });
            window.location.reload();
        });
    }

</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">

		<form action="getAdminUserList" method="post">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="size" value="10">
			<input type="hidden" name="status" value="<%= status%>">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input value="<%= content%>" name="content" placeholder="请按姓名查询" class="layui-input search_input" type="text">
				</div>
				<%
					if(status.equals("1")) {
				%>
				<button class="layui-btn search_btn">查询学生帐号</button>
				<%
					} else if(status.equals("2")) {
				%>
				<button class="layui-btn search_btn">查询教师帐号</button>
				<%
					}
				%>
			</div>

			<div class="layui-inline">
				<%
					if(status.equals("1")) {
				%>
				<a href="jsp/addUser.jsp?status=1" class="layui-btn layui-btn-normal newsAdd_btn">新增学生帐号</a>
				<%
				} else if(status.equals("2")) {
				%>
				<a href="jsp/addUser.jsp?status=2" class="layui-btn layui-btn-normal newsAdd_btn">新增教师帐号</a>
				<%
					}
				%>
			</div>
		</form>

	</blockquote>

		         <!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="5%">
						<col width="13%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
							<%
								if(status.equals("1")) {
							%>
						<col width="15%">
							<%
								}
							%>
						<col width="10%">
						<col width="22%">
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th style="text-align:left;">登录名</th>
							<th>姓名</th>
							<th>角色</th>
							<th>学院</th>
							<%
								if(status.equals("1")) {
							%>
							<th>专业</th>
							<%
								}
							%>
							<th>联系方式</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					<c:forEach items="<%= userLists%>" var="list">
						<tr>
							<td></td>
							<td align="left">${list.loginName}</td>
							<td>${list.userName}</td>
							<td>${list.role}</td>
							<td>${list.college}</td>
							<%
								if(status.equals("1")) {
							%>
							<td>${list.profession}</td>
							<%
								}
							%>
							<td>${list.phone}</td>
							<td>
								<a href="modifyUser?status=<%= status%>&loginName=${list.loginName}" class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>
								<a id="delete" onclick="deleteUser(${list.loginName})" class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a>
								<a id="reset" onclick="resetPassword(${list.loginName})" class="layui-btn layui-btn-normal layui-btn-mini news_collect"><i class="layui-icon"></i> 重置密码</a>
							</td>
						</tr>
					</c:forEach>



					</tbody>
					</table>
			    </div>
		    </div>
		<form name="form1" method="post" action="getAdminUserList">
			<input name="content" type="hidden" value="<%= content%>">
			<input name="size" type="hidden" value="10">
			<input name="status" type="hidden" value="1">
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