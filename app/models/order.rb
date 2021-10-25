class Order < ApplicationRecord
  belongs_to :public
  has_many :order_items, dependent: :destroy

  validates :public_id, :address, :postalcode, :destination, :postage, :bill, :order_status, :pay, presence: true

  enum pay: { クレジットカード: 0, 銀行振り込み: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4 }
end
