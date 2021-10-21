class AddPublicIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :public_id, :integer
  end
end
