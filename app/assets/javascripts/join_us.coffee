join_us_listeners = ->
  # Join Us overlay
  $('.join-us-link').click ->
    # Add the mask to body
    $('body').append '<div id="mask"></div>'
    $('#mask').fadeIn 300

    # Fade in the join us form
    $('.join-us-form-overlay').fadeIn 300
    false

  # Hide when the close button or the mask layer is clicked
  $('body').on 'click', 'a.close, #mask', ->
    $('#mask , .join-us-form-overlay').fadeOut 300, ->
      $('#mask').remove()
    false

  # Tooltip for Join Us button on homepage
  $('.join-us').hover (->
    $(this).addClass 'tooltip-open'
  ), ->
    $(this).removeClass('tooltip-open')
  return

$ -> join_us_listeners()
$(window).bind('page:change', join_us_listeners)
