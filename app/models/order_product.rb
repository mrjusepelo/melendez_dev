class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

def product_name
  product.name if product
end

def product_name=(name)
  # self.product = Product.find_by_name(name) unless name.blank?
  # self.product = Product.find_or_create_by_name(name) unless name.blank?
  self.product = Product.find_or_create_by(name: name) unless name.blank?
end



end
