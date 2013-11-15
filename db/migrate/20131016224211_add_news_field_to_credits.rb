class AddNewsFieldToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :value_payments, :integer
  end
end
