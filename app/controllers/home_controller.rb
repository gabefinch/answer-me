class HomeController < ApplicationController
  
  def index
  end

  def guest
    user = User.new(username: "guest@answer.me", password: "password")
    user.save
    session[:user_id] = @user.id
    flash[:notice] = 'You successfully registered!'
      redirect_to users_path
  end
end
