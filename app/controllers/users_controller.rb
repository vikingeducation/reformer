class UsersController < ApplicationController

  def create
    @user = User.new(whitelisted_user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    # First gotta find the user that we want to update
    @user = User.find(params[:id])

    # updating user with params
    @user.update_attributes(whitelisted_user_params)

    # Ternary fun: if we can save, we'll redirect to user_path, else it's time to render the edit page again.
    @user.save ? (redirect_to user_path) : (render :edit)
  end

  private

  # Sweet ternary method used here. If params[:user] exists (aka nested) then we gonna run that params.require... else we're running params.permid...
  def whitelisted_user_params
    params[:user] ? params.require(:user).permit(:email,:username,:password) : params.permit(:email,:username,:password)
  end

end
