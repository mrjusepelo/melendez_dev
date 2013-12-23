class AddSaleToPaySales < ActiveRecord::Migration
  def change
    add_reference :pay_sales, :sale, index: true
  end
end
