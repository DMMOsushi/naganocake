class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:day]
      @orders = Order.created_today
    else
  	  @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end

  # 注文ステータスの更新
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.pay_confirm?
      @order.order_items.each do |order_item|
        order_item.waiting_production!
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
