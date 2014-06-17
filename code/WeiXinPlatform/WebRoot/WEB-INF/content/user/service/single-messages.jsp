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
      <h4 class="header">单图文消息</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid msg-edit-container">
        <div class="msg-preview">
        	<div class="msg-item-wrapper" id="appmsg" data-appid="" data-create-time="">
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
        				<input type="text" id="title" name="title" class="span9"/>
        				<input name="id" type="hidden" value="${param.id}"/>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="title" class="control-label">封面</label>
        			<div class="controls uploader">
        				<input type="file" id="image" class="span9" data-for="image"/>
        				<input type="hidden" id="image_hidden" name="image"/>
        				<div class="input-append span9">
        					<span class="span12 fileholder" id="fileholder-image">请选择文件</span>
        					<span class="btn span2 filebtn action" id="filebtn-image">选择</span>
        				</div>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="summary" class="control-label">摘要</label>
        			<div class="controls">
        				<textarea type="text" id="summary" name="summary" class="span9" rows="3"></textarea>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="content" class="control-label">正文</label>
        			<div class="controls">
        				<textarea id="content" name="content" class="span9" rows="8" style="display: none;"></textarea>
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
<script type="text/javascript">
var editor;
$(document).ready(function(){
	$('#messageForm').validate({
		rules: {
			title: {
				required: true
			},
			image: {
				required: true
			}
		},
		messages: {
			title: {
				required: '标题必填'
			},
			image: {
				required: '请上传封面'
			}
		}
	});
	$('body').on('change', '#image', function(){
		var temp = $(this).clone(), next = this.nextSibling;
		$('#imageForm').html('').append($(this).attr('id', '').attr('name', 'image'));
		temp.insertBefore($(next));
		$('#imageForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#image_hidden').val(result.msg);
				$('#appmsgItem .i-img').attr('src', ctx + '/' + result.msg);
			}
		});
	});
	$('#title').change(function(){
		$('#appmsgItem .i-title').html($(this).val());
	});
	$('#summary').change(function(){
		$('#appmsgItem .msg-text').html($(this).val());
	});
	$('#saveBtn').click(function(){
		if($('#messageForm').valid()){
			$('#messageForm').ajaxSubmit({
				dataType: 'json',
				success: function(result){
					alert(result.msg);
					if(!result.success){
						return;
					}
					document.location.href = '${ctx}/manage/service/messages.htm';
				}
			});
		}
	});
});
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