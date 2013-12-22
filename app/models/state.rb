class State < ActiveRecord::Base
	has_many :credits
	has_many :orders
end
