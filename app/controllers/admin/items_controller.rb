class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    flash[:success] = "商品を新規登録しました"
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
<<<<<<< HEAD
    
=======
    @categories = category.all
>>>>>>> 893b8de522d4f7035facefa2185f57fe804be5d0
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:success] = "商品を更新しました"
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :tax_excluded_price, :category_id, :sale_status)
  end


end

