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
      !!session[:email]
    end

    def login(email)
      #if statement assignment
      #if user object true, assigns to local var and runs session
      #if user object nil, redirect to login page
      if user = User.find_by(:username => username, :email => email)
        session[:username] = user.username
        session[:email] = user.email
      else
        redirect "/login"
    end

    def logout!
      session.clear
    end

  end

end
