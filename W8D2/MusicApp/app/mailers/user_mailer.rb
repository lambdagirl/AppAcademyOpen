class UserMailer < ApplicationMailer
  default from: 'ZPZ <admin@example.com>'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: "Welcome to 100DaysChallenge!")
  end

  def reminder_email(user)
  end
end
