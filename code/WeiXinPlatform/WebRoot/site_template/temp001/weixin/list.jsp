<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8"/>
	<title>活动预约</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<script type="text/javascript" src="${ctx}/components/user/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/components/bootstrap3/js/bootstrap.min.js"></script>
	<script type='application/javascript' src='${ctx}/site_template/temp001/js/fastclick.js'></script>
	<script type="text/javascript">
	 //请选引用jquery
	 $(function () {
		 FastClick.attach(document.body);
	     $("a").attr('ontouchstart', 'hover(this)');//hover效果
	     $("a").attr('ontouchend', 'mouseout(this)');//秒除hover
	 })
	</script>
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
	<style>
	.moreNewsLink {position: relative;}
	.moreNewsLink::before {content: "";background:url(${ctx}/site_template/temp001/images/arrow_bot.png) no-repeat 50%;height:34px;width:34px;background-size:14px 14px;display:block;position: absolute;left: -40%;}
	.row a {color: #333333;}
	a{display:block; color:#000;}
	a.hover {color:#999;background:rgba(0,0,0,0.5); -webkit-tap-highlight-color: rgba(0,0,0,0.5);/*取消默认手机点击灰色框*/ }
	</style>
</head>
<body style=" background-image:url(${ctx}/site_template/temp001/images/news_list_bg.jpg);background-size:cover">
	<div class="container">
		<c:forEach items="${list}" var="item">
		<a href="view.htm?id=${item.id}">
          	<div class="row" style="margin:1em 0 0 0; background:rgba(255,255,255,0.8); border-radius:5px;">
         		<div class="col-xs-5" style="padding:8px;"><img src="${ctx}/${item.image}" class="img-responsive"/></div>
            	<div class="col-xs-7" style="padding-left:0; padding-top:0.7em;">
              		<dt>${item.title}</dt>
            	</div>
            	<div class="col-xs-12 text-right" style="border-top:1px solid #B6B5BA; background:url(${ctx}/site_template/temp001/images/arrow_right.png) no-repeat 97% 50%; padding:0.2em 0;">
              		<span style="padding-right:2.5em; font-size:1em;">${tip}</span>
            	</div>
         	</div>
         </a> 
		</c:forEach>
          <div class="row" style="margin-top:1em;">
        	<div class="col-xs-3"></div>
            <div class="col-xs-6"><img src="${ctx}/site_template/temp001/images/logo-2.png" class="img-responsive"/></div>
            <div class="col-xs-3"></div>
        </div>
    </div>
</body>
</html>