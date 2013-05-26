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
    @questions = Survey.find(@survey.id).questions
    @questions.each do |q|
      @chosen= get_choice(q.id, params[q.id.to_s.to_sym])
      @answer = Answer.create(voter_id: @voter_id, choice_id: @chosen.id)
    end
    redirect '/surveys'
  else
    redirect "/survey/#{@survey.id}"
    # we need error messages!
  end

end

get '/survey/:survey_id/results' do 
 @survey = Survey.find(params[:survey_id])
 @results_hash = choice_count_mult(@survey.id)
 p @results_hash
 p @results_json = @results_hash.to_json
 
 # raise @results.inspect
 # p @results.inspect
 # @results_json = results_to_json(@survey.id)
 # puts "JSON STRING HERE"
 # p @results_json
 erb :results

end


