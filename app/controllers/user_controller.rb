class UserController < ApplicationController
	def new

	end

	def create
		@user = User.new
		@user.username = view_context.fetch_user_param(:username)
		@user.email = view_context.fetch_user_param(:email)
		@user.password = view_context.fetch_user_param(:password)
		if @user.save
			flash[:notice] = "Post successfully created"
			redirect_to '/'
		else
			flash[:error] = "Sorry, there were errors with your submission!"
			render :new
		end
	end

private 
	def whitelisted_user_params 
		params.require(:user).permit(:username, :email, :password)
	end
end
