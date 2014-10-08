class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private

  def whitelisted_user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      params.permit(:username, :email, :password)
    end
  end
end
