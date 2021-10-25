class Address < ApplicationRecord

  belongs_to :public

  validates :public_id, presence: true
  validates :postalcode, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{minimum: 1, maximum: 100}
  validates :destination, length:{minimum: 2, maximum: 20}

  def full_deliveries
    "〒" + self.postalcode + " " + self.address + " " + self.destination
  end

end
