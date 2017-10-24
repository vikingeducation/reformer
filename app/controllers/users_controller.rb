class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = create_user_with_params
    if @user.save
      redirect_to @user
    else # = this doesnt render with the info still in there :/
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path(@user)
  end


  def edit

  end



  private

  def whitelisted_params
    params.require(:user).permit(:username, :email, :password)
  end


  def create_user_with_params
    if params[:user].present?
      User.new(whitelisted_params)
    else
      User.new
    end
  end


end
