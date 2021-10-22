class Public::OrdersController < ApplicationController
  before_action :move_to_signed_in

  def new
    @order = Order.new
  end

  def confirm
  end

  def create
    cart_items = current_public.cart_items.all
    @order = current_public.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.order_quantity = cart.quantity
        order_item.price = cart.item.taxin_price
        order_item.order_id = @order.id
        order_item.item_id = cart.item_id
        order_item.save
      end
      redirect_to public_orders_thanks

    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def thanks
  end

  def index

  end

  def show
  end

   private

  def order_params
    params.require(:order).permit(:postage, :bill, :pay, :destination, :address, :postal_code, :order_status, :public_id)
  end

  def address_params
    params.require(:order).permit(:destination, :address, :postalcode)
  end

  def move_to_signed_in
    unless public_signed_in?
      redirect_to new_public_session_path
    end
  end

end
