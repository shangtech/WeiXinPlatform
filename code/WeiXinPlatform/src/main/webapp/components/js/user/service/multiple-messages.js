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
	var current = $('#appmsgItem_1');
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
				//$('#fileholder-image').html(result.msg);
				current.find('.i-img').attr('src', ctx + '/' + result.msg).show();
				current.find('input[name^="image_"]').val(result.msg);
				current.find('input[name^="local_"]').val($('#fileholder-image').html());
			}
		});
	});
	$('#title').keyup(function(){
		current.find('.i-title').html($(this).val());
		current.find('input[name^="title_"]').val($(this).val());
	});
	$('#title').change(function(){
		$('#appmsgItem .i-title').html($(this).val());
	});
	$('#summary').change(function(){
		$('#appmsgItem .msg-text').html($(this).val());
	});
	$(".appmsgItem").live({
		mouseover : function() {
	        $(this).addClass("sub-msg-opr-show");
	    },
	    mouseout : function() {
	        $(this).removeClass("sub-msg-opr-show");
	    }
	});
	$('.edit-icon').live('click', function(){
		if(current.attr('id') == $(this).parent().parent().parent().attr('id')
				|| current.attr('id') == $(this).parent().parent().parent().parent().attr('id'))
			return;
		editor.sync();
		current.find('input[name^="content_"]').val($('#content').val());
		current = $(this).parent().parent().parent();
		if(!current.hasClass('appmsgItem')){
			current = current.parent();
			$(".msg-edit-area .a-out").css("top", "43px");
			$(".msg-edit-area .a-in").css("top", "44px");
		}else{
			//计算当前是第几个
			var msgs = $('.appmsgItem');
			var h = 0;
			for(var i = 0; i < msgs.length; i++){
				if($(msgs[i]).attr('id') == current.attr('id'))
					break;
				h += $(msgs[i]).outerHeight();
			}
			h += current.outerHeight()/2;
			$(".msg-edit-area .a-out").css("top", h + "px");
			$(".msg-edit-area .a-in").css("top", (h+1) + "px");
		}
		loadMessage();
	});
	function loadMessage(){
		$('#title').val(current.find('input[name^="title_"]').val());
		$('#image')[0].outerHTML = $('#image')[0].outerHTML;
		$('#fileholder-image').html(current.find('input[name^="local_"]').val());
		//$('#content').val(current.find('input[name^="content_"]').val());
		editor.html(current.find('input[name^="content_"]').val() || '');
	}
	$('.del-icon').live('click', function(){
		if($('.appmsgItem').length < 3){
			alert('至少两条消息');
			return;
		}
		$(this).parent().parent().parent().remove();
	});
	//添加副图文消息
	$(".sub-add").on("click",function(){
		var len = $('.appmsgItem').length;
		if(len >= 8){
			alert('您最多可以加入8条图文消息');
			return;
		}else{
			var id = new Date().getTime();
			var subItemDiv = '<div class="rel sub-msg-item appmsgItem" id="appmsgItem-'+id+'" data-id="'+id+'">'
				+ '<span class="thumb">'
				+ '<span class="default-tip" style="">缩略图</span>'
				+ '<img src="" class="i-img" style="display:none;margin-top:-72px;">'
				+ '<input type="hidden" name="image_'+id+'"/>'
				+ '<input type="hidden" name="local_'+id+'"/>'
				+ '</span><h4 class="msg-t">'
				+ '<span class="i-title"></span></h4>'
				+ '<input type="hidden" name="title_'+id+'"/><input type="hidden" name="cotent_'+id+'"/>'
				+ '<ul class="abs tc sub-msg-opr"><li class="b-dib sub-msg-opr-item">'
				+ '<a href="#;" class="th icon18 edit-icon opr-icon" data-rid="">编辑</a>'
				+ '</li><li class="b-dib sub-msg-opr-item">'
				+ '<a href="#;" class="th icon18 del-icon opr-icon" data-rid="">删除</a></li></ul></div>';
			$(subItemDiv).insertBefore($(".sub-add"));
		}
	});
	$('#saveBtn').click(function(){
		var msgs = $('.appmsgItem');
		var ids = '';
		for(var i = 0; i < msgs.length; i++){
			var msg = $(msgs[i]);
			if(!msg.find('input[name^="title_"]').val() || !msg.find('input[name^="image_"]').val()){
				msg.find('.edit-icon').trigger('click');
				invalid(msg);
				return;
			}
			ids += msg.attr('data-id')+',';
		}
		ids = ids.substring(0, ids.length);
		$('#ids').val(ids);
		$('#multiMsgForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				document.location.href = ctx + '/manage/service/messages.htm';
			}
		});
	});
	function invalid(msg){
		msg.find('.edit-icon').trigger('click');
		$('#messageForm').valid();
	}
});
KindEditor.ready(function(K){
	editor = K.create('#content', {
		width:666,
		height:870,
		afterBlur: function(){
			this.sync();
		}
	});
});