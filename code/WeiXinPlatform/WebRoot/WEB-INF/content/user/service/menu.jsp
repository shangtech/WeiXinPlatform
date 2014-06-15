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
    	<jsp:param value="wxmenu" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
      <a href="#" id="addMenuBtn" class="btn">添加菜单</a>
      <a href="#" id="addMenuBtn" class="btn">排序</a>
      </div>
      <h4 class="header">自定义菜单</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
        <table class="table table-bordered" height="400">
        	<thead>
        		<tr><th width="25%">菜单管理</th><th>动作设置</th></tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td class="nopadding">
        				<div id="menulist">
        					<c:forEach items="${list}" var="item">
        					<div class="level-first">
        						<div data-id="${item.id}" class="menunode" id="menunode-${item.id}" data-parent="0">
        							<a href="#"><span class="menuname">${item.menuName}</span></a>
        							<div class="btns">
        								<a href="#" class="add"><i class="icon-plus"></i></a>
	        							<a href="#" class="edit"><i class="icon-pencil"></i></a>
	        							<a href="#" class="del"><i class="icon-trash"></i></a>
	        						</div>
	        						<a href="#" class="move"><i class="icon-align-justify"></i></a>
        						</div>
        						<div class="level-second" id="level-second-${item.id}">
        							<c:forEach items="${item.children}" var="child">
        							<div data-id="${child.id}" class="menunode" id="menunode-${child.id}" data-parent="${item.id}">
	        							<a href="#"><span class="placeholder"></span><span class="menuname">${child.menuName}</span></a>
	        							<div class="btns">
		        							<a href="#" class="edit"><i class="icon-pencil"></i></a>
		        							<a href="#" class="del"><i class="icon-trash"></i></a>
		        						</div>
		        						<a href="#" class="move"><i class="icon-align-justify"></i></a>
	        						</div>
        							</c:forEach>
        						</div>
        					</div>
        					</c:forEach>
        				</div>
        			</td>
        			<td>
        				
        			</td>
        		</tr>
        	</tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div id="menuFormModal" class="modal hide fade" data-backdrop="static">
  <div class="modal-header">
    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    <h3>新建菜单</h3>
  </div>
  <div class="modal-body">
    <form class="form-horizontal" method="post" action="wxmenu/save.htm"/>
      <div class="control-group">
        <label for="menuName" class="control-label">菜单名称 </label>
        <div class="controls">
          <input id="menuName" name="menuName" type="text" placeholder="菜单名称" />
          <input type="hidden" name="parentId" value="0" id="parentId"/>
          <input type="hidden" name="id" id="id"/>
        </div>
      </div>
    </form>
  </div>
  <div class="modal-footer">
  	<a href="#" data-dismiss="modal" class="btn">取消</a>
  	<a href="#" class="btn btn-primary submit">保存</a>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	function sortMenu(){
		$('#menulist').sortable({
			placeholder: "ui-state-highlight"
		});
		$('.level-second').sortable({
			placeholder: "ui-state-highlight"
		});
	}
	//添加表单验证
	$('#menuFormModal form').validate({
		rules: {
			menuName: {
				required: true
			}
		},
		messages: {
			menuName: {
				required: '菜单名称必填'
			}
		},
		errorElement: 'span',
		errorClass: "help-inline",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	$('#menuFormModal .btn.submit').click(function(){
		if($('#menuFormModal form').valid()){
			$('#menuFormModal form').ajaxSubmit({
				dataType: 'json',
				success: function(result){
					if(!result.success){
						return;
					}
					$('#menuFormModal').modal('hide');
					var old = $('#menunode-'+result.id);
					if(old.length > 0){
						old.find('.menuname')[0].innerHTML = result.menuName;
						return;
					}
					var menunode = $('<div></div>').attr('data-id', result.id).addClass('menunode');
					var menunodeHtml = '<a href="#">'+(result.parentId==0?'':'<span class="placeholder"></span>')+'<span class="menuname">'+result.menuName+'</span></a>';
					menunodeHtml +=			'<div class="btns">';
					//如果是一级菜单要加添加按钮
					if(result.parentId == 0)
						menunodeHtml +=		'	<a href="#" class="add"><i class="icon-plus"></i></a>';
					menunodeHtml +=			'	<a href="#" class="edit"><i class="icon-pencil"></i></a>';
					menunodeHtml +=			'	<a href="#" class="del"><i class="icon-trash"></i></a>';
					menunodeHtml +=			'</div>';
					menunodeHtml +=		'<a href="#" class="move"><i class="icon-align-justify"></i></a>';
					menunode.html(menunodeHtml);
					if(result.parentId != 0){
						$('#level-second-'+result.parentId).append(menunode);
					}else{
						var firstLevel = $('<div class="level-fisrt"></div>').append(menunode)
							.append('<div class="level-second" id="level-second-'+result.id+'"></div>')
							.appendTo($('#menulist'));
					}
				}
			});
		}
	});
	//重新打开的时候清除之前的表单验证,再判断是一级菜单还是二级菜单限制字数
	$('#menuFormModal').on('show', function(){
		var parentId = $('#parentId').val();
		var maxlength = 4;
		var message = '一级菜单最多4个字';
		if(parentId && parentId != '0'){
			maxlength = 7;
			message = '二级菜单最多7个字';
		}
		$('#menuName').rules('add', {
			maxlength: maxlength,
			messages: {
				maxlength: message
			}
		});
	});
	$('#menuFormModal').on('hide', function(){
		$('#menuFormModal form')[0].reset();
	});
	$('#addMenuBtn').click(function(){
		if($('#menulist').children().length >= 3){
			alert('一级菜单最多三项');
			return;
		}
		$('#parentId').val(0);
		$('#id').val('');
		$('#menuFormModal').modal('toggle');
	});
	$('#menulist').on('click', '.edit', function(){
		var node = $(this).parent().parent();
		$('#parentId').val(node.attr('data-parent'));
		$('#id').val(node.attr('data-id'));
		$('#menuName').val(node.find('.menuname')[0].innerHTML);
		$('#menuFormModal').modal('toggle');
	});
	$('#menulist').on('click', '.add', function(){
		var node = $(this).parent().parent();
		if($('#level-second-'+node.attr('data-id')).children().length >= 5){
			alert('二级菜单最多5项');
			return;
		}
		$('#parentId').val(node.attr('data-id'));
		$('#id').val('');
		$('#menuName').val('');
		$('#menuFormModal').modal('toggle');
	});
	$('#menulist').on('click', '.del', function(){
		var node = $(this).parent().parent();
		var id = node.attr('data-id');
		$.ajax({
			url: ctx+'/manage/service/wxmenu/delete.htm',
			dataType: 'json',
			data: {
				id: id
			},
			method: 'POST',
			success: function(result){
				if(!result || !result.success){
					alert(result.msg);
					return;
				}
				if(node.attr('data-parent') != 0){
					node.remove();
				}else{
					node.parent().remove();
				}
			}
		});
	});
	$('#menulist .btns a').on({
		mouseover: function(){
			$(this).children().addClass('icon-white');
		},
		mouseout: function(){
			$(this).children().removeClass('icon-white');
		}
	});
	$('#menulist .menunode').click(function(){
		var node = $(this);
		if(!node.hasClass('on')){
			$('#menulist .on').removeClass('on');
			node.addClass('on');
		}
	});
});
</script>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.core.js"></script>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.widget.js"></script>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.mouse.js"></script>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.sortable.js"></script>
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