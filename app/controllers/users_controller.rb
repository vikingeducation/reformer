class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(params_hash)
    user.save!
    redirect_to new_user_path
  end


  private

  def params_hash
    params.require(:user).permit(:email, :username, :password)
  end
end
