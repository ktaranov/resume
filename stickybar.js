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

