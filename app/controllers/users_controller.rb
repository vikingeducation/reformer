class UsersController < ApplicationController

  def new
    @user = create_user_with_params
  end


  def create
    @user = create_user_with_params
    if @user.save
      redirect_to @user
    else # on new this isn't rendering properly
      render :new
    end
  end


  def show
    find_user
  end


  def index
    @users = User.all
  end

  def destroy
    find_user
    @user.destroy
    redirect_to users_path(@user)
  end


  def edit
    find_user
  end


  def update
    find_user
    if @user.update(whitelisted_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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


  def find_user
    @user = User.find(params[:id])
  end


end
