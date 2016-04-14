$(document).on('ready', function(){
var resource_id


$(function(){
  $('a.btn.btn-danger.btn-sm').on('click', function(){
    debugger
      resource_id= this.parentElement.id;
      $.ajax({
        method: "POST",
        url: "/resources/"+ resource_id + "/complete"
      })

  })

  $(document).ajaxSuccess(function(){
    var completed_resource= $('li#'+ resource_id);
    $('div#tab-3').append(completed_resource);
    $('div#tab-1').remove(completed_resource);
    alert('Resource marked as complete!');
  })
})

