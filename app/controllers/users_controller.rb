class UsersController < ApplicationController
  
  def new
  end

  def create 
    @user = User.new(whitelist_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  private

    def whitelist_params
      params.require(:user).permit(:username, :email, :password)  
    end



end
