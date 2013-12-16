class RemoveProductsFromCredits < ActiveRecord::Migration
  def change
	remove_index(:credit_products, :name => 'index_credit_products_on_product_id')

  end
end
