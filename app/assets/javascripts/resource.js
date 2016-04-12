$(function(
  $('btn btn-primary').on('click', function(){
      var resourceId = $(this).id
      binding.pry
      $.ajax({
        method: 'POST',
        url: '/resources/' + resourceId + '/complete'
      })

  })


  )

);
