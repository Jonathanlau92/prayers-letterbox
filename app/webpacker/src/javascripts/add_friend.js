$( document ).on('ajax:complete', function(event, data, status, xhr) {
	// Add-friend id 
	$("#" + event.target.id).addClass('d-none');
	// request-sent id
  $("#" + event.target.id).next().removeClass('d-none');
});
