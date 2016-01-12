$(document).on 'ready page:load', ->
  $('.menu').click ->
    $('.menu-container').show 'slide', { direction: 'up' }, 500
    return
  $('.close-menu').click ->
    console.log("poo buckets")
    $('.menu-container').hide 'slide', { direction: 'up' }, 500
    return
  $('.cta-input input').focus ->
    $('.fa-search').css('opacity', 1)
    return
  $('.cta-input input').blur ->
    if $('.find-truck-input').val() == ''
      $('.fa-search').css 'opacity', 0
    else
      $('.fa-search').css 'opacity', 1  
    return