class CreatePaymentModes < ActiveRecord::Migration
  def change
    create_table :payment_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
