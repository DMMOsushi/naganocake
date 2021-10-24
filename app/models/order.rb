class Order < ApplicationRecord
  belongs_to :public
  has_many :order_items, dependent: :destroy
  
  
end
