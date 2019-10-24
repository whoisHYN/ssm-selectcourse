<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的成绩</title>
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
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">
	我的成绩

	</blockquote>
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="6%">
						<col width="15%">
						<col width="8%">
						<col width="13%">
						</colgroup>
					<thead>
						<tr>
							<th style="text-align:left;">课程编号</th>
							<th>课程名称</th>
							<th>学分</th>
							<th>成绩</th>
						</tr>
					</thead>
					<tbody class="news_content">
						<c:forEach items="${myGradeInfos}" var="list">
						<tr>
							<td align="left">${list.course_id}</td>
							<td>${list.name}</td>
							<td>${list.credit}</td>
							<td>${list.score}</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
			    </div>
			<div class="layui-form news_list">
				<table class="layui-table">
					<colgroup>
						<col width="33%">
						<col width="33%">
						<col width="33%">
					</colgroup>
					<thead>
					<tr>
						<th style="text-align:left;">已选学分</th>
						<th>已获学分</th>
						<th>未通过学分</th>
					</tr>
					</thead>
					<tbody class="news_content">
						<tr>
							<td align="left">${allCredit}</td>
							<td>${passCredit}</td>
							<td>${noPassCredit}</td>
						</tr>
					</tbody>
				</table>
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