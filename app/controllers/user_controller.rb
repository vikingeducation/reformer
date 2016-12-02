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

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(strong_validation)
      redirect_to @user
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

private

  def strong_validation
    params.require(:user).permit(:username, :email, :password)
  end

end
