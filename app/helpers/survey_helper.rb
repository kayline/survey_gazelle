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