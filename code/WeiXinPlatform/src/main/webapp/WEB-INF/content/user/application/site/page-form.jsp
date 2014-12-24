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
    	<jsp:param value="custompage" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
      <h4 class="header">添加特效页面</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
       		<c:forEach items="${list}" var="item" varStatus="i">
       		<c:if test="${(i.index+1)%3 eq 1}">
       			<ul class="thumbnails">
       		</c:if>
       				<li class="span4">
       					<a href="javascript:;" class="thumbnail mask-parent template" data-id="${item.id}">
       						<img src="${ctx}/site_template/${item.path}/overview.png" alt="${item.name}">
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
      	<form id="pageForm" class="form-horizontal" action="save.htm" method="post">
      		<div class="control-group">
        		<label for="title" class="control-label">标题</label>
        		<div class="controls">
        			<input type="text" id="name" name="name" class="span9"/>
        			<input type="hidden" id="temp" name="temp"/>
        			<input type="hidden" id="data" name="data"/>
        		</div>
        	</div>
        	<div id="custom"></div>
        	<div class="control-group">
        		<div class="controls">
        			<a href="javascript:;" class="btn submit">保存</a>
        		</div>
        	</div>
      	</form>
      	<form action="${ctx}/manage/application/appointment/image/save.htm" enctype="multipart/form-data" method="post" style="display:none;" id="imageForm">
      		<input type="file" name="image"/>
      	</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#pageForm').on('click', '.filebtnadd', function(){
		var id = new Date().getTime();
		var html = '<div class="row-fluid multifile">'
			     + '<input type="file" id="image_'+id+'" class="span9 auto-upload" data-for="image_'+id+'"/>'
		 		 + '<input type="hidden" id="image_'+id+'_hidden"/>'
			     + '<div class="input-append span9">'
			     +   '<span class="span12 fileholder" id="fileholder-image_'+id+'">请选择文件</span>'
			     +   '<span class="btn span2 filebtn action" id="filebtn-image_'+id+'">选择</span>'
			     +   '<span class="btn span2 action filebtnadd">添加</span>'
		    	 + '</div>'
	    		 + '</div>';
	    $(this).parent().parent().parent().append(html);
	    $(this).removeClass('filebtnadd').addClass('filebtnremove').html('移除');
	});
	$('#pageForm').on('click', '.filebtnremove', function(){
		$(this).parent().parent().remove();
	});
	$('.template').click(function(){
		if(!$(this).hasClass('selected')){
			$('.template.selected').removeClass('selected');
			$(this).addClass('selected');
			var id = $(this).attr('data-id');
			$('#temp').val(id);
			$('#custom').html('').load(ctx + '/manage/application/appointment/template/form.htm?id='+id+'&_='+new Date().getTime());
		}
	});
});
function submit(){
	$('#pageForm').ajaxSubmit({
		dataType: 'json',
		success: function(result){
			if(!result.success){
				alert(result.msg);
				return;
			}
			document.location.href = 'list.htm';
		}
	});
}
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