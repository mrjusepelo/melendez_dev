class AddNameToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :name, :string
  end
end
