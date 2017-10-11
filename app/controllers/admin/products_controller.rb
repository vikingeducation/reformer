class Admin::ProductsController < ApplicationController
  layout 'admin_portal'

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new prod_params

    if @product.save
      flash[:success] = "Created product #{@product.name}"
      redirect_to admin_products_path
    else
      flash[:danger] = "Couldn't create product"
      render :new
    end
  end

  private

  def prod_params
    params.require(:product).permit :name, :price, :category_id
  end
end