quote_carousel_init = ->
  $('.carousel-control').css('display', 'block')
  $('#hero-quote-carousel').carousel({
    interval: 5000
  })
  return false

$ -> quote_carousel_init()
$(window).bind('page:change', quote_carousel_init)
