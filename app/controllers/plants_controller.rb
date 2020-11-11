class PlantsController < ApplicationController

    get '/plants' do
        if logged_in? 
            @plants = Plant.all
            erb :'plants/index'
        else  
            redirect "/"
        end
    end

    get '/plants/new' do
        if !logged_in?
            redirect "/login"
        else  
            erb :'plants/new'
        end
    end
    
    post '/plants' do
        @plant = current_user.plants.create(:name => params[:name], :description => params[:description], :water => params[:water])
       # @plants = Plant.create(:name => params[:name], :description => params[:description], :water => params[:water])
       # @plants.user_id = current_user.id
      #  @plants.save
        redirect "/plants/#{@plants.id}"
    end

    get '/plants/:id' do
            @plants = Plant.find(params[:id])
            erb :'plants/show'
    end

    get '/plants/:id/edit' do
        if !logged_in?
            redirect "/login"
        else
            edit_by_user
        end
    end

    patch '/plants/:id' do
        @plants = Plant.find(params[:id])
        @plants.name = params[:name]
        @plants.description = params[:description]
        @plants.water = params[:water]
        @plants.save
        redirect "/plants/#{@plants.id}"
    end

    delete '/plants/:id/delete' do
      plant = Plant.find(params[:id])
      if plant.user == current_user 
          plant.delete
      end
      redirect "/plants"
    end
    
end