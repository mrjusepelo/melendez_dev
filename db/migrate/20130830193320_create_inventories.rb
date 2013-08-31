class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :product_category, index: true
      t.references :image, index: true
      t.references :supplier, index: true
      t.integer :barcode
      t.integer :vale_buy
      t.integer :vale_sale
      t.integer :warranty
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
