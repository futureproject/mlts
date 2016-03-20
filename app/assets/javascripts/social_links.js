var social_links = function() {

  // Copy Container social icons
  $('.facebook-copy-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.wrapper').find('h2').html(),
      img = $this.data('poster');
      facebookShare(fact, img);
  });

  $('.twitter-grid-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.grid-text-container').find('p').html(),
      factGrab = fact.substring(0, 85);
      twitterShare(factGrab);
  });

  // Video Grid social icons
  $('.facebook-grid-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.grid-text-container').find('p').html(),
      img = 'mobile-header-background.jpg';
      facebookShare(fact, img);
  });

  $('.twitter-copy-share').on('click', function(){
      var $this = $(this),
      fact = $this.parents('.wrapper').find('h2').html(),
      factGrab = fact.substring(0, 85);
      twitterShare(factGrab);
  });

  // Helper Functions:

  // Twitter share functionality:
  window.twttr=(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],t=window.twttr||{};if(d.getElementById(id))return;js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);t._e=[];t.ready=function(f){t._e.push(f);};return t;}(document,"script","twitter-wjs"));

  // Check if there are any disallowed characters in the string then replace with the UTF-8 encoding of the character
  function characterCheck(text){
    var regex = /[^\w\-]/;

    if(regex.test(text) == true) {
      return encodeURIComponent(text);
    }else{
      return text;
    }
  }

  function twitterShare(text){

      var fact = characterCheck(text);

      var url = window.location.href,
          hashtag = encodeURIComponent('#mltsfilm'),
          textLink = '&text="' + fact + '..." ' + hashtag,
          urlLink = '?url=' + encodeURIComponent(url),
          link = 'https://twitter.com/intent/tweet' + urlLink + textLink;

      window.open(link, '_blank', 'width=600, height=250, resizable,scrollbars=yes');
  }

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
}

$(document).ready(social_links);
$(window).bind('page:change', social_links);
