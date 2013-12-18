class Sale < ActiveRecord::Base
  belongs_to :credit
  belongs_to :admin_user


  has_many :sale_products
  has_many :inventories, :through => :sale_products

  has_many :pay_sales



  has_many :pay_efectives

  has_many :pay_consigments
  # has_many :pay_sales, :through => :pay_consigments


    has_many :clients


  accepts_nested_attributes_for :sale_products
  accepts_nested_attributes_for :clients
  # accepts_nested_attributes_for :pay_sales

  accepts_nested_attributes_for :pay_efectives
  accepts_nested_attributes_for :pay_consigments

end
