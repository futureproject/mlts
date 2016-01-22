$(document).ready(function() {
  //Random Videos on load
  var videoArray =
  [
      ['116808028', 'robinson1.jpg', 'Sir Ken Robinson' , 'Author, speaker and international advisor on education' ],
      ['116807992', 'robinson2.jpg', 'Sir Ken Robinson' , 'Author, speaker and international advisor on education'],
      ['116807934', 'friedman.jpg', 'Thomas Friedman', 'American journalist, columnist and author'],
      ['116810316', 'silverstein.jpg', 'Jed Silverstein', 'English & Philosophy teacher at Riverdale Country School'],
      ['116809426', 'khan.jpg', 'Sal Khan', 'Founder of Khan Academy'],
      ['116809099', 'mazur.jpg', 'Eric Mazur', 'Physicist and educator at Harvard University'],
      ['116808046', 'macafee.jpg', 'Andrew MacAfee', 'Associate director of the Center for Digital Business at the MIT Sloan School of Management'],
      ['117011883', 'wagner.jpg', 'Tony Wagner', 'Expert In Residence at Harvard University’s new Innovation Lab'],
      ['117016471', 'bruett.jpg', 'Karen Bruett', 'Special Advisor for EdLeader21'],
      ['117058811', 'zhao.jpg', 'Yong Zhao', 'Presidential Chair at the University of Oregon'],
      ['117058806', 'hrabowski.jpg', 'Freeman Hrabowski', 'President of the University of Maryland, Baltimore County'],
      ['117059210', 'dintersmith.jpg' , 'Ted Dintersmith', 'Venture capitalist focused on education issues']
  ];

  var videoResult = shuffleArray(videoArray);
  var video1, video2, video3, video4, video5;

  $('.grid-1').css('background-image', 'url(../images/sundance-recap.jpg)');
  $('.grid-3').css('background-image', 'url(../images/hammond.jpg)');
  $('.grid-9').css('background-image', 'url(../images/'+ videoResult[3][1] + ')');
  $('.grid-7').css('background-image', 'url(../images/'+ videoResult[4][1] + ')');
  $('.grid-11').css('background-image', 'url(../images/'+ videoResult[2][1] + ')');

  $(".video2").data('id', 120585562);
  $(".video3").data('id', 116810306);
  $(".video4").data('id', videoResult[3][0]);
  $(".video5").data('id', videoResult[4][0]);
  $(".video6").data('id', videoResult[2][0]);

  $('.grid-9 .video-name').html(videoResult[3][2]);
  $('.grid-7 .video-name').html(videoResult[4][2]);
  $('.grid-11 .video-name').html(videoResult[2][2]);

  $('.grid-9 .video-descript').html(videoResult[3][3]);
  $('.grid-7 .video-descript').html(videoResult[4][3]);
  $('.grid-11 .video-descript').html(videoResult[2][3]);

  //Random Videos on load
  var quotePosterArray = ['mltsposter1.png','mltsposter2.png','mltsposter3.png','mltsposter4.png'];
  var quotePosterArrayRandom = shuffleArray(quotePosterArray);

  $('.grid-5').css('background-image', 'url(../images/'+ quotePosterArrayRandom[0] + ')');
  $('.facebook-poster-share').data('poster', quotePosterArrayRandom[0]);


  // Google analytics for Grid Videos
  function ganalyticsGridVideo(cat){
    var category = $(cat).data('category');
    var videoName = $(cat).find('.video-name').html();
    var videoId = $(cat).parents('.grid-item').data('id');
    var label = videoName + " - " + videoId;

    ga('send', 'event', category, 'click', label);
  }

  // Google analytics for Grid Quotes
  function ganalyticsGridQuote(cat){
    var category = $(cat).data('category');
    var label = $(cat).parents('.grid-text-center').find('.grid-text-copy').html();

    ga('send', 'event', category, 'click', label);
  }


  // Twitter Share Link function
  function twitterShare(text){

      var fact = characterCheck(text);

      var url = window.location.href,
          hashtag = encodeURIComponent('#mltsfilm'),
          textLink = '&text="' + fact + '..." ' + hashtag,
          urlLink = '?url=' + encodeURIComponent(url),
          link = 'https://twitter.com/intent/tweet' + urlLink + textLink;

      window.open(link, '_blank', 'width=600, height=250, resizable,scrollbars=yes');
  }

  // Facebook Share Link function
  function facebookShare(text, img){

      var fact = characterCheck(text);

      var url = 'http://www.mltsfilm.org/',
          imageurl = window.location.origin + '/images/' + img,
          picture = '&picture=' + encodeURIComponent(imageurl),
          redirect = encodeURIComponent(url),
          urlLink = '&link=' + encodeURIComponent(url),
          hashtag = encodeURIComponent('#mltsfilm'),
          caption = '&caption=MLTS',
          redirectUrl = '&redirect_uri=' + redirect,
          description = '&description=' + hashtag,
          name = '&name="' + fact + '" ' + hashtag,
          link = 'https://www.facebook.com/dialog/feed?app_id=573229176144322&display=popup' + picture + redirectUrl + urlLink + caption + description + name;
      window.open(link, '_blank', 'width=600, height=250, resizable,scrollbars=yes');
  }

  // When Twitter share icon is clicked in the grid
  $('.twitter-grid-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.grid-text-container').find('p').html(),
      factGrab = fact.substring(0, 85);
      twitterShare(factGrab);
  });

  // When Twitter share icon is clicked in the copy container
  $('.twitter-copy-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.wrapper').find('h2').html(),
      factGrab = fact.substring(0, 85);
      twitterShare(factGrab);
  });

  // When fb share icon is clicked in the grid
  $('.facebook-grid-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.grid-text-container').find('p'),
      factGrab = fact.html(),
      img = 'mobile-header-background.jpg';
      facebookShare(factGrab, img);
  });

  // Helper functions:

  // Check if there are any disallowed characters in the string then replace with the UTF-8 encoding of the character
  function characterCheck(text){
    var regex = /[^\w\-]/;

    if(regex.test(text) == true) {
      return encodeURIComponent(text);
    }else{
      return text;
    }
  }

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


});
