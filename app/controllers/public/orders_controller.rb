class Public::OrdersController < ApplicationController
  before_action :move_to_signed_in

  def new
    @order = Order.new
  end

  def confirm

  end

  def create

  end

  def thanks
  end

  def index
    @orders = current_public.orders.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end

   private

  def order_params
    params.require(:order).permit(:postage, :bill, :pay, :destination, :address, :postalcode, :order_status, :public_id)
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
