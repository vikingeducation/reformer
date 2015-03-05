class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to new_user_path
    else
      flash.now[:error] = 'You bungled it.'
      render :new
    end
  end

  def index
    @users = User.all
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
