class AddUnitvalueorderproductsToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :unit_value, :integer
  end
end
