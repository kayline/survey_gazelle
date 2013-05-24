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
 @voter_id = 1

 @answer = Answer.create(voter_id: @voter_id, choice_id: @choice.id)
 redirect '/surveys'

end


