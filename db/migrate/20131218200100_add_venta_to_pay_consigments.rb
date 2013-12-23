class AddVentaToPayConsigments < ActiveRecord::Migration
  def change
    add_reference :pay_consigments, :sale, index: true
  end
end
