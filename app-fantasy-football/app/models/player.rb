class Player < ActiveRecord::Base
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:nfl_team].empty?
  end
end