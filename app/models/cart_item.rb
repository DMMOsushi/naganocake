class CartItem < ApplicationRecord
  belongs_to :public
  belongs_to :item

  validates :public_id, :item_id, :cart_quantity, presence: true

end
