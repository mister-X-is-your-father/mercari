$(function() {
  if ($(".reg-email").val() !== "") {
    $(".reg-pass").hide();
    $(".reg-pass-conf").hide();
  }
});