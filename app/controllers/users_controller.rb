class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #@user = User.new(whitelisted_params)
    @user = User.new(parse_params(params))

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

  def parse_params(passed_params)
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      params.permit(:username, :email, :password)
    end
  end

end
