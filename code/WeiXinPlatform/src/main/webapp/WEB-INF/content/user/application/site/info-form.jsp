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
    	<jsp:param value="application" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="siteinfo" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
      <h4 class="header">网站内容</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
       		<form id="infoForm" class="form-horizontal" method="post" action="save.htm" enctype="multipart/form-data"/>
		      <div class="control-group">
		        <label for="title" class="control-label">标题</label>
		        <div class="controls">
		          <input id="title" name="title" class="span9" type="text" placeholder="标题" value="${info.title}"/>
		          <input name="id" type="hidden" value="${info.id}"/>
		        </div>
		      </div>
		      <div class="control-group">
		        <label for="image" class="control-label">封面图</label>
			    <div class="controls uploader">
			    	<div class="row-fluid">
				    <input type="file" id="image" name="image_file" class="span9" data-for="image"/>
			 		<div class="input-append span9">
				        <span class="span12 fileholder" id="fileholder-image">请选择文件</span>
				        <span class="btn span2 filebtn action" id="filebtn-image">选择</span>
			    	</div>
			    	</div>
		     	</div>
		      </div>
		      <div class="control-group">
		        <label for="content" class="control-label">正文</label>
		        <div class="controls">
		          <textarea rows="5" id="content" name="content">${info.content}</textarea>
		        </div>
		      </div>
		      <div class="control-group">
		      	<div class="controls">
		      		<a class="btn submit" href="javascript:;">保存</a>
		      	</div>
		      </div>
		    </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript" src="${ctx}/components/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${ctx}/components/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#infoForm .submit').click(function(){
		editor.sync();
		$('#infoForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				document.location.href = 'list.htm';
			}
		});
	});
});
var editor;
KindEditor.ready(function(K){
	editor = K.create('#content', {
		width:666,
		height:400
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