var upcoming_screenings = function() {

  // Google spreadsheet as a CMS for Screenings
  // ID of the Google Spreadsheet
  var spreadsheetID = "1umoL078h5Y_LNz4iV6KK5Q06_0H-9PESDTYsU4axib8";

  // Make sure it is public or set to Anyone with link can view
  var url = "https://spreadsheets.google.com/feeds/list/" + spreadsheetID + "/od6/public/values?alt=json";

  $.getJSON(url, function(data) {

    var entry = data.feed.entry;
    var $screeningContainer = $('.screening-table tbody');

    $(entry).each(function(){

      var screeningUrl = this.gsx$screeningurl.$t;
      var isTourScreening = this.gsx$tourscreening.$t == "TRUE";
      if (isTourScreening) {
        var screeningRow = '<tr class="screening-row tour-screening-row" data-href="'+screeningUrl+'">';
      }
      else {
        var screeningRow = '<tr class="screening-row community-screening-row" data-href="'+screeningUrl+'">';
      }

      screeningRow += '<td data-label="Date" class="screening-date">'+this.gsx$screeningdate.$t+'</td>';
      screeningRow += '<td data-label="City" class="screening-location">'+this.gsx$screeninglocation.$t+'</td>';
      screeningRow += '<td data-label="Location" class="screening-name">'+this.gsx$screeningname.$t+'</td>';
      if (screeningUrl) {
        screeningRow += '<td class="icon icon-arrow-right-circle"></td>';
      }
      else {
        screeningRow += '<td class="icon"></td>';
      }

      $screeningContainer.append(screeningRow);
    });
  });

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

}

$(document).ready(upcoming_screenings);
$(window).bind('page:change', upcoming_screenings);
