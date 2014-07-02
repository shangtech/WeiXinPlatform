<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
		<div class="pull-right">
		 <a href="javascript:;" id="addTypeBtn" class="btn">添加分类</a>
     	 <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
		<h4 class="header">子楼盘管理</h4>
      	<div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      	<div class="row-fluid">
		<table class="table table-bordered" height="400">
        	<thead>
        		<tr><th width="25%">楼盘分类</th><th>楼盘列表</th></tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td class="nopadding">
        				<div id="menulist">
        					<c:forEach items="${typeList}" var="item">
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
        				<div class="center"><a href="javascript:;" id="addProjectBtn" class="btn btn-primary btn-large">添加楼盘</a></div>
        			</td>
        		</tr>
        	</tbody>
        </table>
        </div>

<div id="typeFormModal" class="modal hide fade" data-backdrop="static">
  <div class="modal-header">
    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    <h3>楼盘分类</h3>
  </div>
  <div class="modal-body">
    <form class="form-horizontal" method="post" action="type/save.htm">
      <div class="control-group">
        <label for="typeName" class="control-label">分类名称 </label>
        <div class="controls">
          <input id="typeName" name="typeName" type="text" placeholder="分类名称" />
          <input type="hidden" name="id" id="typeId"/>
        </div>
      </div>
    </form>
  </div>
  <div class="modal-footer">
  	<a href="#" data-dismiss="modal" class="btn">取消</a>
  	<a href="#" class="btn btn-primary submit">保存</a>
  </div>
</div>
<div id="projectFormModal" class="modal hide fade" data-backdrop="static">
	<div class="modal-header">
    	<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    	<h3>楼盘详情</h3>
  	</div>
  	<div class="modal-body"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	//添加表单验证
	$('#typeFormModal form').validate({
		rules: {
			typeName: {
				required: true
			}
		},
		messages: {
			typeName: {
				required: '分类名称必填'
			}
		}
	});
	$('#addTypeBtn').click(function(){
		$('#typeId').val('');
		$('#typeName').val('');
		$('#typeFormModal').modal('toggle');
	});
	$('#typeFormModal .submit').click(function(){
		var id = $('#typeId').val();
		var typeName = $('#typeName').val();
		if($('#typeFormModal form').valid()){
			$('#typeFormModal form').ajaxSubmit({
				dataType: 'json',
				success: function(result){
					if(!result.success){
						alert(result.msg);
						return;
					}
					if(id){
						$('#node-'+id+' .name').html(typeName);
					}else{
						var html = '<div class="menunode" id="node-'+result.id+'" data-id="'+result.id+'">'
        						 + '	<a href="#"><span class="menuname name">'+typeName+'</span></a>'
        						 + '	<div class="btns">'
	        					 + '		<a href="#" class="edit"><i class="icon-pencil"></i></a>'
	        					 + '		<a href="#" class="del"><i class="icon-trash"></i></a>'
	        					 + '	</div>'
	        					 + '	<a href="#" class="move"><i class="icon-align-justify"></i></a>'
        						 + '</div>';
        				$('#menulist').append(html);
					}
					$('#typeFormModal').modal('toggle');
				}
			});
		}
	});
	$('#menulist').on('click', '.edit', function(){
		$('#typeId').val($(this).parent().parent().attr('data-id'));
		$('#typeName').val($(this).parent().parent().find('.name').html());
		$('#typeFormModal').modal('toggle');
	});
	$('#menulist').on('click', '.del', function(){
		$.ajax({
			url: '${ctx}/manage/application/property/type/delete.htm?id='+$(this).parent().parent().attr('data-id'),
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$(this).parent().parent().remove();
			}
		});
	});
	$('#addProjectBtn').click(function(){
		$('#projectFormModal').modal('toggle');
		$('#projectFormModal .modal-body').load('${ctx}/manage/application/property/project/form.htm');
	});
});
</script>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.core.js"></script>