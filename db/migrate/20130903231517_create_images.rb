class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :route
      t.boolean :priority

      t.timestamps
    end
  end
end
