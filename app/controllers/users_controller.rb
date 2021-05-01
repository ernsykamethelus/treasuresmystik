class UserController < ApplicationController
   
    get '/users/new' do 
        erb :'/users/new'
    end

    post '/users' do
        user = User.new(params)
        if user.save 
            session[:id] = user.id
            redirect "/users/#{user.id}"
        else
            redirect '/users/new'
        end
    end

     get '/users/:id' do
       @user = User.find_by_id(params[:id])
        if @user.nil? && !is_logged_in?
            redirect '/'
        elsif @user.nil? && is_logged_in?
            redirect "/users/#{session[:id]}"
        else
            redirect "/crystals"
        end
    end
end



  




