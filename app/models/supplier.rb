class Supplier < ActiveRecord::Base
  belongs_to :city
  has_many :inventories
end
