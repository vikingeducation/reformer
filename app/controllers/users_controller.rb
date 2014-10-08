class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render 'new'
    end
  end


  private

  def user_params
    params = check_flat_params
    params.require(:user).permit(:username, :email, :password)
  end

  def check_flat_params
    if params['user'].nil?
      params['user'] = {
        'username' => params['username'],
        'email' => params['email'],
        'password' => params['password']
      }
    end
    params
  end
end

