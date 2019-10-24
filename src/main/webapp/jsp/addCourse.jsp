<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新增用户</title>
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
	<script type="text/javascript">
        function saveCourse() {
            clearErrorMessage();
            var id = $("#id").val();
            if(id.length != 4){
                $('.id_error').text("请输入4位课程编号!!");
                $('#id').focus();
                return false;
            }
            var name = $("#name").val();
            if(name == ""){
                $('.name_error').text("请输入课程名称!!");
                $('#name').focus();
                return false;
            }
            var teaName = $("#teaName").val();
            if(teaName == ""){
                $('.teaName_error').text("请选择课程教师!!");
                $('#name').focus();
                return false;
            }

            var time = $("#time").val();
            if(time == ""){
                $('.time_error').text("请选择课程时间!!");
                $('#name').focus();
                return false;
            }
            var place = $("#place").val();
            if(place == ""){
                $('.place_error').text("请选择课程地点!!");
                $('#name').focus();
                return false;
            }

            layer.confirm('确认提交吗？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                document.form1.submit();
            });
            return false;
        }
        function clearErrorMessage() {
            $('.id_error').text("");
            $('.name_error').text("");
            $('.teaName_error').text("");
            $('.time_error').text("");
            $('.place_error').text("");
        }

	</script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">

		<header class="larry-personal-tit">
			<span>新增课程</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><font color="red">${message}</font></span>
		</header>
		<div class="larry-personal-body clearfix">
			<form name="form1" class="layui-form col-lg-5" action="saveCourse" method="post" onsubmit="return saveCourse()">
				<div class="layui-form-item">
					<label class="layui-form-label">课程编号</label>
					<div class="layui-input-block">
						<input id="id" type="text" name="id" class="layui-input " value="" placeholder="输入4位课程编号" onchange="clearErrorMessage()">
					</div>
					<span class="id_error" style="color: red"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程名称</label>
					<div class="layui-input-block">
						<input id="name" type="text" name="name" class="layui-input " value="" placeholder="输入课程名称" onchange="clearErrorMessage()">
					</div>
					<span class="name_error" style="color: red"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否必修</label>
					<div class="layui-input-block">
						<input type="radio" name="required" value="0" title="否" checked="">
						<input type="radio" name="required" value="1" title="是">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">教师名称</label>
					<div class="layui-input-block">
						<select name="teaName" id="teaName">
							<option value=""></option>
							<c:forEach items="${teaLists}" var="tea">
							<option value="${tea.userName}">${tea.userName}</option>
							</c:forEach>
						</select>
					</div>
					<span class="teaName_error" style="color: red"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学分</label>
					<div class="layui-input-block">
						<input type="radio" name="credit" value="2" title="2分" checked="">
						<input type="radio" name="credit" value="3" title="3分">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程上课时间</label>
					<div class="layui-input-block">
						<select name="time" id="time">
							<option value=""></option>
							<option value="周一:第1,2节">周一:第1,2节</option>
							<option value="周一:第3,4节">周一:第3,4节</option>
							<option value="周一:第5,6节">周一:第5,6节</option>
							<option value="周一:第7,8节">周一:第7,8节</option>
							<option value="周一:第9,10节">周一:第9,10节</option>
							<option value="周二:第1,2节">周二:第1,2节</option>
							<option value="周二:第3,4节">周二:第3,4节</option>
							<option value="周二:第5,6节">周二:第5,6节</option>
							<option value="周二:第7,8节">周二:第7,8节</option>
							<option value="周二:第9,10节">周二:第9,10节</option>
							<option value="周三:第1,2节">周三:第1,2节</option>
							<option value="周三:第3,4节">周三:第3,4节</option>
							<option value="周三:第5,6节">周三:第5,6节</option>
							<option value="周三:第7,8节">周三:第7,8节</option>
							<option value="周三:第9,10节">周三:第9,10节</option>
							<option value="周四:第1,2节">周四:第1,2节</option>
							<option value="周四:第3,4节">周四:第3,4节</option>
							<option value="周四:第5,6节">周四:第5,6节</option>
							<option value="周四:第7,8节">周四:第7,8节</option>
							<option value="周四:第9,10节">周四:第9,10节</option>
							<option value="周五:第1,2节">周五:第1,2节</option>
							<option value="周五:第3,4节">周五:第3,4节</option>
							<option value="周五:第5,6节<">周五:第5,6节</option>
							<option value="周五:第7,8节">周五:第7,8节</option>
							<option value="周五:第9,10节">周五:第9,10节</option>
						</select>
					</div>
					<span class="time_error" style="color: red"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程上课地点</label>
					<div class="layui-input-block">
						<select name="place" id="place">
							<option value=""></option>
							<option value="A101">A101</option>
							<option value="A102">A102</option>
							<option value="A103">A103</option>
							<option value="A104">A104</option>
							<option value="A105">A105</option>
							<option value="A106">A106</option>
							<option value="A107">A107</option>
							<option value="A108">A108</option>
							<option value="A109">A109</option>
							<option value="A110">A110</option>
							<option value="B101">B101</option>
							<option value="B102">B102</option>
							<option value="B103">B103</option>
							<option value="B104">B104</option>
							<option value="B105">B105</option>
							<option value="B106">B106</option>
							<option value="B107">B107</option>
							<option value="B108">B108</option>
							<option value="B109">B109</option>
							<option value="B110">B110</option>
							<option value="C101">C101</option>
							<option value="C102">C102</option>
							<option value="C103">C103</option>
							<option value="C104">C104</option>
							<option value="C105">C105</option>
						</select>
					</div>
					<span class="place_error" style="color: red"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程开始周</label>
					<div class="layui-input-block">
						<input type="text" name="startWeek" class="layui-input layui-disabled" value="1" readonly="true" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">课程结束周</label>
					<div class="layui-input-block">
						<input type="text" name="endWeek" class="layui-input layui-disabled" value="16" readonly="true" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">容纳学生数</label>
					<div class="layui-input-block">
						<select name="stuCount" id="stuCount">
							<option value="40" selected>40</option>
							<option value="40">45</option>
							<option value="40">50</option>
							<option value="40">55</option>
							<option value="40">60</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button  class="layui-btn">立即提交</button>
						<%--<input id="submit" class="layui-btn" type="button" value="提交" onclick="updateUserInfo()">--%>
					</div>
				</div>
			</form>
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