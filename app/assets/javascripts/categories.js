$(function() {
  $('a[href^="#"]').click(function() {
    let speed = 500;
    let href = $(this).attr("href");
    console.log(href)
    let target = $(href == "#" || href == "" ? 'html' : href);
    console.log(target)
    let position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  })
})