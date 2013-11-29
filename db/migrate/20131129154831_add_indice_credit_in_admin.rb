class AddIndiceCreditInAdmin < ActiveRecord::Migration
  def change
    add_index :credits, :admin_id

  end
end
