class CreateConsigments < ActiveRecord::Migration
  def change
    create_table :consigments do |t|
      t.integer :value
      t.date :date
      t.references :order, index: true

      t.timestamps
    end
  end
end
