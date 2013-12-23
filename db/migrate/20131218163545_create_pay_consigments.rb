class CreatePayConsigments < ActiveRecord::Migration
  def change
    create_table :pay_consigments do |t|
      t.date :date
      t.string :num_register
      t.string :name
      t.integer :value
      t.string :num_account

      t.timestamps
    end
  end
end
