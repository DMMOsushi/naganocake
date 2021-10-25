class Public::ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @items = Item.page(params[:page]).per(1)
    @public = current_public
  end

  def show
    @public = current_public
    @item = Item.find(params[:id])
    @categories = Category
    @cart_item = current_public.cart_items.new if public_signed_in?
  end
end
