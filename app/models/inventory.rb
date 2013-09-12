class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :supplier
  
  # validates_presence_of :barcode
  # validates_uniqueness_of :barcode
  
   # validates_each :barcode do |record,model, attr, value|
    # puts("**********************codigo de barras"+ value.to_s)
  # end
  # validates_presence_of :product_id
end
