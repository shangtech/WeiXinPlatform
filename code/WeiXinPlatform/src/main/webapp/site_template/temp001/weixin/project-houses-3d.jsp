<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8"/>
	<title>${project.projectName}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<script type="text/javascript" src="${ctx}/components/user/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/components/bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/components/TouchSlide.1.1.js"></script>
	<script type="text/javascript" src="${ctx}/components/jquery.nicescroll.min.js"></script>
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
<body style="background-image:url(${ctx}/site_template/temp001/images/news_list_bg.jpg); background-attachment:fixed;background-size:cover;">
	<div id="model" class="container">
    	<div class="row">
        	<div class="col-xs-12" style=" font-size:1.5em; padding:0.5em 0 0.5em 1em; color:#FFF;">
            	3D全景图
            </div>
        </div>
        <c:forEach items="${list}" var="item" varStatus="i">
         <div class="row" style="background:rgba(255,255,255,0.8); margin:0;<c:if test="${i.index eq 0}">border-radius:5px 5px 0 0;</c:if><c:if test="${(i.index+1) eq fn:length(list)}">border-radius:0 0 5px 5px;</c:if>">
        	<div class="col-xs-12" style="border-bottom:1px dashed #5B5554; padding:0;">
            	<div class="row" style="margin:1em 0 1em 0;">
                	<div class="col-xs-5" style="padding-right:0px; padding-left:0.5em;">
                    	<a href="house.htm?house=${item.id}" style="color:#414141;"><img src="${ctx}/${item.image}" class="img-responsive" style="padding:0.8em ; border:1px solid #FFF;" alt="${item.houseName}户型"/></a>
                    </div>
                    <div class="col-xs-7">
                    	<dt style="font-size:1.2em;">${item.houseName}</dt>
                        <dt style="font-weight:normal; font-size:1.2em;">${item.description}</dt>
                        <dt style="font-weight:normal; font-size:1.2em;">${item.houseArea}</dt>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <div class="row" style="margin:1em 0 0.5em 0;">
        	<div class="col-xs-3"></div>
            <div class="col-xs-6"><img src="${ctx}/${sessionScope.user.siteLogo}" class="img-responsive"/></div>
            <div class="col-xs-3"></div>
        </div>
    </div>
</body>
</html>