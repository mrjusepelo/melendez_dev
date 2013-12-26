class AddNewFieldPublicadoToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :published, :boolean
  end
end
