$(document).ready(function () {    
  var steps_slider = $('.steps .items').bxSlider({
    pager: false,
    onSlideBefore: function () {
      $('.steps .pager a').removeClass('page_active')
      $(`.steps .pager a:eq(${steps_slider.getCurrentSlide()})`).addClass('page_active')
    }
  })
  $('.steps .pager a').click(function () {
    $('.steps .pager a').removeClass('page_active')
    $(this).addClass('page_active')  
    steps_slider.goToSlide($(this).index())
    return false
  })
})

$(document).ready(function () {  
  var steps_slider = $('.steps-galery .items-galery').bxSlider({
    pager: false,
    onSlideBefore: function () {
      $('.steps-galery .link-galery a').removeClass('galery_active')
      $(`.steps-galery .link-galery a:eq(${steps_slider.getCurrentSlide()})`).addClass('galery_active')
    }
  })
  $('.steps-galery .link-galery a').click(function () {
    $('.steps-galery .link-galery a').removeClass('galery_active')
    $(this).addClass('galery_active')  
    steps_slider.goToSlide($(this).index())
    return false
  })
})

$(document).ready(function () {  
  var steps_slider = $('.steps-galery2 .items-galery').bxSlider({
    pager: false,
    onSlideBefore: function () {
      $('.steps-galery2 .link-galery a').removeClass('galery_active')
      $(`.steps-galery2 .link-galery a:eq(${steps_slider.getCurrentSlide()})`).addClass('galery_active')
    }
  })
  $('.steps-galery2 .link-galery a').click(function () {
    $('.steps-galery2 .link-galery a').removeClass('galery_active')
    $(this).addClass('galery_active')  
    steps_slider.goToSlide($(this).index())
    return false
  })
})
