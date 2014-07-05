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
<body id="list-model">
	<div class="container">
    	<div class="row" style="margin-top:15px;">
        	<div class="col-xs-12">
            	<dt class="title">${project.projectName}</dt>
                <dt class="title-en">${project.nameEn}</dt>
            </div>
        </div>
    	<div class="row">
        	<div class="col-xs-12">
            	<div id="listBox" class="slideBox">
				<div class="bd">
					<ul>
						<c:forEach items="${images}" var="item">
						<li>
							<img src="${ctx}/${item.image}"/>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="hd">
					<ul></ul>
				</div>
                <script type="text/javascript">
				TouchSlide({ 
					slideCell:"#listBox",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					mainCell:".bd ul", 
					effect:"leftLoop", 
					autoPage:true,//自动分页
					autoPlay:true //自动播放
				});
			</script>
			</div>
            </div>
        </div>
    	<div id="function-1" class="row">
        	<div class="col-xs-12">
            	<img src="${ctx}/site_template/temp001/images/list_line_01.png" class="img-responsive"/>
            </div>
            <!--楼盘详情-->
            <a href="project/description.htm?id=${project.id}"><div class="col-xs-4 click-1"></div></a> 	
            <!--360看房-->
            <a href="#"><div class="col-xs-4 click-2"></div></a>   
            <!--地图-->
            <a href="http://api.map.baidu.com/marker?location=${project.latitude},${project.longitude}&title=${project.projectName}&content=${project.projectName}&output=html"><div class="col-xs-4 click-3"></div></a>  
        </div>
        <div id="function-2" class="row">
        	<div class="col-xs-12">
            	<img src="${ctx}/site_template/temp001/images/list_line_02.png" class="img-responsive"/>
            </div>
            <!--周边配套-->
            <a href="project/peripheral.htm?id=${project.id}"><div class="col-xs-4 click-1"></div></a> 
            <!--户型图-->
            <a href="project/houses.htm?id=${project.id}"><div class="col-xs-4 click-2"></div></a> 
            <!--交通-->
            <a href="project/traffic.htm?id=${project.id}"><div class="col-xs-4 click-3"></div></a> 
        </div>
        <div class="row" style="margin-top:5em;">
        	<!--楼盘的电话修改-->
        	<a href="tel:02862358080">
        	<div id="tel" class="col-xs-12 text-center">
            	<i class="iconfont">&#x3439;</i>
                <!--楼盘的电话修改-->
            	<span>028-62358080</span> 
            </div>
            </a>
        </div>
    </div>
</body>
</html>