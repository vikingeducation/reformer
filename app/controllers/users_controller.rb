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
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(whitelisted_user_params)
      redirect_to users_path
    else
      render :edit
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
