class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def user_params
    params[:user] ? whitelisted_user_params : {email: params[:email], username: params[:username], password: params[:password]}
  end


end
