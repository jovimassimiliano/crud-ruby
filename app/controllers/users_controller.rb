class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Hello #{@user.username}, you've been successfully signed up"
      redirect_to suggestions_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You've been successfully updated"
      redirect_to suggestions_path
    else
      render "edit"
    end
  end
  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
