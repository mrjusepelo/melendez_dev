class PayEfective < ActiveRecord::Base

  has_many :pay_sales
  	belongs_to :sale
	

end
