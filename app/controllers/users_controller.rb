class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new( params[:user][:username], params[:user][:email] )
  end

  private
  def whitelisted_params
    params.require( :user ).permit( :username, :email, :password )
  end


end
