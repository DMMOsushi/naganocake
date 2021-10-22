class Public::CartItemsController < ApplicationController
  def index
    @public = current_public
    @sum = 0
    @items = Item.all
  end

  def update
  end

  def destroy
  end

  def create
    @cart_item = current_public.cart_items.new(cart_item_params)
    @cart_item.public_id = current_public.id
    if current_public.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_public.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_quantity = @cart_item.cart_quantity + cart_item.cart_quantity
      cart_item.update(cart_quantity: @cart_quantity)
      redirect_to public_params_cart_items_url(@cart_item.public)
    elsif
      @cart_item.save
      redirect_to public_cart_items_url(@cart_item.public)
    else
      redirect_to items_url
    end
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :public_id, :cart_quantity)
  end
end
