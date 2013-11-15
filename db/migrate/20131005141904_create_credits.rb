class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :payment_mode, index: true
      t.references :state, index: true
      t.integer :total
      t.text :description

      t.timestamps
    end
  end
end
