class AddNewValuesToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :date, :date
  end
end
