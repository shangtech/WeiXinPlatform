<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="/WEB-INF/content/user/common/resources.jsp"></jsp:include>
  	<link href="${ctx}/components/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
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
    	<jsp:param value="application" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="appointment" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
      <h4 class="header">添加预约活动</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
       		<c:forEach items="${tempList}" var="item" varStatus="i">
       		<c:if test="${(i.index+1)%3 eq 1}">
       			<ul class="thumbnails">
       		</c:if>
       				<li class="span4">
       					<a href="javascript:;" class="thumbnail mask-parent template" data-id="${item.id}">
       						<img src="${ctx}/site_template/${item.path}/overview.PNG" alt="${item.name}">
       						<div class="hover-mask"></div>
       						<div class="selected-icon"></div>
       					</a>
       				</li>
       		<c:if test="${((i.index+1)%3 eq 0) or ((i.index+1) eq fn:length(tempList))}">
       			</ul>
       		</c:if>
       		</c:forEach>
      </div>
      <div class="row-fluid">
      	<form id="appointmentForm" class="form-horizontal" action="save.htm" method="post">
      		<div class="control-group">
        		<label for="title" class="control-label">标题</label>
        		<div class="controls">
        			<input type="text" id="title" name="title" class="span9"/>
        			<input type="hidden" id="tempId" name="tempId"/>
        		</div>
        	</div>
        	<div class="control-group">
        		<label for="title" class="control-label">活动封面图</label>
        		<div class="controls uploader">
        			<input type="file" id="image" class="span9 auto-upload" data-for="image"/>
        			<input type="hidden" id="image_hidden" name="image"/>
        			<div class="input-append span9">
        				<span class="span12 fileholder" id="fileholder-image">请选择文件</span>
        				<span class="btn span2 filebtn action" id="filebtn-image">选择</span>
        			</div>
        		</div>
        	</div>
        	<div class="control-group">
        		<label for="title" class="control-label">开始时间</label>
        		<div class="controls">
        			<input type="text" id="startTime" name="start_time" class="span4 form_datetime"/>
        		</div>
        	</div>
        	<div class="control-group">
        		<label for="title" class="control-label">结束时间</label>
        		<div class="controls">
        			<input type="text" id="endTime" name="end_time" class="span4 form_datetime"/>
        		</div>
        	</div>
        	<div id="custom"></div>
        	<div class="control-group">
        		<div class="controls">
        			<a href="javascript:;" class="btn submit">保存</a>
        		</div>
        	</div>
      	</form>
      	<form action="image/save.htm" enctype="multipart/form-data" method="post" style="display:none;" id="imageForm">
      		<input type="file" name="image"/>
      	</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${ctx}/components/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/components/js/user/application/appointment.js"></script>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
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