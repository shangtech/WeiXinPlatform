<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<html class="ks-webkit537 ks-webkit ks-chrome21 ks-chrome">
<head>
	<title>${appointment.title}</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${ctx}/site_template/temp002/css/mobi.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="Cache-Control" content="max-age=0">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<script type="text/javascript"> 
	function checkMobile(){ 
	   var xm=document.zc.xm.value;
		if(xm==""){
			alert("请填写您的姓名！"); 
	        document.zc.xm.focus(); 
	        return false; 
			}
	    var sMobile = document.zc.sj.value 
	    if(!(/^1[3|5|8][0-9]\d{8,8}$/.test(sMobile))){ 
	        alert("输入正确的手机号码！"); 
	        document.zc.sj.focus(); 
	        return false; 
	    } 
	    return true;
	} 
	</script>    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<section class="p-index" style="height: 100%; display: block; ">
		<section class="m-page m-page1 hide" style="height: 100%; ">
			<div class="m-img m-img01" style="background:url(${ctx}/${appointment.custom1}) center no-repeat;background-size:100% 100%">
				<img class="animated fadeInDown J_fTxt" src="${ctx}/${appointment.custom2}" style="position:absolute; left:0px; top:0px; width: 100%; height:100%; display: none; ">
				<a href="javascript:;" class="help-up"></a>
				<!-- <a href="http://www.guguan.net" class="copy">整合营销&nbsp;@古怪科技</a> -->
		  </div>
		</section>
		<section class="m-page m-page2 hide" style="height: 100%; top: 0px; ">
			<div class="m-img m-img01" style="background:url(${ctx}/${appointment.custom3}) center no-repeat;background-size:100% 100%;">
				<img class="animated fadeInDown J_fTxt" src="${ctx}/${appointment.custom4}" style="position:absolute; left:0px; top:0px; width: 100%; height:100%; display: none; ">
				<a href="javascript:;" class="help-up"></a>
                <!-- <a href="http://www.guguan.net" class="copy">整合营销&nbsp;@古怪科技</a> -->
			</div>
		</section>
		<form action="save.htm" method="post" id="zc" name="zc" onSubmit="return false;">
  		<section class="m-page m-page2 hide" style="height: 100%; ">
			<div class="m-img m-img01 run-input" style="background:url(${ctx}/${appointment.custom5}) center no-repeat;background-size: cover!important;">
				<img class="animated fadeInDown J_fTxt" src="${ctx}/${appointment.custom6}" style="position:absolute; left:0px; top:0px; width: 100%; height:100%; display: none; ">
				<input type="text" name="xm" class="input1" />
                <input type="text" name="sj" class="input2"/>
                <input type="hidden" name="appointmentId" value="${appointment.id}"/>
            	<input type="hidden" name="code" value="zan">
				<input type="image" class="input4 submit" src="${ctx}/site_template/temp002/images/submit.png">
			</div>
		</section>
    	</form>
		<article class="run-dialog">
			<a href=""></a>
		</article>
		<a href="javascript:;" class="player-button">
			<span class="player-tip" style="display: none; ">点击开启/关闭音乐</span>
		</a>
	</section>
	<!-- 引入脚本 -->
	<script type="text/javascript" src="${ctx}/components/user/js/jquery.min.js"></script>
	<script src="${ctx}/site_template/temp002/js/jquery.easing.1.3.js"></script>
	<script src="${ctx}/site_template/temp002/js/99_main.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.submit').click(function(){
			if(checkMobile()){
				$.ajax({
					url: 'save.htm',
					data: {
						xm: $('#xm').val(),
						sj: $('#sj').val(),
						appointment: $('#appointmentId').val()
					},
					dataType: 'json',
					method: 'POST',
					success: function(result){
						alert('预约成功');
						$('#zc')[0].reset();
					}
				});
			}
		});
	});
	</script>
</body>
</html>