class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      
      t.integer :customer_id, null: false
      t.string  :destination, null: false
      t.string  :address, null: false
      t.string  :postalcode, null: false

      t.timestamps
    end
  end
end
