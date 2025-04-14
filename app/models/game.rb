class Game < ApplicationRecord
    has_many :watch_list_items
    has_many :watching_users, through: :watch_list_items, source: :user
  end