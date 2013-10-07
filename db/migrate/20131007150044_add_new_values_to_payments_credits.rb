class AddNewValuesToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :description, :text
  end
end
