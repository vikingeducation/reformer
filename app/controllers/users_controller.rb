class UsersController < ApplicationController
  def new
    render :new, locals: {
      email: user_params.fetch(:email, ''),
      username: user_params.fetch(:username, '')
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, locals: {
        email: user_params[:email],
        username: user_params[:username]
      }
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end
