class Public::ItemsController < ApplicationController
  before_action :authenticate_public!, except: [:index, :show]

  def index
    @public = current_public
    @categories = Category.all
    @items = Item.all
    @total_items = @sell_items
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
  end
end
