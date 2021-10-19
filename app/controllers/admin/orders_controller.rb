class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @admin = current
  end

  def update
  end

  private

  def order_params
    params.require(:order).params(:name)
  end

end
