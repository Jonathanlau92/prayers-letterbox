class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "You have successfully setup your user's profile!"
    else
      redirect_to root_path, alert: "There was an error in setting up your user's profile. Please try again or contact admin."
    end
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :church, :current_life_stage, :name)
  end
end
