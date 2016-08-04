class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(nested_params)

    if @user.save!
      redirect_to new_user_path
    else
      render :new
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

