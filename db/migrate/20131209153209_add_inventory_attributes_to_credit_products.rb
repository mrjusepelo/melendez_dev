class AddInventoryAttributesToCreditProducts < ActiveRecord::Migration
  def change
    add_column :credit_products, :inventory_attributes, :string
  end
end
