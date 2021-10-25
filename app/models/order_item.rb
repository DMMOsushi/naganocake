class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, :order_id, :item_quantity, :production_status, :price, presence: true

  enum order_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}
end
