class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = create_user_with_params
    if @user.save
      redirect_to new_user_path
    else # = this doesnt render with the info still in there :/
      render :new
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


end
