class PaymentMode < ActiveRecord::Base
	has_many :orders
end
