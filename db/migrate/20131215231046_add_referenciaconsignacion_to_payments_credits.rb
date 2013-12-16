class AddReferenciaconsignacionToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :referencia_consignacion, :string
  end
end
