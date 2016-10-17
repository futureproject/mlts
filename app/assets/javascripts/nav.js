$(document).ready(function() {

  $('#nav-expand-icon').click(function() {
      var x = document.getElementById("home-main-nav");
      if (x.className === "main-nav-list") {
          x.className += " responsive";
      } else {
          x.className = "main-nav-list";
      }
  });
});
