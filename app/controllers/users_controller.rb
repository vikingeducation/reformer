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
      redirect_to new_user_path
    else
      render :new
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
