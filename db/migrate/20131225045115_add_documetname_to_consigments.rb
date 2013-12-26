class AddDocumetnameToConsigments < ActiveRecord::Migration
  def change
    add_column :consigments, :document, :string
    add_column :consigments, :name, :string
    add_column :consigments, :description, :text
  end
end
