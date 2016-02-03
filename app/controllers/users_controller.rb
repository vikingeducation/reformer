class UsersController < ApplicationController


  def new
    @user = User.new
  end


  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "User '#{@user.username}' successfully created!"
      redirect_to new_user_path
    else
      flash.now[:error] = "Unable to create '#{@user.username}'"
      render :new
    end
  end






  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
