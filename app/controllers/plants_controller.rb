class PlantsController < ApplicationController
    
    get '/' do
        @plants = Plant.all 
        erb :"/plants/index"
    end

    get '/new' do 
       erb :"plants/new"
    end

    get '/:id' do
        @plants = Plant.find(params[:id])
        erb :"plants/show"
    end

    post '/plants' do
        @plants = Plant.new
        
    end

end