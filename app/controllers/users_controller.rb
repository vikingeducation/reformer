class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    redirect_to new_user_path
  end

end
