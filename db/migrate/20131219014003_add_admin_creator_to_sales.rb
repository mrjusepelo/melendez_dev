class AddAdminCreatorToSales < ActiveRecord::Migration
  def change
    add_column :sales, :admin_creator_id, :integer
  end
end
