get '/surveys' do
  @surveys = Survey.all
  erb :surveys  
end

get '/survey/:survey_id' do 
 @survey = Survey.find(params[:survey_id])
 erb :survey 
 
end


