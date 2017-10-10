class Admin::CategoriesController < ApplicationController
  layout 'admin_portal'

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      flash[:success] = "Created category #{@category.name}"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Couldn't create category."
      render :new
    end
  end

  private

  def cat_params
    params.require(:category).permit :name
  end
end