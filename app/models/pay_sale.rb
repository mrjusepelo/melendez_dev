class PaySale < ActiveRecord::Base
  belongs_to :pay_efective
  belongs_to :pay_consigment
end
