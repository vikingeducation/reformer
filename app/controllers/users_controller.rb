class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(whitelisted_params)
		if @user.save
		   redirect_to new_user_path
		else
		   render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(whitelisted_params)
		   redirect_to user_path
		else
		   render :edit
		end
	end

	def index
		@users = User.all
	end


	private

	def whitelisted_params
		params.require(:user).permit(:username, :email, :password)
	end
end
