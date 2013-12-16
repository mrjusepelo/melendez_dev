class AddInventoryFieldsToCreditProducts < ActiveRecord::Migration
  def change
    add_column :credit_products, :inventory_fields, :string
  end
end
