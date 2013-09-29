class AddIndicePedidoInProduct < ActiveRecord::Migration
  def change
  	add_index :products, :order_id
  	
  end
end
