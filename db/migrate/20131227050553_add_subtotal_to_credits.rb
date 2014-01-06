class AddSubtotalToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :subtotal, :float
  end
end
