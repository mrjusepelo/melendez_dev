class AddInventoryToSaleProducts < ActiveRecord::Migration
  def change
    add_reference :sale_products, :inventory, index: true
  end
end
