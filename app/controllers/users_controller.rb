class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(get_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

    def get_params
      params[:user] ? user_params : nest_params
    end

    def nest_params
      {
        username: params[:username],
        email: params[:email],
        password: params[:password]
      }
    end

end
