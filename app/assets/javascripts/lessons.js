$(function(){
  $('.tabs').tabslet();

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
        url: "/resources/"+ resource_id + "/complete"
      })

  });

  $(document).ajaxSuccess(function(){
    swal("Good job!", "You've earned 5 points.", "success");
    card.remove();
    $("#tab-3 #card-ul").append(card);
  });


//});

  $('form#new_lesson').on('submit', function(){
    event.preventDefault();
    event.stopPropagation();

    $.ajax({
      url: '/lessons',
      method: 'POST',
      data: {'title' : $('#lesson_title').val(), 'duration' : $('#lesson_duration').val(), 'track_id' : $('#lesson_track_id').val(), 'ajax_stuff' : 'yes' },
      dataType: "json",
      success: function(data){

        $('form').hide();

        $('#lesson_form').append("<p>You've created a new lesson called <strong>" + data["lesson"]["title"] + "</strong><br><br>");
        $('#lesson_form').append(data["return"]["partial"]);

      }
    });


  });


});
