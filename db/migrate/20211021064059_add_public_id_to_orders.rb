class AddPublicIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :public_id, :integer
  end
end
