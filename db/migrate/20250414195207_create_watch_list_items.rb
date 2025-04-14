class CreateWatchListItems < ActiveRecord::Migration[8.0]
  def change
    create_table :watch_list_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
