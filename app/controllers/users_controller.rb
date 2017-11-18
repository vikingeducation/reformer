class UsersController < ApplicationController
  include UsersHelper
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_url
    end
  end
end
