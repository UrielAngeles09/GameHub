class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @watch_list_games = current_user.watched_games.order(:release_date)
    @notifications = current_user.notifications.order(created_at: :desc).limit(10)
  end
end