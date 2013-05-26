get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  p @user = User.find_by_username(params[:username])
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
  p params[:survey][:title]
  p params[:survey][:questions]
  p params[:survey][:questions][:question1]
  

  # raise params.inspect
  # bounce(session[:id])
  # p create_survey(params[:survey][:title])
  # create_question(params[:survey][:question])
  # create_choices(params[:survey][:choices])
  # redirect '/'
end



