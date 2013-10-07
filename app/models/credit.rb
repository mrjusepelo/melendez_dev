class Credit < ActiveRecord::Base
  belongs_to :payment_mode
  belongs_to :state
  has_many :clients
  has_many :credit_products
  has_many :payments_credits
  has_many :support_documents

  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :credit_products
  accepts_nested_attributes_for :payments_credits
  accepts_nested_attributes_for :support_documents


end
