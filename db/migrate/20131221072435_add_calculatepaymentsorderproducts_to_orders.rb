class AddCalculatepaymentsorderproductsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :number_payments, :integer
    add_column :orders, :value_payments, :integer
  end
end
