class SupportDocument < ActiveRecord::Base
  mount_uploader :route, RouteUploader
	
  belongs_to :credit
end
