$(document).on('ready', function(){


  $('form#new_track').on('submit', function(){
      event.preventDefault();
      event.stopPropagation();

      $.ajax({
          url: '/tracks',
          method: 'POST',
          data: {'name' : $('#track_name').val(), 'description' : $('#track_description').val(), 'category_id' : $('#track_category_id').val(), 'ajax_stuff' : 'yes' },
          dataType: "json",
          success: function(data){

              $('form').hide();

              $('#new_form').append("<p>Congratulations, you've succesfully created a new track. The new track is<br> <strong>" + data["track"]["name"] + "</strong>.</p>");
              $('#new_form').append(data["return"]["partial"]);

          }
      })
  })

} )
