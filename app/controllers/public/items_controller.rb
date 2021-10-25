class Public::ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
<<<<<<< HEAD
    @public =current_public
=======
    @public = current_public
>>>>>>> d38db987cc5df658b13cae9ea110ff45eea0f580
  end

  def show
    @public = current_public
    @item = Item.find(params[:id])
    @categories = Category
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
