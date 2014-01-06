class AddNextpayrderToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :nextpay, :date
  end
end
