class UserMailer < ActionMailer::Base
  default from: "me@me.com"

  def signup_confirmation(user)
    @user = user
    mail to: "gabefinch@gmail.com", subject: "You've got mail!"
  end

  def responded(response)
    @response = response
    @question = response.question
    @user = @question.user
    mail to: @user.username, subject: "You've got a response on Smaug Lavaflow!"
  end

end
