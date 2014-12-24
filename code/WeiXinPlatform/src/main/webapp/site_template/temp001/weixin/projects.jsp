<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
	<meta charset="utf-8"/>
	<title>智能导购</title>
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
<style>
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{ border:none; background:rgba(31,25,23,0.4); border-radius:0; color:#9F9F9D;}
.nav-tabs>li{margin-bottom:0;}
.nav-tabs{border:none;}
.nav-tabs>li>a { border:none; color:#9F9F9D;}
.nav-tabs>li>a:hover{border:none; border-radius:0; background:rgba(31,25,23,0.4); color:#9F9F9D; }
#boxscroll {padding: 40px;height: 220px;width: 300px;border: 2px solid #00F;overflow: auto;margin-bottom:20px;}
#boxframe {position:absolute;top:28px;left:420px;width:400px;height:300px;overflow:auto;border: 2px solid #0F0;}
.tab-pane{ height:450px;overflow: hidden;}
.img-rounded { border-radius: 5px 5px 0 0;}
.tab-pane .row .col-xs-12 dt:first-child {line-height: 1em;}
</style>
<script>
$(document).ready(
  function() { 
    $(".projects").niceScroll();
	$('.nav-tabs a:first').tab('show');
  }
);
</script>
</head>
<body style=" background-image:url(${ctx}/site_template/temp001/images/model_list_bg.jpg);background-size:cover">
	<div class="container" style="padding:0;">
    	<div class="row" style="margin:0;">
            <ul class="nav nav-tabs col-xs-3" style="padding:2em 7px 0 0;">
            	<c:forEach items="${typeList}" var="item">
  				<li class="col-xs-12 text-center" style="padding:0;">
                	<a href="#projects-${item.id}" data-toggle="tab">
                	<dt style="color:#9F9F9D; font-size:0.9em;">${item.name}</dt>
                    <dt style="color:#5D5757; font-size:0.8em; font-weight:normal;">${item.nameEn}</dt>
                	</a>
                </li>
                </c:forEach>
			</ul>
            <div class="col-xs-9" style="padding:0 10px 0 5px;">
            	<div class="tab-content">
            		<c:forEach items="${map}" var="entry">
  					<div class="tab-pane fade in active projects" id="projects-${entry.key}" style="padding-bottom:2em;">
  						<c:forEach items="${entry.value}" var="item">
                    		<a href="project.htm?id=${item.id}">
    							<div class="row" style="margin:1em 0 0 0;">
        							<div class="col-xs-12" style="padding:0;"><img src="${ctx}/${item.image}" class="img-responsive img-rounded"/></div>
            						<div class="col-xs-12 text-center" style="background:rgba(255,255,255,0.8);border-radius:0 0 5px 5px;">
            							<dt style="color:#5B5553; padding-top:0.5em; font-size:1.2em;">${item.projectName}</dt>
                						<dt style="font-weight:normal; color:#5B5553; padding-bottom:0.2em; font-size:0.8em;">${item.nameEn}</dt>
            						</div>
        						</div>
        					</a>
        				</c:forEach>
                    </div>
                    </c:forEach>
				</div>
            </div>
        </div>
        <div class="row" style="margin:0.6em 0 0 0;">
        	<div class="col-xs-5"></div>
            <div class="col-xs-6" style="padding:0 20px 0 0;"></div>
            <div class="col-xs-1"></div>
        </div>
    </div>
</body>
</html>