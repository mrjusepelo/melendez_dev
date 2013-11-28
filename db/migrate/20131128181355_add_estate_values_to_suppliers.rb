class AddEstateValuesToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :state, :boolean
  end
end
