class AddFieldToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :number_payments, :integer
  end
end
