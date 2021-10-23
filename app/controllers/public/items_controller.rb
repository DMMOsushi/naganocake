class Public::ItemsController < ApplicationController
  
  def index
    @categories = Category.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
