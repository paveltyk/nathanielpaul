#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.flexslider-min
#= require idangerous.swiper-2.0.min
#= require idangerous.swiper.3dflow-2.0
#= require jquery.zoom
#= require jquery.fancybox

window.bootstrapCollectionItemShow = ->
  $('.collection-item #largeimage').zoom({url: $('.collection-item #largeimage img').attr('src')})
  $('.collection-item .thumbnails a').on 'click', (e) ->
    e.preventDefault()
    url = $(this).find('img').data('zoom-url')
    img = $('<img />').attr({src: url})
    $('.collection-item #largeimage img').replaceWith(img)
    $('.collection-item #largeimage').zoom({url: url})
