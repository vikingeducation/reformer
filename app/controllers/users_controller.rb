class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show

  end

  def create
    @user = User.new(white_list_user_params)
    p @user
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def white_list_user_params
    if params[:username]
      params.permit(:username,:email,:password)
    else
      params.require(:user).permit(:username,:email,:password)
    end
  end
end
