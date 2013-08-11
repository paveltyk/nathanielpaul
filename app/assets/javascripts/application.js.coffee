#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require idangerous.swiper-2.0.min
#= require idangerous.swiper.3dflow-2.0
#= require_tree .

mySwiper = new Swiper(".swiper-container",
  slidesPerView: 3
  loop: true
  calculateHeight: true

  #Enable 3D Flow
  tdFlow:
    rotate: 0
    stretch: -50
    depth: 450
    modifier: 1
    shadows: true
)
