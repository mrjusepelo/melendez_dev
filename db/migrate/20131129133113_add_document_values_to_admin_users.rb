class AddDocumentValuesToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :document, :string
  end
end
