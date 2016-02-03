class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    nest_flat_tags

    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = 'New user created'
      redirect_to new_user_path
    else
      flash.now[:error] = 'User was not created'
      render :new
    end
  end

  private

  def whitelisted_params
    params.require(:user).permit(:username, :email, :password)
  end

end
