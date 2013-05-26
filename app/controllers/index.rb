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
  @created_surveys = current_user.surveys
  @voted_surveys = get_voted_surveys(session[:id])
  erb :profile
end

get "/user/:user_id/survey/create" do
  bounce(session[:id])
  erb :create_survey
end

post '/user/:user_id/survey/create' do
    p params[:survey][:title]
    p params[:survey][:questions]
    create_survey(params[:survey][:title])
    params[:survey][:questions].each do |q_hash|
      create_question(q_hash[:question])
      create_choices(q_hash[:choices])
    end

  redirect '/'
end



