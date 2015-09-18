var win         = $(window),
    fxel        = $('.navbar-nav'),
    eloffset    = fxel.offset().top;
win.scroll(function() {
	if ( $(window).width() > 992) {
	    if (eloffset < win.scrollTop()) {
	        fxel.addClass("fixed");
	    } else {
	        fxel.removeClass("fixed");
	    }
	}
});

$(document).ready( function(){
  $(".navbar li a").click(function(event) {
    $(".navbar-collapse").removeClass("in").addClass("collapse");
  });
});

$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
