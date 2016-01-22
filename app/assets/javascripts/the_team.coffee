the_team_listeners = ->
  $('.team-member').click ->
    $('.team-member').removeClass('selected')
    $(this).addClass('selected')

$ -> the_team_listeners()
$(window).bind('page:change', the_team_listeners)
