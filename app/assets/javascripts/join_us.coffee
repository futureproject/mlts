$ ->
  # Join Us overlay
  $('.join-us-link').click ->
    $('#mask').fadeIn 300
    $('.join-us-form-overlay').fadeIn 300
    unless $(".navbar-toggle").hasClass("collapsed")
      $(".navbar-toggle").click()
    false

  # Hash link for join us overlay
  if window.location.hash == "#join"
    $('#mask').fadeIn 1000
    $('.join-us-form-overlay').fadeIn 1000
    false

  #Contact Us overlay
  $('.contact-us-link').click ->
    $('#mask').fadeIn 300
    $('.contact-us-overlay').fadeIn 300
    $(".dropdown-toggle").dropdown("toggle");
    unless $(".navbar-toggle").hasClass("collapsed")
      $(".navbar-toggle").click()
    false

  # Hide all overlays the close button or the mask layer is clicked
  $('body').on 'click', 'a.close, #mask', ->
    $('#mask , .lightbox-overlay').fadeOut 300
    false


