class UsersController < ApplicationController
    
    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        @users = User.create(params)
        if @users.valid?
            session[:user_id] = @users.id
            redirect "/users/#{@users.username}"
        else
            redirect '/signup'
        end
    end

    get '/users/:username' do
        
    end

    get '/login' do
        erb :'/users/login'
    end



end