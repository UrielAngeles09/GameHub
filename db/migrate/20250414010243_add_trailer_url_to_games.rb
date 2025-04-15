class AddTrailerUrlToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :trailer_url, :string
  end
end
