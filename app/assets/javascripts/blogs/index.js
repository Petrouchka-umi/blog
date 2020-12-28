$(function(){
  $('a[href^="#"]').click(function(){
    // const speed = 500;
    const href= $(this).attr("href");
    const target = $(href == "#" || href == "" ? 'html' : href);
    const header = 100;
    const position = target.offset().top-header;
    $("html, body").animate({scrollTop:position}, 600, "swing");
    return false;
  });
});