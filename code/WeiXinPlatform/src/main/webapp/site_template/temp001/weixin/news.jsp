<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <title>${type.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
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
<body>
    <div class="container">
        <div class="row">
            <div class="col-xs-12" style="font-size:1.5em; padding-bottom:1em;">
                <dt>${news.title}</dt>
                <dt style="font-weight:normal;text-indent:0;">
                    <span style="font-size:0.5em; color:#999; padding-right:10px;"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd"/></span>
                    <span style="font-size:0.5em; color:#336699;"></span>
                </dt>
            </div>
            <div class="col-xs-12" style="text-indent:2em; line-height:1.8em;">
                ${news.content}
            </div>
        </div>
    </div>
</body>
</html>