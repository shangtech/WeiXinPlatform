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
<body id="detail-model">
	<div class="container">
    	<div class="row">
        	<img src="${ctx}/${project.imagePeripheral}" class="img-responsive"/>
        </div>
        <div class="row" style="margin-top:1.5em; margin-right:0;">
        	<div class="col-xs-8">
            	<dt>${project.projectName}</dt>
                <dt style="font-weight:normal;">楼盘均价：<span style="color:#FB7D27;">${project.priceAvg}</span></dt>
            </div>
            <!--  
            <a href="#">
            	<div id="tuan-no" class="col-xs-4 text-center">暂无团购</div>
            </a>
            -->
        </div>
        <div class="row" style="margin-top:1em; margin-bottom:5em;">
        	<div class="col-xs-12">
        		<div class="panel panel-default">
  					<div class="panel-heading">
    					<h3 class="panel-title">周边配套</h3>
  					</div> 
                    <div id="summary" class="row">
                    	<div class="col-xs-12">${project.peripheral}</div>
                    </div>
                    <!--  
  					<div class="panel-body">
    					<div class="col-xs-4"></div>
                        <a data-toggle="collapse" data-parent="#accordion" href="#info">
            			<div class="col-xs-4 text-center">more
            				<i class="iconfont">&#x3448;</i>
            			</div>
                        </a>
           				<div class="col-xs-4"></div>
  					</div>
					-->
				</div>
            </div>
        </div>
        <div class="row">
        	<!--楼盘的电话修改-->
        	<a href="tel:${sessionScope.user.siteTel}">
        	<div id="tel" class="col-xs-12 text-center">
            	<i class="iconfont">&#x3439;</i>
                <!--楼盘的电话修改-->
            	<span>${sessionScope.user.siteTel}</span>
            </div>
            </a>
        </div>
    </div>
</body>
</html>