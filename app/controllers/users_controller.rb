class UsersController < ApplicationController

  def new
    @user = User.new
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
    if @user.update(white_list_user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(white_list_user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def white_list_user_params
      params.require(:user).permit(:username,:email,:password)
  end
end
