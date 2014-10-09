class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(whitelisted_user_params)
		if @user.save
			redirect_to users_path
			flash[:success] = "Congratulations on creating a new account!" # how to make work?
		else
			render '/users/new'
		end
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(whitelisted_user_params)
			flash[:success] = "Congratulations on creating a new account!" # how to make work?
			redirect_to users_path
		else
			render edit_user_path
		end
	end

	private
	def whitelisted_user_params
		params.require(:user).permit(:username,:email,:password)
	end

end
