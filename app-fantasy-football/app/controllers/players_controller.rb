class PlayersController < ApplicationController
  get "/players" do
    if_not_logged_in
    @players = Players.all
    erb :'players/index'
  end
end