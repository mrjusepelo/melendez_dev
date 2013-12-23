class AddStateorderToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :state, index: true
  end
end
