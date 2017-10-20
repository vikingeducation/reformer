class UsersController < ApplicationController
  protect_from_forgery

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      redirect_to "/users/new"
    else
      render 'new', :locals => {:user => @user}
    end
  end



  private
  def whitelisted_params
    params.permit(:username, :email, :password)
  end

# require(params)

end
