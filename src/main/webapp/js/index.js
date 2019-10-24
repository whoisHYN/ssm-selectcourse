'use strict';
layui.use(['jquery','layer','element'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
  var element = layui.element();
  
// larry-side-menu向左折叠
$('.larry-side-menu').click(function() {
  var sideWidth = $('#larry-side').width();
  if(sideWidth === 200) {
      $('#larry-body').animate({
        left: '0'
      }); //admin-footer
      $('#larry-footer').animate({
        left: '0'
      });
      $('#larry-side').animate({
        width: '0'
      });
  } else {
      $('#larry-body').animate({
        left: '200px'
      });
      $('#larry-footer').animate({
        left: '200px'
      });
      $('#larry-side').animate({
        width: '200px'
      });
  }
});

 
$(function(){
   // 刷新iframe操作
    $(".refreshThis").click(function(){
       $(".layui-tab-content .layui-tab-item").each(function(){
          if($(this).hasClass('layui-show')){
             $(this).children('iframe')[0].contentWindow.location.reload(true);
          }
       });
    });


});


});
