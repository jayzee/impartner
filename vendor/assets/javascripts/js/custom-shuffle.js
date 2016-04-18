/* ----------------------------- 
Card Shuffle Style Script
----------------------------- */          
$(document).ready(function() {
  
  var $el       = $( '#card-ul-shuffle' ),
    sectionFeature  = $('#section-feature-shuffle'),
    baraja      = $el.baraja();
  
    if ( $(window).width() > 480) {
      sectionFeature.appear(function(){
        baraja.fan({
          speed : 1500,
          easing : 'ease-out',
          range : 100,
          direction : 'right',
          origin : { x : 50, y : 200 },
          center : true
        });
      });
      $('#feature-expand-shuffle').click(function() {
        baraja.fan({
          speed : 1500,
          easing : 'ease-out',
          range : 100,
          direction : 'right',
          origin : { x : 50, y : 200 },
          center : true
        });
      }); 
    } else {
      sectionFeature.appear(function(){
        baraja.fan({
          speed : 1500,
          easing : 'ease-out',
          range : 80,
          direction : 'left',
          origin : { x : 200, y : 50 },
          center : true
        });
      });
      $('#feature-expand-shuffle').click(function() {
        baraja.fan({
          speed : 1500,
          easing : 'ease-out',
          range : 80,
          direction : 'left',
          origin : { x : 200, y : 50 },
          center : true
        });
      });
    }
    
  // Feature navigation
  $('#feature-prev-shuffle').on( 'click', function( event ) {
    baraja.previous();
  });

  $('#feature-next-shuffle').on( 'click', function( event ) {
    baraja.next();
  });
  
  // close Features
  $('#feature-close-shuffle').on( 'click', function( event ) {
    baraja.close();
  }); 
});



/* ----------------------------- 
IE 9 Placeholder fix
----------------------------- */
$('[placeholder]').focus(function() {
  var input = $(this);
  if (input.val() == input.attr('placeholder')) {
    input.val('');
    input.removeClass('placeholder');
  }
}).blur(function() {
  var input = $(this);
  if (input.val() == '' || input.val() == input.attr('placeholder')) {
    input.addClass('placeholder');
    input.val(input.attr('placeholder'));
  }
}).blur();

