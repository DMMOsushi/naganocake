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

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを更新しました"
      redirect_to admin_orders_path
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
