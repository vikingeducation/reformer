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

  def update
    # First gotta find the user that we want to update
    @user = User.find(params[:id])

    # now i'm assigning params to the user
    if params_nested?
      @user.email = params[:user][:email]
      @user.username = params[:user][:username]
      @user.password = params[:user][:password]
    else
      @user.email = params[:email]
      @user.username = params[:username]
      @user.password = params[:password]
    end

    if @user.save
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def params_nested?
    params[:user]
  end

  def whitelisted_user_params
    params.require(:user).permit(:email,:username,:password)
  end

end
