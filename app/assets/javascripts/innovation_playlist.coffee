$ ->
  $('.playlist-track').click ->
    $('.playlist-track').removeClass('selected')
    $(this).addClass('selected')

