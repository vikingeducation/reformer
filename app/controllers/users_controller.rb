class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    if params.key? :user
      params.require(:user).permit(:username, :email, :password)
    else
      {username: params[:username], password: params[:password], email: params[:email]}
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
