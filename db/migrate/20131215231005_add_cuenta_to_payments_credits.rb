class AddCuentaToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :cuenta, :string
  end
end
