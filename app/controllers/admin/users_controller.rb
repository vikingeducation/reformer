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
end