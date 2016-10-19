$(document).ready(function() {
  var nav = responsiveNav("#main-nav");
  var toggle = document.getElementById("mobile-nav-toggle");
  toggle.addEventListener("click", function (e) {
    e.preventDefault();
    nav.toggle();
  }, false);
});
