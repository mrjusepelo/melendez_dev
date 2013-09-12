class RemoveEliminarRazonSocialFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :razon_social, :string
  end
end
