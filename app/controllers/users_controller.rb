class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = 'New user created'
      redirect_to users_path
    else
      flash.now[:error] = 'User was not created'
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
    if @user.update(whitelisted_params)
      flash[:success] = 'User updated'
      redirect_to users_path
    else
      flash.now[:error] = 'User was not updated'
      render :edit
    end
  end

  def delete

  end

  private

  def whitelisted_params
    params.require(:user).permit(:username, :email, :password)
  end

end
