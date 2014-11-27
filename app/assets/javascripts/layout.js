$(document).on('ready page:load', function () {
	$("#new_link").click(function(event){
		event.preventDefault();
		$("#login_form").show();
		$("#log_sign").hide()
	});

});
