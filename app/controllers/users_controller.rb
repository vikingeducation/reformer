class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(nested_params)

    if @user.save
      flash[:success] = "Can do it"
      redirect_to new_user_path
    else
      flash.now[:error] = "Can't do it"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(nested_params)

    if @user.save
      flash[:success] = "Can do it"
      redirect_to new_user_path
    else
      flash.now[:error] = "Can't do it"
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def nested_params
    unless params.keys.include?("user")
      params[:user] = {username: params["username"], email: params["email"], password: params["password"]}
    end
    user_params
  end

end

