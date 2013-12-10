class AddInventoriesToCreditProducts < ActiveRecord::Migration
  def change
    add_reference :credit_products, :inventory, index: true
  end
end
