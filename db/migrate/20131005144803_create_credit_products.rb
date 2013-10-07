class CreateCreditProducts < ActiveRecord::Migration
  def change
    create_table :credit_products do |t|
      t.references :product, index: true
      t.references :credit, index: true
      t.string :amount
      t.integer :value

      t.timestamps
    end
  end
end
