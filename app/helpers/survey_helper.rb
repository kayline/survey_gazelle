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

end