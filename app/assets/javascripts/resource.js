$(function(
  $('btn btn-primary').on('click', function(){
    $.ajax({
      method: 'POST',
      url: '/resources/'
    })
  })


  )

);