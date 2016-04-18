$(function(){
  $('.tabs').tabslet({
    animation: true
  });

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


  $('form#new_lesson').on('submit', function(event){
    event.preventDefault();
    event.stopPropagation();

    $.ajax({
      url: '/lessons',
      method: 'POST',
      data: {'title' : $('#lesson_title').val(), 'duration' : $('#lesson_duration').val(), 'track_id' : $('#lesson_track_id').val(), 'ajax_stuff' : 'yes' },
      dataType: "json",
      success: function(data){

        $('form').hide();

        $('#lesson_form').append(data["return"]["partial"]);
        $('#new_alert').append("You've created a new lesson called <strong>" + data["lesson"]["title"] + "</strong>");
        $('form.edit_lesson #lesson_title').val('');
        $('form.edit_lesson #lesson_duration').val('');
      }
    });


  });


});
