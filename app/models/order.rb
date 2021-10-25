class Order < ApplicationRecord
  belongs_to :public
  has_many :order_items, dependent: :destroy



  enum pay: { クレジットカード: 0, 銀行振り込み: 1 }
  enum order_status: { waiting: 0, pay_confirm: 1, in_production: 2, 	in_preparation: 3, shipped: 4 }
  # 0:入金待ち 1:入金確認 2:製作中 3:発送準備中 4:発送済み
end
