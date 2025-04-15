class AddSteamAppIdToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :steam_app_id, :string
  end
end
