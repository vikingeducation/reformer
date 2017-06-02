class UsersController < ApplicationController

  def new
    # @message = "Hello, world!"
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "Wanna buy an axe?"
      redirect_to :users_new
    else
      flash[:error] = "Signup failed because REASONS."
      render :new
    end
  end

  def edit(@user.whitelisted_user_params) # check this!
    if @user.save
      flash[:success] = "Wanna buy an axe?"
      redirect_to :users_new
    else
      flash[:error] = "Signup failed because REASONS."
      render :new
    end
  end

  private

  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end


end
