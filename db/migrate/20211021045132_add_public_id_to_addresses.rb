class AddPublicIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :public_id, :integer
  end
end
