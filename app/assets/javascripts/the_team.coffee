$ ->
  $('.team-member').click ->
    $('.team-member').removeClass('selected')
    $(this).addClass('selected')
