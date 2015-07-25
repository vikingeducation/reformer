class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.new(params_hash)
    user.save!
    redirect_to new_user_path
  end


  private

  def check_nest
    unless params[:user]
      params[:user] = {}
      params[:user][:password] = params[:password]
      params[:user][:email] = params[:email]
      params[:user][:username] = params[:username]
    end
  end

  def params_hash
    check_nest
    params.require(:user).permit(:email, :username, :password)
  end

end
