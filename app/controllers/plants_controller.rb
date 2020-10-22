class PlantsController < ApplicationController
    
    get '/' do
        @plants = Plant.all 
        erb :"/plants/index"
    end

    get '/new' do 
       erb :"plants/new"
    end

    get '/plants/:id' do
        @plants = Plant.find(params[:id])
        erb :"plants/show"
    end

    post '/plants' do
        @plants = Plant.new
        @plants.name = params[:name]
        @plants.description = params[:description]
        redirect "/plants/#{plants.id}"
    end

end