class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User Saved!"
      redirect_to new_user_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    # puts params
    # @user = User.new
    @user = User.find_by_id(params[:id])

  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:success] = "User Updated!"
      redirect_to new_user_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
