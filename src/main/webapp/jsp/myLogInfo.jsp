<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hyn.selectcourse.model.UserLog" %>
<%@ page import="java.util.List" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>日志信息</title>
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
    List<UserLog> userLogLists = (List<UserLog>) request.getAttribute("lists");
    String content = (String) request.getAttribute("content");
    int pageNo = (int) request.getAttribute("page");
    int count = (int) request.getAttribute("count");
    int pageCount = (int) request.getAttribute("pageCount");

%>
<script type="text/javascript">

</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">

        <form action="getLogList" method="post">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="size" value="10">
            <div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="<%= content%>" name="content" placeholder="请输入关键字" class="layui-input search_input" type="text">
		    </div>
            <button class="layui-btn search_btn">查询</button>
		</div>
            <div class="layui-inline">
                <div class="layui-form-mid layui-word-aux"><font color="red">支持登录名,操作类型,详细内容,操作IP模糊查询</font></div>
            </div>
        </form>
            </blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>登录名</th>
                                  <th>操作时间</th>
                                  <th>操作类型</th>
                                  <th>详细内容</th>
                                  <th>操作IP</th>
                              </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="<%= userLogLists%>" var="list">
                              <tr>
                                <td><input type="checkbox"></td>
                                <td>${list.loginName}</td>
                                <td>${list.time}</td>
                                <td>${list.type}</td>
                                <td>${list.detail}</td>
                                <td>${list.ip}</td>
                              </tr>
                          </c:forEach>
                          </tbody>
                     </table>
                    <form name="form1" method="post" action="getLogList">
                        <input name="content" type="hidden" value="<%= content%>">
                        <input name="size" type="hidden" value="10">
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
		    </div>
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