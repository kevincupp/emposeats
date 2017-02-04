// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	/*$('#modal_window').fadeIn('slow');*/
	/*$('#graph24').visualize({type: 'area', });*/
	// $('.refresh').load('php/seatsajax.php');
	$("tr:even").addClass("even");
	$("tr:odd").addClass("odd");
	$("tr:first").removeClass("even");
	$('input.clear-default').clickClear();
	$('#submitComment').attr('disabled', 'disabled');
});

function toggle(div) {
	if ($(div).is(':visible')) {
	    $(div).slideUp('slow');
	} else {
	    $(div).fadeIn('slow');
	}
}

/*var refreshId = setInterval(function()
{
	$('.refresh').fadeOut("slow")
	$('.refresh').delay(1000, function(){
		$('.refresh').load('php/seatsajax.php').fadeIn("slow");
	});
}, 60000);*/

function hidegraphs() {
	$("div[id^='graph']").hide();
}

function showMinutes() {
	hidegraphs();
	$('#graph-minutes').fadeIn('slow');
	$('#minutes').addClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showHours() {
	hidegraphs();
	$('#graph-hours').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').addClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showDays() {
	hidegraphs();
	$('#graph-days').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').addClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function show24hr() {
	hidegraphs();
	$('#graph-24hr').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').addClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showMinutes_pred() {
	hidegraphs();
	$('#graph-minutes-pred').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').addClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showHours_pred() {
	hidegraphs();
	$('#graph-hours-pred').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').addClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showDays_pred() {
	hidegraphs();
	$('#graph-days-pred').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').addClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	return false;
}

function show24hr_pred() {
	hidegraphs();
	$('#graph-24hr-pred').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').addClass('active');
	$('#finals').removeClass('active');
	return false;
}

function showFinals() {
	hidegraphs();
	$('#graph-finals').fadeIn('slow');
	/*$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').addClass('active');*/
	$('#graph-links').fadeOut('slow');
	$('#finals-links').fadeIn('slow');
	return false;
}

function showFinal(day) {
	hidegraphs();
	if (day == "all") {
		$('#graph-finals').show();
	}
	else {
		$('#graph-finals-' + day).show();
	}
	/*$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').removeClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').addClass('active');*/
	return false;
}

function backToGraphs() {
	hidegraphs();
	$('#graph-24hr').fadeIn('slow');
	$('#minutes').removeClass('active');
	$('#hours').removeClass('active');
	$('#days').removeClass('active');
	$('#24hr').addClass('active');
	$('#minutes_pred').removeClass('active');
	$('#hours_pred').removeClass('active');
	$('#days_pred').removeClass('active');
	$('#24hr_pred').removeClass('active');
	$('#finals').removeClass('active');
	$('#finals-links').fadeOut('slow');
	$('#graph-links').fadeIn('slow');
	return false;
}

/**
 * Clears a text form element when it has the style 'clear-default'
 */
$.fn.clickClear = function() {
	return this.each(function() {
		this.defaultValue = $(this).val();
		$(this).click(function() {
			if ($(this).val() == this.defaultValue) {
				$(this).val('');
				$(this).addClass('active');
				$('#submitComment').removeClass('disabled');
				$('#submitComment').removeAttr('disabled');
			};
		}).focus(function() {
			if ($(this).val() == this.defaultValue) {
				$(this).val('');
				$(this).addClass('active');
				$('#submitComment').removeClass('disabled');
				$('#submitComment').removeAttr('disabled');
			};
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val(this.defaultValue);
				$(this).removeClass('active');
				$('#submitComment').addClass('disabled');
				$('#submitComment').attr('disabled', 'disabled');
			};
		});

		$('form').submit(function(event) {
			if ($(this).val() == this.defaultValue) {
				$(this).val('');
				$(this).removeClass('active');
				$('#submitComment').addClass('disabled');
				$('#submitComment').attr('disabled', 'disabled');
			};
		});
	});
};


function sendComment() {
  comment = $("#comment .textfield").val();
  $.ajax({
    url: "email.php",
    data: "comment=" + comment,
    type: "POST",
    success: function(msg) {
      //alert(msg);
	  $('div.comments').hide();
	  $('div.clear').hide();
	  $('div#thankyou').show()
	    .animate({opacity: 1.0}, 3000)
	    .slideUp('slow');
    },
    error: function() {
      //alert("An error occurred while trying to submit your comment");
    }
  });
}
