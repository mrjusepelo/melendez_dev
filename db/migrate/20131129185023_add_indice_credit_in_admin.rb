class AddIndiceCreditInAdmin < ActiveRecord::Migration
  def change
    add_index :credits, :admin_user_id
  	
  end
end
