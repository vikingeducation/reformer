class UsersController < ApplicationController

  def new

    @user = User.new

  end

  def create

    @user = User.new(whitelisted_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  private

  def whitelisted_params

    params.require(:user).permit(:username, :email, :password)

  end

end
