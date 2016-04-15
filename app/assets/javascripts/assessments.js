// $(function(){
//   $('.add-question').on('click', function(e){
//     var form = $(this).parent('form');
//     var content_field = $('#assessment_questions_content');
//     var user_value = content_field.val();
//     e.preventDefault();
//     debugger;

//     $.ajax({
//       type: "POST", 
//       url: "/assessments/"+ +"/questions", 
//       data: form.serialize(),
//       success: function(data){
//         debugger;
//       }, 
//       dataType: 'JSON'
//     });
//   });
// });