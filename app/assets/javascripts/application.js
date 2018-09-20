// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
<<<<<<< HEAD
//= require jquery
$(function() {
	$(document).on('click','.plus-btn',function(){
		$('body').toggleClass('menu-open');
	});
	$("document").ready(function(){
		$(".theTarget").skippr()
	});
});
=======
//= require_tree .

$(function() {
  $(".trigger").click(function() {
    $(".menu").toggleClass("active");
  });
});

>>>>>>> f729b241544b1856af008eb79c4ba6674a7f7356
