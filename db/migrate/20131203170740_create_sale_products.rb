class CreateSaleProducts < ActiveRecord::Migration
  def change
    create_table :sale_products do |t|
      t.references :sale, index: true
      t.references :product, index: true
      t.integer :value
      t.integer :amount
      t.integer :unit_value

      t.timestamps
    end
  end
end
