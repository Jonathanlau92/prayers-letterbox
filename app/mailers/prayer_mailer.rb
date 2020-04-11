class PrayerMailer < ApplicationMailer
  def prayer_email(prayer)
    @prayer = prayer
    
  end
end
