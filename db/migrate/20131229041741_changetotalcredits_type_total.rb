class ChangetotalcreditsTypeTotal < ActiveRecord::Migration
  def change
 	change_column :credits, :total, :float

  end
end
