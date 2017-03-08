class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You've been successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There is something wrong with your login information"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You've been logged out"
    redirect_to login_path
  end
end
