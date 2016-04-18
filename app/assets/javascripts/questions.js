$(function(){
  $("#question-bank").hide();
  $('.add-question').on('click', function(e){
    var form = $(this).parent('form');
    var content_field = $('#question_content');
    e.preventDefault();

    $.ajax({
      type: "POST", 
      url: form.attr('action'), 
      data: form.serialize(),

      success: function(data){
        $('#question-bank').show();
        $('#question-bank').append("<li>" + data.id + ". " + data.content + "</li>");
        content_field.val('');
      }, 
      dataType: 'JSON'
    });
  });
});