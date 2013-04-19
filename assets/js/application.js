$(document).on("click", "a", function(){
  $('html, body').animate({
    scrollTop: $( $.attr(this, 'href') ).offset().top - 30
  }, 500);
  return false;
});

$(window).on("resize", formatNavigation);
$(window).on("load", formatNavigation);

function formatNavigation(){
  var years = $(".year");
  var count = years.length;

  if($(window).width() > 900){
    var height = $(window).height();

    for(var i = 0; i < count; ++i){
      var year = $(years[i]);
      var year_height = parseInt(year.css("height").split("px")[0])
      if(i > 0){
        year.css({"margin-top": height/(count+1) - year_height})
      }
      else {
        year.css({"margin-top": height/(count+1) - year_height/2})
      }
    }

    $(".bookend").css({"display": "none"});
  }
  else {
    for(var i = 0; i < count; ++i){
      $(years[i]).css({"margin-top": 0})
    }

    $(".bookend").css({"display": "inline-block"});
  }
}