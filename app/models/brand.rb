class Brand < ActiveRecord::Base

has_many :products

 # after_update :send_notification_after_change

 #  def send_notification_after_change
 #    puts "************ACTUALIZADO******"
 #  end


end
