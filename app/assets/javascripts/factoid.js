$(function(){
  $('.random-fact button').on("click", function(){
    $.ajax({
      url: "/factoids",
      method: "GET",
      success: (function(data, status, request){
          var url= "<p><a href=" + data.url +" target='_blank'>Learn More</a></p>"
          $('.random-fact button').text(data.title)
          $('.random-fact button').append(url)
        })
    })
    $('.random-fact button').prop( "disabled", true );
    $('.random-fact button').html("<img width= '50' src='http://sampson.washcoll.edu/~ksugalski2/final%20project/images/squid3.gif'>")
  })
})