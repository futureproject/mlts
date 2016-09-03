# Join Us overlay

# $(document).ready ->
$ ->
  $('.join-us-link').click ->
    $('#mask').fadeIn 300

    # Fade in the join us form
    $('.join-us-form-overlay').fadeIn 300
    false

  # Hide when the close button or the mask layer is clicked
  $('body').on 'click', 'a.close, #mask', ->
    $('#mask , .join-us-form-overlay').fadeOut 300
    false
