class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if nested_user_params?
      @user = User.new(nested_whitelisted_user_params)
    else
      @user = User.new(flat_whitelisted_user_params)
    end

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(nested_whitelisted_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def nested_user_params?
    params.has_key?("user")
  end

  def nested_whitelisted_user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def flat_whitelisted_user_params
    params.permit(:username, :password, :email)
  end
end
