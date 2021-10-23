class Public::ItemsController < ApplicationController
  
  def index
<<<<<<< HEAD
    
=======
    @categories = Category.all
    @items = Item.all
>>>>>>> 805066958a8889f17252b8e5d48751d8216b4532
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
