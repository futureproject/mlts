$ ->
  $('.playlist-track').click ->
    $('.playlist-track').removeClass('selected')
    $(this).addClass('selected')

  $('.playlist-tab').click ->
    $('.playlist-tab').removeClass('selected')
    $(this).addClass('selected')

  $('.playlist-tab-watch').click ->
    $('.playlist-content').hide()
    $('.playlist-content-watch').show()

  $('.playlist-tab-listen').click ->
    $('.playlist-content').hide()
    $('.playlist-content-listen').show()

  $('.playlist-tab-act').click ->
    $('.playlist-content').hide()
    $('.playlist-content-act').show()
