class AddIndiceCreatorInSales < ActiveRecord::Migration
  def change
    add_index :sales, :admin_creator_id
  end
end
