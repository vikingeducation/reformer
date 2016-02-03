class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create 
    @user = User.new(whitelist_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(whitelist_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

    def whitelist_params
      params.require(:user).permit(:username, :email, :password)  
    end



end
