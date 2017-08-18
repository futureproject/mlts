var upcoming_screenings = function() {

  // Table Links
  $('#screenings').on('click', '*[data-href]', function(){
    if ($(this).data('href') != "") {
      window.open($(this).data('href'), '_blank');
    }
    return false;
  });

  // Hero button event
  $('.screening-item').on('click', function(e) {

      var $link = $(this).find('a');
      $link.click();
  });

  // Hide labels and auto-select mailing list subscription checkbox in "Host a Screening" form
  $(".fsLabel").hide();
  $("#field36965597_1").click();

  // Listeners for "Host a Screening" form field animation
  $(".fsField").on('focus', function() {
    $(this).parent().find(".fsLabel").css( "display", "block");
  });

  $(".fsField").on('blur', function() {
    $(this).parent().find(".fsLabel").hide();
  });

  // fade in .navbar
  $(function () {
      $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
              $('.navbar').removeClass('transparent');
          } else {
              $('.navbar').addClass('transparent');
          }
      });
  });

}
$(document).ready(upcoming_screenings);
