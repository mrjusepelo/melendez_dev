class CreditProduct < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :credit
end
