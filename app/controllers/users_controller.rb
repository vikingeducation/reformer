class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_post_params)
    if @user.save
      redirect_to new_user_path
    else
      redirect_to new_user_path(@user)
    end
  end

  def edit
     @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def whitelisted_post_params
    params.require(:user).permit(:username,:email,:password)
    # params.permit(:username,:email,:password)
  end
end
