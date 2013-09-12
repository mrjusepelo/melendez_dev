class RemoveEliminarImageFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :image_id, :integer
  end
end
