class Item < ApplicationRecord
  attachment :image
  belongs_to :category
  

  
  validates :name, :image, :explanation, :tax_excluded_price, presence: true
end
