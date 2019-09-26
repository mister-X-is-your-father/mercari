$(document).on('turbolinks:load', function() {

  $('.owl-dot').click(function(){
    $('.owl-dot').removeClass('active');
    $(this).addClass('active');
    image_url = $('img',this).attr('src');
    $('.change-image').attr('src', image_url);
  });
  
});