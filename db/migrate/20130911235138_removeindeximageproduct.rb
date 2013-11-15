class Removeindeximageproduct < ActiveRecord::Migration
  def change
  	# remove_index: index_products_on_image_id
  	remove_index(:products, :name => 'index_products_on_image_id')
  	# remove_index(:product, column: image_id)
  	# : Removes the index specified by column_name.
  	# remove_index(table_name, column: column_name): Removes the index specified by column_name.
  	# change_column :inventories, :barcode, :string

  end
end
