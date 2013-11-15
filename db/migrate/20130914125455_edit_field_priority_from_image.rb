class EditFieldPriorityFromImage < ActiveRecord::Migration
  def change
    change_column :images, :priority, :boolean
    # User.where(:smoking => 1).update_all(:smoking_tmp = true)
    # Image.where(:priority => 1).update_all("priority = true")
    # Image.priority.update_all(:priority => true)
    
    # user.messages.update_all(:read => true)
    # Billing.update_all( "category = 'authorized', approved = 1, author = 'David'" )
 # execute 'ALTER TABLE "users" ALTER COLUMN "smoking" TYPE boolean USING CASE WHEN "flatshare"=\'true\' THEN \'t\'::boolean ELSE \'f\'::boolean END'
     # execute 'ALTER TABLE "images" ALTER COLUMN "priority" TYPE boolean USING CASE WHEN "flatshare"=\'true\' THEN \'t\'::boolean ELSE \'f\'::boolean END'
  end
end
