class UsersController < ApplicationController

  def new
  end

  def create
    user = user.new(user_params)
  end
end


  private

    def user_params
      params.require(:user).permit()
    end
