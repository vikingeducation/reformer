class UsersController < ApplicationController
  before_action :check_params, only: [:create]
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_url, notice: "User successfully created!"
    else
      render :new
    end
  end

  private

  def check_params
    unless params[:user]
      params[:user] = {username: params[:username], email: params[:email], password: params[:password]}
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
