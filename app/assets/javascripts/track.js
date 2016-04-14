$(document).on('ready', function(){
  //If a user isn't enrolled or the teacher, cannot open the lessons.
  //For each lesson element in the ul, grab its text, then replace the link with JUST the text
  var lessonList= $('body div.container ul a');
  for(var i in lessonList){
    var text= $('body div.container ul a')[i].text
    $('body div.container ul a')
  }
})
