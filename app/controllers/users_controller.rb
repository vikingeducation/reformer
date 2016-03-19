class UsersController < ApplicationController

  def create
    if params_nested?
      @user = User.new(whitelisted_user_params)
    else
      @user = User.new(params.permit(:email,:username,:password))
    end
    if @user.save
      redirect_to @user
    else
      @message = "fail, try again"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def params_nested?
    params[:user]
  end

  def whitelisted_user_params
    params.require(:user).permit(:email,:username,:password)
  end

end
