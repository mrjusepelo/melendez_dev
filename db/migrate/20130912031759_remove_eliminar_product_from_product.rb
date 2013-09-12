class RemoveEliminarProductFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :product, :string
  end
end
