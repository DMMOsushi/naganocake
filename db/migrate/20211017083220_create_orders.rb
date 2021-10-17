class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false
      t.integer :postagev, null: false
      t.integer :bill, null: false
      t.integer :pay, null: false, default: 0
      t.string  :destination, null: false
      t.string  :address, null: false
      t.string  :postalcode, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
