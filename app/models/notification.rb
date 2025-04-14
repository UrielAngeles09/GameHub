class Notification < ApplicationRecord
  belongs_to :user

  validates :external_id, uniqueness: { scope: :user_id }
end