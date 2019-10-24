<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>LarryBlogCMS-Home</title>
  <meta name="renderer" content="webkit"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">  
  <meta name="format-detection" content="telephone=no"> 
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css">
	<link rel="stylesheet" type="text/css" href="css/main.css" media="all">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
</head>
<body>
<section class="larry-wrapper">
    <!-- overview -->
	<div class="row state-overview">
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol userblue layui-anim layui-anim-rotate"> <i class="iconpx-users"></i>
				</div>
				<div class="value">
                    <h1 id="count1">${userCount}</h1>
					<p>用户总量</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol commred layui-anim layui-anim-rotate"> <i class="iconpx-user-add"></i>
				</div>
				<div class="value">
                    <h1 id="count2">${courseCount}</h1>
					<p>课程总数</p>
				</div>
			</section>
		</div>
	</div>
	<!-- overview end -->
	<div class="row">
		<div class="col-lg-6">
			<section class="panel">
				<header class="panel-heading bm0">
					<span class='span-title'>系统概览</span>
					<span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
				</header>
				<div class="panel-body" >
					<table class="table table-hover personal-task">
                         <tbody>
                         	<tr>
                         		<td>
                         			<strong>系统信息</strong>： 华南理工大学外国语学院选课系统
                         		</td>
                         		<td>

                         		</td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>开发作者</strong>： 黄亚宁

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>版本信息</strong>：1.0
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>开发时间</strong>：2019/03
                                </td>
                                <td></td>
                         	</tr>
                         </tbody>
					</table>
				</div>
			</section>
		</div>
		<div class="col-lg-6">
             <section class="panel">
                 <header class="panel-heading bm0">
                        <span class='span-title'>系统公告</span>
                  </header>
                  <div class="panel-body">
                        <table class="table table-hover">
                            <tr>
                              <td>
                                  注意事项:<br/><p>1.系统中成绩查询显示的课程性质及各类统计仅供参考,应以课程代码与培养方案对照的课程性质为准(特殊情况除外)!</p>
                                  <br/><p>2.相同相近课程不得重复修读获得学分!</p>
                                  <br/><p>3.考试违纪极可能终生无学位,且不可撤销,请慎重!</p>
                                  <br/><p>毕业学期选课修读的学生，必须及时关注期末成绩录入,确认成绩及时提交,并核实课程性质,重修标记,辅修标记是否正确,同时密切联系学院教学办公室,否则可能无法按期毕业,或影响换证考试!</p>
                              </td>
                            </tr>
                        </table>
                  </div>
             </section>

             <section class="panel">
                  <header class="panel-heading bm0">
                        <span class='span-title'>校内通知</span>
                        <span class="badge" style="background-color:#FF3333;"> new </span>
                        <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body">
                       <table class="table table-hover personal-task">
                             <tbody>
                              <tr>
                                <td>教务管理类</td>
                                <td>
                                  <a href="http://jwc.zufe.edu.cn/sanji-content.jsp?urltype=news.NewsContentUrl&wbtreeid=1073&wbnewsid=4934" target="_blank">2018——2019学年第二学期第一轮选课结束停开课程</a>
                                </td>
                                <td class="col-md-5">阅读量：1074 &nbsp;&nbsp;&nbsp;&nbsp; 	2019/03/16 </td>
                              </tr>
                              <tr>
                                <td>学籍管理类</td>
                                <td>
                                  <a href="http://jwc.zufe.edu.cn/sanji-content.jsp?urltype=news.NewsContentUrl&wbtreeid=1075&wbnewsid=4926" target="_blank">	2019年上半年大学外语和计算机等级考试报名扣款成功名单</a>
                                </td>
                                <td class="col-md-5">阅读量：2745 &nbsp;&nbsp;&nbsp;&nbsp; 	2019/03/14 </td>
                              </tr>
                              <tr>
                                <td>考试管理类</td>
                                <td>
                                  <a href="http://jwc.zufe.edu.cn/sanji-content.jsp?urltype=news.NewsContentUrl&wbtreeid=1075&wbnewsid=4921" target="_blank">	19年上半年外语和计算机考试报名待扣款同学名单</a>
                                </td>
                                <td class="col-md-5">阅读量：4149 &nbsp;&nbsp;&nbsp;&nbsp; 2019/03/12 </td>
                              </tr>
                              <tr>
                                <td>教学改革类</td>
                                <td>
                                  <a href="http://jwc.zufe.edu.cn/sanji-content.jsp?urltype=news.NewsContentUrl&wbtreeid=1080&wbnewsid=4902" target="_blank">	关于开展2018-2019学年第二学期“基地精英进课堂”活动的通知</a>
                                </td>
                                <td class="col-md-5">阅读量：204 &nbsp;&nbsp;&nbsp;&nbsp; 2019/03/06 </td>
                              </tr>
                             </tbody>
                       </table>
                  </div>
             </section>
		</div>
	</div>

</section>

<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element'],function(){
		window.jQuery = window.$ = layui.jquery;
		window.layer = layui.layer;
        window.element = layui.element();

       $('.panel .tools .iconpx-chevron-down').click(function(){
       	   var el = $(this).parents(".panel").children(".panel-body");
       	   if($(this).hasClass("iconpx-chevron-down")){
       	   	   $(this).removeClass("iconpx-chevron-down").addClass("iconpx-chevron-up");
       	   	   el.slideUp(200);
       	   }else{
       	   	   $(this).removeClass("iconpx-chevron-up").addClass("iconpx-chevron-down");
       	   	   el.slideDown(200);
       	   }
       })

	});
</script>
</body>
</html>