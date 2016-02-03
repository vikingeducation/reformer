class UsersController < ApplicationController
  before_action :nested_or_flat, only: [:create]


  def new
    @user = User.new
  end


  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "User '#{@user.username}' successfully created!"
      redirect_to new_user_path
    else
      flash.now[:error] = "Unable to create '#{@user.username}'"
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end






  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def nested_or_flat
    unless params[:user]
      params[:user] = {email: params[:email], username: params[:username], password: params[:password]}
    end
  end


end
