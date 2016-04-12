$(function(
  $('btn btn-primary').on('click', function(){
    var resourceId = $(this).id
    $.ajax({
      method: 'POST',
      url: '/resources/'+ resourceId+'/complete'
    })

    
  })


  )

);