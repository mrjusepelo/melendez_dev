class AddNewValuesToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :amount, :integer
  end
end
