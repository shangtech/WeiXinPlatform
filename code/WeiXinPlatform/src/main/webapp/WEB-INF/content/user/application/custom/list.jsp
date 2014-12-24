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
    	<jsp:param value="application" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="custom" name="current"/>
    </jsp:include>
    <div class="span9">
      <div class="pull-right">
		 <a href="javascript:;" id="addGroupBtn" class="btn">添加客服分组</a>
		 <a href="javascript:;" id="addBtn" class="btn">添加客服</a>
     	 <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
		<h4 class="header">客服管理</h4>
      	<div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      	<div class="row-fluid">
		<table class="table table-bordered" height="400">
        	<thead>
        		<tr><th width="25%">客服分组</th><th>客服列表</th></tr>
        	</thead>
        	<tbody style="height:364px;">
        		<tr>
        			<td class="nopadding">
        				<div id="menulist">
        					<c:forEach items="${list}" var="item">
        					<div class="menunode" id="node-${item.id}" data-id="${item.id}">
        						<a href="#"><span class="menuname name">${item.name}</span></a>
        						<div class="btns">
	        						<a href="#" class="edit"><i class="icon-pencil"></i></a>
	        						<a href="#" class="del"><i class="icon-trash"></i></a>
	        					</div>
	        					<a href="#" class="move"><i class="icon-align-justify"></i></a>
        					</div>
        					</c:forEach>
        				</div>
        			</td>
        			<td>
        				<div class="center" id="service-list">
        					<c:forEach items="${map}" var="entry">
        					<div class="project" id="group-${entry.key}">
        						<c:forEach items="${entry.value}" var="item" varStatus="i">
        							<c:if test="${(i.index+1)%3 eq 1}"><ul class="thumbnails"></c:if>
        							<li class="span4">
        								<div href="#" class="thumbnail" data-id="${item.id}">
        									<img src="${ctx}/${item.image}" alt=""/>
        									<div class="service-opts" style="margin-top:3px;">
	        									<div class="btn-group">
	        										<a href="javascript:;" class="btn btn-primary edit">编辑</a>
	        										<a href="javascript:;" class="btn btn-primary remove">删除</a>
	        									</div>
	        								</div>
        								</div>
        							</li>
        							<c:if test="${((i.index+1) eq fn:length(entry.value)) or ((i.index+1)%3 eq 0)}"></ul></c:if>
        						</c:forEach>
        					</div>
        					</c:forEach>
        				</div>
        			</td>
        		</tr>
        	</tbody>
        </table>
        </div>
    </div>
  </div>
</div>
<div id="groupFormModal" class="modal hide fade" data-backdrop="static">
  <div class="modal-header">
    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    <h3>客服分组</h3>
  </div>
  <div class="modal-body" id="groupFormBody">
    
  </div>
  <div class="modal-footer">
  	<a href="#" data-dismiss="modal" class="btn">取消</a>
  	<a href="javascript:;" class="btn btn-primary submit">保存</a>
  </div>
</div>
<div id="serviceFormModal" class="modal hide fade" data-backdrop="static">
  <div class="modal-header">
    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    <h3>客服信息编辑</h3>
  </div>
  <div class="modal-body" id="serviceFormBody">
    
  </div>
  <div class="modal-footer">
  	<a href="#" data-dismiss="modal" class="btn">取消</a>
  	<a href="javascript:;" class="btn btn-primary submit">保存</a>
  </div>
</div>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#menulist').on('click', '.menunode', function(){
		if(!$(this).hasClass('on')){
			$('#menulist .on').removeClass('on');
			$(this).addClass('on');
			$('#service-list .show').removeClass('show');
			$('#group-'+$(this).attr('data-id')).addClass('show');
		}
	});
	$('#addBtn').click(function(){
		var node = $('.menunode.on');
		if(node.length == 0){
			alert('请先选择分组');
			return;
		}
		$('#serviceFormBody').load('form.htm?group='+node.attr('data-id')+'&_='+new Date().getTime());
		$('#serviceFormModal').modal('toggle');
	});
	$('#groupFormModal .submit').click(function(){
		var name = $('#name').val();
		var id = $('#group-id').val();
		$('#groupForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#groupFormModal').modal('toggle');
				if(id){
					$('#node-'+id +' span.name').html(name);
				}else{
					var html = '<div class="menunode" id="node-'+result.msg+'" data-id="'+result.msg+'">'
	        				 +	'	<a href="#"><span class="menuname name">'+name+'</span></a>'
	        				 +	'	<div class="btns">'
		        			 +	'		<a href="#" class="edit"><i class="icon-pencil"></i></a>'
		        			 +	'		<a href="#" class="del"><i class="icon-trash"></i></a>'
		        			 +	'	</div>'
		        			 +	'	<a href="#" class="move"><i class="icon-align-justify"></i></a>'
		        			 +	'</div>';
		        	$('#menulist').append(html);
				}
			}
		});
	});
	$('#menulist').on('click', '.edit', function(){
		var id = $(this).parent().parent().attr('data-id');
		$('#groupFormBody').load('group/form.htm?id='+id+'&_='+new Date().getTime());
		$('#groupFormModal').modal('toggle');
	});
	$('#menulist').on('click', '.del', function(){
		var id = $(this).parent().parent().attr('data-id');
		var node = $(this).parent().parent();
		$.ajax({
			url: 'group/delete.htm?id=' + id,
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				node.remove();
			}
		});
	});
	$('#addGroupBtn').click(function(){
		$('#groupFormBody').load('group/form.htm?_='+new Date().getTime());
		$('#groupFormModal').modal('toggle');
	});
	$('#serviceFormModal .submit').click(function(){
		$('#serviceForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#serviceFormModal').modal('toggle');
				var group = $('.menunode.on').attr('data-id');
				$('#group-'+group).load('list/'+group+'.htm?_='+new Date().getTime());
			}
		});
	});
	$('#service-list').on('click', '.edit', function(){
		var id = $(this).parent().parent().parent().attr('data-id');
		$('#serviceFormBody').load('form.htm?id='+id+'&_='+new Date().getTime());
		$('#serviceFormModal').modal('toggle');
	});
	$('#service-list').on('click', '.remove', function(){
		var id = $(this).parent().parent().parent().attr('data-id');
		var node = $(this).parent().parent().parent().parent();
		$.ajax({
			url: 'delete.htm?id='+id,
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				node.remove();
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