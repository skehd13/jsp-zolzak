// 배경색과 설명색을 5초마다 바꿔준다.
var colourIndex = 0;
var colours = ['#FF3636', '#EDD200', '#2FED28', '#0030DB'];
$(document).ready(function() {
    var timer = setInterval(function() {
        colourIndex = (colourIndex + 1) % colours.length;
        $('body').animate({'background-color':colours[colourIndex]}, 3000);
        $('p,ul').animate({'color':colours[colourIndex]}, 3000);
    }, 5000);
});
