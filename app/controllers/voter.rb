get '/surveys' do
  @surveys = Survey.all
  erb :surveys  
end

get '/survey/:survey_id' do 
 @survey = Survey.find(params[:survey_id])
 erb :survey  
end

post '/survey/:survey_id' do
 @choice = Choice.find(params[:choice_id])
 @survey = Survey.find(params[:survey_id])
 @voter_id = current_user.id

 @answer = Answer.create(voter_id: @voter_id, choice_id: @choice.id)
 redirect '/surveys'

end

get '/survey/:survey_id/results' do 
 @survey = Survey.find(params[:survey_id])
 @results = choice_count(@survey.id)
 p @results.inspect

end


