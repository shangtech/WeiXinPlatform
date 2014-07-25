<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="net.shangtech.weixin.site.entity.CustomPage"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>
<script type="text/javascript">var ctx = '${ctx}';</script>
 <!DOCTYPE html>
<html lang="ch">
<head>
	<title>${page.name}</title>
	<meta charset="utf-8" />
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="0">
	<meta name="apple-touch-fullscreen" content="yes" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="pragram" content="no-cache" />
	<script src="${ctx}/site_template/${temp.path}/js/offline.js"></script>	<!--移动端兼容适配 -->
	<script type="text/javascript">
	if(/Android (\d+\.\d+)/.test(navigator.userAgent)){
		var version = parseFloat(RegExp.$1);
		if(version>2.3){
			var phoneScale = parseInt(window.screen.width)/640;
			document.write('<meta name="viewport" content="width=640, minimum-scale = '+ phoneScale +', maximum-scale = '+ phoneScale +', target-densitydpi=device-dpi">');
		}else{
			document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
		}
	}else{
		document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
	}
	//微信去掉下方刷新栏
	if(navigator.userAgent.indexOf('MicroMessenger') >= 0){
		document.addEventListener('WeixinJSBridgeReady', function() {
			//WeixinJSBridge.call('hideToolbar');
		});
	}
	</script>
	<!--移动端兼容适配 end -->
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/reset.css?v=1.5"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/app.css?v=1.5"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/animation.css?v=1.5"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/units.css?v=1.5"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/modules.css?v=1.5"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/site_template/${temp.path}/css/page.css?v=1.5"/>
<head>
	<%
	CustomPage _page = (CustomPage)request.getAttribute("page");
	String data = _page.getData();
	String music = data.substring(0, data.indexOf(";"));
	String pics = data.substring(data.indexOf(";")+1);
	String background = pics.substring(0, pics.indexOf(";"));
	pics = pics.substring(pics.indexOf(";")+1);
	%>
<body class="app" data-app-id="3466" style="background:url('${ctx}/<%=background%>');">
	<!--app loading-->
	<div id="app-loading" class="app-loading">
		<div class="cycleWrap">
			<span class="cycle cycle-1"></span>
			<span class="cycle cycle-2"></span>
			<span class="cycle cycle-3"></span>
			<span class="cycle cycle-4"></span>
		</div>
		<div class="lineWrap">
			<span class="line line-1"></span>
			<span class="line line-2"></span>
			<span class="line line-3"></span>
		</div>
	</div>
	<!--app loading end-->
	<c:set var="music" value="<%=music%>"></c:set>
	<c:set var="pics" value="<%=pics%>"></c:set>
	<!--app header-->
	<header class="app-header">
			<a href="javascript:void(0);" class="u-globalAudio">
				<i class="icon-music"></i>
				<audio src="${ctx}/${music}" autoplay="autoplay" loop="loop"></audio>
			</a>																																																																			</header>
	<!--app header end-->
	<!--app content-->
	<section class="app-content">
		<c:forTokens items="${pics}" var="item" delims=";" varStatus="i">
		<!--启动页page-->
		<section class="page page-index<c:if test="${i.index eq 0}"> z-current</c:if>" data-plugin-type="info_front">
			<section class="page-content">
				<!--动画背景图-->
								<!-- 科技场景-->
				<div class="m-animationBox m-meteorShower"></div>
								<!--前景图-->
				<img class="m-foregroundImg" src="${ctx}/${item}">
			</section>
		</section>
		<!--启动页page end-->
		</c:forTokens>
	</section>
	<!--app content end-->
	<!--app footer-->
	<footer class="app-footer">
	</footer>
	<!--app footer end-->
	<input type="hidden" value="http://www.lightapp.cn/userfiles/video/tmp/59/53abff056892d.jpg" data-share-pic>
	<!-- script -->
	<script type="text/javascript" src="${ctx}/site_template/${temp.path}/js/sea.js"></script>
	<script type="text/javascript">
		var assetsVersion = '1.6';
		seajs.config({
			map: [
				[ /^(.*\.(?:css|js))(.*)$/i, '$1?v='+ assetsVersion]
			]
		});
		seajs.use('${ctx}/site_template/${temp.path}/js/main');
	</script>
	<!-- script end-->
</body>
</html>
