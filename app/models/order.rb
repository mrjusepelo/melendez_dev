class Order < ActiveRecord::Base
	has_many :order_products
	has_many :consigments
	belongs_to :supplier

   accepts_nested_attributes_for :order_products
   accepts_nested_attributes_for :consigments


end
