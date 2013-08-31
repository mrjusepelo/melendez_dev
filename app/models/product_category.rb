class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  # has_and_belongs_to_many :categories
  # has_and_belongs_to_many :product_categories
end
