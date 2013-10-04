class AddNewValuesSumPaymentsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sum_payments, :integer
  end
end
