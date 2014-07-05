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
});