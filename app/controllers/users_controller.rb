class UsersController < ApplicationController

  def new

    @user = User.new

  end

  def create

    @user = User.new(whitelisted_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  def index

    @users = User.all

  end

  def show

    @user = User.find(params[:id])

  end

  def destroy

    @user = User.find(params[:id]).destroy
    redirect_to users_path

  end

  def edit

    @user = User.find(params[:id])

  end

  def update

    @user = User.find(params[:id])

    if @user.update(whitelisted_params)
      redirect_to users_path
    else
      render :edit
    end

  end

  private

  def whitelisted_params

    params.require(:user).permit(:username, :email, :password)

  end

end
