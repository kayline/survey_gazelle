get '/surveys' do
  @surveys = Survey.all
  erb :surveys  
end

get '/survey/:survey_id' do 
 @survey = Survey.find(params[:survey_id])
 p @survey.id
 erb :survey  
end

post '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user
    @voter_id = current_user.id
    if voted?(@voter_id, @survey.id)
      @errors = ["You have already voted on this survey"]
      erb :surveys
    else
      @questions = Survey.find(@survey.id).questions
      @questions.each do |q|
        @chosen= get_choice(q.id, params[q.id.to_s.to_sym])
        @answer = Answer.create(voter_id: @voter_id, choice_id: @chosen.id)
        redirect '/surveys'
      end
    end
  else
    @errors = ["Please log in to vote on a survey"]
    erb :surveys
  end
end

get '/survey/:survey_id/results' do 
 @survey = Survey.find(params[:survey_id])
 @results_hash = choice_count_mult(@survey.id)
 p @results_hash
 p @results_json = @results_hash.to_json
 erb :results
end


