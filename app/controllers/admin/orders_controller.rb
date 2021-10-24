class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを更新しました"
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).params(:order_status)
  end

end
