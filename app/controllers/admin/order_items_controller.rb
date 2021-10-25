class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order_item.order.order_items
    @order_item.update(order_item_params)
    if @order_item.in_production?
      @order.in_production!
    elsif @order_items.count == @order_items.complete.count
      @order.in_preparation!
      render 'show'
    end
    redirect_to admin_order_path(@order_item.order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
