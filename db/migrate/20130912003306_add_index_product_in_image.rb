class AddIndexProductInImage < ActiveRecord::Migration
  def change
  	add_index :images, :product_id
  	# change_column :inventories, :barcode, :string
  end
end
