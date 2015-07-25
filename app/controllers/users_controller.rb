class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "New user #{@user.username} was created!"
      redirect_to @user
    else
      render :new
    end
  end


  def whitelisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitelisted_user_params)
      flash[:success] = "User #{@user.username} was updated!"
      redirect_to user_path
    else
      render :edit
    end

  end

end
