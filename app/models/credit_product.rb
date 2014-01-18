class CreditProduct < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :credit

  validates_presence_of :amount
  validates_presence_of :unit_value
  validates_presence_of :value
  validates_presence_of :inventory_id

validates :amount, :value, :unit_value, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}




end
