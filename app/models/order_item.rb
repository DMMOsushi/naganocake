class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: { cannot_start: 0, waiting_production: 1, in_production: 2, complete: 3}
  # 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3
end
