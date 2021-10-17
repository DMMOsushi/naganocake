class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.boolean :sale_status, null: false, default: "TRUE"
      t.text :image_id, null: false
      t.integer :tax_excluded_price, null: false

      t.timestamps
    end
  end
end
