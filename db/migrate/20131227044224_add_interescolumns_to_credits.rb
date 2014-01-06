class AddInterescolumnsToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :interescorriente, :float
    add_column :credits, :interesmora, :float
  end
end
