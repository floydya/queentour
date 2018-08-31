$(document).ready(function () {

//show-hide block .header__telephone
  $('.header__number--strel, .header__number--tel').click(function () {
    $('.header__telephone').toggle()
  })
  //main-news in page index.html
  $('.news__main').mouseover(function () {
    $('.news__main').addClass('news__main-hover')
  })
  $('.news__main').mouseout(function () {
    $('.news__main').removeClass('news__main-hover')
  })
  //map in page index.html
  $(".map").click(function () {
    $(".map__dis").hide()
  })
  //logo in footer
  $('.footer__logo').mouseover(function () {
    $('.footer__logo').hide()
    $('.footer__logo-hover').show()
  })
  $('.footer__logo-hover').mouseout(function () {
    $('.footer__logo-hover').hide()
    $('.footer__logo').show()
  })

  //popup call
  $(".header__button-click").on('click', function (e) {
    $(".popup-call").fadeIn(600)
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show() 
  })
  $(".forma__close").on('click', function (e) {
    $(".popup-call").fadeOut(300)
    $("body").removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-call").fadeOut(300)
    $("body").removeClass('load')
  })
  //popup selection
  $('.capture').mouseover(function () {
    $('.popup-selection').show()
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show()
  })
  $(".forma__close").on('click', function (e) {
    $('.popup-selection').hide()
    $('body').removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-selection").hide()
    $("body").removeClass('load')
  })
    
  //show-hide filter tour.html
  $('.tour__open-filter').click(function () {
    $('.tour__filter').addClass('show-filter')
    $('.tour__open-filter').hide()
    $('.tour__close-filter').show()
  })
  $('.tour__close-filter').click(function () {
    $('.tour__filter').removeClass('show-filter')
    $('.tour__close-filter').hide()
    $('.tour__open-filter').show()
  })

  //navigation
  var url=document.location.href
  $.each($(".navigation__a"), function () {
    if (this.href==url) {$(this).addClass('active-link')};
  })
  //navigation in footer
  var url=document.location.href
  $.each($(".footer__link"), function () {
    if (this.href==url) {$(this).addClass('active-link-footer')};
  })
  // open all-galery about.html
  $('.galery__show').click(function () {
    $('.galery-preview-open__a ').toggle()
    $('.anchor__none').toggle()
  })
  //header-mobile
  $('.header__adaptive-icon').click(function () {
    $('.header-mobile').show()
    $('.header__adaptive-icon').hide()
    $('.header__adaptive-icon--hover').show()

  })
  $('.header__adaptive-icon--hover').click(function () {
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show()
  })
  //popup selection in fixed menu
  $(".fixed-menu__submit-push").on('click', function (e) {
    $(".popup-tour").show()
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show()   
  })
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load')
  })
  //navigation mobile
  var url=document.location.href
  $.each($(".header-mobile__a"), function () {
    if (this.href==url) {$(this).addClass('active-link')};
  })
  //more text in about.html
  $('.about__more').click(function () {
    $('.about__text-all').removeClass('about__text-hide')
    $('.about__text-span1, .about__text-span2, .about__text-span3, .about__text-span4').addClass('about__text-span-all ')
    $('.about__more').addClass('about__text-hide')
  })
  //
  $(".city__marking1").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".depiction__text").hide()
    el.find(".city__marking2").show()
    $(this).hide()
  })
  $(".city__marking2").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".depiction__text").show()
    el.find(".city__marking1").show()
    $(this).hide()
  })
  //navigation in country_1.html
  var url=document.location.href
  $.each($(".anchor__a"), function () {
    if (this.href==url) {$(this).addClass('anchor__a-active')};
  })

  //filter in hotels.html
  $(".hotels__close").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".hotels__meaning").slideDown(500)
    el.find(".hotels__open").show()
    el.find(".hotels__title").addClass('hotels__sort-a-active')
    $(this).hide()
  })
  $(".hotels__open").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".hotels__meaning").slideUp(300)
    el.find(".hotels__close").show()
    el.find(".hotels__title").removeClass('hotels__sort-a-active')
    $(this).hide()
  })
  //side-bar for mobile-version 
  $('.hotels__button-two').click(function (e) {
    $('.hotels__side-bar').addClass('hotels__side-bar-active')
    $('body').addClass('load2')
    $('.sub-two').addClass('sub-show')
  })
  $('.sub-two').click(function (e) {
    $('.hotels__side-bar').removeClass('hotels__side-bar-active')
    $('body').removeClass('load2')
    $('.sub-show').removeClass('sub-show')
  })
  //search for mobile-version
  $('.hotels__button-one').click(function (e) {
    $('.hotels__content-search').addClass('hotels__search-active')
    $('body').addClass('load2')
    $('.sub-two').addClass('sub-show')
  })
  $('.sub-two').click(function (e) {
    $('.hotels__content-search').removeClass('hotels__search-active')
    $('body').removeClass('load2')
    $('.sub-show').removeClass('sub-show')
  }) 
  //label in blog.html
  $('.blog__label').click(function () {
    $(this).toggleClass('blog__label-active')
  })
  //heading in blog.html for mobile-version 
  $('.heading').click(function (e) {
    $('.blog__top-form').addClass('blog__popular-active')
    $('body').addClass('load2')
    $('.sub-two').addClass('sub-show')
  })
  $('.sub-two').click(function (e) {
    $('.blog__top-form').removeClass('blog__popular-active')
    $('body').removeClass('load2')
    $('.sub-show').removeClass('sub-show')
  })
  //open text in documents.html 
  $('.documents__show').click(function () {
    $('.documents__td4-list').removeClass('documents__hidden')
    $('.documents__show').hide()
  })
  //show-hide table in documents.html
  $(".documents__close").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".documents__mobile-wrap").show()
    el.find(".documents__open ").show()
    $(this).hide()
  })
  $(".documents__open ").on('click', function (e) {
    var el = $(this).parent().parent()
    el.find(".documents__mobile-wrap").hide()
    el.find(".documents__close").show()
    $(this).hide()
  })
  //top menu active
  var url=document.location.href
  $.each($(".header__link"), function () {
    if (this.href==url) {$(this).addClass('header__link-acive')};
  })
  //map in conctact.html 
  $(".contacts__right").click(function () {
    $(".contacts__dis").hide()
  })
  //popup-admin in contact.html
  $(".contacts__button").on('click', function (e) {
    $(".popup-tour").show()
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show()   
  })
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load')
  })
  //popup-sertificate in sertificate.html
  $(".sertificate__button").on('click', function (e) {
    $(".popup-tour").show()
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show()   
  })
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide()
    $("body").removeClass('load')
  })
  //popup thanks for the request
  $(".thank").on('click', function (e) {
    $(".popup-tour").hide()
    $(".popup-selection").hide()
    $(".about__button-form").hide()
    $(".popup-call").hide()
    $(".popup-thank-you").fadeIn(1000)
    $('body').removeClass('load')
    setTimeout(function () {
      $('.popup-thank-you').fadeOut(2000)
    }, 3000)
  })
  $(".sub-thank").on('click', function (e) {
    $(".popup-thank-you").hide()
  })
  //popup-assortment in about.html
  $(".about__button-form").on('click', function (e) {
    $(".popup-assortment").show()
    $("body").addClass('load')
    $('.header-mobile').hide()
    $('.header__adaptive-icon--hover').hide()
    $('.header__adaptive-icon').show() 
  })
  $(".forma__close").on('click', function (e) {
    $(".popup-assortment").hide()
    $("body").removeClass('load') 
  })
  $(".sub").on('click', function (e) {
    $(".popup-assortment").hide()
    $("body").removeClass('load')
  })
})
