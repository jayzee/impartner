
$(document).on('ready', function(){


  $('#new_track').on('submit', function(){
      event.preventDefault();
      debugger
      $.ajax({
          url: '/tracks',
          method: 'POST',
          data: {'name' : $('#track_name').val(), 'description' : $('#track_description').val(), 'category_id' : $('#track_category_id').val(), 'ajax_stuff' : 'yes' },
          dataType: "json",
          success: function(data){
              $('form').hide();
              debugger



          }
      })
  })

} )
