class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(whitelist_new_user_input)
	if @user.save
		redirect_to user_path(@user)
	else
		render :new
	end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(whitelist_new_user_input)
    redirect_to users_path
  else
    render :edit
  end
end

def index
  @user=User.all
end

def show
  @user = User.find(params[:id])
end

private

def whitelist_new_user_input
	params.require(:user).permit(:username, :email, :password)
end

end
