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