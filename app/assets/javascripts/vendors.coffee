$(document).on 'ready page:load', ->
  $ ->
    $('.vendor_opened_on').datepicker({
      dateFormat: 'yy-mm-dd'
    })
    $('.vendor_opened_on_time').timepicker()
    return