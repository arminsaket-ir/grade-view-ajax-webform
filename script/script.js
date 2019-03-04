$(function () {
    $('.dot').click(function () {
        $(".dot.current").removeClass("current");
        $(this).addClass("current");
    });
});