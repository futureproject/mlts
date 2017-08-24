var video_grid = function() {

  // Hash link for trailer overlay
  if (window.location.hash == "#trailer") {
    loadTrailer();
  }

  function loadTrailer() {
    var $this = $('.play-trailer'),
        videoID = $this.data('id'),
        iframeLink = '<iframe class="vimeo-trailer" id="trailerplayer" width="600" height="350" src="https://player.vimeo.com/video/' + videoID + '?autoplay=1&api=1&player_id=trailerplayer" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>' ;
    $('.trailer-video-container').append(iframeLink);
    var iframe = 'trailerplayer';
    var player = $f(iframe);
    $('html').addClass('trailer-open');
    $('.trailer-video-container').fadeIn(1000);
  }

  // Trailer play button
  $('.play-trailer').on('click', loadTrailer);

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


  //Random poster background
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
