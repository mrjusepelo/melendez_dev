class AddInventoryfieldsToSaleProducts < ActiveRecord::Migration
  def change
    add_column :sale_products, :inventory_fields, :string
  end
end
