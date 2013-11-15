class AddNewValuePayToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :sum_payments, :integer
  end
end
