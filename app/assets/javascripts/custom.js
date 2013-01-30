(function($) {

  $(document).ready( function() {
    var radius = 300; // radius of the circle
    var faceballs = $('.faceball'),
        container = $('#container'),
        width = container.width(),
        height = container.height(),
        angle = 0,
        step = (2*Math.PI) / faceballs.length;

    faceballs.each(function() {
        var x = Math.round(width/2 + radius * Math.cos(angle) - $(this).width()/2),
            y = Math.round(height/2 + radius * Math.sin(angle) - $(this).height()/2);
        $(this).css({
            left: x + 'px',
            top: y + 'px'
        });
        angle += step;
    });
  }); // only run when html loading is done, run this script

})(jQuery); // creating closure to use jQuery