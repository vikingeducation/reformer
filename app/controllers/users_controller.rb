class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = user_params_or_nah
    if @user.save
      flash[:success] = "The user was created! :)"
      redirect_to new_user_path
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_params_or_nah
    if !params[:user].nil?
      User.new(user_params)
    else
      User.new(username: params[:username],
               email: params[:email],
               password: params[:password])
    end
  end
end
