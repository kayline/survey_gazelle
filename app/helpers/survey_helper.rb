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



 def choice_count(survey_id, index)
  results = {}
  question = Survey.find(survey_id).questions[index]
  question.choices.each do |choice|
    choice_sym = choice.choice.to_sym
    results[choice_sym] = choice.answers.count
  end
  results
 end

  def choice_count_mult(survey_id)
    results= {}
    questions = Survey.find(survey_id).questions
    questions.each do |question|
      question_sym = question.question.to_sym
      choice_array = []
      question.choices.each do |choice|
        choice_sym = choice.choice.to_sym
        choice_array << {choice_sym => choice.answers.count}
      end
      results[question_sym] = choice_array
    end
    results
  end

   def get_voted_surveys(user_id)
    user = User.find(user_id)
    survey_objs = user.questions.map {|question| question.survey }.uniq
   end

   def voted?(user_id, survey_id)
    completed_surveys = get_voted_surveys(user_id)
    comp_survey_ids = completed_surveys.map {|survey| survey.id}
    if comp_survey_ids.include?(survey_id)
      true
    else
      false
    end
   end

end
