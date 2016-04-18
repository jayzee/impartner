$(function(){
  $("#question-bank").hide();
  $('.add-question').on('click', function(e){
    var form = $(this).parent('form');
    var content_field = $('#question_content');
    var answer_field = $('#answer-field');
    e.preventDefault();

    $.ajax({
      type: "POST", 
      url: form.attr('action'), 
      data: form.serialize(),

      success: function(data){
        $('#question-bank').show();
        $('#question-bank').append("<li>" + data.content + "<strong> " + data.correct_answer + "</strong>" + "</li>");
        content_field.val('');
        answer_field.val('');
        $('.show-answer-field').prop( "checked", false );
        answer_field.hide();
      }, 
      dataType: 'JSON'
    });
  });
});