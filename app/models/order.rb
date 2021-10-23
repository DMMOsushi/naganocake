class Order < ApplicationRecord
  belongs_to :public

  enum pay: { card: 0, bank: 1 }
  enum order_status: { wait: 0, check: 1, making: 2, ready: 3, sent: 4 }
end
