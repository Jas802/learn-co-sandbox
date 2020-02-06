class CreatePLayers < ActiveRecord::Migration
def change
	create_table :players do |t|
	t.string :name
	t.string :position
	t.string :nfl_team
    end
  end
end