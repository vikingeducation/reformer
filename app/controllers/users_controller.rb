class UsersController < ApplicationController
  protect_from_forgery

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to "/users/new"
    else
      render 'new', :locals => {:user => @user}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end



  private
  def whitelisted_user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      params.permit(:username, :email, :password)
    end
  end

end
