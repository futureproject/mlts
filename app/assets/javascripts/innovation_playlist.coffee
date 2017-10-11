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

  # Temporary solution to disappearing album art
  $('.playlist-tab-listen').one('click', ->
    $('#bandcamp-iframe').attr('src', $('#bandcamp-iframe').attr('src'))
  )

  $('.playlist-tab-listen').click ->
    $('.playlist-content').hide()
    $('.playlist-content-listen').show()


  $('.playlist-tab-act').click ->
    $('.playlist-content').hide()
    $('.playlist-content-act').show()
