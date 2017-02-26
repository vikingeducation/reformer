class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to action: 'new'
    end
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end



end
