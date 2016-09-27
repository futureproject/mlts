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
//
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require froogaloop.min
//= require bootstrap_carousel
//= require underscore
//= require markerclusterer.min
//= require gmaps/google
//= require join_us
//= require social_links
//= require quote_carousel
//= require the_team
//= require video_grid
//= require upcoming_screenings

// Google analytics tracking with value
function ganalytics(cat){
  var label = $(cat).data('label');
  if ($(cat).attr('alt')) {
    var label = $(cat).attr('alt');
  }else if ( $(cat).attr('placeholder')){
    var label = $(cat).attr('placeholder');
  }else{
    var label = $(cat).html();
  }
  var category = $(cat).data('category');
  // ga('send', 'event', category, 'click', label);
}
