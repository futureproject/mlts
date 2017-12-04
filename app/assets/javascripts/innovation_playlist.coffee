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

  # Try a Project section
  $('.project-item-container').click ->
    $('.project-item-container').not(this).removeClass('selected')
    $(this).toggleClass('selected')
    id = $(this).attr('data-related')
    $(".project-content").each ->
      if($(this).attr('id') == id)
        $(this).toggle(300)
      else
        $(this).hide(300)
