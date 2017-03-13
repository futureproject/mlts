var video_grid = function() {

  // Trailer play button
  $('.no-touch .play-trailer').on('click', function(){
      var $this = $(this),
          videoID = $this.data('id'),
          iframeLink = '<iframe class="vimeo-trailer" id="trailerplayer" width="600" height="350" src="https://player.vimeo.com/video/' + videoID + '?api=1&player_id=trailerplayer" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>' ;
      $('.trailer-video-container').append(iframeLink);
      var iframe = 'trailerplayer';
      var player = $f(iframe);
      $('html').addClass('trailer-open');
      $('.trailer-video-container').fadeIn(1000);
  });

  // Trailer play button (touch)
  $('.touch .play-trailer').on('click', function(){
      var $this = $(this),
          videoID = $this.data('id'),
          iframeLink = '<iframe class="vimeo-trailer" id="trailerplayer" width="600" height="350" src="https://player.vimeo.com/video/' + videoID + '?api=1&player_id=trailerplayer" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>' ;
      $('.trailer-video-container').append(iframeLink);
      var iframe = 'trailerplayer';
      var player = $f(iframe);
      $('html').addClass('trailer-open');
      $('.trailer-video-container').fadeIn(1000);
  });

  // Trailer close
  $('.trailer-close').on('click',function(){
      var iframe = 'trailerplayer';
      var player = $f(iframe);
      player.api('pause');
      $('.trailer-video-container').fadeOut(1000, function(){
          $('#trailerplayer').remove('iframe');
      });
      $('html').removeClass('trailer-open');
  });

  // Commented out for temporary "quick fix" to remove quotes from video grid.
  //Random Videos on load
  // var videoArray =
  // [
      // ['116808028', 'robinson1.jpg', 'Sir Ken Robinson' , 'Author, speaker and international advisor on education' ],
      // ['116807992', 'robinson2.jpg', 'Sir Ken Robinson' , 'Author, speaker and international advisor on education'],
      // ['116807934', 'friedman.jpg', 'Thomas Friedman', 'American journalist, columnist and author'],
      // ['116810316', 'silverstein.jpg', 'Jed Silverstein', 'English & Philosophy teacher at Riverdale Country School'],
      // ['116809426', 'khan.jpg', 'Sal Khan', 'Founder of Khan Academy'],
      // ['116809099', 'mazur.jpg', 'Eric Mazur', 'Physicist and educator at Harvard University'],
      // ['116808046', 'macafee.jpg', 'Andrew MacAfee', 'Associate director of the Center for Digital Business at the MIT Sloan School of Management'],
      // ['117011883', 'wagner.jpg', 'Tony Wagner', 'Expert In Residence at Harvard University’s new Innovation Lab'],
      // ['117016471', 'bruett.jpg', 'Karen Bruett', 'Special Advisor for EdLeader21'],
      // ['117058811', 'zhao.jpg', 'Yong Zhao', 'Presidential Chair at the University of Oregon'],
      // ['117058806', 'hrabowski.jpg', 'Freeman Hrabowski', 'President of the University of Maryland, Baltimore County'],
      // ['117059210', 'dintersmith.jpg' , 'Ted Dintersmith', 'Venture capitalist focused on education issues']
  // ];

  var video1, video2, video3, video4, video5;

  $('.grid-1').css('background-image', 'url(../images/sundance-recap.jpg)');
  $('.grid-3').css('background-image', 'url(../images/hammond.jpg)');
  $('.grid-9').css('background-image', 'url(../images/bruett.jpg)');
  $('.grid-7').css('background-image', 'url(../images/dintersmith.jpg)');
  $('.grid-11').css('background-image', 'url(../images/hrabowski.jpg)');

  $(".video2").data('id', 120585562);
  $(".video3").data('id', 116810306);
  $(".video4").data('id', 117016471);
  $(".video5").data('id', 117059210);
  $(".video6").data('id', 117058806);


  //Random Videos on load
  var quotePosterArray = ['mltsposter1.png','mltsposter2.png','mltsposter3.png','mltsposter4.png'];
  var quotePosterArrayRandom = shuffleArray(quotePosterArray);

  $('.grid-5').css('background-image', 'url(../images/'+ quotePosterArrayRandom[0] + ')');
  $('.facebook-poster-share').data('poster', quotePosterArrayRandom[0]);

  // Will store the scrolltop position of div when play is clicked
  var videoTop;

  // Scrolls to scrolltop position on click
  function mobileScrollOnClose(){
      $(".touch body").animate({
              scrollTop: videoTop
          }, 100);
      return false;
  }

  // Desktop grid Video Close
  $('.no-touch .close').on('click',function(){
      var iframe = 'player';
      var player = $f(iframe);
      player.api('pause');
      $('.grid-video-container').fadeOut(1000, function(){
          $('#player').remove('iframe');
      });
      $('html').removeClass('video-open');
  });

  // Mobile grid video close, calls mobileScrollOnClose() function
  $('.touch .close').on('click',function(){
      var iframe = 'player';
      var player = $f(iframe);
      player.api('pause');
      $('.grid-video-container').fadeOut(1000, function(){
          $('#player').remove('iframe');
      });
      $('html').removeClass('video-open');
      mobileScrollOnClose();
  });

  // grid desktop play buttons
  $('.no-touch .grid-play-video').click(function() {
      var $this = $(this),
          videoID = $this.data('id'),
          iframeLink = '<iframe class="vimeo-video" id="player" width="600" height="350" src="https://player.vimeo.com/video/' + videoID + '?api=1&player_id=player" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>' ;
      videoTop = $this.offset().top;
      $('.grid-video-container').append(iframeLink);
      var iframe = 'player';
      var player = $f(iframe);
      $('html').addClass('video-open');
      $('.grid-video-container').fadeIn(1000);
      $('.trailer-video-container').fadeOut(1000, function(){
          $('#trailerplayer').remove('iframe');
      });
  });

  // grid mobile play buttons
  $('.touch .grid-play-video').click(function() {
      var $this = $(this),
          videoID = $this.data('id'),
          iframeLink = '<iframe class="vimeo-video" id="player" width="600" height="350" src="https://player.vimeo.com/video/' + videoID + '?api=1&player_id=player" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>' ;
      videoTop = $this.offset().top;
      $('.grid-video-container').append(iframeLink);
      var iframe = 'player';
      var player = $f(iframe);
      $('.grid-video-container').fadeIn(1000, function(){
          $(".touch body").animate({
              scrollTop: 0
          }, 100, function(){
              $('html').addClass('video-open');
          });
      });
      $('.trailer-video-container').fadeOut(1000, function(){
          $('#trailerplayer').remove('iframe');
      });
  });

  // Google analytics for Grid Videos
  function ganalyticsGridVideo(cat){
    var category = $(cat).data('category');
    var videoName = $(cat).find('.video-name').html();
    var videoId = $(cat).parents('.grid-item').data('id');
    var label = videoName + " - " + videoId;

    // ga('send', 'event', category, 'click', label);
  }

  // Google analytics for Grid Quotes
  function ganalyticsGridQuote(cat){
    var category = $(cat).data('category');
    var label = $(cat).parents('.grid-text-center').find('.grid-text-copy').html();

    // ga('send', 'event', category, 'click', label);
  }

  $('.grid-item-container').click(function() {
    ganalyticsGridVideo(this);
  });

  $('.social-icon-items').click(function(){
    ganalyticsGridQuote(this)
  });


  // Helper functions:

  // Randomize order of array
  function shuffleArray(array) {
      for (var i = array.length - 1; i > 0; i--) {
          var j = Math.floor(Math.random() * (i + 1));
          var temp = array[i];
          array[i] = array[j];
          array[j] = temp;
      }
      return array;
  }
}

$(document).ready(video_grid);
