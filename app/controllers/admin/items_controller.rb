class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
<<<<<<< HEAD
    @items = Item.page(params[:page]).per(6)
=======
    @items = Item.page(params[:page]).per(8)
>>>>>>> d38db987cc5df658b13cae9ea110ff45eea0f580
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :tax_excluded_price, :category_id, :sale_status)
  end


end

