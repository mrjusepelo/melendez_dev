class AddAdminCreatorValuesToCredits < ActiveRecord::Migration
  def change
    add_reference :credits, :admin_creator, index: true
  end
end
