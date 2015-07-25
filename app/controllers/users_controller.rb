class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params_hash)
    user.save!
    redirect_to users_path
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
    if @user.update(params_hash)
      redirect_to users_path
    else
      render :edit
    end

  end

  private

  def check_nest
    unless params[:user]
      params[:user] = {}
      params[:user][:password] = params[:password]
      params[:user][:email] = params[:email]
      params[:user][:username] = params[:username]
    end
  end

  def params_hash
    check_nest
    params.require(:user).permit(:email, :username, :password)
  end

end
