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
	<script type="text/javascript" src="common/layer/layer.js"></script>
</head>

<script type="text/javascript">
	$(function () {
//        $('.134').text("请输入6~15位数字");
		<c:forEach items="${courseLists}" var="course">
			if(${course.time == "周一:第1,2节"} ) {
			    $('.112').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>')
			} else if(${course.time == "周一:第3,4节"} ) {
				$('.134').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周一:第5,6节"} ) {
				$('.156').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周一:第7,8节"} ) {
				$('.178').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周一:第9,10节"} ) {
				$('.190').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周二:第1,2节"} ) {
				$('.212').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周二:第3,4节"} ) {
				$('.234').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周二:第5,6节"} ) {
				$('.256').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周二:第7,8节"} ) {
				$('.278').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周二:第9,10节"} ) {
				$('.290').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周三:第1,2节"} ) {
				$('.312').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周三:第3,4节"} ) {
				$('.334').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周三:第5,6节"} ) {
				$('.356').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周三:第7,8节"} ) {
				$('.378').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周三:第9,10节"} ) {
				$('.390').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周四:第1,2节"} ) {
				$('.412').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周四:第3,4节"} ) {
				$('.434').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周四:第5,6节"} ) {
				$('.456').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周四:第7,8节"} ) {
				$('.478').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周四:第9,10节"} ) {
				$('.490').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周五:第1,2节"} ) {
				$('.512').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周五:第3,4节"} ) {
				$('.534').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周五:第5,6节"} ) {
				$('.556').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周五:第7,8节"} ) {
				$('.578').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			} else if(${course.time == "周五:第9,10节"} ) {
				$('.690').html('<br/>'+ '<a href="javascript:;" onClick="courseInfo(${course.id})" style="color: red">' + '${course.name}'+ '</a>' + '<br/>'+
                    '周一:第1,2节{第${course.startWeek}-${course.endWeek}周}'+ '<br/>'+'${course.teaName}'+ '<br/>'+'${course.place}'+'<br/>'+'<br/>');
			}
		</c:forEach>
    });
	function courseInfo(pdata) {
        layer.open({
            type: 2,
            title: '课程详细信息',
            shadeClose: true,
            shade: 0.8,
            area: ['500px', '90%'],
            content: 'courseDetail?courseId=' + pdata
        });
    }
</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">

	<blockquote class="layui-elem-quote news_search">

		<div align="center">我的课表</div>

	</blockquote>

		         <!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
					    <colgroup>
						<col width="3%">
						<col width="7%">
						<col width="18%">
						<col width="18%">
						<col width="18%">
						<col width="18%">
						<col width="18%">
						</colgroup>
					<thead>
						<tr>
							<th colspan="2">时间</th>
							<th>星期一</th>
							<th>星期二</th>
							<th>星期三</th>
							<th>星期四</th>
							<th>星期五</th>
						</tr>
					</thead>
					<tbody class="news_content">
						<tr>
							<td rowspan="4">上午</td>
							<td>第一节</td>
							<td class="112" rowspan="2"></td>
							<td class="212" rowspan="2"></td>
							<td class="312" rowspan="2"></td>
							<td class="412" rowspan="2"></td>
							<td class="512" rowspan="2"></td>
						</tr>
						<tr>
							<td>第二节</td>
						</tr>
						<tr>
							<td>第三节</td>
							<td class="134" rowspan="2"></td>
							<td class="234" rowspan="2"></td>
							<td class="334" rowspan="2"></td>
							<td class="434" rowspan="2"></td>
							<td class="534" rowspan="2"></td>
						</tr>
						<tr>
							<td>第四节</td>
						</tr>
						<tr>
							<td rowspan="4">下午</td>
							<td>第五节</td>
							<td class="156" rowspan="2"></td>
							<td class="256" rowspan="2"></td>
							<td class="356" rowspan="2"></td>
							<td class="456" rowspan="2"></td>
							<td class="556" rowspan="2"></td>
						</tr>
						<tr>
							<td>第六节</td>
						</tr>
						<tr>
							<td>第七节</td>
							<td class="178" rowspan="2"></td>
							<td class="278" rowspan="2"></td>
							<td class="378" rowspan="2"></td>
							<td class="478" rowspan="2"></td>
							<td class="578" rowspan="2"></td>
						</tr>
						<tr>
							<td>第八节</td>
						</tr>
						<tr>
							<td rowspan="2">晚上</td>
							<td>第九节</td>
							<td class="190" rowspan="2"></td>
							<td class="290" rowspan="2"></td>
							<td class="390" rowspan="2"></td>
							<td class="490" rowspan="2"></td>
							<td class="590" rowspan="2"></td>
						</tr>
						<tr>
							<td>第十节</td>
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