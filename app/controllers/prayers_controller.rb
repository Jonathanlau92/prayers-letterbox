class PrayersController < ApplicationController
  def index
      @prayers = Prayer.all
  end

  def new

  end

  def show

  end

  private
  def prayer_params
    params.require(:prayer).permit(:request, :user_particulars, :is_deleted, :prayer_count)
  end
end
