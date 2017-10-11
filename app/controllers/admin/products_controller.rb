class Admin::ProductsController < ApplicationController
  layout 'admin_portal'

  def index
    @products = Product.all
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

  def show
    @product = Product.find params[:id]
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    old_name = @product.name

    if @product.update_attributes(prod_params)
      flash[:success] = "Updated product #{old_name} to #{@product.name}"
      redirect_to admin_products_path
    else
      flash[:danger] = "Couldn't edit product."
      render :edit
    end
  end

  private

  def prod_params
    params.require(:product).permit :name, :price, :category_id
  end
end