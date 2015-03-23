class UserMailer < ActionMailer::Base
  default from: "me@me.com"

  def signup_confirmation(user)
    @user = user
    mail to: "gabefinch@gmail.com", subject: "You've got mail!"
  end

end
