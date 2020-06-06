$( document ).on('turbolinks:load', function() {
  var token = $('meta[name=csrf-token]').attr('content');
  $("input.add-friend").click(function(e) {
   	console.log("Clicked!", $(this).data('user-id'));
   	$.post("/users/" + $(this).data('user-id') + "/add_friends", function(){
      authenticity_token: token
   	}).done(function(result){
   		console.log("what is result: ", result);
   		const path = result["link"];
   		Turbolinks.visit(path);
   	})
  });
});
