class UsersController < ApplicationController

def new
end

def create
  @user = User.new
  @user.email = params[:email]
  @user.username = params[:username]
  @user.password = params[:password]

  if @user.save
    redirect_to new_user_path
  else
    render :new
  end

end

end
