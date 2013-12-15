class CreateStateInventories < ActiveRecord::Migration
  def change
    create_table :state_inventories do |t|
      t.string :name

      t.timestamps
    end
  end
end
