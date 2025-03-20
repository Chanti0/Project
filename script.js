$(document).ready(function () {
    $("button").hover(function () {
        $(this).css("background", "#ff5722");
    }, function () {
        $(this).css("background", "#ffcc00");
    });

    $(".navbar a").hover(function () {
        $(this).css("color", "#ff5722");
    }, function () {
        $(this).css("color", "#fff");
    });
});
document.addEventListener("DOMContentLoaded", function() {
    document.querySelector(".container").style.opacity = 0;
    setTimeout(() => {
        document.querySelector(".container").style.opacity = 1;
    }, 500);
});
