class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Created new user!"
    else
      flash.now[:alert] = "Failed to create user!"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Updated user!"
    else
      flash.now[:alert] = "Failed to update user!"
      render :edit
    end
  end

  private

  def user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      { username: params[:username], email: params[:email], password: params[:password] }
    end
  end
end
