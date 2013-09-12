class ChangeTypeColumn < ActiveRecord::Migration
  def change
  	change_column :inventories, :barcode, :string
  end
end
