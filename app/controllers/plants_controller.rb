class PlantsController < ApplicationController
    
    get '/' do
        @plants = Plant.all 
        erb :"/plants/index"
    end

    #allows you to add a new plant
    get '/new' do 
        if logged_in?
            erb :"plants/new"
        else 
            redirect_if_not_logged_in
        end
    end

    #shows plants
    get '/plants/:id' do
        @plants = Plant.find(params[:id])
        erb :"plants/show"
    end

    #creates plants
    post '/plants' do
        @plants = Plant.new
        @plants.name = params[:name]
        @plants.description = params[:description]
        @plants.save
        redirect "/plants/#{plants.id}"
    end

end