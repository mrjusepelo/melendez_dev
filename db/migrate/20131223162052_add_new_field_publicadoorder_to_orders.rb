class AddNewFieldPublicadoorderToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :published, :boolean
  end
end
