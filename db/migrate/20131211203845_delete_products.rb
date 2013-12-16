class DeleteProducts < ActiveRecord::Migration
  def change
remove_index(:sale_products, :name => 'index_sale_products_on_product_id')
  	
  end
end
