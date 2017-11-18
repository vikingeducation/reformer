class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_url
    end
  end

  def show
    
  end

  def index
    @users = User.all
  end
end
