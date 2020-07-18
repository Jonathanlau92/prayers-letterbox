class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :add_friends, :accept_request, :block_request]

  def index
    @users = User.all
  end

  def edit
    
  end

  def update
    if @user.update!(user_params)
      redirect_to root_path, notice: "You have successfully setup your user's profile!"
    else
      redirect_to root_path, alert: "There was an error in setting up your user's profile. Please try again or contact admin."
    end
  end

  def show
  end

  def add_friends
    @friend = User.find(params[:user_id])
    current_user.friend_request(@friend)
    respond_to do |format|
      format.json { render json: { friend_name: @friend }, status: :ok, friend: @friend.name }
    end
  end

  def accept_request
    @friend = User.find_by(id: params[:friend_id])
    if current_user.accept_request(@friend)
      redirect_to user_path(current_user.id), notice: 'Accept friend request!'
    else
      redirect_to root_path, alert: 'Accepting friend request has failed. Please contact admin'
    end
  end

  def block_request
    @friend = User.find_by(id: params[:block_id])
    if current_user.block_friend(@friend)
      redirect_to user_path(current_user.id), notice: 'Blocked friend request successfully!'
    else
      redirect_to root_path, alert: 'Blocked friend request has failed. Please contact admin!'
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
