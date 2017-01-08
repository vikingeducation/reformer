class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

    def get_params
      params[:user] ? user_params : nest_params
    end

    def nest_params
      {
        username: params[:username],
        email: params[:email],
        password: params[:password]
      }
    end

end
