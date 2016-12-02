class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User Saved!"
      redirect_to new_user_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
