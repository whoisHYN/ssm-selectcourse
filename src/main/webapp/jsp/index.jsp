<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>选课系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="common/layer/layer.js"></script>
	<script type="text/javascript">
		$(function () {
            $(".signOut").click(function(){
                layer.confirm('确定要退出吗？', {
                    btn: ['确认','取消'] //按钮
                }, function(){
                    $.ajax({
                        url:'logout',
                        type:'post',
                    });
                    window.parent.location.href ="index.jsp";
                });
            });
            $(".showNotice").click(function(){
                showNotice();
            });
        });
        showNotice();
        function showNotice(){
            layer.open({
                type: 1,
                title: "系统公告",
                closeBtn: false,
                area: ['600px', '360px'],
                shade: 0.8,
                id: 'LAY_layuipro',
                btn: ['确定'],
                moveType: 1,
                content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;">' +
				'注意事项:<br/><p>1.系统中成绩查询显示的课程性质及各类统计仅供参考,应以课程代码与培养方案对照的课程性质为准(特殊情况除外)!</p>' +
				'<br/><p>2.相同相近课程不得重复修读获得学分!</p>' +
                '<br/><p>3.考试违纪极可能终生无学位,且不可撤销,请慎重!</p>' +
                '<br/><p>毕业学期选课修读的学生，必须及时关注期末成绩录入,确认成绩及时提交,并核实课程性质,重修标记,辅修标记是否正确,同时密切联系学院教学办公室,否则可能无法按期毕业,或影响换证考试!</p>' +
                '</div>',
                success: function(layero){
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.on("click",function(){
                        layer.tips('系统公告躲在了这里', '.layui-nav-item', {
                            tips: 3
                        });
                    })
                }
            });
        }


	</script>
	
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="#" title="logo">选课系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
			<ul class="layui-nav top_menu">

				<%--<li class="layui-nav-item lockcms">--%>
					<%--<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>--%>
				<%--</li>--%>

				<li class="layui-nav-item">
					<a href="javascript:;">
						<img src="images/head.jpg" class="layui-circle" width="35" height="35">
						<cite>${user.userName}</cite>
					</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;" class="showNotice"><i class="iconfont icon-zhanghu"></i><cite>系统公告</cite></a></dd>
						<dd><a href="javascript:;" class="signOut"><i class="iconfont icon-loginout"></i><cite>退出登录</cite></a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">

		<div class="user-photo">
			<a class="img" title="我的头像"><img src="images/head.jpg"></a>
			<p>你好！<span class="userName">${user.userName}</span>, 欢迎登录</p>
		</div>

		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="jsp/main.jsp">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>

				<li class="layui-nav-item">
					<a href="javascript:;">
						<i class="iconfont icon-jiaoseguanli" ></i>
						<span>我的信息</span>
						<em class="layui-nav-more"></em>
					</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;" data-url="jsp/personInfo.jsp">
								<i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
								<span>个人信息</span>
							</a>
						</dd>
						<dd>
							<a href="javascript:;" data-url="jsp/changePwd.jsp">
								<i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
								<span>修改密码</span>
							</a>
						</dd>
						<%--<dd>--%>
							<%--<a href="javascript:;" data-url="jsp/upload.jsp">--%>
								<%--<i class="layui-icon">&#xe62f;</i>--%>
								<%--<span>头像上传</span>--%>
							<%--</a>--%>
						<%--</dd>--%>
						<dd>
							<a href="javascript:;" data-url="getLogList?content=&page=1&size=10">
								<i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
								<span>日志信息</span>
							</a>
						</dd>
					</dl>
				</li>

			<c:if test="${user.status == 3}">
				<li class="layui-nav-item">
						<a href="javascript:;">
						   <i class="iconfont icon-jiaoseguanli2" ></i>
						   <span>信息管理</span>
						   <em class="layui-nav-more"></em>
						</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="javascript:;" data-url="getAdminUserList?content=&page=1&size=10&status=1">
									   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
									   <span>学生帐号管理</span>
									</a>
								</dd>
								<dd>
									<a href="javascript:;"  data-url="getAdminUserList?content=&page=1&size=10&status=2">
									   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
									   <span>教师帐号管理</span>
									</a>
								</dd>
							</dl>
				</li>

			<!-- 内容管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-wenzhang1" ></i>
					   <span>课程管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					   <dl class="layui-nav-child">
						   <dd>
							   <a href="javascript:;" data-url="addCourse1">
								   <i class="iconfont icon-pinglun1" data-icon='icon-pinglun1'></i>
								   <span>开设新课程</span>
							   </a>
						   </dd>
						   <dd>
							   <a href="javascript:;" data-url="adminCourseManage?page=1&content=">
								   <i class="iconfont icon-tags1" data-icon='icon-tags1'></i>
								   <span>课程管理</span>
							   </a>
						   </dd>
					   </dl>
			   </li>
			</c:if>
			<c:if test="${user.status != 1}">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-wenzhang1" ></i>
					<span>我的课程</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="teaCourseManage?page=1&content=">
							<i class="iconfont icon-pinglun1" data-icon='icon-pinglun1'></i>
							<span>课程管理</span>
						</a>
					</dd>
				</dl>
			</li>
			</c:if>
			<c:if test="${user.status !=  2}">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-shengchengbaogao" ></i>
					<span>我的选课</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="getSelectCoursePage?page=1&content=&courseId=0">
							<i class="iconfont icon-shengchengbaogao" data-icon='icon-shengchengbaogao'></i>
							<span>选课列表</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="getChoosePage?page=1&content=&courseId=0">
							<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
							<span>我的选课</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="myTimeTable">
							<i class="iconfont icon-qingchuhuancun" data-icon='icon-qingchuhuancun'></i>
							<span>我的课表</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="myGrade">
							<i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
							<span>我的成绩</span>
						</a>
					</dd>
				</dl>
			</li>
			</c:if>

				<li class="layui-nav-item" >
					<a href="javascript:;"data-url="jsp/friendLink.jsp">
					   <i class="iconfont icon-youqinglianjie"  data-icon='icon-youqinglianjie'></i>
					   <span>友情链接</span>
					</a>
				</li>
		</ul>
	    </div>
	</div>

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				    </dl>
				  </li>
				</ul>
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="main"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<p><span>2019 &copy;</span>
			华南理工大学,版权所有
	</div>
</div>
<!-- 加载js文件-->                                                                                                                                                                                           
	<script type="text/javascript" src="common/layui/layui.js"></script>
	<script type="text/javascript" src="js/larry.js"></script>
	<script type="text/javascript" src="js/index.js"></script>

</body>
</html>