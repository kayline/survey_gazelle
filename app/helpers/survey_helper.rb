helpers do


  def question(survey_id)
    Survey.find(survey_id).questions[0].question
  end

   def choices(survey_id)
    choices= []
    Survey.find(survey_id).questions[0].choices.each do |choice|
      choices << choice
    end
    choices
   end

   def choice_count(survey_id)
    results= {}
    @question = Survey.find(survey_id).questions[0]
    @question.choices.each do |choice|
      results["#{choice.choice}"] = choice.answers.count
    end
    results
   end

end