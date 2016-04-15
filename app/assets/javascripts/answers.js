$(function(){
  $('.new_answer').on('submit', function(e){
    e.preventDefault();
    

    var form = $(this);
    var answer = form.parent('div');
    var edit = "<a href='#''>Edit Answer</a>";
    var badge = parseInt($("li.list-group-item.active > span").text())
    $.ajax({
      type: "POST", 
      url: form.attr('action'), 
      data: form.serialize(),

      success: function(data){
        answer.append(data.content);
        answer.append(edit);
        form.remove();
        $("div.panel.panel-primary").toggleClass("panel panel-primary panel panel-default");
        $("li.list-group-item.active > span").text(badge - 1)
      }, 
      dataType: 'JSON'
    });

  });

});