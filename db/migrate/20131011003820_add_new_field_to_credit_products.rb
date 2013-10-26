class AddNewFieldToCreditProducts < ActiveRecord::Migration
  def change
    add_column :credit_products, :unit_value, :integer
  end
end
