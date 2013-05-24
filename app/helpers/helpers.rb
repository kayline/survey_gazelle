helpers do
  def current_user
    if session[:id]
      @current_user = User.find(session[:id])
    end
  end

  def bounce(id)
    redirect '/' if session[:id].nil?
  end

  def create_survey(title)
    @survey = Survey.create(:title => title, :creator_id => session[:id])
  end

  def create_question(question)
    @question = Question.create(:question => question, :survey_id => @survey.id)
  end

  def create_choices(choices)
    choices.each do |choice|
      Choice.create(:choice => choice("choice"), :question_id => @question.id)
    end
  end
end
