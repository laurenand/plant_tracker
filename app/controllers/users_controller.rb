class UsersController < ApplicationController
    
    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        @users = User.new params[:user]
        if @users.valid?
            session[:user_id] = @users.id
            redirect "/users/#{@users.username}"
        else
            redirect to '/signup'
        end
    end

    get '/users/:username' do
        @users = User.fin_by(params)
        if @users == nil
            redirect '/'
        end
        erb :"users/show"
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        login(params[:email])
    end

    get '/error' do
        erb :"users/error"
    end

    get '/logout' do
        logout!
        redirect to '/'
    end

end