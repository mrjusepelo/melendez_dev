class AddPaymentmodeToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :payment_mode, index: true
  end
end
