class Item < ApplicationRecord
  attachment :image
  belongs_to :category

  has_many :order_items


  validates :name, :image, :explanation, :tax_excluded_price, presence: true
end
