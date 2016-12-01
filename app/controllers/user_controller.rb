class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_validation)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

private

  def strong_validation
    params.permit(:username, :email, :password)
  end

end
