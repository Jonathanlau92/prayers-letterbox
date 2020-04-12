class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
  end

  def new
    @prayer = Prayer.new
  end

  def create
    @prayer = Prayer.new(prayer_params)
    @prayer.is_deleted=false
    @prayer.prayer_count=0
    @prayer.user_particulars = {
      name: params[:your_name]
    }
    if @prayer.save
      flash[:success] = "Your prayer request has been received."
      redirect_to root_path
    else
      flash[:alert] = "There was an error in submitting your prayer request. Please try again!"
      render :new
    end
  end

  def show
    @prayer = Prayer.find(rand(1..Prayer.count))
    
  end

  def send_prayer_email
    @prayer = Prayer.find(params[:prayer])
    PrayerMailer.send_prayer_email(@prayer, params[:email]).deliver_now
    flash[:success] = "Your prayer request has been sent to your email."
    redirect_to root_path
  end

  private
  def prayer_params
    params.require(:prayer).permit(:request, :user_particulars, :is_deleted, :prayer_count)
  end
end
