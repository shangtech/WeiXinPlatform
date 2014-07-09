<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="http://stc.weimob.com/css/estate/3dview.css?2014-02-25-10" media="all" />
		<link rel="stylesheet" type="text/css" href="http://stc.weimob.com/css/estate/back.css?2014-02-25-10" media="all" />
		<script type="text/javascript" src="http://stc.weimob.com/src/estate/skin.js?2014-02-25-10"></script>
		<title>室内</title>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
        <!-- Mobile Devices Support @begin -->
        <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
        <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
        <meta content="no-cache" http-equiv="pragma">
        <meta content="0" http-equiv="expires">
        <meta content="telephone=no, address=no" name="format-detection">
        <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <!-- Mobile Devices Support @end -->
    </head>
    <body onselectstart="return true;" ondragstart="return false;">
        <div id="container" style="width:100%;height:100%;">
	This content requires HTML5/CSS3, WebGL, or Adobe Flash Player Version 9 or higher.
</div>
<script type="text/javascript">
	if (ggHasHtml5Css3D() || ggHasWebGL()) {
		pano=new pano2vrPlayer("container");
		skin=new pano2vrSkin(pano);
		pano.readConfigUrl('panorama/data.htm?id=${p.id}');
	} else{
		alert("not support 360view");
	}
</script>
<noscript>
	<p><b>Please enable Javascript!</b></p>
</noscript>
<div class='view_change'><a href='javascript:history.go(-1);'>切换房间</a></div>

<a href="javascript:history.go(-1);" class="back360" style="">&nbsp;</a>      		
<div mark="stat_code" style="width:0px; height:0px; display:none;">
					</div>
	</body>
</html>