class SupportDocument < ActiveRecord::Base
  mount_uploader :route, RouteUploader
	
  belongs_to :credit
  validates_presence_of :name
  validates_presence_of :route

end
