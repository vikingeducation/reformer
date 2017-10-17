class Admin::UsersController < ApplicationController
  layout 'admin_portal'

  def index
    render :index, locals: { users: User.all }
  end
end