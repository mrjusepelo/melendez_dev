class RemoveEliminarAmountFromInventory < ActiveRecord::Migration
  def change
    remove_column :inventories, :amount, :integer
  end
end
