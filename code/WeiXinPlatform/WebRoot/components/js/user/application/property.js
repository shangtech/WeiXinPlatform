var descriptionEditor, peripheralEditor, trafficEditor;
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
	/**
	 * 添加楼盘分类
	 */
	$('#addTypeBtn').click(function(){
		$('#typeId').val('');
		$('#typeName').val('');
		$('#nameEn').val('');
		$('#typeFormModal').modal('toggle');
	});
	/**
	 * 保存楼盘分类
	 * @return {TypeName} 
	 */
	$('#typeFormModal .submit').click(function(){
		var id = $('#typeId').val();
		var typeName = $('#typeName').val();
		var nameEn = $('#nameEn').val();
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
						$('#name_en_'+id).val(nameEn);
					}else{
						var html = '<div class="menunode" id="node-'+result.id+'" data-id="'+result.id+'">'
        						 + '	<a href="#"><span class="menuname name">'+typeName+'</span></a>'
        						 + '	<input type="hidden" value="'+nameEn+'"/>'
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
	/**
	 * 编辑楼盘分类
	 * @memberOf {TypeName} 
	 */
	$('#menulist').on('click', '.edit', function(){
		$('#typeId').val($(this).parent().parent().attr('data-id'));
		$('#typeName').val($(this).parent().parent().find('.name').html());
		$('#nameEn').val($(this).parent().parent().find('input').val());
		$('#typeFormModal').modal('toggle');
	});
	/**
	 * 选择楼盘分类,显示该分类楼盘和添加楼盘按钮
	 * @memberOf {TypeName} 
	 */
	$('#menulist').on('click', '.menunode', function(){
		if(!$(this).hasClass('on')){
			$('#menulist .on').removeClass('on');
			$(this).addClass('on');
			$('#addProjectBtn').show();
			$('#project-list .show').removeClass('show');
			$('#project-'+$(this).attr('data-id')).addClass('show');
		}
	});
	/**
	 * 删除楼盘分类
	 * @memberOf {TypeName} 
	 * @return {TypeName} 
	 */
	$('#menulist').on('click', '.del', function(){
		$.ajax({
			url: ctx + '/manage/application/property/type/delete.htm?id='+$(this).parent().parent().attr('data-id'),
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
	/**
	 * 添加楼盘
	 */
	$('#addProjectBtn').click(function(){
		$('#projectFormModal .modal-body').html('');
		$('#projectFormModal').modal('toggle');
		$('#projectFormModal .modal-body').load(ctx + '/manage/application/property/project/form.htm?type='+$('#menulist .on').attr('data-id')+'&_='+new Date().getTime());
	});
	/**
	 * 添加楼盘图片
	 * @memberOf {TypeName} 
	 */
	$('#projectFormModal').on('click', '.filebtnadd', function(){
		var id = new Date().getTime();
		var html = '<div class="row-fluid multifile">'
			     + '<input type="file" id="image_'+id+'" class="span9" name="project_image" data-for="image_'+id+'"/>'
		 		 + '<div class="input-append span9">'
			     +   '<span class="span12 fileholder" id="fileholder-image_'+id+'">请选择文件</span>'
			     +   '<span class="btn span2 filebtn action" id="filebtn-image_'+id+'">选择</span>'
			     +   '<span class="btn span2 action filebtnadd">添加</span>'
		    	 + '</div>'
	    		 + '</div>';
	    $(this).parent().parent().parent().append(html);
	    $(this).removeClass('filebtnadd').addClass('filebtnremove').html('移除');
	});
	/**
	 * 移除楼盘图片
	 * @memberOf {TypeName} 
	 */
	$('#projectFormModal').on('click', '.filebtnremove', function(){
		$(this).parent().parent().remove();
	});
	/**
	 * 保存楼盘数据
	 * @return {TypeName} 
	 */
	$('#projectFormModal .submit').click(function(){
		descriptionEditor.sync();
		peripheralEditor.sync();
		trafficEditor.sync();
		$('#projectFormModal form').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#projectFormModal').modal('toggle');
				var type = $('#type').val();
				$('#project-'+type).load(ctx + '/manage/application/property/projects/type.htm?type='+type+'&_='+new Date().getTime());
			}
		});
	});
	/**
	 * 点击已有楼盘弹出编辑表单
	 * @memberOf {TypeName} 
	 */
	$('#project-list').on('click', '.project .edit', function(){
		$('#projectFormModal .modal-body').html('');
		$('#projectFormModal').modal('toggle');
		$('#projectFormModal .modal-body').load(ctx + '/manage/application/property/project/form.htm?id='+$(this).parent().parent().parent().parent().attr('data-id')+'&_='+new Date().getTime());
	});
	/**
	 * 删除楼盘
	 */
	$('#project-list').on('click', '.project .remove', function(){
		$.ajax({
			url: ctx + '/manage/application/property/project/delete.htm?id='+$(this).parent().parent().parent().parent().attr('data-id'),
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				var type = $('#menulist .on').attr('data-id');
				$('#project-'+type).load(ctx + '/manage/application/property/projects/type.htm?type='+type+'&_='+new Date().getTime());
			}
		});
	});
	
	/**
	 * 保存户型信息
	 * @param {Object} marker
	 */
	$('#projectFormModal').on('click', '#houses .submit', function(){
		$('#houses form').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#houses tbody').load(ctx + '/manage/application/property/project/houses.htm?projectId='+$('#id').val()+'&_='+new Date().getTime());
				$('#houses form')[0].reset();
			}
		});
	});
	$('#projectFormModal').on('click', '#house-3d .submit', function(){
		$('#house-3d form').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#house-3d tbody').load('panorama/list.htm?house='+$('#panorama-house-id').val()+'&_='+new Date().getTime());
				$('#house-3d form')[0].reset();
			}
		});
	});
//	$('#projectFormModal').on('show', function(){
//		$('#projectName').focus();
//	});
	/**
	 * 编辑户型信息
	 * @param {Object} marker
	 */
	$('#projectFormModal').on('click', '#houses .edit', function(){
		var tds = $(this).parent().parent().parent().find('td');
		var id = $(this).parent().parent().parent().attr('data-id');
		$('#house-id').val(id);
		$('#houseName').val(tds[0].innerHTML);
		$('#houseArea').val(tds[1].innerHTML);
		$('#houseDescription').val(tds[2].innerHTML);
		$('#houseSort').val(tds[3].innerHTML);
	});
	$('#projectFormModal').on('click', '#houses .3dimage', function(){
		var id = $(this).parent().parent().parent().attr('data-id');
		$('#panorama-house-id').val(id);
		$('.nav-tabs #tab-3dimage').tab('show');
		$('#house-3d tbody').load('panorama/list.htm?house='+id+'&_='+new Date().getTime());
		$('.tab-pane.active').removeClass('active');
		$('#house-3d').addClass('active');
	});
	$('#projectFormModal').on('click', '#house-3d tbody .remove', function(){
		var id = $(this).parent().parent().parent().attr('data-id');
		$.ajax({
			url: 'panorama/delete.htm?id='+id,
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#house-3d tbody').load('panorama/list.htm?house='+$('#panorama-house-id').val()+'&_='+new Date().getTime());
			}
		});
	});
});