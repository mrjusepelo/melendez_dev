class AddModopagoToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :modo_pago, :integer
  end
end
