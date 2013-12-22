class AddPaydayorderToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payday, :date
  end
end
