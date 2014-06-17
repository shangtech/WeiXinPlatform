$.extend($.validator.defaults, {
		ignore: "",
		errorElement: 'span',
		errorClass: "help-inline",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			//$(element).parents('.control-group').addClass('success');
		}
});