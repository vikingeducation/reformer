class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created!'
      redirect_to users_path
    else
      flash.now[:error] = 'Error: user not created'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated!'
      redirect_to @user
    else
      flash.now[:error] = 'Error: user not updated'
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
