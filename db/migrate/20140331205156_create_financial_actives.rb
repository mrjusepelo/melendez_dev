class CreateFinancialActives < ActiveRecord::Migration
  def change
    create_table :financial_actives do |t|
      t.string :name
      t.float :value
      t.date :date
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end
