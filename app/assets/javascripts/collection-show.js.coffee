swiperClickHandler = (swiper) ->
  if swiper.activeIndex != swiper.clickedSlideIndex
    swiper.swipeTo(swiper.clickedSlideIndex)
  else
    slide = $(swiper.activeSlide())
    url = slide.find('a').attr('href')
    $.fancybox
      href: url
      padding: 0
      type: 'ajax'
      scrolling: 'no'
      afterShow: -> bootstrapCollectionItemShow()
      beforeShow: -> slide.addClass('opened')
      beforeClose: -> slide.removeClass('opened')

$ ->
  swiper = new Swiper('.swiper-container', {
    slidesPerView: 'auto',
    calculateHeight: true,
    keyboardControl: true,
    centeredSlides: true,
    initialSlide: 1,
    preventLinks: true,
    tdFlow: {
      rotate: -10,
      stretch: -30,
      depth: 200,
      modifier: 1,
      shadows: false,
    },
    onSlideClick: swiperClickHandler
  });
  $('.swiper-slide').on 'click', (e) -> e.preventDefault()
