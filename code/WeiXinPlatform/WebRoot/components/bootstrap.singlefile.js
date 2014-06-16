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
});