class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :document
      t.string :address
      t.string :phone
      t.string :neihborhood
      t.references :city, index: true
      t.boolean :buyer
      t.boolean :bondsman

      t.timestamps
    end
  end
end
