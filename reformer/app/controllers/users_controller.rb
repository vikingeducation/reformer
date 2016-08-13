class UsersController < ApplicationController
  def new
  end

  def create
    if nested_params?
      @user = User.new(whitelisted_params)
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    end

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def whitelisted_params
    params.require(:user).permit(:username, :email, :password)
  end 

  def nested_params?
    !!params[:user]
  end
end
