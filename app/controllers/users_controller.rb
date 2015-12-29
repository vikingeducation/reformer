class UsersController < ApplicationController
  before_action :check_params, only: [:create]
  before_action :set_user, only: [:show]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User successfully created!"
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_params
    unless params[:user]
      params[:user] = {username: params[:username], email: params[:email], password: params[:password]}
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
