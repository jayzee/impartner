$(document).ready(function() {
  $('.popup-with-form').magnificPopup({
    type: 'inline',
    preloader: false,
    focus: '#name',

    // When elemened is focused, some mobile browsers in some cases zoom in
    // It looks not nice, so we disable it:
    callbacks: {
      beforeOpen: function() {
        if($(window).width() < 700) {
          this.st.focus = false;
        } else {
          this.st.focus = '#name';
        }
      }
    }
  });

  $('.popup-with-form').on("click", function(){
    $('input#send').show()
    $('#contact-form').prop( "disabled", false );
    $('#status').empty();
  })

  $('input#send').on("click", function(event){
    event.preventDefault();
    var r_id= $('#recipient_id').val();
    var s_id= $('#sender_id').val();
    var content= $('#content').val();
    $('#contact-form').prop( "disabled", true );
    $('input#send').hide();
    $('#status').append("Message Sent!")
    $.ajax({
      method: "POST",
      url: "/users/"+s_id+"/messages",
      data: {recipient_id: r_id, sender_id: s_id, content: content}
    });

  });

  $(document).ajaxSuccess(function(event, request, options, data){
    $('#contact-form').prop("disabled", false);
    $('.messages').append("From: "+ data[0].email +"<br>To: "+ data[1].email+"<br>Content: "+ data[2].content)
  })
});