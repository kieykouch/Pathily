// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs


$(function() {

  $('#job_alert_tag2').click(function(){ 

  	console.log("fuck you");

	function validateEmail(email) {
	    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	}


	var value = $(".form-control")[5];
	var value2 = $(value).val();
	console.log(value);
	console.log(value2);

	if (value2 != "" && validateEmail(value2))
	{                                  
	    $('#job_alert_tag2').notify 
	    ("Summited the email", "success", { position:"right" });
	}
	else{
		$('#job_alert_tag2').notify 
	    ("Please check your email", "error", { position:"right" });
	}
	});
});

///= require bootstrap-sprockets
//= require bootstrap
//= require_tree .

//= require turbolinks