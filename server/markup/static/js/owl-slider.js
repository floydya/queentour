$(document).ready(function () {
  $("#owl-demo-one").owlCarousel({
    itemsCustom: [
      [0, 1],
      [320, 1],
      [480, 2],
      [720, 2],
      [960, 3],
      [1110, 4]
		 ],
    autoPlay: true,
    stopOnHover: true,
    navigation: true,
    itemsDesktop: [1199, 3],
    itemsDesktopSmall: [979, 3],
  })
  $("#owl-demo-two").owlCarousel({
    itemsCustom: [
      [0, 1],
      [320, 1],
      [480, 2],
      [720, 2],
      [960, 3],
      [1110, 4]
		 ],
    autoPlay: true,
    stopOnHover: true,
    navigation: true,
    itemsDesktop: [1199, 3],
    itemsDesktopSmall: [979, 3],
  })
	 

	 $('.fancybox').fancybox()
	 $('.fancybox2').fancybox()
})
