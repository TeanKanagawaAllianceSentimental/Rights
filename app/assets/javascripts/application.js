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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


/*ハンバーガーメニューJS*/
/*水平ラインJS*/
$(function() {
    $(document).on('click', ".trigger", function() {
        $(".menu").toggleClass("active");
    });

    $("document").ready(function(){
        $(".theTarget").skippr();
    });

    winW = $(window).width();
    $('#horizon1').css('left', winW/2);
    speed = 2500;
    $(window).scroll(function() {
        if ($(this).scrollTop() >= 500 && $(this).scrollTop() <= 550) {
            if($(".horizon1").is(":animated")){
        return false;
        } else {
                if ($('#horizon1').width() == 0) {
                    $('#horizon1').animate({
                        left: 0,
                        width: winW
                    }, speed);
                }
            }
        } else {
            if($("#horizon1").is(":animated")){
        return false;
        } else {
                if ($('#horizon1').width() == winW) {
                    $('#horizon1').animate({
                        left: winW/2,
                        width: 0
                    }, speed);
                }
            }
        }
    });

    $(document).on('click', "#leftside-navigation .sub-menu > a", function(){
        $("#leftside-navigation ul ul").slideUp(),
        $(this).next().is(":visible") || $(this).next().slideDown(),
        e.stopPropagation()
    })
});

