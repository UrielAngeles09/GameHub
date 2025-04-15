class AddDetailsToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :buy_link, :string
    add_column :games, :easter_eggs, :text
  end
end
