<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title>精准传媒/全景漫游</title>
<style type="text/css">
@charset "gb2312";
body,ul,p{
	font-family: "微软雅黑","宋体";
	font-size: 12px;
	line-height: 20px;
	color: #808080;
	margin:0px;
	padding:0px;
	list-style:none;
}
a{
color:#808080; text-decoration:none; outline:none;
}
a:hover{
color:#808080; text-decoration:none;
}
img{
border:none; outline:none;
}
.hide{
display:none;
}
.main{
/*width:1260px;*/ width:100%; margin:0px auto; overflow:hidden; background:url(${ctx}/main-site/bj.jpg) repeat;
}
.head img{ border:0; margin:0; padding:0;}
.kuandu{width:900px; margin:0px auto; overflow:hidden;}
.xian{border-bottom:#d3d3d3 solid 1px; font-size:1px; height:1px;clear:both; width:900px; line-height:1px;}
.zxty{ padding:18px 0 0 0;}
.zxty ul{ overflow:hidden;}
.zxty li{ float:left;display:inline; padding:0 2px 2px 0;height: 111px;}

.ysfg li{ float:left;display:inline; padding-right:2px; height:131px; overflow:hidden;}

.youshi{ float:left;display:inline; width:900px;}
.youshi_title{ float:left; display:inline; padding:32px 0 23px 0;width:900px;}
.youshi_title_right{ float:right; display:inline; width:24px; height:30px;}
.youshi_tubiao li{ float:left; width:225px;_width:205px;}
.youshi_tubiao li span{ float:left; width:205px;}
.xuxian{ background:url(${ctx}/main-site/xuxian.jpg) repeat-x; font-size:1px; height:1px; width:900px;clear:both;line-height:1px;}

.wuxiaci{ float:left;display:inline; margin:21px 0 0 0; width:900px;}
.wuxiaci_title{ padding:22px 0 20px 0;}

.wuxiaci_img li{ float:left; padding-right:66px;}

.hzlc{ float:left;display:inline; width:900px;}

.hzlc_title{ padding:27px 0 22px 0}
.hzlc_title_right{ float:right; display:inline; width:283px; height:34px;}

.hzlc_img{ float:left;display:inline; margin:21px 0 0 0; width:900px;}
.hzlc_img li{ float:left;display:inline;}

.end_nav{display: block; float: left;height: 24px; padding: 22px 0;width: 900px;}
.end_nav_left{ float:left;display:inline;}
.end_nav_right{ float:right;display:inline;}

.end{ padding:26px 0 46px 0;}
.end_logo{ float:right; display:inline;}
</style>
</head>

<body>
<div class="main">
<div class="kuandu">

  <div class="head">
<table width="900" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><a href="javascript:;" target="_blank"><img src="${ctx}/main-site/top.jpg" alt="精准传媒" width="900" height="96" /></a></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/gg_2.jpg" width="900" height="97" /></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/format.jpg" width="900" /></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/gg_7.jpg" width="900" height="97" /></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/gg_8.jpg" width="900" height="96" /></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/gg_9.jpg" width="900" height="97" /></td>
  </tr>
  <tr>
    <td><img src="${ctx}/main-site/gg_10.jpg" width="900" height="95" /></td>
  </tr>
</table>
  </div>
  <div class="xian"></div>
  <div class="zxty">
  <ul>
  <c:forEach items="${samples}" var="item">
  	<li><a href="${item.value}" target="_blank"><img src="${ctx}/${item.key}" width="179" height="111"/></a></li>
  </c:forEach>
  </ul>
  </div>
  
  <img src="${ctx}/main-site/gg_16.jpg" width="178" height="41" />
  <div class="ysfg">
  <div class="xian"></div>
  <ul>
  <c:forEach items="${styles}" var="item">
  	<li>${item.value}<br /><img src="${ctx}/${item.key}" alt="${item.value}" width="178" height="111" /></li>
  </c:forEach>
  </ul>
  </div>
  <div class="youshi">

  <div class="youshi_title"><div class="youshi_title_right"><img src="${ctx}/main-site/gg_30.jpg" width="24" height="30" /></div><img src="${ctx}/main-site/gg_28.jpg" width="413" height="30" /></div>
  <div class="xian"></div>
  <div class="youshi_tubiao">
  <ul>
  <li><img src="${ctx}/main-site/gg_34.jpg" width="226" height="187" /><br />
<span>①新颖：打破传统呆板图标/界面；<br />
②定制：优秀的设计团队可定制匹配图标/界面；③动画：生动图标动画可提升用户兴趣。
</span>
</li>
  <li><img src="${ctx}/main-site/gg_35.jpg" width="225" height="187" /><br />
<span>①设备：种类数量较多，本着客户为
中心的思想，所用设备均从高端入手；<br />②摄影师：均是经验丰富的摄影专家。各种复杂环境皆能出好效果。</span></li>
  <li><img src="${ctx}/main-site/gg_36.jpg" width="224" height="187" /><br />
<span>引擎特点：<br />
①流畅&nbsp;&nbsp;&nbsp;&nbsp;②人性化互动&nbsp;&nbsp;&nbsp;&nbsp;③方便<br /> 
专业插件设计师，满足各种特殊效果设计。</span></li>
  <li style="padding:0;"><img src="${ctx}/main-site/gg_37.jpg" width="225" height="187" /><br />
<span>全景漫游价格：<br />
全景数量越多，可享受的折扣也越多<br />
全景视频相关事项均面议。<br />
视频分辨率：>=3000*1500像素</span></li>
  
  </ul>
  </div>
  <div class="wuxiaci">
    <div class="xuxian"></div>
    <div class="wuxiaci_title"><img src="${ctx}/main-site/gg_38.jpg" width="155" height="17" /></div>
    <div class="xuxian"></div>
    
  </div>
  <div class="wuxiaci_img">
  <ul>
  <li><img src="${ctx}/main-site/gg_40.jpg" width="107" height="193" /></li>
  <li><img src="${ctx}/main-site/gg_39.jpg" width="103" height="194" /></li>
  <li><img src="${ctx}/main-site/gg_43.jpg" width="107" height="193" /></li>
  <li><img src="${ctx}/main-site/gg_45.jpg" width="109" height="193" /></li>
  <li style="padding-top:30px;"><img src="${ctx}/main-site/gg_48.jpg" width="123" height="109" /></li>
  </ul>
  </div>
  
  </div>
  <div class="hzlc">
  <div class="xuxian" style=" margin-top:10px;"></div>
  
    <div class="hzlc_title">
      <div class="hzlc_title_right"><img src="${ctx}/main-site/gg_52.jpg" width="283" height="34" /></div>
      <img src="${ctx}/main-site/gg_51.jpg" width="173" height="34" /></div>
      <div class="xian"></div>

  
  <div class="hzlc_img">
  <ul>
  <li><img src="${ctx}/main-site/gg_53.jpg" width="177" height="153" /></li>
  <li><img src="${ctx}/main-site/gg_54.jpg" width="182" height="153" /></li>
  <li><img src="${ctx}/main-site/gg_55.jpg" width="182" height="153" /></li>
  <li><img src="${ctx}/main-site/gg_56.jpg" width="181" height="153" /></li>
  <li><img src="${ctx}/main-site/gg_57.jpg" width="178" height="153" /></li>
  </ul>
  </div>
  <div class="xuxian"></div>
  </div>
  <div class="end_nav">
	<%--
    <div class="end_nav_right"><a href="http://www.ddmer.com/web/" target="_blank"><img src="${ctx}/main-site/gg_59.jpg" alt="网站建设" width="233" height="24" /></a></div>
    <div class="end_nav_left"><a href="http://www.ddmer.com/contact/" target="_blank"><img src="${ctx}/main-site/gg_58.jpg" alt="联系我们" width="143" height="24" /></a></div>
    
    --%>
    </div>
  <div class="xian"></div>
  
  <div class="end">
  <%--
<div class="end_logo"><a href="http://www.ddmer.com" target="_blank"><img src="${ctx}/main-site/gg_60.jpg" alt="丁丁猫" width="51" height="36" /></a></div>
ICP证号：京ICP备13033698号-1 Copyright @ 2009-2014  北京<a href="http://www.ddmer.com" target="_blank">丁丁猫</a>文化传媒有限公司<br />

地址：北京市大兴区黄村兴华北路  电话：010-8362 5051 
  <a href="http://www.ddmer.com" target="_blank">http://www.ddmer.com</a></div>
	--%>
</div>
</div>
<div style="display: none;">
<script src="http://www.ddmer.com/js/tj.js" type="text/javascript"></script>
</div>
</body>
</html>
