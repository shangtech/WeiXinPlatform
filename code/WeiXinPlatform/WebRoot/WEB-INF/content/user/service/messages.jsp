<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="/WEB-INF/content/user/common/resources.jsp"></jsp:include>
  	<title>仪表盘</title>
  </head>
  <body>
    <div id="in-nav">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="pull-right">
              <li>xxx，下午好。<a href="login.html">退出</a></li>
            </ul>
            <a id="logo" href="index.html">
            <h4>xxx<strong>微信运营平台</strong></h4></a>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/content/user/common/menu.jsp">
    	<jsp:param value="service" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-service.jsp">
    	<jsp:param value="messages" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="messages/single.htm" id="addMenuBtn" class="btn">添加单图文消息</a>
	      <a href="messages/multiple.htm" id="addMenuBtn" class="btn">添加多图文消息</a>
      	</div>
      <h4 class="header">图文消息列表</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
        <c:forEach items="${page.result}" var="item" varStatus="i">
        <c:if test="${i.index%2 eq 0}">
        <div class="row-fluid">
        </c:if>
        	<div class="span6">
        		<div class="msg-preview container">
        			<div class="msg-item-wrapper" data-create-time="">
		                <div id="appmsgItem" class="msg-item appmsgItem">
		                    <h4 class="msg-t"> 
								<span id="titleSpan" class="i-title">标题</span> 
							</h4>
		                    <p class="msg-meta"><span class="msg-date">2014-06-15</span></p>
		                    <div class="cover">
		                        <p class="default-tip" style="">封面图片</p>
		                        <img src="http://fengchaodata.com:80/images/res/guaguaka1.png" class="i-img" style="margin-top:-164px;"> 
							</div>
		                    <p class="msg-text">封面图片封面图片</p>
		                 </div>
		                 <div class="msg-opr">
		                 	<ul class="f0 msg-opr-list">
		                 		<li class="b-dib opr-item">
		                 			<a class="block tc opr-btn edit-btn" href="javascript:void(0);" data-mid="2308">
		                 				<span class="th vm dib opr-icon edit-icon">编辑</span>
		                 			</a>
		                 		</li><li class="b-dib opr-item">
		                 			<a class="block tc opr-btn del-btn" href="javascript:void(0);" data-mid="2308">
		                 				<span class="th vm dib opr-icon del-icon">删除</span>
		                 			</a>
		                 		</li>
		                 	</ul>
		                 </div>
		             </div>
        		</div>
        	</div>
        <c:if test="${(i.index%2 eq 1) or ((i.index+1) eq fn:length(page.result))}">
        </div>
        </c:if>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
      </div>
    </div>
    <footer>
      <div class="container">
        <div class="row">
          <div class="span12">
            <p class="pull-right">Admin Theme by Nathan Speller</p>
            <p>&copy; Copyright 2013 FreelanceLeague</p>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>