class AddIndiceProveedorInOrder < ActiveRecord::Migration
  def change
    add_index :orders, :supplier_id
  	
  end
end
