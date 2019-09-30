
$(document).on('turbolinks:load', function() {
  $(function(){
    if ($('.slider').length > 0) {
      $(".slider").not('.slick-initialized').slick({
        autoplay: true,
        dots: true,
        autoplaySpeed: 4000,
        speed: 800,
        prevArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png" class="slide-arrow prev-arrow">',
        nextArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png" class="slide-arrow next-arrow">'
      });
    }
  });
});