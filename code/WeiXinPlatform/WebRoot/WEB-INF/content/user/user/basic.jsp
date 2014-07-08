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
    	<jsp:param value="user" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-user.jsp">
    	<jsp:param value="user" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
      	</div>
      <h4 class="header">基础设置</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
       	<form id="basicForm" class="form-horizontal" method="post" action="basic/save.htm" enctype="multipart/form-data"/>
       		<div class="control-group">
		        <label for="wxName" class="control-label">账号名称</label>
		        <div class="controls">
		          <input id="wxName" name="wxName" class="span9" type="text" placeholder="账号名称" value="${user.wxName}"/>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="wxNumber" class="control-label">微信号</label>
		        <div class="controls">
		          <input id="wxNumber" name="wxNumber" class="span9" type="text" placeholder="微信号" value="${user.wxNumber}"/>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="url" class="control-label">url</label>
		        <div class="controls">
		        	<div class="input-append">
		          		<input id="url" class="input-xlarge" type="text" value="http://203.195.148.137/${user.appid}.htm" readonly="true"/>
		          		<a href="javascript:;" class="btn hastooltip" data-toggle="tooltip" data-title="复制到剪贴板" data-placement="top">复制</a>
		          	</div>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="token" class="control-label">token</label>
		        <div class="controls">
		        	<div class="input-append">
		          		<input id="token" class="input-xlarge" type="text" value="${user.token}" readonly="true"/>
		          		<a href="javascript:;" data-toggle="tooltip" title data-title="复制到剪贴板" class="btn hastooltip" data-placement="bottom">复制</a>
		          	</div>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="appid" class="control-label">appid</label>
		        <div class="controls">
		          	<input id="appid" name="appid" placeholder="appid" class="span9" type="text" value="${user.appid}"/>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="appkey" class="control-label">appkey</label>
		        <div class="controls">
		          	<input id="appkey" name="appkey" placeholder="appkey" class="span9" type="text" value="${user.appkey}"/>
		        </div>
		    </div>
		    <div class="control-group">
		        <label for="siteTel" class="control-label">网站电话</label>
		        <div class="controls">
		          	<input id="siteTel" name="siteTel" placeholder="siteTel" class="span9" type="text" value="${user.siteTel}"/>
		        </div>
		    </div>
		    
		    <div class="control-group">
		        <label for="siteLogo" class="control-label">网站LOGO</label>
		        	<div class="controls uploader">
        				<input type="file" id="image" class="span9" data-for="image"/>
        				<div class="input-append span9">
        					<span class="span12 fileholder" id="fileholder-image">请选择文件</span>
        					<span class="btn span2 filebtn action" id="filebtn-image">选择</span>
        				</div>
        			</div>
		    </div>
		    <div class="control-group">
		    	<div class="controls">
		    		<a href="javascript:;" class="btn submit">保存</a>
		    	</div>
		    </div>
       	</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.hastooltip').tooltip();
	$('#basicForm .submit').click(function(){
		$('#basicForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				alert('保存成功');
			}
		});
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