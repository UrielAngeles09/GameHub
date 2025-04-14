class GamehubController < ApplicationController

  allow_unauthenticated_access only: :index

  def index
    redirect_to home_path if authenticated?
  end
  
  def home 
    redirect_to home_path unless authenticated?
  end

  def gamedetails

  end

  def dashboard
    redirect_to new_session_path unless authenticated?
  end
end
