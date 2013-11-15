class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date_billed
      t.date :date_arrival
      t.date :date_limit_pay
      t.date :date_pay_real
      t.string :val_real

      t.timestamps
    end
  end
end
