class AddSaleToPayEfectives < ActiveRecord::Migration
  def change
    add_reference :pay_efectives, :sale, index: true
  end
end
