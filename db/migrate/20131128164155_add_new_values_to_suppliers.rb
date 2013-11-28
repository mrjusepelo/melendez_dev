class AddNewValuesToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :frecuence_notification, :string
  end
end
