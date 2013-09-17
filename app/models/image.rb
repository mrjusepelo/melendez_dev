class Image < ActiveRecord::Base
  mount_uploader :route, RouteUploader

  belongs_to :product

end
