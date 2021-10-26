class Address < ApplicationRecord

  belongs_to :public

  def full_deliveries
    "〒" + self.postalcode + " " + self.address + " " + self.destination
  end

end
