class CreateNotificationCredits < ActiveRecord::Migration
  def change
    create_table :notification_credits do |t|
      t.date :nextdate
      t.references :credit, index: true
      t.boolean :revised

      t.timestamps
    end
  end
end
