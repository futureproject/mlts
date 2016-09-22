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

  handler = Gmaps.build('Google', { markers: { clusterer: undefined  }});
  handler.buildMap({ provider: {minZoom: 3}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(markers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}

$(document).ready(upcoming_screenings);
