// function initMap() {
  // map = new google.maps.Map(document.getElementById('map'), {
    // center: {lat: -34.397, lng: 150.644},
    // zoom: 8
  // });
  // $('#map').on('shown', function () {
    // google.maps.event.trigger(map, 'resize');
    // map.setCenter(new google.maps.LatLng(42.3605336, -72.6362989));
  // })
// }

var upcoming_screenings = function() {

  // Google spreadsheet as a CMS for Screenings
  // ID of the Google Spreadsheet
  var spreadsheetID = "1umoL078h5Y_LNz4iV6KK5Q06_0H-9PESDTYsU4axib8";

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

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": 0,
        "lng": 0,
        "picture": {
          "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
          "width":  32,
          "height": 32
        },
        "infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}

$(document).ready(upcoming_screenings);
