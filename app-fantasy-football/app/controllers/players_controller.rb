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
  
  patch '/articles/:id' do #Update action
    @player = Player.find_by_id(params[:id])
    @player.name = params[:name]
    @player.nfl_team = params[:nfl_team]
    @player.save
    redirect to "/players/#{@player.id}"
  end
  
  delete "/players/:id" do #delete/destroy action
    @player = Player.find_by_id(params[:id])
    @player.delete
    redirect to '/players'
  end
end