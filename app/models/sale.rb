class Sale < ActiveRecord::Base
  belongs_to :credit
  belongs_to :admin_user

  # has_many :sale_products
  # has_many :products, :through => :sale_products
  has_many :sale_products
  has_many :inventories, :through => :sale_products


    has_many :clients


  accepts_nested_attributes_for :sale_products
  accepts_nested_attributes_for :clients

end
