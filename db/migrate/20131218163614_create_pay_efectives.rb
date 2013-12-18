class CreatePayEfectives < ActiveRecord::Migration
  def change
    create_table :pay_efectives do |t|
      t.date :date
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
