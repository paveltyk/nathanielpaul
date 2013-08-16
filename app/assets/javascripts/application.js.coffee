#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.flexslider-min
#= require idangerous.swiper-2.0.min
#= require idangerous.swiper.3dflow-2.0
$(".image img").on "click", (e) ->
  $("#largeimage img").attr "src", $(this).attr("src")