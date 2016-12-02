class UsersController < ApplicationController
  before_action :prepared_params, only: [:create]

  def index
    @users = User.all.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(prepared_params)
    if @user.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :root
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def prepared_params
    if params[:user]
      prepared_params = user_params
    else
      prepare_params = {
        username: params[:username],
        email: params[:email],
        password: params[:password]
      }
    end
  end
end
