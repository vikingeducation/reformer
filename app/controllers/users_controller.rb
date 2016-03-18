class UsersController < ApplicationController

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to @user
    else
      @message = "fail, try again"
      render :new
    end
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def whitelisted_user_params
    params.require(:user).permit(:email,:username,:password)
  end

end
