var landing_page = function() {
  $('.navbar').addClass('transparent');

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
$(document).ready(landing_page);

