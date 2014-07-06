$(document).ready(function(){
	//alert($('body input type["file"]').length);
	$('body').on({
		mouseover: function(){
			var id = $(this).attr('id');
			$('#filebtn-'+id).addClass('hover');
		},
		mouseout: function(){
			var id = $(this).attr('id');
			$('#filebtn-'+id).removeClass('hover');
		},
		mousedown: function(){
			var id = $(this).attr('id');
			$('#filebtn-'+id).addClass('active');
		},
		mouseup: function(){
			var id = $(this).attr('id');
			$('#filebtn-'+id).removeClass('active');
		},
		change: function(){
			var id = $(this).attr('data-for');
			$('#fileholder-'+id).html($(this).val());
		}
	}, 'input[type="file"]');
	$('body').on('change', '.auto-upload', function(){
		var id=$(this).attr('id'), temp = $(this).clone(), next = this.nextSibling;
		$('#imageForm').html('').append($(this).attr('id', '').attr('name', 'image'));
		temp.insertBefore($(next));
		$('#imageForm').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				$('#fileholder-'+id).html(result.msg);
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#'+id+'_hidden').val(result.msg);
			}
		});
	});
});