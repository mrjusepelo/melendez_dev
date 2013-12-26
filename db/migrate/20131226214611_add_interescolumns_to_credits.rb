class AddInterescolumnsToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :interescorriente, :integer
    add_column :credits, :interesmora, :integer
  end
end
