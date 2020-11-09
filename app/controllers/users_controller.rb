class UsersController < ApplicationController
    
    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        @users = User.new
        @users.username = params[:username]
        @users.email = params[:email]
        @users.password = params[:password]
        if @users.save
            redirect "/login"
        else  
            erb :'users/signup'
        end
    end

    get '/users/:username' do
        @users = User.find_by(params)
        if @users == nil
            redirect "/plants"
        end
        erb :'users/show'
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        login(params[:username], params[:password])
    end

    get '/logout' do
        logout!
        redirect "/"
    end

end