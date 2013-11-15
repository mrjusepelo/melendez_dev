class CreditProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :credit
end
