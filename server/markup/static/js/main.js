webpackJsonp([0],{

/***/ 6:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(7);


/***/ }),

/***/ 7:
/***/ (function(module, exports, __webpack_require__) {

"use strict";


$(document).ready(function () {
  $('.header__number--strel, .header__number--tel').unbind().click(function () {
    $('.header__telephone').toggle();
  });

  $('.news__main').mouseover(function () {
    $('.news__main').addClass('news__main-hover');
  });
  $('.news__main').mouseout(function () {
    $('.news__main').removeClass('news__main-hover');
  });

  $(".map").click(function () {
    $(".map__dis").hide();
  });

  $('.footer__logo').mouseover(function () {
    $('.footer__logo').hide();
    $('.footer__logo-hover').show();
  });
  $('.footer__logo-hover').mouseout(function () {
    $('.footer__logo-hover').hide();
    $('.footer__logo').show();
  });

  $(".header__button-click").on('click', function (e) {
    $(".popup-call").fadeIn(600);
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $(".popup-call").fadeOut(300);
    $("body").removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-call").fadeOut(300);
    $("body").removeClass('load');
  });

  $('.capture').mouseover(function () {
    $('.popup-selection').show();
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $('.popup-selection').hide();
    $('body').removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-selection").hide();
    $("body").removeClass('load');
  });

  $('.tour__open-filter').click(function () {
    $('.tour__filter').addClass('show-filter');
    $('.tour__open-filter').hide();
    $('.tour__close-filter').show();
  });
  $('.tour__close-filter').click(function () {
    $('.tour__filter').removeClass('show-filter');
    $('.tour__close-filter').hide();
    $('.tour__open-filter').show();
  });

  var url = document.location.href;
  $.each($(".navigation__a"), function () {
    if (this.href == url) {
      $(this).addClass('active-link');
    };
  });

  var url = document.location.href;
  $.each($(".footer__link"), function () {
    if (this.href == url) {
      $(this).addClass('active-link-footer');
    };
  });

  $('.galery__show').unbind().click(function () {
    $('.galery-preview-open__a ').toggle();
    $('.anchor__none').toggle();
  });

  $('.header__adaptive-icon').click(function () {
    $('.header-mobile').show();
    $('.header__adaptive-icon').hide();
    $('.header__adaptive-icon--hover').show();
  });
  $('.header__adaptive-icon--hover').click(function () {
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });

  $(".fixed-menu__submit-push").on('click', function (e) {
    $(".popup-tour").show();
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });

  var url = document.location.href;
  $.each($(".header-mobile__a"), function () {
    if (this.href == url) {
      $(this).addClass('active-link');
    };
  });

  $('.about__more').click(function () {
    $('.about__text-all').removeClass('about__text-hide');
    $('.about__text-span1, .about__text-span2, .about__text-span3, .about__text-span4').addClass('about__text-span-all ');
    $('.about__more').addClass('about__text-hide');
  });

  $(".city__marking1").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".depiction__text").hide();
    el.find(".city__marking2").show();
    $(this).hide();
  });
  $(".city__marking2").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".depiction__text").show();
    el.find(".city__marking1").show();
    $(this).hide();
  });

  var url = document.location.href;
  $.each($(".anchor__a"), function () {
    if (this.href == url) {
      $(this).addClass('anchor__a-active');
    };
  });

  $(".hotels__close").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".hotels__meaning").slideDown(500);
    el.find(".hotels__open").show();
    el.find(".hotels__title").addClass('hotels__sort-a-active');
    $(this).hide();
  });
  $(".hotels__open").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".hotels__meaning").slideUp(300);
    el.find(".hotels__close").show();
    el.find(".hotels__title").removeClass('hotels__sort-a-active');
    $(this).hide();
  });

  $('.hotels__button-two').click(function (e) {
    $('.hotels__side-bar').addClass('hotels__side-bar-active');
    $('body').addClass('load2');
    $('.sub-two').addClass('sub-show');
  });
  $('.sub-two').click(function (e) {
    $('.hotels__side-bar').removeClass('hotels__side-bar-active');
    $('body').removeClass('load2');
    $('.sub-show').removeClass('sub-show');
  });

  $('.hotels__button-one').click(function (e) {
    $('.hotels__content-search').addClass('hotels__search-active');
    $('body').addClass('load2');
    $('.sub-two').addClass('sub-show');
  });
  $('.sub-two').click(function (e) {
    $('.hotels__content-search').removeClass('hotels__search-active');
    $('body').removeClass('load2');
    $('.sub-show').removeClass('sub-show');
  });

  $('.blog__label').unbind().click(function () {
    $(this).toggleClass('blog__label-active');
  });

  $('.heading').click(function (e) {
    $('.blog__top-form').addClass('blog__popular-active');
    $('body').addClass('load2');
    $('.sub-two').addClass('sub-show');
  });
  $('.sub-two').click(function (e) {
    $('.blog__top-form').removeClass('blog__popular-active');
    $('body').removeClass('load2');
    $('.sub-show').removeClass('sub-show');
  });

  $('.documents__show').click(function () {
    $('.documents__td4-list').removeClass('documents__hidden');
    $('.documents__show').hide();
  });

  $(".documents__close").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".documents__mobile-wrap").show();
    el.find(".documents__open ").show();
    $(this).hide();
  });
  $(".documents__open ").on('click', function (e) {
    var el = $(this).parent().parent();
    el.find(".documents__mobile-wrap").hide();
    el.find(".documents__close").show();
    $(this).hide();
  });

  var url = document.location.href;
  $.each($(".header__link"), function () {
    if (this.href == url) {
      $(this).addClass('header__link-acive');
    };
  });

  $(".contacts__right").click(function () {
    $(".contacts__dis").hide();
  });

  $(".contacts__button").on('click', function (e) {
    $(".popup-tour").show();
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });

  $(".sertificate__button").on('click', function (e) {
    $(".popup-tour").show();
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-tour").hide();
    $("body").removeClass('load');
  });

  $(".thank").on('click', function (e) {
    $(".popup-tour").hide();
    $(".popup-selection").hide();
    $(".about__button-form").hide();
    $(".popup-call").hide();
    $(".popup-thank-you").fadeIn(1000);
    $('body').removeClass('load');
    setTimeout(function () {
      $('.popup-thank-you').fadeOut(2000);
    }, 3000);
  });
  $(".sub-thank").on('click', function (e) {
    $(".popup-thank-you").hide();
  });

  $(".about__button-form").on('click', function (e) {
    $(".popup-assortment").show();
    $("body").addClass('load');
    $('.header-mobile').hide();
    $('.header__adaptive-icon--hover').hide();
    $('.header__adaptive-icon').show();
  });
  $(".forma__close").on('click', function (e) {
    $(".popup-assortment").hide();
    $("body").removeClass('load');
  });
  $(".sub").on('click', function (e) {
    $(".popup-assortment").hide();
    $("body").removeClass('load');
  });
});

/***/ })

},[6]);
//# sourceMappingURL=main.js.map