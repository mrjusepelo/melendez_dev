class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :image
  has_many :product_categories
  has_many :categories, :through => :product_categories  
end
