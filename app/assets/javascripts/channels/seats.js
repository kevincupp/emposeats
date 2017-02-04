//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.seats = App.cable.subscriptions.create('SeatsChannel', {
	received: function(data) {
		$('.refresh').fadeOut("slow", function() {
			$('.refresh').html(data.markup).fadeIn("slow");
		});
	}
});
