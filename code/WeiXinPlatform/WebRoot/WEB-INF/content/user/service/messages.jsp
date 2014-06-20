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
        	<div style="display:none;">
        		<c:forEach items="${page.result}" var="message" varStatus="i">
        		<div class="msg-preview container" data-index="${i.index}">
        			<div class="msg-item-wrapper" data-create-time="">
        				<c:if test="${empty message.subMessages}">
		                <div id="appmsgItem" class="msg-item appmsgItem">
		                    <h4 class="msg-t"> 
								<span id="titleSpan" class="i-title">${message.title}</span> 
							</h4>
		                    <p class="msg-meta"><span class="msg-date"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd"/></span></p>
		                    <div class="cover">
		                        <p class="default-tip" style="">封面图片</p>
		                        <img src="${ctx}/${message.image}" class="i-img" style="margin-top:-164px;"> 
							</div>
		                    <p class="msg-text">${message.summary}</p>
		                 </div>
		                 </c:if>
		                 <c:if test="${not empty message.subMessages}">
		                 <div class="msg-item multi-msg">
		                 	<div class="appmsgItem" id="appmsgItem_1" >
		                		<p class="msg-meta"> 
									<span class="msg-date"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd"/></span> 
								</p>
								<div class="cover">
									<p class="default-tip" style="">封面图片</p>
									<h4 class="msg-t"> 
										<span id="titleSpan" class="i-title">${message.title}</span>
									</h4>
									<img src="${ctx}/${message.image}" class="i-img" style="margin-top:-213px;">
								</div>
		                	</div>
		                	<c:forEach items="${message.subMessages}" var="item">
		                	<div class="rel sub-msg-item appmsgItem"> 
								<span class="thumb"> 
									<span class="default-tip" style="">缩略图</span> 
									<img src="${ctx}/${item.image}" class="i-img" style="margin-top:-72px;"> 
								</span>
		                        <h4 class="msg-t"> 
									<span class="i-title">${item.title}</span> 
								</h4>
		                      </div>
		                      </c:forEach>
		                 </div>
		                 </c:if>
		                 <div class="msg-opr">
		                 	<ul class="f0 msg-opr-list">
		                 		<li class="b-dib opr-item">
		                 		<c:if test="${not empty message.subMessages}">
		                 			<a class="block tc opr-btn edit-btn" href="${ctx}/manage/service/messages/multiple.htm?id=${message.id}" data-mid="2308">
		                 		</c:if>
		                 		<c:if test="${empty message.subMessages}">
		                 			<a class="block tc opr-btn edit-btn" href="${ctx}/manage/service/messages/single.htm?id=${message.id}" data-mid="2308">
		                 		</c:if>
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
        		</c:forEach>
        	</div>
       <div>
       <div class="row-fluid">
        	<div class="span6" id="col-left">
        		
        	</div>
        	<div class="span6" id="col-right">
        		
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var left = $('#col-left'), right = $('#col-right');
	$('.msg-preview').each(function(){
		if(left.height() > right.height()){
			right.append($(this));
		}else{
			left.append($(this));
		}
	});
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