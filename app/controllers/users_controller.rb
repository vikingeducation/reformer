class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations on creating a new account!"
      @user = User.new
      render :new
    else
      flash[:error] = "Rats! There were errors when we tried to create your account..."
      render :new
    end
  end

  def user_params
    if params[:user].nil?
      params.permit(:username, :email, :password)
    else
      params.require(:user).permit(:username,:email,:password)
    end
  end
end
