class Public::HomesController < ApplicationController
  def top
    @public = current_public
    @items = Item.all
  end

  def about
  end
end
