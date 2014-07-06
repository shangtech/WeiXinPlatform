$(document).ready(function(){
	$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
	$('.template').click(function(){
		if(!$(this).hasClass('selected')){
			$('.template.selected').removeClass('selected');
			$(this).addClass('selected');
			var id = $(this).attr('data-id');
			$('#tempId').val(id);
			$('#custom').html('').load(ctx + '/manage/application/appointment/template/form.htm?id='+id+'&_='+new Date().getTime());
		}
	});
	$('#appointmentForm .submit').click(function(){
		if(!$('#tempId').val()){
			alert('请先选择页面模板');
			return;
		}
		$('#appointmentForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				alert(result.msg);
				if(result.success){
					document.location.href = ctx + '/manage/application/appointment/list.htm';
				}
			}
		});
	});
});