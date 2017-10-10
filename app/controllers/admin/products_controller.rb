class Admin::ProductsController < ApplicationController
  layout 'admin_portal'

  def new
    @product = Product.new
  end
end