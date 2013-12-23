class AddValueorderproductsToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :value, :integer
  end
end
