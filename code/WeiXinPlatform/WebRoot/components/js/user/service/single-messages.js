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
				$('#appmsgItem .i-img').attr('src', ctx + '/' + result.msg).show();
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
			editor.sync();
			$('#messageForm').ajaxSubmit({
				dataType: 'json',
				success: function(result){
					alert(result.msg);
					if(!result.success){
						return;
					}
					document.location.href = ctx + '/manage/service/messages.htm';
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