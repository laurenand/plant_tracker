require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "aloethere"
  end

  get "/" do
    erb :home
  end

  helpers do
    
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      #if statement assignment
      #if user object true, runs session
      #if user object nil, redirect to login page
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
        redirect "/plants"
      else
        redirect "/login"
      end
    end

    def logout!
      session.clear
    end

    def edit_by_user
      plant = Plant.find(params[:id])
      if plant.user == current_user 
          erb :'plants/edit'
      else 
          redirect "/plants"
      end
    end

  end

end
