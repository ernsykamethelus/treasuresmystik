class SessionsController < ApplicationController

    get '/login' do
        erb :'/login'
    end

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id 
            redirect "/users/show"
        else 
            redirect '/login'
        end
    end

get '/logout' do 
    session.clear 
    redirect '/'
  end
end