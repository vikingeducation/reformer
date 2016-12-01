class UsersController < ApplicationController

	include UsersHelper

	def new

		@user = User.new

	end

	def index

		@users = User.all

	end

	def create

		@user = User.new( user_params(params[:user]) )

		if @user.save
			redirect_to user_path( @user )
		else
			render new_user_path
		end

	end

	def show

		@user = User.find( params[ :id ] )


	end


	def edit

		@user = User.find(params[:id])

	end

	def update

		@user = User.find(params[:id])

		@user.update(user_params( params[:user]))

		redirect_to action: 'index'

	end

end
