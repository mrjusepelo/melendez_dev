class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.text :description
      t.references :brand, index: true
      t.references :image, index: true

      t.timestamps
    end
  end
end
