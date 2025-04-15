class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]  # Skip for new and create actions

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to root_path  # Redirect after successful sign-up
    else
      render :new  # If errors, render the new user page again
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
