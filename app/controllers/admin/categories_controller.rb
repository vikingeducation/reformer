class Admin::CategoriesController < ApplicationController
  layout 'admin_portal'

  def new
    @category = Category.new
  end
end