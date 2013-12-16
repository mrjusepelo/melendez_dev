class RemoveProductCreateInventoryFromCredits < ActiveRecord::Migration
  def change
    remove_column :credit_products, :product_id, :integer
  end
end
