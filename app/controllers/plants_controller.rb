class PlantsController < ApplicationController
    
    get '/' do
        @plants = Plant.all 
        erb :"/plants/index"
    end

    get '/plants/new' do 
       erb :"plants/new"
    end

    get '/plants/:id' do
        @plants = Plant.find(params[:id])
        erb :"plants/show"
    end

    post '/plants' do
        @plants = Plant.new
        
    end

end