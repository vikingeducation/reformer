class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  #@user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
  @user = User.new(whitelisted_user_params)
  if @user.save
    redirect_to new_user_path
  else
    flash[:notice] = "Oh no!!!!!"
    render :new
  end

end

private

def whitelisted_user_params
  params.require(:user).permit(:email, :username, :password)
end

end
