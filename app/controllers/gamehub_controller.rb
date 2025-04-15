class GamehubController < ApplicationController
  allow_unauthenticated_access only: :index
  before_action :set_current_user

  def index
    redirect_to home_path if authenticated?
  end

  def home
    redirect_to new_session_path unless authenticated?

    @selected_platform = params[:platform] || "All Platforms"
    @games = if params[:platform].present?
               Game.all.select { |game| game.platform_list.include?(@selected_platform) }
             else
               Game.all
             end
  end

  def gamedetails
    # Optional: Add logic here to fetch a specific game by ID if needed
  end

  def dashboard
    redirect_to new_session_path unless authenticated?

    @notifications = @current_user&.notifications || []
    @watch_list_games = @current_user&.watch_list_games || []
  end

  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
