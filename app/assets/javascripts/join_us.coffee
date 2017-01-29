# Join Us overlay

$ ->
  $('.join-us-link').click ->
    $('#mask').fadeIn 300
    $('.join-us-form-overlay').fadeIn 300
    unless $(".navbar-toggle").hasClass("collapsed")
      $(".navbar-toggle").click()
    false

  # Hide when the close button or the mask layer is clicked
  $('body').on 'click', 'a.close, #mask', ->
    $('#mask , .join-us-form-overlay').fadeOut 300
    false

  if window.location.hash == "#join"
    $('#mask').fadeIn 1000
    $('.join-us-form-overlay').fadeIn 1000
    false
