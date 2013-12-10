class AddAdminValuesToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :admin_user_id, :integer
  end
end
