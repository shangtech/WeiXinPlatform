<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="/WEB-INF/content/user/common/resources.jsp"></jsp:include>
  	<link href="${ctx}/components/kindeditor/themes/default/default.css"/>
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
    <div class="span12">
    	<div class="pull-right">
     	 <a href="javascript:history.go(-1);" id="addMenuBtn" class="btn">返回</a>
      	</div>
      <h4 class="header">多图文消息</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid msg-edit-container">
        <div class="msg-preview" style="position:absolute;">
        	<div class="msg-item-wrapper" id="appmsg" data-appid="" data-create-time="">
        		<form id="multiMsgForm" action="${ctx}/manage/service/messages/multiple/save.htm" method="post" style="margin:0px;">
        		<input type="hidden" name="ids" id="ids"/>
                <div class="msg-item multi-msg">
                	<div class="appmsgItem" id="appmsgItem_1" data-id="1">
                		<p class="msg-meta"> 
							<span class="msg-date"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd"/></span> 
						</p>
						<div class="cover">
							<p class="default-tip" style="">封面图片</p>
							<h4 class="msg-t"> 
								<span id="titleSpan" class="i-title">${message.title}</span>
								<input name="id_1" type="hidden" value="${param.id}"/>
								<input type="hidden" name="title_1" value="${message.title}"/>
								<input type="hidden" name="content_1" value="${message.content}"/>
							</h4>
							<ul class="abs tc sub-msg-opr">
								<li class="b-dib sub-msg-opr-item"> 
								<a href="javascript:void(0);" class="th icon18 edit-icon opr-icon" data-rid="1">编辑</a> 
								</li>
							</ul>
							<c:if test="${empty message.image}">
							<img src="" class="i-img" style="display:none;margin-top:-213px;">
							</c:if>
							<c:if test="${not empty message.image}">
							<img src="${ctx}/${message.image}" class="i-img" style="margin-top:-213px;">
							</c:if>
							<input type="hidden" value="" name="image_1" value="${message.image}"/> 
							<input type="hidden" value="" name="local_1"/>
						</div>
                	</div>
                	<c:if test="${empty message.subMessages}">
                	<div class="rel sub-msg-item appmsgItem" id="appmsgItem_2" data-id="2"> 
						<span class="thumb"> 
							<span class="default-tip" style="">缩略图</span> 
							<img src="" class="i-img" style="display:none;margin-top:-72px;"> 
							<input type="hidden" value="" name="image_2"/> 
							<input type="hidden" value="" name="local_2"/>
						</span>
                        <h4 class="msg-t"> 
							<span class="i-title"></span> 
							<input type="hidden" name="title_2"/>
							<input type="hidden" name="content_2"/>
						</h4>
                       	<ul class="abs tc sub-msg-opr">
                            <li class="b-dib sub-msg-opr-item"> 
								<a href="javascript:void(0);" class="th icon18 edit-icon opr-icon" data-rid="2">编辑</a> 
							</li><li class="b-dib sub-msg-opr-item"> 
								<a href="javascript:void(0);" class="th icon18 del-icon opr-icon" data-rid="2">删除</a> 
							</li>
                        </ul>
                    </div>
                    </c:if>
                    <c:if test="${not empty message.subMessages}">
                    <c:forEach items="${message.subMessages}" var="item" varStatus="i">
                	<div class="rel sub-msg-item appmsgItem" id="appmsgItem_${i.index+2}" data-id="${i.index+2}"> 
						<span class="thumb"> 
							<span class="default-tip" style="">缩略图</span> 
							<img src="${ctx}/${item.image}" class="i-img" style="margin-top:-72px;"> 
							<input type="hidden" value="${item.image}" name="image_${i.index+2}"/> 
							<input type="hidden" value="" name="local_${i.index+2}"/>
							<input type="hidden" value="${item.id}" name="id_${i.index+2}"/>
						</span>
                        <h4 class="msg-t"> 
							<span class="i-title">${item.title}</span> 
							<input type="hidden" name="title_${i.index+2}" value="${item.title}"/>
							<input type="hidden" name="content_${i.index+2}" value="${item.title}"/>
						</h4>
                        <ul class="abs tc sub-msg-opr">
                            <li class="b-dib sub-msg-opr-item"> 
								<a href="javascript:void(0);" class="th icon18 edit-icon opr-icon" data-rid="2">编辑</a> 
							</li><li class="b-dib sub-msg-opr-item"> 
								<a href="javascript:void(0);" class="th icon18 del-icon opr-icon" data-rid="2">删除</a> 
							</li>
                         </ul>
                      </div>
                      </c:forEach>
                      </c:if>
                      <div class="sub-add">
	                      <a href="javascript:;" class="block tc sub-add-btn">
	                      <span class="vm dib sub-add-icon"></span>
	                      </a>
                      </div>
                 </div>
                 </form>
             </div>
             <div>
             	<span class="btn span12" id="saveBtn">保     存</span>
             </div>
        </div>
        <div class="msg-edit-wrapper">
        <div class="msg-edit-area">
        	<form class="form-horizontal" action="${ctx}/manage/service/messages/single/save.htm" method="post" id="messageForm">
        		<div class="control-group">
        			<label for="title" class="control-label">标题</label>
        			<div class="controls">
        				<input type="text" id="title" name="title" value="${message.title}" class="span9"/>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="title" class="control-label">封面</label>
        			<div class="controls uploader">
        				<input type="file" id="image" class="span9" data-for="image"/>
        				<input type="hidden" id="image_hidden" name="image" value="${message.image}"/>
        				<div class="input-append span9">
        					<span class="span12 fileholder" id="fileholder-image">请选择文件</span>
        					<span class="btn span2 filebtn action" id="filebtn-image">选择</span>
        				</div>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="content" class="control-label">正文</label>
        			<div class="controls">
        				<textarea id="content" name="content" class="span9" rows="8" style="display: none;">${message.content}</textarea>
        			</div>
        		</div>
        	</form>
        	<form id="imageForm" style="display:none;" action="${ctx}/manage/service/messages/image/save.htm" enctype="multipart/form-data" method="post">
        		<input type="file" name="image"/>
        	</form>
        	<span class="msg-arrow a-out" style="margin-top: 0px;"></span>
        	<span class="msg-arrow a-in" style="margin-top: 0px;"></span>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${ctx}/components/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript" src="${ctx}/components/js/user/service/multiple-messages.js"></script>
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