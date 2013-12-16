class AddIvaToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :iva, :integer
  end
end
