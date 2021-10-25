class Public::ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
<<<<<<< HEAD
    @items = Item.page(params[:page]).per(8)
=======
    @items = Item.page(params[:page]).per(1)
    @public = current_public
>>>>>>> d09a42053f698a630bda7aa8feddad714ec8a327
  end

  def show
    @public = current_public
    @item = Item.find(params[:id])
    @categories = Category
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
