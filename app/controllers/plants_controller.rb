class PlantsController < ApplicationController

    #allows the view to access all the articles in the database through the instance variable
    get '/plants' do
        @plants = Plant.all 
        erb :"plants/index"
    end

    #loads the form to create a new plant
    get '/plants/new' do 
        if logged_in?
            erb :"plants/new"
        else 
            #show error message?
        end
    end
    
    #creates a new plants based on the params and saves to the database
    post '/plants' do
        @plants = Plant.create(:name => params[:name, :description => params[:description]])
        redirect to "/plants/#{plants.id}"
    end

    #displays a plant by id
    get '/plants/:id' do
        @plants = Plant.find(params[:id])
        erb :"plants/show"
    end

    #loads the form to edit plants
    get '/plants/:id/:edit' do
        @plants = Plant.find(params[:id])
        erb :"plants/edit"
    end

    #updates plants name and description by id and saves, then redirects to the show page
    patch '/plants/:id' do
        @plants = Plant.find(params[:id])
        @plants.name = params[:name]
        @plants.description = params[:description]
        @plants.save
        redirect to "/plants/#{@plants.id}"
    end

    #finds the plant in the database based on the id and deletes it, then redirects to the index page
    delete '/plants/:id' do
        @plants = Plant.find(params[:id])
        @plants.delete
        redirect to '/plants'
    end
    
end