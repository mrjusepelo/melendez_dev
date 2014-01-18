class PaymentsCredit < ActiveRecord::Base
  belongs_to :credit


  validates_numericality_of :value, :only_integer =>true, :greater_than_or_equal_to =>0, :message => "solo puedes ingresar n&uacute;meros enteros positivos"
validates :document, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}

 validates_presence_of :name
 validates_presence_of :value
 validates_presence_of :date

# Funcional
# validates_numericality_of :document, :only_integer => true, :allow_nil => true, 
    # :greater_than_or_equal_to => 1,
#     :less_than_or_equal_to => 999,
    # :message => "can only be whole number between 1 and 999."




end
