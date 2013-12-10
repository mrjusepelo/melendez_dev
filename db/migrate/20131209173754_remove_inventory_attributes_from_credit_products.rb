class RemoveInventoryAttributesFromCreditProducts < ActiveRecord::Migration
  def change
    remove_column :credit_products, :inventory_attributes, :string
  end
end
