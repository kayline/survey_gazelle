var form = "<div class='question-box container'>"+
              "<input name='survey[question]' type='text' placeholder='Question'>"+
              "<input name='survey[choices][][choice]' type='text' placeholder='Answer'>"+
              "<input name='survey[choices][][choice]' type='text' placeholder='Answer'>"+
              "<button class='add_choice' type='button'>Add Choice</button>"+
            "</div>";
var choice = "<input name='survey[choices][][choice]' type='text' placeholder='Answer'>";

$(document).ready(function() {
  $('.add_question').on('click', function(){
    $(form).appendTo($('form').last());
    $('.add_buttons').appendTo($('form').last());
  });

  $(document).on('click','.add_choice' ,function(){
    $(choice).appendTo($(this).parent());
    $(this).appendTo($(this).parent());
  });
});


