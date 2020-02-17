class PlayersController < ApplicationController
  get "/players" do #displays players
    if_not_logged_in
    @players = Player.all
    erb :'players/index'
  end
  
  get "/players/new" do #Create action
    if_not_logged_in
    @error_message = params[:error]
    erb :'players/new'
  end
  
  get "/players/:id" do #Read action
    if_not_logged_in
    @player = Player.find(params[:id])
    erb :'players/show'
  end
  
  get "/players/:id/edit" do #Edit action/loads edit form
    if_not_logged_in
    @error_message = params[:error]
    @player = Player.find(params[:id])
    erb :'players/edit'
  end
  
  post "/players/:id" do #update action
    if_not_logged_in
    @player = Player.find(params[:id])
    unless Player.valid_params?(params)
      redirect "/players/#{@player.id}/edit?error=invalid"
    end
    @player.update(params.select{|p|p=="nfl_team"})
    redirect "/players/#{@player.id}"
  end
  
  delete "/players/:id" do #delete/destroy action
    @player = Player.find_by_id(params[:id])
    @player.delete
    redirect to '/players'
    end
  end