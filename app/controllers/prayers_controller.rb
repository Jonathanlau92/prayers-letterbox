class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
  end

  def new
    @prayer = Prayer.new
  end

  def create
    @prayer = Prayer.new(prayer_params)
    @prayer.is_deleted = false
    @prayer.prayer_count = 0
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
    # Order by random then call the first instance. This is to prevent missing ID in between (for eg, if we delete prayer with ID=3)
    @prayer = Prayer.where(is_deleted: false).order("RANDOM()").first
  end

  def send_prayer_email
    id=params[:prayer]
    @prayer = Prayer.find(id)
    @prayer.increment(:prayer_count)
    if @prayer.save
      PrayerMailer.send_prayer_email(@prayer, params[:email]).deliver_later
      flash[:success] = "Your prayer request has been sent to your email."
      redirect_to root_path
    else
      flash[:alert] = "Error sending the email. Please try again later!"
      redirect_to root_path
    end
  end

  def report_spam
    @prayer = Prayer.find(params[:prayer_id])
    @prayer.is_deleted = true
    # Send email to admin email to report spam
    PrayerMailer.send_report_spam_email(@prayer).deliver_now
    if @prayer.save
      flash[:success] = "Admin will vet through your spam request."
      redirect_to root_path
    else
      flash[:alert] = "Error reporting spam. Please try again later."
      redirect_to root_path
    end
  end

  private
  def prayer_params
    params.require(:prayer).permit(:request, :user_particulars, :is_deleted, :prayer_count)
  end
end
