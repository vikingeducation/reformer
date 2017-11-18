class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_url
    else
      render "new"
    end
  end

  def show

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render "edit"
    end
  end
end
