class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :city, index: true

      t.timestamps
    end
  end
end
