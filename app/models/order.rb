class Order < ActiveRecord::Base
	has_many :order_products
	has_many :consigments
	has_many :notifications
	belongs_to :supplier
	belongs_to :payment_mode

   accepts_nested_attributes_for :order_products
   accepts_nested_attributes_for :consigments


end
