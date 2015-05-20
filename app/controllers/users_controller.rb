class UsersController < ApplicationController
  include UsersHelper
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to action: :index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: :index
    else
      render :new
    end
  end
end
