class AddIndiceCreditInCient < ActiveRecord::Migration
  def change
    add_index :clients, :credit_id

  end
end
