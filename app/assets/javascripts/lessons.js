$(function(){
  $('.tabs').tabslet();

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
    })

  })


});
