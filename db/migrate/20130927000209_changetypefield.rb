class Changetypefield < ActiveRecord::Migration
  def change
    change_column :messages, :phone, :string
  end
end
