class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(choose_user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(choose_user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private


  def choose_user_params
    if params[:user]
      user_params
    else
      flat_params
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def flat_params
     params.permit(:username, :password, :email)
  end
end
