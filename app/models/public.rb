class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :last_name, length:{minimum: 1, maximum: 10}
  validates :first_name, length:{minimum: 1, maximum: 10}
  validates :last_kana_name, length:{minimum: 1, maximum: 10}
  validates :first_kana_name, length:{minimum: 1, maximum: 10}
  validates :email, length:{maximum: 100}
  validates :postalcode, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{maximum: 100}
  validates :telephone, length:{is: 11}, numericality: { only_integer: true }


  def active_for_authentication?
    super && (user_status == false)
  end
end
