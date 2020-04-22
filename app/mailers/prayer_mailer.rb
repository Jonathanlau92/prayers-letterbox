class PrayerMailer < ApplicationMailer
  def send_prayer_email(prayer, email)
    @prayer = prayer
    @email = email
    mail(to: @email, subject: '[Prayer Request]')
  end

  def send_report_spam_email(prayer)
  	@prayer = prayer
  	mail(to: 'prayersletterbox@gmail.com', subject: '[Prayer has been reported spam]')
  end

  def send_multiple_prayers(prayers, email)
  	@prayers = prayers
  	@email = email
  	mail(to: @email, subject: '[Here are your prayer requests]')
  end
end
