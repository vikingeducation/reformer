class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      { email: params[:email],
        password: params[:password],
        username: params[:username] }
    end
  end
end
