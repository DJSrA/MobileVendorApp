$(document).on 'ready page:load', ->
  $ ->
    $('.vendor_opened_on').datepicker({
      dateFormat: 'yy-mm-dd'
    })
    $('.vendor_opened_on_time').timepicker()
    return

  $('.fa-heart-o').click ->
    $(event.target).addClass('fa-heart').removeClass 'fa-heart-o'
    return

  $('.fa-heart').click ->
    $(event.target).addClass('fa-heart-o').removeClass 'fa-heart'
    return
