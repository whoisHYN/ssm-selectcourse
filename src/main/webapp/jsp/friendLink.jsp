<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>友情链接</title>
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
</head>

<script type="text/javascript">


</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">
	友情链接

	</blockquote>
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="5%">
						<col width="45%">
						<col width="45%">

						</colgroup>
					<thead>
						<tr>
							<th style="text-align:left;"></th>
							<th>网站名称</th>
							<th>网址</th>
						</tr>
					</thead>
					<tbody class="news_content">
						<tr>
							<td align="left"></td>
							<td><a href="https://www.scut.edu.cn/new/">华南理工大学</a></td>
							<td>https://www.scut.edu.cn/new/</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td><a href="http://jw.scut.edu.cn/zhinan/cms/index.do">华南理工大学教务处</a></td>
							<td>http://jw.scut.edu.cn/zhinan/cms/index.do</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td><a href="http://www.lib.scut.edu.cn/">华南理工大学图书馆</a></td>
							<td>http://www.lib.scut.edu.cn/</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td><a href="http://www.scut.edu.cn/jw2005/">华南理工大学教务管理系统</a></td>
							<td>http://www.scut.edu.cn/jw2005/</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td><a href="http://www2.scut.edu.cn/graduate/">华南理工大学研究生院</a></td>
							<td>http://www2.scut.edu.cn/graduate/</td>
						</tr>

					</tbody>
					</table>
			    </div>
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