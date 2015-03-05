class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def whitelisted_user_params
    if params[:user]
      params.require(:user).permit(:email, :username, :password)
    else
      { email: params[:email],
        username: params[:username],
        password: params[:password] }
    end
  end
end
