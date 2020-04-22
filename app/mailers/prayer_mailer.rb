class PrayerMailer < ApplicationMailer
  def send_prayer_email(prayer, email)
    @prayer = prayer
    @email = email
    mail(to: @email, subject: '[Prayer Requests]')
  end

  def send_report_spam_email(prayer)
  	@prayer = prayer
  	mail(to: 'prayersletterbox@gmail.com', subject: '[Prayer has been reported spam]')
  end
end
