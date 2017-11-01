class UsersController < ApplicationController
  def new
    @user = User.new

    render :new, locals: {
      email: @user.email,
      first_name: @user.first_name,
      last_name: @user.last_name,
      errors: []
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, locals: {
        email: @user.email,
        first_name: @user.first_name,
        last_name: @user.last_name,
        errors: @user.errors.full_messages
      }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
