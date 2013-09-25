class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :reason
      t.text :message

      t.timestamps
    end
  end
end
