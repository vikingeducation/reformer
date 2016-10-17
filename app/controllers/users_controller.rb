class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(user_find)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(user_find)
  end

  def update
    @user = User.find(user_find)

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      
      render 'edit'
    end
  end

  private
  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
