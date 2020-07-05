$( document ).on('ajax:complete', '#add-friend', function(event, data, status, xhr) {
  $("#add-friend").addClass('d-none');
  $("#request-sent").removeClass('d-none');
});
