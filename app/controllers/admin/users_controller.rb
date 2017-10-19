class Admin::UsersController < ApplicationController
  layout 'admin_portal'

  def index
    users = User.all.map { |user| ::UserDecorator.new(user) }
    render :index, locals: { users: users }
  end

  def show
    user = User.find params[:id]
    render :show, locals: { user: UserDecorator.new(user) }
  end

  def new
    render :new, locals: { user: User.new }
  end

  def create
    user = User.new user_params

    if user.save
      flash[:success] = "Created user #{user.first_name}"
      redirect_to admin_user_path(user)
    else
      flash[:danger] = "Couldn't create user"
      render :new, locals: { user: user }
    end
  end

  def edit
    user = User.find params[:id]
    render :edit, locals: { user: UserDecorator.new(user) }
  end

  def update
    user = UserDecorator.new(User.find(params[:id]))

    if user.update_attributes user_params
      flash[:success] = "Updated user #{user.full_name}"
      redirect_to admin_user_path(user)
    else
      flash[:danger] = "Couldn't update user #{user.full_name}"
      render :edit, locals: { user: user }
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      flash[:success] = "User #{user.first_name} #{user.last_name} deleted"
      redirect_to admin_users_path
    else
      flash[:danger] = "Couldn't delete user"
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit [:first_name, :last_name, :email, :phone]
  end
end