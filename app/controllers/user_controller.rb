class UserController < ApplicationController
	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(id = params[:id])
	end

	def update
		@user = User.find(id = params[:id])
		@user.username = view_context.fetch_user_param(:username)
		@user.email = view_context.fetch_user_param(:email)
		@user.password = view_context.fetch_user_param(:password)
		if @user.save
			flash[:notice] = "User successfully updated"
			redirect_to :user_index
		else
			flash[:error] = "Sorry, there were errors with your submission!"
			render :edit
		end
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
