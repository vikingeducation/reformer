class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(whitelist_new_user_input)
	if @user.save
		redirect_to user_path
	else
		render :new
	end
end

def show
end

private

def whitelist_new_user_input
	params.require(:user).permit(:name, :email, :password)
end

end
