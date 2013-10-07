class CreateSupportDocuments < ActiveRecord::Migration
  def change
    create_table :support_documents do |t|
      t.string :name
      t.string :route
      t.references :credit, index: true

      t.timestamps
    end
  end
end
