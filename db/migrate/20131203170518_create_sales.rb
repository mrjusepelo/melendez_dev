class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :credit, index: true
      t.references :admin_user, index: true
      t.date :date
      t.integer :value

      t.timestamps
    end
  end
end
