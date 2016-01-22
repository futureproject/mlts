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
        screeningRow += '<td class="icon-disabled icon-arrow-right-circle"></td>';
      }

      $screeningContainer.append(screeningRow);
    });
    filterInit();
  });

  //Screening Filtering
  var tourSelected = false;
  var communitySelected = false;
  function filterInit() {
    queryString = window.location.href.split('#').pop();
    if (queryString == "communityscreenings") {
      communityFilter();
    }

    if (queryString == "tourscreenings") {
      tourFilter();
    }
  }

  function communityFilter() {
      $('.tour-screening-row').hide();
      $('.community-screening-row').show();
      communitySelected = true;
      tourSelected = false;
      $('#community-screenings-filter').addClass('community-selected');
      $('#tour-events-filter').removeClass('tour-selected');
      document.location.href = document.location.href.split(/[#?,]/)[0] + "#communityscreenings";
  }

  function tourFilter() {
      $('.tour-screening-row').show();
      $('.community-screening-row').hide();
      tourSelected = true;
      communitySelected = false;
      $('#tour-events-filter').addClass('tour-selected');
      $('#community-screenings-filter').removeClass('community-selected');
      document.location.href = document.location.href.split(/[#?,]/)[0] + "#tourscreenings"
  }

  function removeFilter() {
      $('.screening-row').show();
      tourSelected = false;
      communitySelected = false;
      document.location.hash = '#screenings';
  }

  $('#tour-events-filter').click(function() {
    if (tourSelected) {
      removeFilter();
      $(this).removeClass('tour-selected');
    }
    else {
      // filter to only show tour events
      tourFilter();
    }

  });

  $('#community-screenings-filter').click(function() {
    if (communitySelected) {
      removeFilter();
      $(this).removeClass('community-selected');
    }

    else {
      // filter to only show community screenings
      communityFilter();
    }
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
