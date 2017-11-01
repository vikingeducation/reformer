class Admin::CategoriesController < ApplicationController
  layout 'admin_portal'

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
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

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    old_name = @category.name

    if @category.update_attributes(cat_params)
      flash[:success] = "Updated category #{old_name} to #{@category.name}"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Couldn't edit category."
      render :edit
    end
  end

  def destroy
    if Category.find(params[:id]).destroy
      flash[:success] = 'Category deleted.'
      redirect_to admin_categories_path
    else
      flash[:danger] = "Couldn't delete category."
      redirect_to :back
    end
  end

  private

  def cat_params
    params.require(:category).permit :name
  end
end