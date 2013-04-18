$(document).on("click", "a", function(){
  $('html, body').animate({
    scrollTop: $( $.attr(this, 'href') ).offset().top - 30
  }, 500);
  return false;
});