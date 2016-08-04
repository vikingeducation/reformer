class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Great Job!"
      redirect_to new_user_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

end
