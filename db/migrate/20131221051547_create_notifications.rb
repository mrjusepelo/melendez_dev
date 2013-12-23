class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :revised
      t.references :order, index: true
      t.date :nextdate

      t.timestamps
    end
  end
end
