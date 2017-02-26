class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: 'new'
    end
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def user_params
    params[:user] ? whitelisted_user_params : {email: params[:email], username: params[:username], password: params[:password]}
  end


end
