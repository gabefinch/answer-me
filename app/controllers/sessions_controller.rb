class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = 'You are logged in!'
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = 'Unsuccessful login attempt!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are now logged out.'
    redirect_to users_path
  end
end
