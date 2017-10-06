class UsersController < ApplicationController
  def new
    @user = User.new

    render :new, locals: {
      email: @user.email,
      username: @user.username
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, locals: {
        email: @user.email,
        username: @user.username
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
