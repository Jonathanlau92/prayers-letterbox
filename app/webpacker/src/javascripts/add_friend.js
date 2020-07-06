$( document ).on('ajax:complete', '#add-friend', function(event, data, status, xhr) {
	console.log("HELLO")
  $("#add-friend").addClass('d-none');
  $("#request-sent").removeClass('d-none');
});
