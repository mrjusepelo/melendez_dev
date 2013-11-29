class AddSerialValuesToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :serial, :string
  end
end
