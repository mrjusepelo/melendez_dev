class AddInteresToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :interes, :integer
  end
end
