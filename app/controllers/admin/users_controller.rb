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

  private

  def user_params
    params.require(:user).permit [:first_name, :last_name, :email, :telephone]
  end
end