$(window).load ->
  $('.flexslider').flexslider({
    animation: 'fade',
    easing: 'swing',
    controlNav: false,
    slideshowSpeed: 7000,
    animationSpeed: 900
    })

mySwiper = new Swiper('.swiper-container',
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
