class Admin::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
  end

  def update
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
