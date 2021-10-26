class Admin::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    @category.save
    flash[:success] = "ジャンルを新規追加しました！"
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:success] = "ジャンルを更新しました"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
