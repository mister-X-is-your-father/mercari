$(function() {

  if ($(".reg-email").val() !== "") {
    $(".reg-pass").hide();
    $(".reg-pass-conf").hide();
  }

  $('#user_birth_day').eq(1).change(function(){
    var str1 = $("#user_birth_day").eq(1).val();
    console.log(str1);
    // $('.owl-dot').removeClass('active');
    // $(this).addClass('active');
    // image_url = $('img',this).attr('src');
    // $('.change-image').attr('src', image_url);
  });

});