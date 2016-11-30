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
			redirect_to new_user_path
		end

	end

	def show

		@user = User.find( params[ :id ] )


	end



end
