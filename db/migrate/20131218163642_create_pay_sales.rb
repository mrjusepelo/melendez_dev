class CreatePaySales < ActiveRecord::Migration
  def change
    create_table :pay_sales do |t|
      t.integer :value
      t.date :date
      t.references :pay_efective, index: true
      t.references :pay_consigment, index: true

      t.timestamps
    end
  end
end
