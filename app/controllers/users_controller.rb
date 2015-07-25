class UsersController < ApplicationController

  def new

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
    params.require(:user).permit(:username,:email,:password)
  end
end
