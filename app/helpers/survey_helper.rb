helpers do


  def question(survey_id)
    Survey.find(survey_id).questions[0].question
  end

  def get_questions(survey_id)
    Survey.find(survey_id).questions
  end

  def get_choices(question_id)
 Question.find(question_id).choices
 end

 def get_choice(question_id, choice_content)
  Choice.where("question_id = ? AND choice = ?", question_id, choice_content).first
 end



 def choice_count(survey_id)
  results= {}
  @question = Survey.find(survey_id).questions[0]
  @question.choices.each do |choice|
    choice_sym = choice.choice.to_sym
    results[choice_sym] = choice.answers.count
  end
  results
 end

   def results_to_json(survey_id)
    results= {}
    @question = Survey.find(survey_id).questions[0]
    @question.choices.each do |choice|
      choice_string = choice.choice
      results[choice_string] = choice.answers.count.to_s
    end
    results.to_json.tr(' ','')
   end

end