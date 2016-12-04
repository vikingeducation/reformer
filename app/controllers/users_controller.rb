class UsersController < ApplicationController
  def new
    # render html: 'Hello world'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success!"
      puts flash
      puts '!!'
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:success] = "Success!"
      render :new

    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
