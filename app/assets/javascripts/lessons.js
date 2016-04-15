$(function(){

  $('#popup-youtube, #popup-vimeo, #popup-gmaps').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,

    fixedContentPos: false
  });

  $('#image-popup-vertical-fit').magnificPopup({
    type: 'image',
    closeOnContentClick: true,
    mainClass: 'mfp-img-mobile',
    image: {
      verticalFit: true
    }
    
  });

  var resource_id;
  var card;

  $('a.btn.btn-info.btn-sm').on('click', function(){
      card = this.parentElement
      resource_id= card.id;
      $.ajax({
        method: "POST",
        url: "/resources/"+ resource_id + "/complete", 
        success: function(){
          swal("Good job!", "", "success");
          card.remove();
          $("#tab-3 #card-ul").append(card);
        }
      })
  
  });


});




