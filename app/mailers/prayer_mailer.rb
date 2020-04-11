class PrayerMailer < ApplicationMailer
  def send_prayer_email(prayer, email)
    @prayer = prayer
    @email = email
    mail(to: @email, subject: '[Prayer Requests]')
  end
end
