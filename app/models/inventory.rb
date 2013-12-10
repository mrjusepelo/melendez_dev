class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :supplier

# lineas agregadas
  has_many :credit_products
  has_many :credits, :through => :credit_products

  # validates_presence_of :barcode
  # validates_uniqueness_of :barcode
  validates_presence_of :serial
  
   # validates_each :barcode do |record,model, attr, value|
    # puts("**********************codigo de barras"+ value.to_s)
  # end
  # validates_presence_of :product_id
end
