class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(parse_params(params))

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

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

    if @user.update(parse_params(params))
      redirect_to users_path
    else
      render :edit
    end

  end



  private


  def whitelisted_params
    params.require(:user).permit(:username, :email, :password)
  end


  def parse_params(passed_params)
    if params[:user]
      whitelisted_params
    else
      params.permit(:username, :email, :password)
    end
  end

end
