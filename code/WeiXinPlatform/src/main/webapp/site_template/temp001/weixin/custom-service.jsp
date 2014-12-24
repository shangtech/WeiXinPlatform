<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8"/>
	<title>在线客服</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<script type="text/javascript" src="${ctx}/components/user/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/components/bootstrap3/js/bootstrap.min.js"></script>
	<script type='application/javascript' src='${ctx}/site_template/temp001/js/modernizr.js'></script>
	<style>
	#carousel .flex-active-slide{background:rgba(1,17,44,0.3);}
	.modal {
	    background: url(${ctx}/site_template/temp001/images/bus_bg.jpg);
	    background-color: transparent;
	    box-shadow: none;
	}
	</style>
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
<body id="service-list">
	<div class="container">
    	<div id="carousel" class="row">
          <ul class="slides">
          	<c:forEach items="${list}" var="item">
          	<li id="navs" class="col-xs-3 text-center">${item.name}</li>
          	</c:forEach>
          </ul>
        </div>
    	<div id="slider" class="flexslider">
          <ul class="slides">
          	<c:forEach items="${map}" var="entry">
          	<li>
          		<c:forEach items="${entry.value}" var="item">
            	<button id="btn_pop" class="col-xs-12">
  	    	    <div id="list" class="row">
                	<div class="col-xs-2"></div>
                    <div id="info" class="col-xs-10">
                    	<dt id="title">${item.realname}</dt>
                        <dt id="name">${item.description}</dt>
                    </div>
                    <div id="pic" class="col-xs-3"><img src="${ctx}/${item.image}" class="img-responsive img-circle" /></div>
                </div>
                </button>
                </c:forEach>
  	    	</li>
          	</c:forEach>
          </ul>
        </div> 
    </div>

<script type="text/javascript" src="${ctx}/site_template/temp001/js/jquery.flexslider-min.js"></script>
 <script type="text/javascript">
 $(window).load(function() {
  // The slider being synced must be initialized first
  $('#carousel').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    itemWidth: 120,
    itemMargin: 0,
    asNavFor: '#slider'
  });
   
  $('#slider').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    sync: "#carousel"
  });
});
    
  </script>
   <!-- Syntax Highlighter -->
  <script type="text/javascript" src="${ctx}/site_template/temp001/js/shCore.js"></script>
  <script type="text/javascript" src="${ctx}/site_template/temp001/js/shBrushXml.js"></script>
  <script type="text/javascript" src="${ctx}/site_template/temp001/js/shBrushJScript.js"></script>

  <!-- Optional FlexSlider Additions -->
  <script src="${ctx}/site_template/temp001/js/jquery.easing.js"></script>
  <script src="${ctx}/site_template/temp001/js/jquery.mousewheel.js"></script>
  <script defer src="${ctx}/site_template/temp001/js/demo.js"></script>
</body>
</html>
