class CreatePaymentsCredits < ActiveRecord::Migration
  def change
    create_table :payments_credits do |t|
      t.date :date
      t.integer :value
      t.references :credit, index: true

      t.timestamps
    end
  end
end
