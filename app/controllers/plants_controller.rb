class PlantsController < ApplicationController

    #allows the view to access all the articles in the database through the instance variable
    get '/plants' do
        if logged_in?
            @plants = Plant.all 
            erb :'plants/index'
        else 
            redirect "/"
        end
    end

    #loads the form to create a new plant
    get '/plants/new' do 
        if !logged_in?
            redirect "/login"
        else 
            erb :'plants/new'
        end
    end
    
    #creates a new plants based on the params and saves to the database
    post '/plants' do
        @plants = Plant.create(:name => params[:name], :description => params[:description], :water => params[:water])
        @plants.user = current_user
        @plants.save
        redirect "/plants/#{@plants.id}"
    end

    #displays a plant by id
    get '/plants/:id' do
            @plants = Plant.find(params[:id])
            erb :'plants/show'
    end

    #loads the form to edit plants
    get '/plants/:id/edit' do
        if !logged_in?
            redirect "/login"
        else
            #binding.pry
            plant = Plant.find_by(params[:id])
            if plant.user == current_user #.plants.find_by(params[:id])
                erb :'plants/edit'
            else 
                redirect "/plants"
            end
        end
    end

    #updates plants name and description by id and saves, then redirects to the show page
    patch '/plants/:id' do
        @plants = Plant.find(params[:id])
        @plants.name = params[:name]
        @plants.description = params[:description]
        @plants.water = params[:water]
        @plants.save
        redirect "/plants/#{@plants.id}"
    end

    #finds the plant in the database based on the id and deletes it, then redirects to the index page
    delete '/plants/:id' do
        @plants = Plant.find(params[:id])
        @plants.delete
        redirect "/plants"
    end
    
end