class AddNewValuesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :credit_id, :integer
  end
end
