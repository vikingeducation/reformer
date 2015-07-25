class UsersController < ApplicationController

def new
	@user = User.new
end

def index
  @user=User.all
end

def update
  @user = User.find(params[:id])

  if @user.update(whitelist_new_user_input)
    flash.notice = "User '#{@user.username}' updated"
    redirect_to user_path(@user)
  else
    render :edit
  end
end

def edit
  @user = User.find(params[:id])
  
end

def create
	@user = User.new(whitelist_new_user_input)
	if @user.save
		redirect_to user_path(@user)
	else
		render :new
	end
end

def show
  @user = User.find(params[:id])
end

private

def whitelist_new_user_input
	if params[:username].nil?
    params.require(:user).permit(:username, :email, :password)
    
	else
		params.permit(:username, :user, :password)
	end
end

end
