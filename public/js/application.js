var choice = "<input name='survey[choices][][choice]'' type='text' placeholder='Answer'>"

$(document).ready(function() {
  $('.add_choice').on('click', function(){
    var submit_button = $('.submit').detach();
    var survey = $('.survey')
    $(choice).appendTo(survey);
    $(submit_button).appendTo(survey);
  });
});
