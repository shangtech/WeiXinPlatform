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
        	<img src="${ctx}/${project.imageTraffic}" class="img-responsive"/>
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
    					<h3 class="panel-title">交通</h3>
  					</div> 
                    <div id="summary" class="row">
                    	<div class="col-xs-12">${project.traffic}</div>
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
        	<a href="tel:02862358080">
        	<div id="tel" class="col-xs-12 text-center">
            	<i class="iconfont">&#x3439;</i>
                <!--楼盘的电话修改-->
            	<span>028-62358080</span>
            </div>
            </a>
        </div>
        <%--  
        <div class="row">
        	<!--在线客服地址修改-->
        	<a data-toggle="modal" data-target="#service">
        	<div id="chat" class="col-xs-3"><img src="images/icon_chat.png" class="img-responsive" /></div>
            </a>
        </div>
        --%>
    </div>
<%--
<div class="modal fade" id="service" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      	<div class="row">
    		<div id="titles" class="col-xs-12 text-center">点击头像进行在线咨询</div>
    	</div>
       	<div class="row" style="margin:1em 0 0 0;">
    		<div class="col-xs-6 text-center"><a href="#"><img src="images/CD010206.jpg" id="pics" class="img-responsive img-circle" /></a></div>
        	<div class="col-xs-6 text-center"><a href="#"><img src="images/CD002762.jpg" id="pics" class="img-responsive img-circle" /></a></div>
    	</div>
    	<div class="row" style="margin:0.5em 0 0 0;">
    	 	<div class="col-xs-6 text-center">
        		<dt class="name">李梦娜</dt>
            	<dt class="tip">甜美的微笑，与您达成心与心的沟通。</dt>
            	<dt class="tel"><i class="iconfont">&#x3439;</i><a href="tel:13658039133">13658039133</a></dt>
        	</div>
        	<div class="col-xs-6 text-center">
        		<dt class="name">刘路革</dt>
            	<dt class="tip">真诚的服务 ，给您玫瑰般的温馨。</dt>
            	<dt class="tel"><i class="iconfont">&#x3439;</i><a href="tel:13880467036">13880467036</a></dt>
        	</div>
    	</div>
        <div class="row" style="margin:1em 0 0 0;">
    		<div class="col-xs-6 text-center"><a href="#"><img src="images/blmghy_01.jpg" id="pics" class="img-responsive img-circle" /></a></div>
        	<div class="col-xs-6 text-center"><a href="#"><img src="images/blmghy_02.jpg" id="pics" class="img-responsive img-circle" /></a></div>
    	</div>
    	<div class="row" style="margin:0.5em 0 0 0;">
    	 	<div class="col-xs-6 text-center">
        		<dt class="name">邹媛</dt>
            	<dt class="tip">形象气质佳，贴心服务到您家。</dt>
            	<dt class="tel"><i class="iconfont">&#x3439;</i><a href="tel:13980505266">13980505266</a></dt>
        	</div>
        	<div class="col-xs-6 text-center">
        		<dt class="name">先镠怿</dt>
            	<dt class="tip">成熟的专业视角成为当之无愧的金牌顾问。</dt>
            	<dt class="tel"><i class="iconfont">&#x3439;</i><a href="tel:18613201770">18613201770</a></dt>
        	</div>
    	</div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
  <div class="row" style="margin:0;">
    	<div class="col-xs-12 text-center" data-dismiss="modal" aria-hidden="true" style=" position:fixed; bottom:0; left:0;background:rgba(7,15,35,0.6);  z-index:9999999;">
        	<img src="${ctx}/site_template/temp001/images/btn_close_3.png" class="img-responsive" style=" width:18%;margin:auto; padding:1em;"/>
        </div>
    </div>
</div>
--%>
</body>
</html>