var win         = $(window),
    fxel        = $('.nav'),
    eloffset    = fxel.offset().top
    contentarea = $('.mainarea');

console.log(contentarea);

win.scroll(function() {
    if (eloffset < win.scrollTop()) {
        fxel.addClass("fixed");
        contentarea.addClass("fixed-offset");
        console.log("added fixed");
    } else {
        fxel.removeClass("fixed");
        contentarea.removeClass("fixed-offset");
        console.log("removed fixed");
    }
});