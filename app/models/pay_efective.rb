class PayEfective < ActiveRecord::Base

  has_many :pay_sales
  	belongs_to :sale
	
  validates_presence_of :value
  validates_presence_of :name
  validates_presence_of :date
    

validates  :value, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}


end
