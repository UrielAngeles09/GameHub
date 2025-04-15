class AddPlatformsToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :platforms, :string
  end
end
