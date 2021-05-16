require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    # register Sinatra::Flash
    set :method_override, true
    set :session_secret, "crystal_secret"
  end

  get "/" do
      if is_logged_in?
        redirect "/users/#{session[:user_id]}"
      else
        erb :home
  end
end

  get "/error" do 
    erb :error
  end

helpers do 
  def current_user 
    user = User.find_by_id(session[:user_id])
  end

  def is_logged_in?
    !!current_user
    # !!session[:id]
  end

  # def current_user 
  #   user = User.find_by(session[:id])
  # end

  def user_not_logged_in
    if !is_logged_in?
      redirect '/login'
     end
  end
end
end
