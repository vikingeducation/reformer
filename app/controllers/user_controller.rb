class UserController < ApplicationController
	def new

	end

	def create
		@user = User.new
		@user.username = params["user"][:username]
		@user.email = params["user"][:email]
		@user.password = params["user"][:password]
		if @user.save
			redirect_to '/'
		else
			render :new
		end
	end

private 
	def whitelisted_user_params 
		params.require(:user).permit(:username, :email, :password)
	end
end
