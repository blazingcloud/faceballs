(function($) {



  $(document).ready( function() {
    function makeCircle(faceballs) {
      if (faceballs.length > 0) {
        var radius = 300; // radius of the circle
        var container = $('#container'),
            width = container.width(),
            height = container.height(),
            left = container.position().left,
            angle = 0,
            step = (2*Math.PI) / faceballs.length;

        faceballs.each(function() {
            var x = Math.round(width/2 + radius * Math.cos(angle) - $(this).width()/2),
                y = Math.round(height/2 + radius * Math.sin(angle) - $(this).height()/2);
            $(this).css({
                left: x + left + 'px',
                top: y + 'px'
            });
            angle += step;
          });
      };
    };
    makeCircle($('.userball'));
    makeCircle($('.friendball'));
  }); // only run when html loading is done, run this script


})(jQuery); // creating closure to use jQuery

