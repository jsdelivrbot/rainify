// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

function checkForRain(){
	if($("#rainify_check")[0].checked){
		$('body').css("background-image", "url(rain.png)")
		$("#rain_status").html("Your site will have rain.")
	}else{
		$('body').css("background-image", "none")
		$("#rain_status").html("Your site will not have rain.")
	}
}

$(document).ready(function(){
	checkForRain();
	$("body").height($(document).height())
	$("#rainify_check").click(function(){
	checkForRain();
		$.ajax({
			method: "POST",
			url: '/shops/'+ this.value+ '/toggle',
			data: {"rainify": this.checked}
		})
	})
})

