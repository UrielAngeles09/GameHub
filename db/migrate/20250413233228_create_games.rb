class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :title
      t.date :release_date
      t.string :cover_url
      t.integer :steam_app_id

      t.timestamps
    end
  end
end
