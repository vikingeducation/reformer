class UsersController < ApplicationController
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

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(whitelisted_user_params)
    else
      render :edit
    end
  end

  def at
    @auth_token = form_authenticity_token
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
