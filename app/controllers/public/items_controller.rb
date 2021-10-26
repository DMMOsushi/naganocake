class Public::ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
    @public =current_public
  end

  def show
    @public = current_public
    @item = Item.find(params[:id])
    @categories = Category.all
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
