$(function(){
    $('#new_answer').on('submit', function(e){
        e.preventDefault();
        

        var form = $(this);
        var answer = form.parent('div');
        var edit = "<a href='#''>Edit Answer</a>";

        $.ajax({
          type: "POST", 
          url: form.attr('action'), 
          data: form.serialize(),

          success: function(data){
            answer.append(data.content);
            answer.append(edit);
            form.remove();
          }, 
          dataType: 'JSON'
        });

    });

});