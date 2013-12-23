class AddTipocuentaToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :tipo_cuenta, :string
  end
end
