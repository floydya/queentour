$(document).ready(function () {

  var $menu = $("#menu")

  $(window).scroll(function () {
    if ( 795 < $(this).scrollTop() && $menu.hasClass("default") ) {
      $menu.removeClass("default").addClass("fixed")
    } else if (795 >= $(this).scrollTop() && $menu.hasClass("fixed")) {
      $menu.removeClass("fixed").addClass("default")
    }
  })//scroll
})
$(document).ready(function () {
  var $menu = $("#menu2")

  $(window).scroll(function () {
    if ( 910 < $(this).scrollTop() && $menu.hasClass("default2") ) {
      $menu.removeClass("default2").addClass("fixed2")
      $('.anchor__navigation').addClass('anchor__navigation2')
    } else if (910 >= $(this).scrollTop() && $menu.hasClass("fixed2")) {
      $menu.removeClass("fixed2").addClass("default2")
      $('.anchor__navigation').removeClass('anchor__navigation2')
    }
  })//scroll
})

$(document).ready(function () {
  var $menu = $("#menu3")

  $(window).scroll(function () {
    if ( 700 < $(this).scrollTop() && $menu.hasClass("default3") ) {
      $menu.removeClass("default3").addClass("fixed3")
      $('.button-top').addClass('anchor__navigation3')
    } else if (700 >= $(this).scrollTop() && $menu.hasClass("fixed3")) {
      $menu.removeClass("fixed3").addClass("default3")
      $('.button-top').removeClass('fixed3')
    }
  })//scroll
})
