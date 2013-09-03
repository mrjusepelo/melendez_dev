class Product < ActiveRecord::Base
	has_many :product_categories
  	has_many :categories, :through => :product_categories

  # has_and_belongs_to_many :categories

    # has_many :user_languages			
    # has_many :users, :through => :user_languages
end
