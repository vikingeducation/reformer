class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to new_user_path
    else
      flash.now[:error] = "There are some errors with your input."
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitelisted_user_params)
      redirect_to user_path
    else
      flash.now[:error] = "There are some errors with your input."
      render :edit
    end
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
