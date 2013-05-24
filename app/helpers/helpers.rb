helpers do
  def current_user
    if session[:id]
      @current_user = User.find(session[:id])
    end
  end

  def bounce(id)
    redirect '/' if session[:id].nil?
  end
end
