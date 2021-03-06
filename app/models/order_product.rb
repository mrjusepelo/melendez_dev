class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product


  validates_presence_of :amount
  validates_presence_of :unit_value
  validates_presence_of :value

# validates_numericality_of :amount, :value, :unit_value =>true, :greater_than_or_equal_to =>0, :message => "solo puedes ingresar n&uacute;meros enteros positivos"
validates :amount, :value, :unit_value, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}

# def product_name
#   product.name if product
# end

# def product_name=(name)
#   # self.product = Product.find_by_name(name) unless name.blank?
#   # self.product = Product.find_or_create_by_name(name) unless name.blank?
#   self.product = Product.find_or_create_by(name: name) unless name.blank?
# end



end
