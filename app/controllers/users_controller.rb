class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted)
    if @user.save
      redirect_to new_user_path
      #Insert code
    else
      flash.now[:error]
      render :new
    end
  end

  private

  def permitted
    # if params[:user]
    #   params.require(:user).permit(:email, :username, :password)
    # else
    #   { email: params[:email],
    #     username: params[:username],
    #     password: params[:password] }
    # end
    params.require(:user).permit(:username, :email, :password)
  end
end
