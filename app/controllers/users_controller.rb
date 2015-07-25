class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "New user #{@user.username} was created!"
      redirect_to new_user_path
    else
      render :new
    end
  end


  def whitelisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
