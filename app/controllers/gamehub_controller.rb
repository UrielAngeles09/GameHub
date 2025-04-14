class GamehubController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
    redirect_to home_path if authenticated?
  end

  def home
    redirect_to new_session_path unless authenticated?

    if params[:platform].present?
      @selected_platform = params[:platform]
      @games = Game.all.select { |game| game.platform_list.include?(@selected_platform) }
    else
      @selected_platform = "All Platforms"
      @games = Game.all
    end
  end

  def dashboard
    redirect_to new_session_path unless authenticated?
  end
end
