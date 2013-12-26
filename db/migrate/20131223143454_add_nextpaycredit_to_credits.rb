class AddNextpaycreditToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :nextpay, :date
  end
end
