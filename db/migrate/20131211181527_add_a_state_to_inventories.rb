class AddAStateToInventories < ActiveRecord::Migration
  def change
    add_reference :inventories, :state_inventory, index: true
  end
end
