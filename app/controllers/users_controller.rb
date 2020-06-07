class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :add_friends]

  def index
    @users = User.all
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "You have successfully setup your user's profile!"
    else
      redirect_to root_path, alert: "There was an error in setting up your user's profile. Please try again or contact admin."
    end
  end

  def show
  end

  def add_friends
    @friend = User.find(params[:user_id])
    if current_user.friend_request(@friend)
      redirect_to user_path(current_user.id), notice: 'Successfully requested for friend'
    else
      redirect_to root_path, alert: 'Ok it failed. No luck.'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :church, :current_life_stage, :name, :profile_image)
  end
end
