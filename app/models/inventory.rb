class Inventory < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :image
  belongs_to :supplier
end
