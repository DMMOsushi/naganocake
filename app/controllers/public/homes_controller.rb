class Public::HomesController < ApplicationController
  def top
    @public = current_public
    @items = Item.all
    @categories = Category.all
  end

  def about
  end
end
