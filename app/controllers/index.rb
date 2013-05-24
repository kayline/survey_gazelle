get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_username(params[:username])
  session[:id] = @user.id
  erb :profile
end

get '/user/create' do
  erb :create_user
end


post '/user/create' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get "/user/:user_id/profile" do
  bounce(session[:id])
  erb :profile
end

get "/user/:user_id/survey/create" do
  bounce(session[:id])
  erb :create_survey
end

post '/user/:user_id/survey/create' do
  bounce(session[:id])
  title = params[:survey][:title]
  survey = Survey.create(:title => title, :creator_id => session[:id])
  question = params[:survey][:question]
  Question.create(:question => question, :survey_id => survey.id)
  params[:survey][:choices].each do |hash|
    Choice.create(:choice => hash[:choice], :question_id => question.id)
  end
  redirect '/'
end



