class Public::OrdersController < ApplicationController
  before_action :set_current_public

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(public_id: @public.id)
    @bill = (@cart_items.map { |cart_item| cart_item.item.tax_excluded_price * cart_item.cart_quantity }.sum * 1.08).floor
    # 現在の住所を使う場合
    if params[:order][:address_number] == '1'
      @order = Order.new(
        public_id: @public.id,
        postalcode: @public.postalcode,
        address: @public.address,
        destination: @public.last_name + @public.first_name,
        pay: params[:order][:pay]
      )
    # 配送先登録した住所を使う場合
    elsif params[:order][:address_number] == '2'
      address = Address.find(params[:order][:registered]) # params[:select]は選択した住所のid
      @order = Order.new(
        public_id: @public.id,
        postalcode: address.postalcode,
        address: address.address,
        destination: address.destination,
        pay: params[:order][:pay]
      )
    # 新しく住所を追加する場合
    elsif params[:order][:address_number] == '3'
      @order = Order.new(order_params)
    else
      @order = Order.new(order_params)
    end
    if @order.invalid?(:confirm)
      render :new
    end
  end

  def create
    # カートが空の場合
    if @public.cart_items.blank?
      redirect_to public_cart_items_path and return
    end
    @order = Order.new(order_params)
    @order.order_status=0

    if @order.save
      # 注文商品テーブルのレコードを作成
      @public.cart_items.map do |cart_item|
        OrderItem.create(
          order_id: @order.id,
          item_id: cart_item.item_id,
          item_quantity: cart_item.cart_quantity,
          production_status: 0,
          tax_included_price: (cart_item.item.tax_excluded_price * 1.08).floor
        )
      end
      # カートアイテムを空にする
      @public.cart_items.destroy_all
      redirect_to public_orders_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  def index
    @orders = current_public.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def set_current_public
    @public = current_public
  end

  def order_params
    params.require(:order)
    .permit(:postage, :bill, :pay, :destination, :address, :postalcode, :order_status)
    .merge(public_id: current_public.id)
  end

end
