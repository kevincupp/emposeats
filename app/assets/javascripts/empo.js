$(document).ready(function() {
	$('tr:even').addClass('even');
	$('tr:odd').addClass('odd');
	$('tr:first').removeClass('even');
	$('#submitComment').attr('disabled', 'disabled');

	$('#graph-links li a').click(function(e) {
		e.preventDefault();

		var graph = $(this).data('graph');

		$('div[id^="graph"]').hide();
		$('#graph-'+graph).show();

		$('#graph-links li').removeClass('active');
		$(this).closest('li').addClass('active');
	})
});
