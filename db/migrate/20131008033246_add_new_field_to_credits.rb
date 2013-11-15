class AddNewFieldToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :payday, :date
  end
end
