<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8"/>
	<title>${info.title}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<script type="text/javascript" src="${ctx}/components/user/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/components/bootstrap3/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
	<link rel="stylesheet" media="screen" href="${ctx}/components/bootstrap3/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="${ctx}/site_template/temp001/css/css.css">
	<link rel="stylesheet" media="screen" href="${ctx}/site_template/temp001/css/fonts.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-image:url(${ctx}/site_template_temp001/images/news_list_bg.jpg);background-attachment:fixed;background-size:cover">
    <div id="background_wrap"></div>
	<div class="container" style="background:rgba(255,255,255,0.8);margin:15px 10px 30px 10px;border-radius:3px;">  	
        <!--  
        <div class="row">
        	<div class="col-xs-12" style=" margin-top:1em; margin-bottom:1em;">
            	<img src="${ctx}/${info.image}" class="img-responsive" style=""/>
            </div>
        </div>
        -->
        <div class="row">
        	${info.content}
        </div>
    </div>
    <div class="logo" style="">
        <img src="${ctx}/${sessionScope.user.siteLogo}" style="width:140px;display:block;margin:0 auto;padding:0 0 10px 0;" />
    </div>
</body>
</html>
