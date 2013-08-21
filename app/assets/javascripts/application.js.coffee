#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.flexslider-min
#= require idangerous.swiper-2.0.min
#= require idangerous.swiper.3dflow-2.0
#= require jquery.zoom
#= require jquery.fancybox

window.applyZoom = (el) ->
  $(el).parent().zoom
    url: $(el).attr('src')
    onZoomIn: ->
      $(@).prev('img').addClass('zoomed')
      false
    onZoomOut: ->
      $(@).prev('img').removeClass('zoomed')
      false

window.bootstrapCollectionItemShow = ->
  applyZoom $('.collection-item #largeimage img')

  $('.collection-item .thumbnails a').on 'click', (e) ->
    e.preventDefault()
    url = $(this).find('img').data('zoom-url')
    img = $('<img />').attr({src: url})
    $('.collection-item #largeimage img').replaceWith(img)
    applyZoom $('.collection-item #largeimage img')
