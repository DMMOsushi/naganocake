class CartItem < ApplicationRecord
  belongs_to :public
  belongs_to :item
end
