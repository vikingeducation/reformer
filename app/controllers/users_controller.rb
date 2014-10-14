class UsersController < ApplicationController

def index
  @users = User.all
end

def new
  @user = User.new
end

def edit
  @user = User.find(params[:id])
end

def create
  @user = User.new(whitelisted_user_params)

  if @user.save
    redirect_to root_path
  else
    flash.now[:notice] = "Oh no!!!!!"
    render :new
  end

end

def update
  @user = User.find(params[:id])
  if @user.update(whitelisted_user_params)
    redirect_to root_path
  else
    flash.now[:notice] = "You're very crappy at CRUD."
    render :edit
  end

end

private

# Works for flat params and nested params
def whitelisted_user_params
  if params[:user]
    params.require(:user).permit(:email, :username, :password)
  else
    { :email => params[:email],
      :username => params[:username],
      :password => params[:password] }
  end
end

end
