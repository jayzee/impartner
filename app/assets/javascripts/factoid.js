// var listing;
// var fact;

// $(function(){
//   $.getJSON("https://www.reddit.com/r/funfacts/random.json", function(data){
//     listing = data[0].data.children[0].data;
//     fact = listing.data.title
//     debugger; 
//   })

//   $(document).ajaxSuccess(function(){
//     $()
//   })
// })

$(function(){
  $('.random-fact button').on("click", function(){
    $.ajax({
      url: "/factoids",
      method: "GET"
    })
    // $('.random-fact button').replaceWith("<h3>Loading Fact...</h3>")
    $('.random-fact button').prop( "disabled", true );
    $('.random-fact button').html("<img width= '25' src='http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_gray_350.gif'>")
  })

  $(document).ajaxSuccess(function(event, request, options, data){
    var url= "<p><a href=" + data.url +">Learn More Here!</a></p>"
    $('.random-fact button').text(data.title)
    $('.random-fact button').append(url)
  })
})