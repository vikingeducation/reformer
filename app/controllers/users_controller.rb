class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(users_params)
			redirect_to user_path(@user.id)
		else
			render action: "edit"
		end
	end

	def create
		@user = User.new(users_params)
		if @user.save
			redirect_to new_user_path
		else
			render action: "new"
		end
	end

	def users_params
		if params[:user]
			params.require(:user).permit(:username, :email, :password)
		else
			params.permit(:username, :email, :password)
		end
	end
end
