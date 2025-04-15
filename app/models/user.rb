class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # For the Notifications
  has_many :watch_list_items
  has_many :watched_games, through: :watch_list_items, source: :game
  has_many :notifications

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
